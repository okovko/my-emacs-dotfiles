(evil-leader/set-key
  "w" 'save-buffer
  "q" 'kill-buffer-and-window
  "j" 'helm-jump
  "d" 'helm-find-files
  "b" 'helm-buffers-list
  "f" 'helm-recentf
  "i" 'helm-semantic-or-imenu
  "s" 'helm-swoop
  "x" 'helm-M-x
  "y" 'helm-show-kill-ring
  "r" 'helm-rg
  "a" 'helm-apropos
  )

(provide 'my-leader-keys)
