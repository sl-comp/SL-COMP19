;;
;;

(require 'ox-publish)

(setq org-publish-project-alist
      `(("www"
         :components ("www-pages" "www-static"))
        ("www-pages" 
	 :base-directory "./org"
	 :base-extension "org"
 	 :publishing-directory "./www"
 	 :publishing-function org-html-publish-to-html
	 :recursive t

	 ;:auto-sitemap t                ; Generate sitemap.org automagically...
	 ;:sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
	 ;:sitemap-title ""         	; ... with title 'tree'.
	 ;:makeindex t
	 )

         ("www-static"
	  :base-directory "./org"
	  :base-extension "md\\|css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|gz\\|tar\\|zip\\|bz2\\|xz\\|tex\\|txt\\|html\\|scm\\|key\\|svg"
	  :publishing-directory "./www"
	  :publishing-function org-publish-attachment
	  :recursive t)
	 )
      )

; Export as UTF-8
(setf org-export-html-coding-system 'utf-8-unix)

(setf user-full-name "Mihaela Sighireanu")
(setf user-mail-address "sl-comp@googlegroups.com")

;; activate debugging
(setq debug-on-error t
      debug-on-signal nil
      debug-on-quit nil)
