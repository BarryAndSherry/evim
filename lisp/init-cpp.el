;; code

(use-package imenu-list
  :defer 2
  :bind
  ("<f10>" . imenu-list-smart-toggle)
  :custom-face
  (imenu-list-entry-face-1 ((t (:foreground "white"))))
  :custom
  (imenu-list-focus-after-activation t)
  (imenu-list-auto-resize t))

;; c++ code style
(setq c-default-style "linux"
      c-basic-offset 4
      tab-width 4)

(provide 'init-cpp)
