(use-package guide-key
  :ensure guide-key
  :diminish guide-key-mode
  :config
  (progn
    (setq guide-key/guide-key-sequence '("C-x" "C-c"))
    (setq guide-key/recursive-key-sequence-flag t)
    (guide-key-mode 1)
    (setq guide-key/idle-delay 0.5)
    (setq guide-key/popup-window-position 'top)))

(use-package guide-key-tip
  :ensure guide-key-tip
  :config
  (progn
    ;; doesn't work in terminal mode,
    ;; but also look ugly in graphical mode
    ;; i'll figure this out later when i switch
    ;; to graphical mode
    (setq guide-key-tip/enabled nil)))


(provide 'my-guide-key)
