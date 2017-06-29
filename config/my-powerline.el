(use-package powerline
  :ensure powerline
  :init
  (progn
    (use-package powerline-evil
      :ensure powerline-evil
      :init
      (progn
	(powerline-evil-vim-color-theme)))))

(provide 'my-powerline)
    
