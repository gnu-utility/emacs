;******************** AucTex setting ********************
;(add-to-list 'load-path "/usr/share/emacs23/site-lisp/")
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
