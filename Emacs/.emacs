;; -*- coding: utf-8 -*-

;; learning emacs configuration

;; init load-path and start-time
(setq emacs-load-start-time (current-time))
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-complete"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs-dictionary"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/dired"))
(when (<= emacs-major-version 21)
  (add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs-21")))

;;----------------------------------------------------------------------------
;; compilation setting
;;----------------------------------------------------------------------------

;; do not promp
;; (setq compilation-read-command nil)

;; set compile command
;; (setq compile-command "make clobber")
(setq compile-command "make debug")

;;----------------------------------------------------------------------------
;; using tags
;;----------------------------------------------------------------------------

;; create tags in specific directory for specific directory
(defun create-tags (dir-name1 tag-file-name dir-name2)
  "Create tags file"
  (interactive 
   "DDirectory in which tag-file will be created: \
    \nsName of the tag-file (TAGS): \
    \nDDirectory to be taged: ")
  (if (string= "" tag-file-name) (setq tag-file-name "TAGS))
  (shell-command
   ;; use system ctags instead of emacs ctags
   (format "/usr/bin/ctags -f %s/%s -e -R %s" dir-name1 tag-file-name (directory-file-name dir-name2)))
   (message "create-tags succeed !")
  )
(defalias 'ct 'create-tags)

;; set tags file lists
(setq tags-table-list
      '("~/my_tag_files"
        "~/my_include")) 

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require 'init-com-functions)
(require 'dictionary-init)
(require 'init-routines)
(require 'init-register)
(require 'init-macros)
(require 'init-dired)
(require 'dired+)
(require 'init-hippie-expand)
(require 'init-gnus)
(require 'init-cc-mode)
(require 'tempo-c-cpp)
(require 'init-alias)
(if (> emacs-major-version 21)
    (progn
      (require 'init-auto-complete)
      (require 'init-lua))
  (progn
    (require 'ido)
    ;; (require 'init-emacs-w3m)
    ))
(require 'init-basics)

(require 'session)
(add-hook 'after-init-hook 'session-initialize)
