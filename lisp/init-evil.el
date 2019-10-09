
;; code
(use-package evil
  :init
  (setq evil-want-integration nil) ;; required by evil-collection
  (setq evil-want-keybinding nil)
  ;; (setq evil-search-module 'evil-search)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-vsplit-window-right t) ;; like vim's 'splitright'
  (setq evil-split-window-below t) ;; like vim's 'splitbelow'
  (setq evil-shift-round nil)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))


(use-package key-chord
  :ensure nil)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)


;; Now list all of key bindings overlay on evil mode and using which-key plugin
(use-package which-key
  :defer 1
  :init
  (which-key-mode))



(with-eval-after-load 'evil
  ;; Hit space twice to exec elisp command
  (define-key evil-normal-state-map (kbd "SPC SPC") 'counsel-M-x)
  (define-key evil-visual-state-map (kbd "SPC SPC") 'counsel-M-x)

  ;; File things
  (define-key evil-normal-state-map (kbd "SPC f f") 'counsel-find-file)
  (define-key evil-normal-state-map (kbd "SPC f r") 'counsel-recentf)
  (define-key evil-normal-state-map (kbd "SPC f l") 'counsel-locate)

  ;; Jump things
  (define-key evil-normal-state-map (kbd "SPC j i") 'counsel-imenu)
  (define-key evil-normal-state-map (kbd "SPC j s") 'swiper)
  ;; (define-key evil-normal-state-map (kbd "SPC j d") 'rtags-find-symbol-at-point)
  ;; (define-key evil-normal-state-map (kbd "SPC j r") 'rtags-find-references-at-point)
  ;; (define-key evil-normal-state-map (kbd "SPC j b") 'rtags-location-stack-back)
  ;; (define-key evil-normal-state-map (kbd "SPC j f") 'rtags-find-all-functions-called-this-function)
  ;; (define-key evil-normal-state-map (kbd "C-]") 'rtags-find-symbol-at-point)
  ;; (define-key evil-normal-state-map (kbd "C-[") 'rtags-find-symbol-at-point)
  ;; (define-key evil-normal-state-map (kbd "C-t") 'rtags-location-stack-back)
  (define-key evil-normal-state-map (kbd "s") 'avy-goto-char)
  ;; (define-key evil-normal-state-map (kbd "f") 'avy-goto-char-in-line)

  ;; window things here
  (define-key evil-normal-state-map (kbd "SPC w w") 'switch-window)
  (define-key evil-normal-state-map (kbd "SPC w 1") 'delete-other-windows)
  (define-key evil-normal-state-map (kbd "SPC w 2") 'barry-split-window-and-follow-vertically)
  (define-key evil-normal-state-map (kbd "SPC w 3") 'barry-split-window-and-follow-horizontally)

  ;; some setting for winum
  (define-key evil-normal-state-map (kbd "SPC 1") 'winum-select-window-1)
  (define-key evil-normal-state-map (kbd "SPC 2") 'winum-select-window-2)
  (define-key evil-normal-state-map (kbd "SPC 3") 'winum-select-window-3)
  (define-key evil-normal-state-map (kbd "SPC 4") 'winum-select-window-4)
  (define-key evil-normal-state-map (kbd "SPC 5") 'winum-select-window-5)

  ;; Buffer things
  (define-key evil-normal-state-map (kbd "SPC b") 'ivy-switch-buffer)
  (define-key evil-normal-state-map (kbd "SPC q") 'evil-delete-buffer)

  ;; Commnet code
  ;; (define-key evil-normal-state-map (kbd "SPC c") 'comment-or-uncomment-region)

  ;; Projectile key map
  (define-key evil-normal-state-map (kbd "SPC p") 'projectile-command-map)
  (define-key evil-normal-state-map (kbd "<f12>") 'projectile-grep)


  ;; Open terminal must be v
  (define-key evil-normal-state-map (kbd "SPC RET") 'eshell)

  ;; repeat excommand with ; key
  (define-key evil-normal-state-map (kbd ";") 'evil-ex-repeat)

  ;; Insert shot cut
  ;; (define-key evil-normal-state-map (kbd "SPC i i") 'barry-insert-shot)

  ;; For a shortcut key for compile
  (define-key evil-normal-state-map (kbd "<f5>") 'compile)
  ;; (define-key evil-normal-state-map (kbd "<f5>") 'barry-compile)

  );; dont delete this


(provide 'init-evil)



