;; c/c++ programming mode setting

;; Here's a sample .emacs file that might help you along the way.
;; Just copy this region and paste it into your .emacs file.  You may
;; want to change some of the actual values.

(defconst my-c-style
  '((c-tab-always-indent        . t)
    (c-comment-only-line-offset . 4)
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (substatement-open . 0)
                                   (case-label        . 4)
                                   (block-open        . 0)
                                   (knr-argdecl-intro . -)))
    (c-echo-syntactic-information-p . t))
  "My C Programming Style")

;; offset customizations not in my-c-style
(setq c-offsets-alist '((member-init-intro . ++)))

;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  ;; add my personal style and set it for the current buffer
  (c-add-style "PERSONAL" my-c-style t)
  ;; other customizations
  (setq tab-width 8
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
  ;; we like auto-newline and hungry-delete
  (c-toggle-auto-hungry-state 1)
  ;; key bindings for all supported languages.  We can put these in
  ;; c-mode-base-map because c-mode-map, c++-mode-map, objc-mode-map,
  ;; java-mode-map, idl-mode-map, and pike-mode-map inherit from it.
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; show function name in mode-line
(add-hook 'c-mode-common-hook (lambda() (which-function-mode t)))

;; navigation between header and cpp/cc files
(add-hook 'c-mode-common-hook (lambda() (local-set-key (kbd "C-c o") 'ff-find-other-file)))
    
;; jump to the start of the function    
(add-hook 'c-mode-common-hook (lambda() (local-set-key (kbd "C-M-a") 'c-beginning-of-defun)))

;; jump to the end of the function    
(add-hook 'c-mode-common-hook (lambda() (local-set-key (kbd "C-M-e") 'c-end-of-defun)))
    
;; use <f5> to compile
(add-hook 'c-mode-common-hook (lambda() (local-set-key (kbd "<f5>") 'compile)))

(provide 'init-cc-mode)
