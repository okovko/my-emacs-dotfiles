(use-package elisp-slime-nav
  :ensure elisp-slime-nav
  :init
  (progn
    (defun my-lisp-hook ()
      (elisp-slime-nav-mode)
      (eldoc-mode))
    (add-hook 'emacs-lisp-mode-hook 'my-lisp-hook))
  :config
  (eval-after-load 'evil
    '(progn
      (evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
        'elisp-slime-nav-describe-elisp-thing-at-point))))

(provide 'my-elisp-slime-nav)
