;;; my-evil.el -- My evil config with leader, key chords, and my binds
;;; Commentary:
;;; evil-leader must load before evil
;;; Code:

(use-package evil-leader
  :commands (evil-leader-mode global-evil-leader-mode)
  :ensure evil-leader
  :demand evil-leader
  :config
  (progn
    (evil-leader/set-leader "SPC")
    (global-evil-leader-mode t)
    (global-evil-tabs-mode t)))

(use-package evil
  :ensure evil
  :config
  (progn
    (evil-mode 1)
    (setq evil-move-cursor-back nil)
    (setq evil-search-wrap nil)
    (setq evil-cross-lines t)

	;; 42 idiocy
    (whitespace-mode)
	;; end idiocy

    (use-package key-chord
      :ensure key-chord
      :config
      (progn
	(key-chord-mode 1)))

    (defun my-evil-char-from-point-whitespace-p (&optional pos)
      (let ((pos (or pos 0)))
		(memq (get-char-code-property (char-after (+ (point) pos)) 'general-category)
	      '(Zs Zl Cc))))
    (defun my-evil-char-from-point-symbol-p (&optional pos)
      (let ((pos (or pos 0)))
		(not (my-evil-char-from-point-whitespace-p pos))))
    (defun my-test (&optional pos)
      (interactive)
      (let ((pos (or pos (point))))
	(if (my-evil-char-from-point-symbol-p)
	    (message "symbol")
	  (message "not symbol"))))

    (defun my-evil-backward-WORD-boundary ()
      "Move cursor back a WORD boundary"
      (interactive)
      (cond ((my-evil-char-from-point-symbol-p)
	     (cond ((my-evil-char-from-point-symbol-p -1)
		    (evil-backward-WORD-begin))
		   (t
		    (evil-backward-WORD-end))))
	    (t
	      (evil-backward-WORD-end))))

    (defun my-evil-forward-WORD-boundary ()
      "Move cursor forward a WORD boundary"
      (interactive)
      (cond ((my-evil-char-from-point-symbol-p)
	     (cond ((my-evil-char-from-point-symbol-p 1)
		    (evil-forward-WORD-end))
		   (t
		    (evil-forward-WORD-begin))))
	    (t
	      (evil-forward-WORD-begin))))

;;  (defun my-evil-forward-word-boundary-boundary ()
;;    "Move cursor back a word, treating '-' as whitespace and bounds symbols as words"
;;
;;  (defun my-evil-forward-word ()
;;    "Move cursor forward a word, treating hyphens as whitespace, and ()[]{},. as words"
	
;;	(defun my-evil-next-line ()
;;	  "Move down a line, moving forward by the number of words behind the original position, and forward by the number of characters from the start of the original word"
;;	  (interactive)
;;	  (let (original-line original-point left-bound chars-before words-before)
;;		(setq original-line (line-beginning-position))
;;		(setq original-point (point))
;;		(evil-backward-word-end)
;;		(setq left-bound (point))
;;		(cond ((eq (line-beginning-position) original-line)
;;			   (setq words-before (count-words (line-beginning-position) left-bound))
;;               (setq chars-before (- original-point left-bound))
;;               (evil-next-line)
;;               (evil-beginning-of-line)
;;               (evil-forward-word-end words-before)
;;               (evil-forward-char chars-before))
;;			  (t
;;			   (evil-next-line 2)
;;			   (evil-move-beginning-of-line)))))
;;
;;	(defun my-evil-previous-line ()
;;	  "Move up a line, moving forward by the number of words behind the original position, and forward by the number of characters from the start of the original word"
;;	  (interactive)
;;	  (let (original-line original-point left-bound chars-before words-before)
;;		(setq original-line (line-beginning-position))
;;		(setq original-point (point))
;;		(evil-backward-word-end)
;;		(setq left-bound (point))
;;		(cond ((eq (line-beginning-position) original-line)
;;			   (setq words-before (count-words (line-beginning-position) left-bound))
;;               (setq chars-before (- original-point left-bound))
;;               (evil-previous-line)
;;               (evil-beginning-of-line)
;;               (evil-forward-word-end words-before)
;;               (evil-forward-char chars-before))
;;			  (t
;;			   (evil-previous-line 2)
;;			   (evil-move-beginning-of-line)))))

;;	(defun my-evil-word-count (start end)
;;	  "Count words between two positions"
;;	  (while (my-evil-char-from-point-whitespace-p start)
;;		(setq start (+ start 1)))
;;	  (let (num)
;;		(setq num 0)
;;		(while (not (equal start end)))
;;		  (while (my-evil-char-from-point-symbol-p start)
;;			(setq start (+ start 1)))
;;		  (while (my-evil-char-from-point-whitespace-p start)
;;			(setq start (+ start 1)))
;;		  (setq num (+ num 1))
;;		  (num)))

    ;; i would like j and k to move me to the equivalent word boundary in the next and prev line
    ;; also i think i actually prefer moving by word boundaries than by word begin / end
    ;; this would also free up letters to use for binds i actually want
    ;; furthermore, moving using f and t is usually better honestly

    ;; i actually hate some of the vim defaults
	;; just some of the less useful vim defaults that can be removed to do more useful stuff
	;; that said, it's painful to get used to not having them, unexpectedly..
    ;;(define-key evil-normal-state-map "c" nil)
    ;;(define-key evil-normal-state-map "x" nil)
    ;;(define-key evil-normal-state-map "a" nil)
    ;;(define-key evil-normal-state-map "s" nil)
    ;;(define-key evil-normal-state-map "o" nil)

	;; switch goto mark and goto mark line
    (define-key evil-normal-state-map (kbd "'") 'evil-goto-mark)
    (define-key evil-normal-state-map (kbd "`") 'evil-goto-mark-line)
	;; switch undo and replace char
    (define-key evil-normal-state-map (kbd "r") 'undo-tree-redo)
    (define-key evil-normal-state-map (kbd "C-r") 'evil-replace)
	;; put jumps on accessibly keys with useless binds
    (define-key evil-normal-state-map (kbd "DEL") 'evil-jump-backward)
    (define-key evil-normal-state-map (kbd "RET") 'evil-jump-forward)
	;; switch record macro and backward word begin
    (define-key evil-normal-state-map (kbd "b") 'evil-record-macro)
    (define-key evil-normal-state-map (kbd "q") 'evil-backward-word-begin)
    ;; i have arrow keys, why do i need hjkl for useless binds?
	;; these are the old binds
    ;;(define-key evil-normal-state-map (kbd "h") 'evil-backward-WORD-begin)
    ;;(define-key evil-normal-state-map (kbd "l") 'evil-forward-WORD-end)
	;; here are my custom binds (:
	;; add word boundary based movement.. someday
    ;; (define-key evil-normal-state-map (kbd "h") 'my-evil-backward-word-boundary)
    ;; (define-key evil-normal-state-map (kbd "l") 'my-evil-forward-word-boundary)
	;; add word based width movement.. someday
    ;; (define-key evil-normal-state-map (kbd "j") 'my-evil-next-line)
    ;; (define-key evil-normal-state-map (kbd "k") 'my-evil-previous-line)
    (define-key evil-normal-state-map (kbd "s") 'evil-backward-word-end)
	;; window navigation
    (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
    (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
    (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
    (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)

    (define-key evil-insert-state-map (kbd "C-q") 'indent-for-tab-command)
    (define-key evil-replace-state-map (kbd "C-q") 'indent-for-tab-command)

	;; use TAB as escape, forsaking consistency for ergonomics
    (define-key evil-insert-state-map (kbd "TAB") 'evil-force-normal-state)
    (define-key evil-visual-state-map (kbd "TAB") 'evil-force-normal-state)
    (define-key evil-motion-state-map (kbd "TAB") 'evil-force-normal-state)
    (define-key evil-replace-state-map (kbd "TAB") 'evil-force-normal-state)
    (define-key evil-operator-state-map (kbd "TAB") 'evil-force-normal-state)))

(provide 'my-evil)
;;; my-evil.el ends here
