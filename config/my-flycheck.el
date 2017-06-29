(use-package flycheck
  :ensure flycheck
  :init
  (progn
    (add-hook 'after-init-hook #'global-flycheck-mode))
  :config
  (progn
    (setq flycheck-check-syntax-automatically '(save mode-enabled))

    (eval-after-load 'evil
      '(progn
	 (evil-define-key 'normal flycheck-error-list-mode-map
	   "q" 'quit-window
	   "j" #'flycheck-error-list-next-error
	   "k" #'flycheck-error-list-previous-error
	   "K" #'evil-previous-line
	   "J" #'evil-next-line
	   (kbd "RET") #'flycheck-error-list-goto-error)))))

(provide 'my-flycheck)
