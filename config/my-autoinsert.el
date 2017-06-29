(eval-after-load 'autoinsert
  '(define-auto-insert '("\\.\\(c\\|h\\)\\'" . "42 C header")
     '(
       "Short description: "
             "/* ************************************************************************** */" \n
             "/*                                                                            */" \n
             "/*                                                        :::      ::::::::   */" \n
             "/*   "
             (file-name-nondirectory (buffer-file-name))
             (substring (make-string 51 ? )
                                    (length (file-name-nondirectory (buffer-file-name))))
             ":+:      :+:    :+:   */" \n
             "/*                                                    +:+ +:+         +:+     */" \n
             "/*   By: " (user-login-name) " <marvin@42.fr>"
             (substring (make-string 28 ? ) (length (user-login-name)))
             "+#+  +:+       +#+        */" \n
             "/*                                                +#+#+#+#+#+   +#+           */" \n
             "/*   Created: " (format-time-string "%Y/%m/%d %H:%M:%S") " by " (user-login-name)
             (substring (make-string 18 ? ) (length (user-login-name)))
             "#+#    #+#             */" \n
             "/*   Updated: " (format-time-string "%Y/%m/%d %H:%M:%S") " by " (user-login-name)
             (substring (make-string 17 ? ) (length (user-login-name)))
             "###   ########.fr       */" \n
             "/*                                                                            */" \n
       "/* ************************************************************************** */" \n
       )))

(defun my-42-header ()
  "check and update or replace 42 header in .c and .h files"
  (interactive)
  (if (my-42-header-check)
      (my-42-header-update)
    (my-42-header-replace)))

(defun my-42-header-update ()
  "Update the existing 42 header"
  (interactive)
  (save-excursion
    (goto-char 0)
    (re-search-forward "/\\*   .\\{51\\}:\\+:      :\\+:    :\\+:   \\*/" 891 t)
    (replace-match (concat "/*   "
                           (file-name-nondirectory (buffer-file-name))
                           (substring (make-string 51 ? )
                                      (length (file-name-nondirectory (buffer-file-name))))
                           ":+:      :+:    :+:   */"))
    (re-search-forward "/\\*   Updated: [0-9]\\{4\\}/[0-9]\\{2\\}/[0-9]\\{2\\} \
[0-9]\\{2\\}:[0-9]\\{2\\}:[0-9]\\{2\\} by .\\{17\\}###   ########\\.fr       \\*/" 891 t)
    (replace-match (concat "/*   Updated: "
                           (format-time-string "%Y/%m/%d %H:%M:%S")
                           " by " (user-login-name)
                         (substring (make-string 17 ? ) (length (user-login-name)))
                           "###   ########.fr       */"))))

(defun my-42-header-replace ()
  "Replace the first 11 lines with a fresh 42 header, if there is probably a bad header"
  (interactive)
  (save-excursion
    (goto-char 0)
    (cond ((re-search-forward "^/\\*.*\\*/$" nil t)
           (re-search-forward "^$" nil t)
           (delete-region 1 (point))))
    (insert (my-42-header-generate))))

(defun my-42-header-generate ()
  "Generate 42 header string"
  (concat "/* ************************************************************************** */\n"
          "/*                                                                            */\n"
          "/*                                                        :::      ::::::::   */\n"
          "/*   "
          (file-name-nondirectory (buffer-file-name))
          (substring (make-string 51 ? )
                     (length (file-name-nondirectory (buffer-file-name))))
          ":+:      :+:    :+:   */\n"
          "/*                                                    +:+ +:+         +:+     */\n"
          "/*   By: " (user-login-name) " <marvin@42.fr>"
          (substring (make-string 28 ? ) (length (user-login-name)))
          "+#+  +:+       +#+        */\n"
          "/*                                                +#+#+#+#+#+   +#+           */\n"
          "/*   Created: " (format-time-string "%Y/%m/%d %H:%M:%S") " by " (user-login-name)
          (substring (make-string 18 ? ) (length (user-login-name)))
          "#+#    #+#             */\n"
          "/*   Updated: " (format-time-string "%Y/%m/%d %H:%M:%S") " by " (user-login-name)
          (substring (make-string 17 ? ) (length (user-login-name)))
          "###   ########.fr       */\n"
          "/*                                                                            */\n"
          "/* ************************************************************************** */\n"))

(defun my-42-header-check ()
  "Check if there's a 42 header at the top of the current buffer"
  (widen)
  (let (header lines)
    (condition-case my-simple-error
                (setq header (buffer-substring-no-properties 1 891))
            (my-simple-handler
             (my-42-header-replace)))
    (setq lines (split-string header "\n"))
    (and (= 11 (length lines))
         (seq-every-p (lambda (e) (= 80 (length e))) lines)
         (string-match "/\\* \\*\\{74\\} \\*/" (nth 0 lines))
         (string-match "/\\* \\{76\\}\\*/" (nth 1 lines))
         (string-match "/\\* \\{56\\}:::      ::::::::   \\*/" (nth 2 lines))
         (string-match "/\\*   .\\{51\\}:\\+:      :\\+:    :\\+:   \\*/" (nth 3 lines))
         (string-match "/\\* \\{52\\}\\+:\\+ \\+:\\+         \\+:\\+     \\*/" (nth 4 lines))
         (string-match "/\\*   By: .\\{3,42\\}<marvin@42.fr> *\\+#\\+  \\+:\\+       \\+#\\+        \\*/" (nth 5 lines))
         (string-match "/\\* \\{48\\}\\+#\\+#\\+#\\+#\\+#\\+   \\+#\\+           \\*/" (nth 6 lines))
         (string-match "/\\*   Created: [0-9]\\{4\\}/[0-9]\\{2\\}/[0-9]\\{2\\} \
[0-9]\\{2\\}:[0-9]\\{2\\}:[0-9]\\{2\\} by .\\{18\\}#\\+#    #\\+#             \\*/" (nth 7 lines))
         (string-match "/\\*   Updated: [0-9]\\{4\\}/[0-9]\\{2\\}/[0-9]\\{2\\} \
[0-9]\\{2\\}:[0-9]\\{2\\}:[0-9]\\{2\\} by .\\{17\\}###   ########\\.fr       \\*/" (nth 8 lines))
     (string-match "/\\* \\{76\\}\\*/" (nth 9 lines))
       (string-match "/\\* \\*\\{74\\} \\*/" (nth 10 lines)))))

;;i still hate you
(auto-insert-mode t)
(add-hook 'c-mode-hook 'my-42-header)
(provide 'my-autoinsert)
