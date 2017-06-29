(add-to-list 'load-path (concat user-emacs-directory "config"))

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(require 'package)
(package-initialize)
(setq package-enable-at-startup nil)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;;(require 'levenshtein)
;;(require 'my-dired)
;;(require 'my-ibuffer)
;;(require 'my-neotree)
(require 'my-core)
(require 'my-autoinsert)
(require 'my-evil)
(require 'my-god)
(require 'my-eshell)
(require 'my-copy)
(require 'my-apropos)
(require 'my-elisp-slime-nav)
(require 'my-whitespace)
(require 'my-powerline)
(require 'my-projectile)
(require 'my-avy)
(require 'my-company)
(require 'my-flycheck)
(require 'my-helm)
(require 'my-c)
(require 'my-el)
(require 'my-guide-key)
(require 'my-helm-rg)
(require 'my-leader-keys)

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-tabs helm-ag helm-projectile neotree projectile guide-key-tip guide-key avy paredit use-package-chords powerline-evil helm-swoop helm-flycheck god-mode evil-leader elisp-slime-nav company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-space ((t (:bold t :foreground "red"))))
 '(whitespace-tab ((t (:bold t :foreground "green")))))

;; (load-theme 'mine-theme)
