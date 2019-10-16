;; Config elpa here

(when (>= emacs-major-version 24)
   (require 'package)
   (setq package-enable-at-startup nil)
   (setq package-check-signature nil)
   (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                           ("melpa" . "http://elpa.emacs-china.org/melpa/")))

   ;; (add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/") t)
   ;; (add-to-list 'package-archives '("gnu" . "http://elpa.emacs-china.org/gnu/") t)
   ;; (add-to-list 'package-archives '("org" . "http://elpa.emacs-china.org/org/") t)
   )

(package-initialize)
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
   
(provide 'init-elpa)

