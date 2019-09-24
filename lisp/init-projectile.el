;; code 

(use-package projectile
  :defer 2
  :config
  (setq projectile-use-git-grep t)
  (projectile-global-mode t)
  (setq projectile-completion-system 'ivy))

(provide 'init-projectile)
