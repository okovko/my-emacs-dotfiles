;;; my-company.el -- my completion config
;;; Commentary:
;;; No idea what my-company-pass-key is about
;;; Code:

(use-package company
  :ensure company
  :init
  (progn
    (global-company-mode)
    (setq company-global-modes '(not eshell-mode)))
  :config
  (progn
    (defun my-company-pass-key (arg)
      "Pass a key out of company-mode"
      (interactive "P")
      (company-abort)
      (kbd arg))

    (define-key company-active-map (kbd "C-h") 'company-show-doc-buffer)
    (define-key company-active-map (kbd "C-l") 'company-show-location)
    (define-key company-active-map (kbd "C-j") 'company-select-next)
    (define-key company-active-map (kbd "C-k") 'company-select-previous)
    (define-key company-active-map (kbd "TAB") 'company-complete-selection)
    (define-key company-active-map (kbd "S-TAB") 'company-complete-common)
    (define-key company-active-map "\C-s" 'company-search-candidates)
    (define-key company-active-map "\C-\M-s" 'company-filter-candidates)
    (define-key company-active-map [return] 'company-abort)
    (define-key company-active-map "\e\e\e" 'company-abort)
    (define-key company-active-map "\C-g" 'company-abort)
    (define-key company-active-map (kbd "SPC") 'my-company-pass-key)))

(provide 'my-company)
;;; my-company.el ends here
