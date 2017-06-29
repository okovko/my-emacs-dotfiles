(eval-after-load 'evil
  '(progn
     (defun my-c-mode-hook ()
       (setq-default tab-width 4)
       (setq-default indent-tabs-mode t)
       (setq-default c-default-style "linux")
       (c-set-offset 'substatement-open 0)
       (setq-default c-basic-offset 4)
       (setq c-basic-offset 4)
       (setq-default evil-shift-width 4)
       (define-key evil-insert-state-map (kbd "C-q") 'tab-to-tab-stop)
       (define-key evil-replace-state-map (kbd "C-q") 'tab-to-tab-stop))
     (add-hook 'c-mode-hook 'my-c-mode-hook)))

(provide 'my-c)
