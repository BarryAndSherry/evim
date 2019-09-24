;; Config elpa here

(when (>= emacs-major-version 24)
   (require 'package)
   (setq package-enable-at-startup nil)
     (add-to-list 'package-archives
                '("melpa" . "http://elpa.emacs-china.org/melpa/") t))
(package-initialize)                                                                                                                    

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
   
(provide 'init-elpa)

