(tool-bar-mode -1) (menu-bar-mode -1)
(setq create-lockfiles nil)
(put 'narrow-to-region 'disabled nil)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(column-number-mode)
(set-fringe-style '(8 . 0))
(setq initial-scratch-message nil)
(defalias 'man 'woman)
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)
(setq ediff-split-window-function 'split-window-horizontally)

(xterm-mouse-mode 0)
(visual-line-mode 1)
(setq require-final-newline t)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq sentence-end-double-space nil)

(setq mark-ring-max 64)
(setq global-mark-ring-max 128)

(which-function-mode 1)

(setq backup-directory-alist '(("." . "~/.emacs.backups"))
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 20
      kept-old-versions 5)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.autosaves/" t)))

(provide 'my-core)
