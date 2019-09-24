;; code
(defun barry-split-window-and-follow-vertically()
  (interactive)
  (split-window-right)
  (other-window 1))

(defun barry-split-window-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (other-window 1))

;; set for winum
(use-package winum
  :defer 1
  :init
  (winum-mode))

(provide 'init-windows)
