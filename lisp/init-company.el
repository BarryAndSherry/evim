;; code 
(use-package company
  :defer 2
  :init
  (company-mode t)
  :config
  (setq
   ;; company-dabbrev-ignor
   ;; company-dabbrev-code-ignore-case nil
   ;; company-dabbrev-downcase nil
   company-idle-delay 0
   company-minimum-prefix-length 3)
  (add-hook 'after-init-hook 'global-company-mode))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-j") 'company-select-next)
  (define-key company-active-map (kbd "C-k") 'company-select-previous)
  (define-key company-active-map (kbd "C-/") 'company-search-candidates)
  (define-key company-active-map (kbd "C-M-/") 'company-filter-candidates)
  (define-key company-active-map (kbd "C-d") 'company-show-doc-buffer))

;; some config for c++ auto-complete
;; (use-package ycmd
;;   :defer 2)
;; 
;; (add-hook 'c++-mode-hook 'ycmd-mode)
;; (add-hook 'python-mode-hook 'ycmd-mode)
;; (set-variable 'ycmd-server-command `("python3" , (file-truename "~/.vim/plugged/YouCompleteMe/third_party/ycmd/ycmd")))
;; 
;; (use-package company-ycmd
;;   :defer 2
;;   :init (company-ycmd-setup))


(use-package company-irony
  :ensure t
  :defer 2
  :config
  (require 'company)
  (add-to-list 'company-backends 'company-irony))


(use-package irony
  :ensure t
  :defer 2
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))


;; some config for yasnippet
(use-package yasnippet
  :defer 2
  :diminish yas-minor-mode
  :custom (yas-snippet-dirs '("~/.emacs.d/snippets"))
  :hook (after-init . yas-global-mode))

;; And add yasnippet support for all company backends
(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")
(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))
(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))


(provide 'init-company)
