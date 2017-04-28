;****************** (from) MUSE MANUAL **************************
;****************** http://learn.tsinghua.edu.cn:8080/2005211356/emacs/EmacsMusecof.html

;****************** Getting Started ***********************
(require 'outline)       ; I like outline-style faces
(require 'muse)          ; load generic module
(require 'muse-colors)   ; load coloring/font-lock module
(require 'muse-mode)     ; load authoring mode
(require 'muse-blosxom)  ; load blosxom module
(require 'muse-docbook)  ; load DocBook publishing style
(require 'muse-html)     ; load (X)HTML publishing style
(require 'muse-latex)    ; load LaTeX/PDF publishing styles
;; (require 'muse-latex2png) ; publish <latex> tags
(require 'muse-texinfo)  ; load Info publishing style
(require 'muse-wiki)     ; load Wiki support
(require 'muse-xml)      ; load XML support


;; Inline LaTex
; (load "/home/dog/TMP/soft/muse/lisp/muse-latex2png.el")
;(push '("latex" t t t gs-latex-tag) emacs-wiki-markup-tags)
;(setq gs-latex2png-scale-factor 
;****************** Creating and Managing Muse Projects ***********

(require 'muse-project)

(muse-derive-style "my-page-html" "html"
                   :header "~/World/WebSite/header.html"
                   :footer "~/World/WebSite/footer.html")

;; (setq muse-project-alist
;;       `(
;;         ("my-page"
;;          (,@(muse-project-alist-dirs "~/projects/my-page-muse") :default "index")
;;          ,@(muse-project-alist-styles "~/projects/my-page-muse"
;;                                       "~/projects/my-page-muse"
;;                                       "my-page-html")
;;          (:base "my-page-pdf"
;;                 :path "~/projects/my-page-muse/en"
;;                 :include "/alexott-cv-en[^/]*$")
;;          (:base "my-page-pdf"
;;                 :path "~/projects/my-page-muse/ru"
;;                 :include "/alexott-cv-ru[^/]*$"))))

;; (setq muse-project-alist
;;       '(("website" ("~/Pages" :default "index")
;;          (:base "html" :path "~/public_html")
;;          (:base "pdf" :path "~/public_html/pdf"))))

(setq muse-project-alist
;;       '(
;; 	("WebSite"
;; 	 ("~/World/WebSite/museFiles" :default "index")
;; 	 (:base "html" :path "~/World/WebSite/html")
;; 	 (:base "pdf" :path "~/World/WebSite/html/pdf")
;; 	 )
;; 	;; (,@(muse-project-alist-dirs "~/World/WebSite/museFiles") :default "index")
;; 	;;  ;; Publish this directory and its subdirectories.  Arguments
;; 	;;  ;; are as follows.  The above `muse-project-alist-dirs' part
;; 	;;  ;; is also needed.
;; 	;;  ;;   1. Source directory
;; 	;;  ;;   2. Output directory
;; 	;;  ;;   3. Publishing style
;; 	;;  ;;   remainder: Other things to put in every generated style
;; 	;;  ,@(muse-project-alist-styles "~/World/WebSite/museFiles"
;; 	;; 			      "~/World/WebSite/html"
;; 	;; 			      "html"))
;; 	("Public"                      
;;          ("~/World/WebSite/museFiles/public" :default "new-research")
;;          (:base "html" :path "~/World/WebSite/html/public")
;;          (:base "pdf" :path "~/World/WebSite/html/public/pdf")
;; 	 )

;; 	;; ("Panther"                      
;;         ;; ("~/DogDoc/Muse/Home" :default "Wel")
;;         ;; (:base "html" :path "~/DogDoc/MuseSite/Home" ))
;; ;        ("Panther"                      
;; ;         ("~/DogDoc/Muse/Panther" :default "Wel")
;; ;         (:base "html" :path "~/DogDoc/MuseSite/Panther" ))
;; ;        ("Arrow"
;; ;	 ("~/DogDoc/Muse/Arrow" :default "Wel")
;; ;	 (:base "html" :path "~/DogDoc/MuseSite/Arrow")
;; ;	 (:base "pdf" :path "~/DogDoc/MuseSite/Arrow/pdf")
;; 	)
      '(
	("WebSite"
	 ("~/World/WebSite/museFiles" :default "index")
	 (:base "html" :path "~/World/WebSite/html")
	 (:base "pdf" :path "~/World/WebSite/html/pdf")
	 )
	("UIUC-WebSite"                      
         ("~/World/WebSite/UIUC-Muse-Files" :default "index")
         (:base "my-page-html" :path "~/World/WebSite/UIUC-html/public")
         (:base "pdf" :path "~/World/WebSite/UIUC-html/public/pdf")
	 )
	 )
        )

(muse-publishing-directive "title")
(muse-publishing-directive "author")
(muse-publishing-directive "date")

(custom-set-variables
 '(muse-colors-autogen-headings (quote outline))
 '(muse-file-extension "muse")
 '(muse-html-charset-default "utf-8")
 '(muse-html-encoding-default (quote utf-8))
 '(muse-html-meta-content-encoding (quote utf-8))
 '(muse-mode-auto-p nil nil (muse-project))
 '(muse-mode-highlight-p t nil (muse-colors))
 )

(setq muse-html-style-sheet "<link rel=\"stylesheet\"
                                   type=\"text/css\"
                                   href=\"style.css\"/>")


; (setq muse-html-header "~/World/WebSite/header.html")
;; (setq muse-html-footer "~/World/WebSite/footer.html")

;; "header.html" and "footer.html" are header and footer,
;; muse will insert them before and after the generated HTML


;!!!!!!!!!!!!!!!!!!!! INCOMPLETE
;******************** CONTENTS *****************************
; http://gunnarwrobel.de/wiki/EmacsMuseMode.html

;; (defun muse-publish-content ()
;;   (let ((depths (muse-publishing-directive "contentdepth")))
;;     (when depths
;;       (let ((depth (string-to-number depths)))
;; 	(when (not (eq depth 0))
;; 	  (insert "<td class='contents'><div class='contenthead'>
;;                    Table of contents</div><div class='contentbody'>")
;; 	  (set (make-local-variable 'muse-publish-generate-contents)
;; 	       (cons (copy-marker (point) t) depth))
;; 	  (forward-char)
;; 	  (insert "</div></td>"))))))

;; (defun muse-publish-status ()
;;   (let ((status  (muse-publishing-directive "status")))
;;     (when status
;;       (let ((tmp (split-string status "|")))
;; 	(concat "<div class='status"
;; 		(pop tmp)
;; 		"'>Status: "
;; 		(pop tmp)
;; 		"</div>")))))

;;;;;;;;;;;;;;;;;;;;;;; Last change
; #lastchange 2005-09-09 [11:12]

;; (defun format-time-last-changed ()
;;   (format-time-string "%Y-%m-%d [%H:%M]"))

;; (defun insert-last-changed ()
;;   (insert (format-time-last-changed)))

;; (defun update-last-changed ()
;;   (save-excursion
;;     (goto-char (point-min))
;;     (when (re-search-forward "^#lastchange\\s +[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}\\s \\[[0-9]\\{2\\}:[0-9]\\{2\\}\\]" nil t)
;;       (delete-region (match-beginning 0) (match-end 0))
;;       (insert "#lastchange ")
;;       (insert-last-changed))))

;; (defun record-last-changed ()
;;   (setq write-contents-hooks 'update-last-changed))

;; (setq muse-mode-hook (quote (flyspell-mode highlight-changes-mode record-last-changed)))

;; (load "~/Pond/sword/emacs-el-files/muse-srctag.el")