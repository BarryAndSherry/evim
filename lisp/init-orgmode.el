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

(provide 'init-orgmode)
