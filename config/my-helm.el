(use-package helm
  :ensure helm
  :config
  (progn
	(setq helm-apropos-fuzzy-match t)
    (setq helm-M-x-fuzzy-match t)
    (setq helm-buffers-fuzzy-matching t)
    (setq helm-recentf-fuzzy-match t)
    (setq helm-split-window-in-side-p t)
    (setq helm-adaptive-history-file "~/.emacs.d/helm-adaptive-history")
    ;;(setq helm-split-window-default-side (quote other))
    ;;(setq helm-display-function 'helm-default-display-buffer)
    (setq helm-grep-ag-command "rg --color=always --colors 'match:fg:black' --colors 'match:bg:yellow' --smart-case --no-heading --line-number %s %s %s")
    (setq helm-grep-ag-pipe-cmd-switches '("--colors 'match:fg:black'" "--colors 'match:bg:yellow'"))
    (helm-mode t)

    (define-key helm-map (kbd "C-e") 'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-j") 'helm-next-line)
    (define-key helm-map (kbd "C-k") 'helm-previous-line)
    (define-key helm-map (kbd "C-c") 'helm-delete-minibuffer-contents)
    (define-key helm-map (kbd "C-d") 'backward-kill-word)

    (require 'helm-files)

    (eval-after-load 'projectile
      (use-package helm-projectile
        :ensure helm-projectile))

      (defun helm-jump ()
        "Customized contents and order of minibuffer"
        (interactive)
        (let ((helm-ff-transformer-show-only-basename nil))
          (helm-other-buffer '(helm-projectile-sources-list
                               helm-source-buffers-list
                               helm-source-recentf
                               helm-source-bookmarks
                               helm-source-file-cache
                               helm-source-files-in-current-dir
                               helm-source-locate
                               helm-source-buffer-not-found)
                             "*helm jump*")))

    (setq helm-quick-update t)

    (use-package helm-swoop
      :ensure helm-swoop
      :config
      (progn
        (setq helm-swoop-pre-input-function (lambda () ()))))

    (eval-after-load 'flycheck
      '(progn
         (use-package helm-flycheck
           :ensure helm-flycheck)))))

(provide 'my-helm)
