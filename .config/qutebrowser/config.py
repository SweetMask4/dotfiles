# import libraries
import os
import catppuccin  # Catppuccin setup

# Disable default auto-loading of configuration
config.load_autoconfig(False)

# Setting catppuccin theme to 'mocha'.
catppuccin.setup(c, 'mocha', True)

# Colors & Media
c.colors.webpage.darkmode.enabled = True  # requires a restart when changed
c.colors.webpage.preferred_color_scheme = 'dark'
c.colors.webpage.bg = 'black'
c.statusbar.widgets = ["url", "progress", "scroll"]

# Useful aliases
c.aliases = {'q': 'quit', 'w': 'session-save', 'wq': 'quit --save'}

# Set the default encoding to UTF-8
config.set('content.default_encoding', 'utf-8')

# Language configuration
config.set('content.headers.accept_language', 'en-US,en;q=0.9')

# Header configuration
config.set('content.headers.user_agent',
           'Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0')

# Privacy and security configuration
config.set('content.autoplay', False)
config.set('content.geolocation', False)
config.set('content.webgl', False)
config.set('content.media.audio_capture', False)
config.set('content.media.video_capture', False)
config.set('content.media.audio_video_capture', False)
config.set('content.desktop_capture', False)
config.set('content.notifications.enabled', False)
config.set('content.register_protocol_handler', False)
config.set('content.headers.custom', {
           'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'})
config.set('content.headers.referer', 'same-domain')
config.set('content.canvas_reading', False)
config.set('content.tls.certificate_errors', "block")
config.set('content.javascript.can_access_clipboard', False)
config.set('content.javascript.enabled', False)
config.set('content.webrtc_ip_handling_policy', 'disable-non-proxied-udp')
config.set('content.unknown_url_scheme_policy', 'disallow')
config.set('content.cookies.store', False)
config.set('content.cookies.accept', 'no-3rdparty')
config.set('content.plugins', False)
config.set('content.pdfjs', False)

# Enable JavaScript and accept cookies for sites listed in the 'sites.txt' file
try:
    with (config.configdir / 'adblock/sites.txt').open() as sites_file:
        sites = [line.strip() for line in sites_file if line.strip()]
    for site in sites:
        config.set('content.javascript.enabled', True, site)
        config.set('content.cookies.store', True)
except FileNotFoundError:
    raise ConfigError('sites.txt not found')

# Download configuration
c.downloads.location.directory = '~/Downloads'
c.downloads.remove_finished = 5000

# Default start page
c.url.default_page = 'https://searx.be'
c.url.start_pages = 'https://searx.be'

# Search engine configuration
c.url.searchengines = {
    'DEFAULT': 'https://searx.be/search?q={}',  # Default search engine
    'wikidata': 'https://www.wikidata.org/wiki/Special:Search?search={}',  # Wikidata search
    'teddit': 'https://teddit.net/r/{}',  # Teddit search by subreddit
    'piped': 'https://piped.qdi.fi/results?search_query={}',  # Pipe search engine
    'archwiki': 'https://wiki.archlinux.org/index.php?search={}',  # Arch Wiki search
    'artixwiki': 'https://wiki.artixlinux.org/index.php?search={}',  # Artix Wiki search
    'rae': 'https://dle.rae.es/{}',  # RAE (Real Academia Española) search
    'invidius': 'https://inv.vern.cc/search?q={}',  # Invidious search
    'musicale': 'https://musicale.tk/#search={}',  # Musicale search
    'nitter': 'https://nitter.net/search?q={}',  # Nitter search
    'libreddit': 'https://libreddit.de/r/{}',  # Libreddit search by subreddit
    'proxitok': 'https://proxitok.pabloferreiro.es/@{}',  # ProxiTok search
    'libremdb': 'https://libremdb.iket.me/find?q={}',  # LibreMDB search
    'startpage': 'https://www.startpage.com/do/search?query={}',  # Startpage search
    'librex': 'https://librex.yogeshlamichhane.com.np/search.php?q={}',  # Librex search
}

# Font configuration
c.fonts.default_family = ["Fira code", "DejaVu Sans Mono",
                          "Liberation Mono", "JoyPixels", "JetBrains Mono"]
c.fonts.tabs.selected = "11pt Fira code"
c.fonts.tabs.unselected = c.fonts.tabs.selected
c.fonts.statusbar = "11pt Fira code"
c.fonts.downloads = c.fonts.statusbar
c.fonts.prompts = c.fonts.statusbar
c.fonts.hints = "12px Fira code"
c.fonts.messages.info = "11pt Fira code"
c.fonts.keyhint = c.fonts.messages.info
c.fonts.messages.warning = c.fonts.messages.info
c.fonts.messages.error = c.fonts.messages.info
c.fonts.completion.entry = c.fonts.statusbar
c.fonts.completion.category = c.fonts.statusbar

# Keybindings in normal mode
c.bindings.commands['normal'] = {
    'M': 'hint links spawn mpv {hint-url}',
    'Z': 'hint links spawn st -e youtube-dl {hint-url}',
    't': 'set-cmd-text -s :open -t',
    '<Ctrl-o>': 'config-source',
    'xb': 'config-cycle statusbar.show always never',
    'xt': 'config-cycle tabs.show always never',
    'xx': 'config-cycle statusbar.show always never;; config-cycle tabs.show always never',
    'xs': 'config-cycle content.javascript.can_access_clipboard',
    'xp': 'config-cycle content.javascript.enabled',
    'pt': 'tab-pin',
    '<Ctrl-=>': 'zoom-in',
    '<Ctrl-->': 'zoom-out',
}

# Content blocking (Adblock)
adblock_file = config.configdir.joinpath('adblock', 'adblock.txt')
hosts_file = config.configdir.joinpath('adblock', 'hosts.txt')

# Read links from adblock.txt
with adblock_file.open() as f:
    adblock_links = [line.strip() for line in f if line.strip()]

# Read links from hosts.txt
with hosts_file.open() as f:
    hosts_links = [line.strip() for line in f if line.strip()]

# Adblock configuration
c.content.blocking.method = 'both'
c.content.blocking.enabled = True
c.content.blocking.adblock.lists += adblock_links

# Hosts configuration
c.content.blocking.hosts.lists += hosts_links

# Misc
# Set the editor command for opening external editor
c.editor.command = [os.environ["TERMINAL"], "-e", os.environ["EDITOR"], "-f", "{file}", "-c", "normal {line}G{column0}l"]

# Enable smooth scrolling
c.scrolling.smooth = True

# Set content cache size to 50MB (52428800 bytes)
c.content.cache.size = 52428800

# Shrink completion to display more suggestions
c.completion.shrink = True

# Show multiple tabs
c.tabs.show = "always"

# Bind key 'gn' to spawn terminal and open editor for js.sites configuration file
config.bind('gn', f"spawn {os.environ['TERMINAL']} -e {os.environ['EDITOR']} {config.configdir}adblock/sites.txt")
