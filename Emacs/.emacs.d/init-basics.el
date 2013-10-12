;;----------------------------------------------------------------------------
;; global key-bindings
;;----------------------------------------------------------------------------

;; bind pop-tag-mark
(global-set-key (kbd "M-?") 'pop-tag-mark)

;;----------------------------------------------------------------------------
;; mode setting
;;----------------------------------------------------------------------------

;; enable icomplete-mode
(icomplete-mode t)

;; enable ido-mode
;;(ido-mode t)

;; enable electric-pair-mode
;;(electric-pair-mode t)

;; save desktop
;;(desktop-save-mode t)

;; highlight the active region
(transient-mark-mode t)

;; hide toolbar
(tool-bar-mode -1)

;; hide scroll bar
(scroll-bar-mode -1)

;; enable the delete-selection-mode
(delete-selection-mode t)

;; enable global high light
(global-font-lock-mode t)

;; set text-mode as default major mode
(setq default-major-mode 'text-mode)

;; enable emacs to open image file
(auto-image-file-mode)

;; enable line-number-mode
(setq line-number-mode t)

;; enable column-number-mode
(setq column-number-mode t)

;;----------------------------------------------------------------------------
;; some other settings
;;----------------------------------------------------------------------------

;; enable narrow
(put 'narrow-to-region 'disabled nil)

;; disable emacs system beep
(setq visible-bell t)

;; enlarge kill-ring-max value
(setq kill-ring-max 200)

;; show file's full path in title
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(provide 'init-basics)