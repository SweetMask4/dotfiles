(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq inhibit-startup-message t)
(setq use-dialog-box nil)
(setq use-file-dialog nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(menu-bar-mode -1)
(tool-bar-mode -1)
(fringe-mode -1)
(setq ring-bell-function #'ignore)
(scroll-bar-mode -1)
(global-subword-mode 1)
(defalias 'yes-or-no-p 'y-or-n-p)

(column-number-mode 1)
(global-visual-line-mode)
;; Enable line numbers for some modes
(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))

;; Override some modes which derive from the above
(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(load-theme 'catppuccin :no-confirm)

(use-package mood-line
  :ensure t
  :if window-system
  :init
  (mood-line-mode))

(set-face-attribute 'default nil
  :font "JetBrainsMono Nerd Font"
  :height 110
  :weight 'medium)
(set-face-attribute 'variable-pitch nil
  :font "Ubuntu"
  :height 120
  :weight 'medium)
(set-face-attribute 'fixed-pitch nil
  :font "JetBrainsMono Nerd Font"
  :height 110
  :weight 'medium)
;; Makes commented text and keywords italics.
;; This is working in emacsclient but not emacs.
;; Your font must have an italic face available.
(set-face-attribute 'font-lock-comment-face nil
  :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
  :slant 'italic)

;; Uncomment the following line if line spacing needs adjusting.
(setq-default line-spacing 0.12)

;; Needed if using emacsclient. Otherwise, your fonts will be smaller than expected.
(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font-11"))
;; changes certain keywords to symbols, such as lamda!
(setq global-prettify-symbols-mode t)

(use-package vertico
   :ensure t
   :init
   (vertico-mode))

(use-package orderless
 :ensure t
 :init
 (setq completion-styles '(orderless)))

(use-package savehist
:init
(savehist-mode))

(use-package swiper
  :ensure t
  :bind ("C-s" . 'swiper))

(require 'epa-file)
(epa-file-enable)
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
(setq epa-file-select-keys nil)

(use-package smartparens :ensure t
  :hook ((prog-mode . smartparens-mode)
        (org-mode . smartparens-mode)))

(use-package writegood-mode
    :ensure t
    :hook (flyspell-mode . writegood-mode))

  (use-package writeroom-mode
    :commands (writeroom-mode global-writeroom-mode)
    :init
    (setq writeroom-width 90))

(use-package flyspell-correct
    :bind ("C-c DEL" . flyspell-correct-previous)
    :hook ((markdown-mode nroff-mode org-mode
			  mail-mode
			  git-commit-mode)
	   . flyspell-mode)
    :init
    (add-to-list 'ispell-skip-region-alist '("+begin_src" . "+end_src"))
    (setq flyspell-use-meta-tab nil))

(use-package eshell-syntax-highlighting
  :after esh-mode
  :config
  (eshell-syntax-highlighting-global-mode +1))

;; eshell-syntax-highlighting -- adds fish/zsh-like syntax highlighting.
;; eshell-rc-script -- your profile for eshell; like a bashrc for eshell.
;; eshell-aliases-file -- sets an aliases file for the eshell.
  
(setq eshell-rc-script (concat user-emacs-directory "eshell/profile")
      eshell-aliases-file (concat user-emacs-directory "eshell/aliases")
      eshell-history-size 5000
      eshell-buffer-maximum-lines 5000
      eshell-hist-ignoredups t
      eshell-scroll-to-bottom-on-input t
      eshell-destroy-buffer-when-process-dies t
      eshell-visual-commands'("bash" "fish" "htop" "ssh" "top" "zsh"))

(use-package vterm
:bind ("<f7>" . vterm)
:config
(setq shell-file-name "/bin/zsh"
      vterm-max-scrollback 5000))

(use-package vterm-toggle
:after vterm
:config
(setq vterm-toggle-fullscreen-p nil)
(setq vterm-toggle-scope 'project)
(add-to-list 'display-buffer-alist
             '((lambda (buffer-or-name _)
                   (let ((buffer (get-buffer buffer-or-name)))
                     (with-current-buffer buffer
                       (or (equal major-mode 'vterm-mode)
                           (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
                (display-buffer-reuse-window display-buffer-at-bottom)
                ;;(display-buffer-reuse-window display-buffer-in-direction)
                ;;display-buffer-in-direction/direction/dedicated is-added in emacs27
                ;;(direction . bottom)
                ;;(dedicated . t) ;dedicated is-supported in emacs27
                (reusable-frames . visible)
                (window-height . 0.3))))

(use-package sudo-edit :ensure t)

(use-package rainbow-delimiters
:ensure t
:hook (prog-mode . rainbow-delimiters-mode))

(use-package rainbow-mode
:ensure t
:hook ((python-mode . rainbow-mode)
       (web-mode . rainbow-mode)
       (LaTeX-mode . rainbow-mode)
       (shell-mode . rainbow-mode)
       (lisp-mode . rainbow-mode)
       (emacs-lisp-mode . rainbow-mode)
       (text-mode . rainbow-mode)
       (conf-unix-mode . rainbow-mode)
       (org-mode . rainbow-mode)))

(use-package lsp-mode
  :ensure t
  :hook
  ((python-mode . lsp)
  (sh-mode .lsp)
  (c-mode .lsp)
  (c++-mode .lsp)))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company
	  :ensure t
          :config
	  (add-hook 'after-init-hook 'global-company-mode)
	  (setq company-idle-delay 0.1)
	  (setq company-minimum-prefix-length 2)
          (setq company-selection-wrap-around t)
          (setq company-tooltip-align-annotations t))

(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "C-n") 'company-select-next)
     (define-key company-active-map (kbd "C-p") 'company-select-previous)
     (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
     (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)))

(use-package yasnippet
  :ensure t
  :hook ((prog-mode . yas-minor-mode)
         (conf-mode . yas-minor-mode)
         (text-mode . yas-minor-mode)
         (snippet-mode . yas-minor-mode)))

(use-package yasnippet-snippets
  :ensure t
  :after (yasnippet))

(use-package flycheck
  :ensure t)

(use-package magit
  :ensure t
  :config
  (setq magit-push-always-verify nil)
  (setq git-commit-summary-max-length 50)
  :bind
  ("M-g" . magit-status))

(use-package lua-mode :ensure t)
(use-package markdown-mode :ensure t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(electric-indent-mode -1)

(require 'org-tempo)

(use-package org-auto-tangle
 :defer t)

(setq org-agenda-files '("~/Documents/org/agenda.org"))
(setq org-agenda-start-with-log-mode t)
(setq org-log-done 'time)
