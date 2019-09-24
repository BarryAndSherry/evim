;;  code
(defun eshell/cl()
  (let ((eshell-buffer-maximum-lines 0)) (eshell-truncate-buffer)))

(add-hook 'eshell-mode-hook
             (lambda() (define-key evil-insert-state-local-map (kbd "C-l")
                         (lambda() (interactive) (eshell/cl)))))

;; Some alias
(defalias 'ff 'find-file)


(provide 'init-shell)
