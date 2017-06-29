(use-package god-mode
  :ensure god-mode
  :init
  (progn)
  :config
  (progn
    (eval-after-load 'evil
      '(progn
         (evil-define-state god
           "God state."
           :tag " <G> "
           :message "-- GOD MODE --"
           :entry-hook (evil-god-start-hook)
           :exit-hook (evil-god-stop-hook)
           :input-method t
           :intercept-esc nil)

         (defun evil-god-start-hook ()
           (diminish 'god-local-mode)
           (guide-key-mode t)
           (god-local-mode 1))

         (defun evil-god-stop-hook ()
           (god-local-mode -1)
           (diminish-undo 'god-local-mode))

         (evil-define-command evil-god-state-visual-entry ()
           "Enter God State with mark and point set correctly"
           (cond
            ((evil-visual-state-p)
             (let ((mrk (mark))
                   (pnt (point)))
               (evil-god-state)
               (evil-set-marker mrk)
               (evil-goto-char pnt)
               (evil-visual-highlight)))
            (t
             (evil-god-state))))

         (evil-define-command evil-god-state-exit ()
           (if (and (eq evil-previous-state 'visual)
                    (not (use-region-p)))
               (progn
                 (evil-change-to-previous-state)
                 (evil-exit-visual-state))
             (evil-change-to-previous-state)))
         ;;(add-hook 'evil-god-state-exit-hook #'evil-god-state-exit t)

         (evil-define-key 'normal global-map (kbd "\\") 'evil-god-state)
         (evil-define-key 'visual global-map (kbd "\\") 'evil-god-state-visual-entry)
         (evil-define-key 'god global-map (kbd "C-\\") 'evil-god-state-exit)))))

(provide 'my-god)
