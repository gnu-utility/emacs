;; (require 'gnuplot-mode)
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot-mode" t)

;;*************** ***************
(setq initial-frame-alist '((top . 0) (left . 0) (width . 150) (height . 50)))

(toggle-frame-maximized)

;; once ispell installed, point it to the installed path, let emacs
;; use it
(setq ispell-program-name "/usr/local/bin/ispell")

;; (fringe-mode minimal)
(set-fringe-mode '(0 . 0)) 

;; cursor reduced to a bar
(setq-default cursor-type 'bar)

;; remove scroll bar
(scroll-bar-mode -1)

;; set default-directory 
(setq default-directory "/Users/anduo/")

;; ***************** reread buffer from file
(global-set-key [S-f5] 'revert-buffer)
; (global-set-key "\C-x\C-r" 'revert-buffer)

;;***************** TIME-STAMP *******************
(add-hook 'write-file-hooks 'time-stamp)
(setq time-stamp-format "%:u %02m/%02d/%04y %02H:%02M:%02S")

(set-clipboard-coding-system 'chinese-iso-8bit)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;********************* highlight current line ************************
(global-hl-line-mode 1)

;; (mouse-wheel-mode t)
(setq auto-fill-mode 1)

(setq search-highlight           t) ; Highlight search object
(setq query-replace-highlight    t) ; Highlight query objectp
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening

(transient-mark-mode t) 

(global-font-lock-mode 1)

(setq visible-bell t) ;;-------------------------

(setq column-number-mode t) ;;-------------------------
(setq line-number-mode t)
(setq hl-line-mode t)

(show-paren-mode t) 
(setq show-paren-style 'parentheses) ;;-------------------

(setq frame-title-format "emacs@%b %f ") ;----------------

(tool-bar-mode -1) ;;
(setq-default make-backup-files nil) ;
(setq inhibit-startup-message t) ;;-----------------------

(fset 'yes-or-no-p 'y-or-n-p) ;;------

; (setq lazy-lock-defer-on-scrolling t) ;**
; (setq font-lock-support-mode 'lazy-lock-mode)
; (setq font-lock-maximum-decoration t)
;; (scroll-bar-mode nil)

;; (setq scroll-margin 1
;;       scroll-conservatively 10000)

;(setq default-major-mode 'text-mode)

(mouse-avoidance-mode 'animate)



;********************* INSERT TIME *******************************
(defun my-insert-date ()
  (interactive)
  (insert (format-time-string "%Y/%m/%d %H:%M:%S" (current-time))))

(global-set-key (kbd "C-c m d") 'my-insert-date)


;********************* GLOBAL BINDINGS ************************
(global-set-key (kbd "<C-^>") 'enlarge-window)
(global-set-key (kbd "<f9> e") 'eshell)
(global-set-key (kbd "<f9> s") 'shell)
(global-set-key (kbd "<f8>") 'other-window)

(global-set-key (kbd "<f9> d") 'kill-buffer)
(global-set-key (kbd "<f5>") 'ispell-word)
(global-set-key [?\S- ] 'set-mark-command)

(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)



;;************************ DISPLAY TIME *************
(setq display-time-24hr-format t)
(setq display-time-day-and-date -1)
(display-time)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)
(display-time-mode -1)


;**************** MATCH PAREN *******************
(global-set-key "%" 'match-paren)
          
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))

;******************* SHELL **********************
(eshell)
(rename-buffer "l")
(eshell)
(rename-buffer "h")
(eshell)
(rename-buffer "k")
(eshell)
(rename-buffer "j")

; ***************** ***********************
(setq user-full-name "Anduo Wang")
(setq user-mail-address "wadaries@gmail.com")

;*******************  EMACS bs.el ************************************
(global-set-key "\C-x\C-b" 'bs-show)    ;; or another key
(global-set-key "\M-P"  'bs-cycle-previous)
(global-set-key "\M-N"  'bs-cycle-next)

;*************** css ***************
(autoload 'css-mode "css-mode")
(setq auto-mode-alist       
     (cons '("\\.css\\'" . css-mode) auto-mode-alist))


;******************** ido.el*********************
   (require 'ido)
   (ido-mode t)

;; load path
(add-to-list 'load-path "/Users/anduo/Pond/sword/emacs-el-files/")
(add-to-list 'load-path "/Users/anduo/sword/emacs-el-files/color-theme/")




;**************************** DIRED (from info) *****************
(require 'dired-x)

     (add-hook 'dired-load-hook
               (lambda ()
                 (load "dired-x")
                 ;; Set dired-x global variables here.  For example:
                  (setq dired-guess-shell-gnutar "gtar")
		                   ;; Bind dired-x-find-file.
                 (setq dired-x-hands-off-my-keys nil)
                 ;; Make sure our binding preference is invoked.
                 (dired-x-bind-find-file)
                 ))

     (add-hook 'dired-mode-hook
               (lambda ()
               ;; Set dired-x buffer-local variables here.  For example:
                 (setq dired-omit-files-p t)
                ))

          ;;do not wish to see `dot' files (files starting with a `.')
          (setq dired-omit-files
              (concat dired-omit-files "\\|^\\..+$"))


(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)



;***************************** SPEED BAR ***************************
(global-set-key (kbd "C-c s") 'speedbar-get-focus)

;;***************** fontset ***************** 
;; (frame-parameter nil 'font)

;; (set-default-font "-Adobe-Courier-Medium-R-Normal--14-100-100-100-M-90-ISO8859-1")
; (set-default-font "-gnu-unifont-medium-r-normal--16-160-75-75-c-80-iso10646-1")

; -*-Courier-normal-r-*-*-13-*-*-*-c-*-*-iso8859-1
;(set-default-font "-Misc-Fixed-Medium-R-Normal--15-140-75-75-C-90-ISO8859-1")

;;;************ CHINESE SETTING UP ***************

;; (set-language-environment 'Chinese-GB)
;; (set-keyboard-coding-system 'euc-cn)
;; (set-clipboard-coding-system 'euc-cn)
;; (set-terminal-coding-system 'euc-cn)
;; (set-buffer-file-coding-system 'euc-cn)
;; (set-selection-coding-system 'euc-cn)
;; (modify-coding-system-alist 'process "*" 'euc-cn)
;; (setq default-process-coding-system 
;;             '(euc-cn . euc-cn))
;; (setq-default pathname-coding-system 'euc-cn)

; ------------------------------------------------------------
; tag

;; (setq path-to-ctags "/opt/local/bin/ctags") ;; <- your ctags path here

;; (defun create-tags (dir-name)
;;     "Create tags file."
;;     (interactive "DDirectory: ")
;;     (shell-command
;;      (format "ctags -f %s -e -R %s" path-to-ctags (directory-file-name dir-name)))
;;   )

;------------------------------------------------------------
; auto completion

;(global-auto-complete-mode t)

;(global-pabbrev-mode t)
