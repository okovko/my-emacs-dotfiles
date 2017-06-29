(eval-after-load 'evil
  '(progn
     (defun my-lisp-mode-hook ()
       (setq-default tab-width 2)
       (setq-default indent-tabs-mode nil)
       (setq-default evil-shift-width 2)
       (define-key evil-insert-state-map (kbd "C-q") 'indent-for-tab-command)
       (define-key evil-replace-state-map (kbd "C-q") 'indent-for-tab-command))
     (add-hook 'lisp-mode-hook 'my-lisp-mode-hook)))

(provide 'my-el)
