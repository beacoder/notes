;;----------------------------------------------------------------------------
;; third-party setting
;;----------------------------------------------------------------------------

;;; whitespace setting
(require 'init-whitespace)


;;; dired setting
(require-package 'dired+)
(require-package 'dired-details)
(require-package 'dired-details+)


;;; async setting
(require-package 'async)
;; deal with problems when updating packages
(require 'async-bytecomp)
(async-bytecomp-package-mode 1)

;; provide dired with asynchronous abilities
(after-load "dired-aux" (require 'dired-async))

;; sending emails asynchronously
(require 'smtpmail-async)
(setq send-mail-function 'async-smtpmail-send-it
      message-send-mail-function 'async-smtpmail-send-it)


;;; multiple-cursors setting
(require-package 'multiple-cursors)

(defvar my-mc-keymap nil
  "Customize keybindings for multiple-cursors-mode.")
(progn
  (setq my-mc-keymap (make-sparse-keymap))
  (define-key my-mc-keymap (kbd "C-e") 'mc/edit-lines)
  (define-key my-mc-keymap (kbd "C-p") 'mc/mark-previous-like-this)
  (define-key my-mc-keymap (kbd "C-n") 'mc/mark-next-like-this))

(define-minor-mode my-mc-mode
  "minor-mode to customize keybindings for mulitiple-cursors-mode. "
  nil nil my-mc-keymap
  (when my-mc-mode
    (add-hook 'multiple-cursors-mode-disabled-hook
              (lambda () (my-mc-mode -1)))))
(global-set-key (kbd "C-x m") 'my-mc-mode)


;;; undo-tree setting
;; "C-x u" => open the undo-tree-visualizer
(require-package 'undo-tree)
(global-undo-tree-mode)
;; undo-buffer limit -> 100 MB                                                       |
(setq undo-outer-limit (* 100 (expt 1024 2)))



;;; slime setting
;; (require 'slime-autoloads)
;; (setq inferior-lisp-program
;;       (replace-regexp-in-string "/lib/sbcl/?$" "/bin/sbcl" (getenv "SBCL_HOME")))
;; (slime-setup '(slime-fancy slime-indentation slime-asdf))
;; (setq lisp-indent-function 'common-lisp-indent-function)


;;; paredit setting
;; (require-package 'paredit)
;; (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
;; (eval-after-load 'paredit
;;   '(progn
;;      ;; Modify kill-sentence, which is easily confused with the kill-sexp
;;      ;; binding, but doesn't preserve sexp structure
;;      (define-key paredit-mode-map [remap kill-sentence] 'paredit-kill)
;;      (define-key paredit-mode-map [remap backward-kill-sentence] nil)

;;      ;; Allow my global binding of M-? to work when paredit is active
;;      (define-key paredit-mode-map (kbd "M-?") nil)
;;      ))
;; (add-hook 'prog-mode-hook 'enable-paredit-mode)

;; ;; "C-)" might not work as expected in putty, so we create a new prefix-key for paredit.
;; (define-prefix-command 'paredit-map)
;; (define-key global-map "\C-xp" paredit-map)
;; (define-key paredit-map (kbd "s") 'paredit-forward-slurp-sexp)
;; (define-key paredit-map (kbd "b") 'paredit-forward-barf-sexp)


;;; smex setting
(require-package 'smex)
(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(global-set-key [remap execute-extended-command] 'smex)


;;; ttcn3 setting
(autoload 'ttcn-3-mode "ttcn3" "Major mode for ttcn3 files" t)
(add-to-list 'auto-mode-alist '("\\.ttcn$" . ttcn-3-mode))
(add-to-list 'auto-mode-alist '("\\.ttcnpp$" . ttcn-3-mode))


;;; keyfreq setting
;; keyfreq-show could show the key-frequency
(require-package 'keyfreq)
(setq keyfreq-excluded-commands
      '(self-insert-command
        abort-recursive-edit
        forward-char
        backward-char
        previous-line
        next-line))
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)


;;; regex-tool setting
;; "C-c C-c" => force an update
;; "C-c C-k" => quit regex-tool
(require-package 'regex-tool)
;; use pcre instead of emacs
(setq regex-tool-backend 'perl)
(global-set-key (kbd "C-c C-r") 'regex-tool)


;;; zenburn setting
;; need to setup putty color which goes well with zenburn first
(require-package 'zenburn-theme)
(load-theme 'zenburn t)


;;; key-binding reminder
(require-package 'guide-key)
(guide-key-mode 1)
(setq guide-key/guide-key-sequence '("C-c"    ;; general
                                     "C-x r"  ;; register
                                     "C-x t"  ;; ttcn3
                                     "C-c M"  ;; ggtags
                                     "C-c r"  ;; rtags
                                     ))


;;; diminish
(require-package 'diminish)


;;; ggtags setting
;; "cd /path/to/project && gtags" => generate gtags
;; "M-." =>  ggtags-find-tag-dwim
;; "C-c M-r" ggtags-find-tag-regexp
;; "M-]" =>  ggtags-find-reference
;; "C-c M-f" ggtags-find-file
;; "C-c M-g" ggtags-grep
(require-package 'ggtags)
(after-load 'ggtags (define-key ggtags-mode-prefix-map "\M-r" 'ggtags-find-tag-regexp))
(defun use-gtags ()
  (and (executable-find "global")
       ;; check existence of GTAGS
       (not (string-match-p "GTAGS not found" (shell-command-to-string "global -p")))
       (not (member major-mode ggtags-exclude-modes))))
(add-hook 'c-mode-common-hook
          (lambda () (when (use-gtags)
                       (setq gtags-suggested-key-mapping t)
                       (ggtags-mode 1))))


;;; weather report
;;  "wttrin" => Display weather; "g" => Change city; "q" => Quit
(require-package 'wttrin)
(setq wttrin-default-cities '("Shanghai" "Taizhou"))


;;; other setting
(require 'init-hydra)
(require 'init-git)
;; (require 'init-helm)
(require 'init-company)
(require 'init-rtags)
(require 'init-dictionary)
(require 'init-dired)
(require 'init-org)
(require-package 'buffer-move)
(require-package 'flymake-cursor)

(provide 'init-3rd-party)
