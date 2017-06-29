(eval-after-load 'evil
  (eval-after-load 'company
    '(progn
       (evil-set-initial-state 'eshell-mode 'insert)
       (defun my-eshell-setup-keybinds ()
         (evil-define-key 'insert eshell-mode-map
         (kbd "C-a") 'eshell-pcomplete))
       (add-hook 'eshell-mode-hook 'my-eshell-setup-keybinds)
       
       (add-hook 'eshell-mode-hook
                 (lambda ()
                   (eshell-cmpl-initialize)
                   (define-key eshell-mode-map [remap eshell-pcomplete] 'helm-esh-pcomplete)
                   (define-key eshell-mode-map (kbd "C-p") 'helm-eshell-history))))))

(provide 'my-eshell)
