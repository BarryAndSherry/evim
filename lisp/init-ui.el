;; UI config

;; (setq initial-frame-alist '( (fullscreen . maximized)))
;; (setq default-frame-alist '( (fullscreen . maximized)))


;; Setting font
;;(setq default-frame-alist '((font . "ShureTechMono Nerd Font 11")))
;;(set-default-font "ShureTechMono Nerd Font 12")



(setq line-number-mode t)
;;(setq column-number-mode t)
(setq frame-title-format "Barry's EmVim")
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(setq inhibit-startup-message t)
(setq visible-bell 0)

;; using smartparens
(use-package smartparens
  :defer 1
  :hook
  (after-init . smartparens-global-mode)
  :config
  (require 'smartparens-config)
  (sp-pair "=" "=" :actions '(wrap))
  (sp-pair "+" "+" :actions '(wrap))
  (sp-pair "<" ">" :actions '(wrap))
  (sp-pair "$" "$" :actions '(wrap)))

;; theme
;; (use-package gruvbox-theme
;;              :ensure t
;;              :init
;;               (load-theme 'gruvbox t))


(use-package doom-themes
  :custom
  (doom-themes-enable-italic t)
  (doom-themes-enable-bold t)
  :custom-face
  (vertical-bar   (doom-darken base5 0.4))
  ;; (doom-darken bg 0.4)
  :config
  (load-theme 'doom-one t)
  ;; (doom-themes-org-config)
  ;; Modeline
  (use-package doom-modeline
    :custom
    (doom-modeline-buffer-file-name-style 'truncate-with-project)
    (doom-modeline-icon nil)
    (doom-modeline-major-mode-icon nil)
    (doom-modeline-minor-modes nil)
    :hook
    (after-init . doom-modeline-mode)
    :config
    (set-cursor-color "cyan")
    (line-number-mode 1)
    (column-number-mode 0)
    (doom-modeline-def-modeline 'main
      '(bar window-number  buffer-info  buffer-position parrot selection-info)
      '(misc-info persp-name lsp github debug minor-modes input-method major-mode process vcs checker))))

(use-package rainbow-mode
  :diminish
  :hook (emacs-lisp-mode . rainbow-mode))

;; rainbow-delimiters
(use-package rainbow-delimiters
  :defer 1
  :hook
  (prog-mode . rainbow-delimiters-mode))


;; highlight cur line
(use-package hl-line
  :defer 1
  :hook
  (after-init . global-hl-line-mode))

;; (use-package highlight-indent-guides
;; :defer t
;; :diminish
;; :hook
;; ((prog-mode yaml-mode) . highlight-indent-guides-mode)
;; :custom
;; (highlight-indent-guides-auto-enabled t)
;; (highlight-indent-guides-responsive t)
;; (highlight-indent-guides-method 'character)) ; column

(use-package all-the-icons
  :ensure nil
  :defer t)

(provide 'init-ui)
