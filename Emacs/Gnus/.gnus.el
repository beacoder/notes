;; my gnus configuration

;; enable fetch news function
;; (setq gnus-select-method '(nntp "news.gmane.org"))

;; enable fetch email function
;; (setq gnus-secondary-select-methods '((nnml "")))

;; add this to be able to list all labels in gmail
(setq gnus-ignored-newsgroups "")

;; to be able to search within your gmail/imap mail
;; (require 'nnir)

;; add this to configure gmail imap 
(add-to-list 'gnus-secondary-select-methods '(nnimap "gmail"
                                             (nnimap-address "imap.gmail.com")
                                             (nnimap-server-port 993)
                                             (nnimap-stream ssl)
				             (nnir-search-engine imap)
				             (nnimap-authinfo-file "~/.authinfo")))

;; set "nnml" method and pop server configuration 
;; so that we could retrieve mails from pop server

(setq gnus-select-method '(nnml ""))

;; receive mails from a pop server
(setq mail-sources
      '((pop :server "pop.ee-post.com"          ;; pop3 mail server
	     :user "bright_chen@huatek.com"     ;; user name
	     :port "pop3"
	     :password "5ihuatek")))            ;; password

;; some other e-mail address
;; chenhuming@gmail.com
;; Bright_Chen@huatek.com
;; Bright.Chen@ptn.advantest.com

;; set your name and email address 
(setq user-full-name "Bright.Chen"
      user-mail-address "Bright.Chen@ptn.advantest.com")
      
;; never delete no received mails in gnus
(setq mail-source-delete-incoming nil)

;; if we don't want to delete mails on our pop server,
;; we need to install 'epop3.el'

;; send mails with a smtp server
(setq smtpmail-auth-credentials
     '(("smtp.ee-post.com"                      ;; smtp used to send mails
	      25                                ;; port
      	"bright_chen@huatek.com"                ;; user name
	      "5ihuatek"                        ;; password
	    )))

;; specify the smtp server used to send mails 
(setq smtpmail-default-smtp-server "smtp.ee-post.com"
      smtpmail-smtp-server "smtp.ee-post.com")

;; function used to send mail
(setq send-mail-function 'smtpmail-send-it
      ;; message-send-mail-function 'smtpmail-send-it
      )

;; show debug info where sending mails failed 
(setq smtpmail-debug-info t
      smtpmail-debug-verb t)

;; load smtpmail library
(require 'smtpmail)