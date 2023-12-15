#!/bin/bash

# Script para buscar y reproducir películas, series y anime de Cuevana3

# Dependencias requeridas: mpv, yt-dlp, fzf, curl

base_url="https://cuevana3.ch"
search_endpoint="/search.html?keyword="
state_file="$HOME/.cache/saved.txt"
selected_url=""
result_url=""
video_links=()

# checks if dependencies are present
dep_ch() {
    for dep; do
        command -v "$dep" >/dev/null || die "Program \"$dep\" not found. Please install it."
    done
}

dep_ch "curl" "sed" "grep" "mpv" "fzf" "yt-dlp" || true

search_local(){
    result_url=$(cat "$state_file")
}

search_web(){
    read -rp "Ingresa el nombre de un anime que deseas buscar: " query
    formatted_query=$(printf "%s" "$query" | sed "s| |+|g")
    search_url="${base_url}${search_endpoint}${formatted_query}"

    selected_title=$(curl -s "$search_url" | grep "$query" | grep href | awk -F'["]' '{print $2}' | fzf)

    selected_url="${base_url}${selected_title}"

    if [[ $selected_title == *"serie"* ]]; then
        selected_episode=$(curl -s "$selected_url" | grep "$query" | grep episodio | awk -F'["]' '{print $2}' | fzf)
        result_url="${base_url}${selected_episode}"
    else
        result_url=$selected_url
    fi
}

read -rp "¿Deseas reproducir el último enlace guardado? (S/N): " choice
if [[ "${choice,,}" == "s" ]]; then
    search_local
else
    search_web
fi


load_video_links() {
    mapfile -t video_links < <(curl -s "$result_url" | grep data-video | awk '!/dood|azipcdn|pelisplay/' | cut -d\" -f2 | grep https)
}

load_video_links

while [[ ${#video_links[@]} -gt 0 ]]; do
    for link in "${video_links[@]}"; do
        if mpv "$link"; then
            echo "$result_url" > "$state_file"
        else
            choice=$(echo -e "play\nnext\nquit" |fzf)
            case "$choice" in
                'next')
                    next_url=$(curl -s "$result_url" | grep next | cut -d\" -f2)
                    result_url="${base_url}${next_url}"
                    load_video_links
                    break ;;
                'quit')
                    break 2 ;;
            esac
        fi
    done
done
