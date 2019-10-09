;; code 

(use-package org
  :ensure nil)

(require 'org-indent)
(setq org-startup-indented t)

(set-default 'truncate-lines nil)
(set-default 'word-wrap t)
(setq helm-buffers-truncate-lines nil)
(setq org-startup-truncated nil)

(setq org-auto-align-tags nil)
(setq org-checkbox-hierarchical-statistics nil)

(setq org-image-actual-width nil)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.3))


(use-package org-bullets
  :ensure t
  :init
  (add-hook 'org-mode-hook 'org-bullets-mode)
  :config
  (setq org-bullets-bullet-list (quote ( "☀"  "⊛" "☉" "⚫" "⚪"  ))))
(setq org-ellipsis " ⤵");; ⤵ ≫
(add-to-list 'org-file-apps '("pdf" . "okular %s"))


;; set org for sage using
(use-package ob-sagemath
  :ensure nil)

;; Ob-sagemath supports only evaluating with a session.
(setq org-babel-default-header-args:sage '((:session . t)
                                           (:results . "output")))

;; C-c c for asynchronous evaluating (only for SageMath code blocks).
(with-eval-after-load "org"
  (define-key org-mode-map (kbd "C-c c") 'ob-sagemath-execute-async))

;; Do not confirm before evaluation
(setq org-confirm-babel-evaluate nil)

;; Do not evaluate code blocks when exporting.
(setq org-export-babel-evaluate nil)

;; Show images when opening a file.
(setq org-startup-with-inline-images t)

;; Show images after evaluating code blocks.
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
(add-hook 'org-babel-after-execute-hook 'org-toggle-latex-fragment)

;; config for python
(use-package ob-ipython
  :ensure t)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (ipython . t)
   ))
(setq python-shell-interpreter "/home/wl/external/workspace/python/learning-python/env/bin/python3")

(provide 'init-orgmode)
