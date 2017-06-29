(use-package avy
  :ensure avy
  :init
  (progn
    (setq avy-all-windows nil)
    (setq avy-case-fold-search t))
   ;; (defun my-avy-goto-char-timer-all-windows ()
   ;;   (interactive)
   ;;   (setq avy-all-windows t)
   ;;   (avy-goto-char-timer)
   ;;   (setq avy-all-windows nil))
   ;; (defun my-avy-goto-line-all-windows ()
   ;;   (interactive)
   ;;   (setq avy-all-windows t)
   ;;   (avy-goto-line)
   ;;   (setq avy-all-windows nil))
  :config
  (progn
    (defun my-avy-binary-toggle-case-fold-search ()
      "Toggle avy-case-fold-search between <t> and <nil>"
      (interactive)
      (if (eq avy-case-fold-search nil)
	  (progn (setq avy-case-fold-search t)
		 (message "avy-case-fold-search set to <t>"))
	(progn
	  (setq avy-case-fold-search nil)
	  (message "avy-case-fold-search set to <nil>"))))
    (defun my-avy-binary-toggle-all-windows ()
      "Toggle avy-case-fold-search between <t> and <nil>"
      (interactive)
      (if (eq avy-all-windows nil)
	  (progn (setq avy-all-windows t)
		 (message "avy-case-fold-search set to <t>"))
	(progn
	  (setq avy-all-windows nil)
	  (message "avy-case-fold-search set to <nil>"))))
    (eval-after-load 'evil
      '(progn
	 (define-key evil-normal-state-map "F" 'avy-goto-char-timer)
	 (define-key evil-normal-state-map "T" 'avy-goto-line)

	 (define-key evil-visual-state-map "F" 'avy-goto-char-timer)
	 (define-key evil-visual-state-map "T" 'avy-goto-line)))))

	 ;;(define-key evil-normal-state-map "f" 'avy-goto-char-timer)
	 ;;(key-chord-define evil-normal-state-map "ff" 'my-avy-goto-char-timer-all-windows)
	 ;;(define-key evil-normal-state-map "t" 'avy-goto-line)
	 ;;(key-chord-define evil-normal-state-map "tt" 'my-avy-goto-line-all-windows)

	 ;;(define-key evil-visual-state-map "f" 'avy-goto-char-timer)
	 ;;(key-chord-define evil-visual-state-map "ff" 'my-avy-goto-char-timer-all-windows)
	 ;;(define-key evil-visual-state-map "t" 'avy-goto-line)
	 ;;(key-chord-define evil-visual-state-map "tt" 'my-avy-goto-line-all-windows)

(provide 'my-avy)
