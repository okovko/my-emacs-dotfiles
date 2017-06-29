(eval-after-load 'evil
  '(progn
     (evil-set-initial-state 'apropos-mode 'normal)
     (evil-define-key 'normal apropos-mode-map
       (kbd "j") 'forward-button
       (kbd "k") 'backward-button
       (kbd "q") 'quit-window
       (kbd "RET") 'apropos-follow
       )))

(provide 'my-apropos)
