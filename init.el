;; This is emacs config file -- init.el

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Code begin;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; emacs startup time
(add-hook 'emacs-startup-hook
	  (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                (format "%.2f seconds"
                    (float-time
                        (time-subtract after-init-time before-init-time))) gcs-done)))

;;; Temporarily reduce garbage collection during startup. Inspect `gcs-done'.
(defun ambrevar/reset-gc-cons-threshold ()
  (setq gc-cons-threshold (car (get 'gc-cons-threshold 'standard-value))))
(setq gc-cons-threshold (* 64 1024 1024))
(add-hook 'after-init-hook #'ambrevar/reset-gc-cons-threshold)

;;; Temporarily disable the file name handler.
(setq default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(defun ambrevar/reset-file-name-handler-alist ()
  (setq file-name-handler-alist
	(append default-file-name-handler-alist
		file-name-handler-alist))
  (cl-delete-duplicates file-name-handler-alist :test 'equal))
(add-hook 'after-init-hook #'ambrevar/reset-file-name-handler-alist)

;; Avoid the pitfall of “loading old bytecode instead of newer source”
(setq load-prefer-newer t)

;; Add lisp pahth and make it fast 
(defun update-load-path (&rest _)
  "Update `load-path'."
  (push (expand-file-name "site-lisp" user-emacs-directory) load-path)
  (push (expand-file-name "lisp" user-emacs-directory) load-path)
  (push (expand-file-name "github" user-emacs-directory) load-path))

(defun add-subdirs-to-load-path (&rest _)
  "Add subdirectories to `load-path'."
  (let ((default-directory
          (expand-file-name "site-lisp" user-emacs-directory)))
    (normal-top-level-add-subdirs-to-load-path)))

(advice-add #'package-initialize :after #'update-load-path)
(advice-add #'package-initialize :after #'add-subdirs-to-load-path)
(update-load-path)

;; some common settings
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

;; set proxy for emacs
;; (setq url-proxy-services '(("http" . "127.0.0.1:1080")))
;; load config plugin

(require 'init-elpa)
(require 'init-shell)
(require 'init-ivy)
(require 'init-company)
(require 'init-avy)
(require 'init-windows)
(require 'init-projectile)
(require 'init-cpp)
(require 'init-orgmode)
(require 'company-english-helper)
(require 'darkroom)
(require 'insert-translated-name)
(require 'init-evil)
(require 'init-ui)
