(use-package counsel
  :defer 1)

(use-package swiper
  :defer 1
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    (advice-add 'swiper :after #'recenter)))

(provide 'init-ivy)
