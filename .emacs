(add-to-list 'auto-mode-alist '("\\.md$" . jekyll-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.html" . jekyll-html-mode))

(defun connect-remote ()
  (interactive)
  (dired "/ssh:mininet@mininet-vm:~/"))

(load-file "~/Pond/sword/emacs-start.d/basic.el")
(load-file "~/Pond/sword/emacs-start.d/nongnu.el")

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-aliceblue)))

;; (set-face-background 'hl-line "black")

;; (set-face-background 'hl-line "LightCyan1")
;; (set-face-background 'hl-line "azure2")
;; (set-face-background 'hl-line "ivory")
;; (set-face-background 'hl-line "honeydew1")
;; (set-face-background 'hl-line "light yellow")
;; (set-face-background 'hl-line "beige")
;; (set-face-background 'hl-line "light goldenrod")

;; (set-face-background 'hl-line "wheat1")
;; (set-face-background 'hl-line "light green")
;; (set-face-background 'hl-line "LightBlue1")
;; (set-face-background 'hl-line "peach puff")

;; (set-face-background 'hl-line "gainsboro")

;; (set-face-background 'hl-line "saddle brown")
;; (set-face-background 'hl-line "SlateGray4")
;; (set-face-background 'hl-line "turquoise4")
;; (set-face-background 'hl-line "Pink4")
;; (set-face-background 'hl-line "HotPink4")
;; (set-face-background 'hl-line "DarkSlateGray1")
;; (set-face-background 'hl-line "blue")
;; (set-face-background 'hl-line "DeepSkyBlue4")
;; (set-face-background 'hl-line "PaleTurquoise1")
;; (set-face-background 'hl-line "DodgerBlue4")
;; (set-face-background 'hl-line "DodgerBlue4")
;; (set-face-background 'hl-line "RoyalBlue4")
;; (set-face-background 'hl-line "gray30")
;; (set-face-background 'hl-line "gray20")
;; (set-face-background 'hl-line "gray40")
;; (set-face-background 'hl-line "gray10")
;; (set-face-background 'hl-line "gray80")
;; (set-face-background 'hl-line "black")
;; (set-face-background 'hl-line "blue4")
;; (set-face-background 'hl-line "selectedKnobColor")
;; (set-face-background 'hl-line "DeepSkyBlue4")
;; (set-face-foreground 'highlight nil)
;; (set-face-background 'hl-line "white")
;; (set-face-background 'hl-line "CadetBlue4")
;; (set-face-background 'hl-line "#3e4446")

;; (setq bm-highlight-style 'bm-highlight-only-line)
;; M-x customize-variable

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(bm-face ((t (:background "sea green" :foreground "white"))))
;;  '(bm-persistent-face ((t (:background "IndianRed1" :foreground "White")))))

;; tex, automatically generated, 2014/06/27 14:57:51
;; I got lucky and found a solution!
;; Follow these steps
;; M-x customize-variable
;; Emacs gives: Customize variable: Enter: TeX-command-list
;; Search for View (enter C-s and then type `View)
;; Emacs will take you to the view command where you can enter text.
;; It will look something like this (after Command there will be a place for text entry):
;; [INS] [DEL] Name: View                                                                                 
;;             Command: open -a Preview.app %s.pdf                                                        
;;             How: [Value Menu] TeX-run-command                                                          
;;             Create a process for NAME using COMMAND to process FILE. More                              
;;             Prompt: [Toggle]  on (non-nil)                                                             
;;             Modes: [Value Menu] All                                                                    
;;             Menu elements:                                                                             
;;             [INS] [DEL] Lisp expression: :help                                                         
;;             [INS] [DEL] Lisp expression: "Run Text viewer"
;; Change the text after Command: to whatever you need. This will automatically change your ~/.emacs file.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-list (quote (("TeX" "%(PDF)%(tex) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (plain-tex-mode texinfo-mode ams-tex-mode) :help "Run plain TeX") ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX") ("Makeinfo" "makeinfo %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with Info output") ("Makeinfo HTML" "makeinfo --html %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with HTML output") ("AmSTeX" "%(PDF)amstex %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (ams-tex-mode) :help "Run AMSTeX") ("ConTeXt" "texexec --once --texutil %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt once") ("ConTeXt Full" "texexec %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt until completion") ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX") ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber") ("View" "open -a Preview.app %s.pdf" TeX-run-discard-or-function t t :help "Run Viewer") ("Print" "%p" TeX-run-command t t :help "Print the file") ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command) ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file") ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file") ("Check" "lacheck %s" TeX-run-compile nil (latex-mode) :help "Check LaTeX file for correctness") ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document") ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files") ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files") ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(bm-buffer-persistence t)
 '(custom-enabled-themes nil)
 '(send-mail-function (quote smtpmail-send-it)))

;; mac-specific key-bindings 2014/06/29 00:15:54
;; (setq mac-option-modifier 'alt)
(setq mac-command-modifier 'meta)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bm-persistent-face ((t (:background "yellow" :foreground "Brown")))))

;****************************** AuCTEX *************************
;; (getenv "PATH")
;; (setenv "PATH"
;; 	(concat
;; 	 "/usr/texbin" ":"
;; 	 (getenv "PATH")))

;; (add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
;; ;; ; (add-to-list 'load-path "/Users/anduo/.emacs.d/elpa/auctex-11.88.2/auctex.el")

;; (load-file "/Users/anduo/.emacs.d/init.el")


;; (require 'package)
;; (add-to-list 'package-archives
;;  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; (require 'tex-site)
;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)

;; find path to pdflatex
(getenv "PATH")
(setenv "PATH"
	(concat
	 "/usr/texbin" ":"
	 (getenv "PATH")))

(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot-mode" t)
(put 'upcase-region 'disabled nil)


(defun unwrap-line ()
      "Remove all newlines until we get to two consecutive ones.
    Or until we reach the end of the buffer.
    Great for unwrapping quotes before sending them on IRC."
      (interactive)
      (let ((start (point))
            (end (copy-marker (or (search-forward "\n\n" nil t)
                                  (point-max))))
            (fill-column (point-max)))
        (fill-region start end)
        (goto-char end)
        ;; (newline)
        (goto-char start)))

(global-set-key (kbd "M-q") 'unwrap-line)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(add-hook 'yaml-mode-hook
 '(lambda ()
    (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
