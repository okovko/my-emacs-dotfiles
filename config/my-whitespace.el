(use-package whitespace
  :commands (whitespace-style whitespace-mode)
  :ensure whitespace
  :init
  (progn
	(setq whitespace-style (quote (tab-mark space-mark face tabs spaces)))
	(setq whitespace-display-mappings
		  '((space-mark 32 [9251] [46])
			(tab-mark 9 [8594 9] [92 9])))
	(custom-set-faces
	 '(whitespace-space ((t (:bold t :foreground "red"))))
	 '(whitespace-tab ((t (:bold t :foreground "green"))))))
  :config
  (progn
  (eval-after-load 'evil
	'(progn
	   (define-key evil-normal-state-map (kbd "C-t") 'whitespace-mode)))))

(provide 'my-whitespace)
