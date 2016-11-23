;;----------------------------------------------------------------------------
;; rtags setting
;;----------------------------------------------------------------------------

(require-package 'rtags)

;;; steps to index a project
;; cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 /path/to/project
;; rc -J /path/to/project

;; start the rdm process unless the process is already running.
(add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-common-hook 'rtags-start-process-unless-running)

(require 'company)
(require 'rtags)

(rtags-enable-standard-keybindings c-mode-base-map)
(rtags-diagnostics)
(setq rtags-completions-enabled t
      rtags-autostart-diagnostics t)
(push 'company-rtags company-backends)

;; fall back to gtags if rtags doesn’t have a certain project indexed
(defun use-rtags ()
  (and (rtags-executable-find "rc")
       (rtags-is-indexed)))

(provide 'init-rtags)
