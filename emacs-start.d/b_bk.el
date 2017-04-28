;; ***************** reread buffer from file
(global-set-key [S-f5] 'revert-buffer)
; (global-set-key "\C-x\C-r" 'revert-buffer)

;;*************** 设置启动时大小 ***************
(setq initial-frame-alist '((top . 0) (left . 176) (width . 91) (height . 46)))

;;***************** fontset ***************** 
(set-default-font "-Misc-Fixed-Medium-R-Normal--15-140-75-75-C-90-ISO8859-1")

;;***************** TIME-STAMP *******************
(add-hook 'write-file-hooks 'time-stamp)
(setq time-stamp-format "%:u %02m/%02d/%04y %02H:%02M:%02S")


;;;************ CHINESE SETTING UP ***************

(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'euc-cn)
(set-clipboard-coding-system 'euc-cn)
(set-terminal-coding-system 'euc-cn)
(set-buffer-file-coding-system 'euc-cn)
(set-selection-coding-system 'euc-cn)
(modify-coding-system-alist 'process "*" 'euc-cn)
(setq default-process-coding-system 
            '(euc-cn . euc-cn))
(setq-default pathname-coding-system 'euc-cn)

;(set-clipboard-coding-system 'ctext)

(set-clipboard-coding-system 'chinese-iso-8bit)
;(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))


;********************* 设置一下备份时的版本控制，这样更加安全 ******************
(setq version-control t
      kept-old-versions 2
      kept-new-versions 5
      delete-old-versions t
      backup-directory-alist
      '(("." . "/home/dog/BAK/EmacsCVS")
        (cons tramp-file-name-regexp nil))
      backup-by-copying t
      backup-by-copying-when-linked t
      backup-by-copying-when-mismatch t)
(setq dired-kept-versions 1)



;********************* BASIC CONFIGURATION ***************************
;(global-hl-line-mode 1)
(mouse-wheel-mode t)
(setq auto-fill-mode 1)

(setq search-highlight           t) ; Highlight search object
(setq query-replace-highlight    t) ; Highlight query objectp
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening

(transient-mark-mode t) ;--为什么不能像Windows下编辑器那样, 高亮显示要拷贝的区域----

(global-font-lock-mode 1)

(setq visible-bell t) ;;-------------------------关闭错误提示的Beep音--file:///home/dog/Pond/sword/emacs/font.html------------

(setq column-number-mode t) ;;-------------------------显示列号--------------------------
(setq line-number-mode t)
(setq hl-line-mode t)

(show-paren-mode t) 
(setq show-paren-style 'parentheses) ;;-------------------------括号匹配--------------------------

(setq frame-title-format "emacs@%b %f ") ;---------------------标题拦显示buffer的名字------------

(tool-bar-mode -1) ;;不要如此大的工具条
(setq-default make-backup-files nil) ;;不生成临时文件
(setq inhibit-startup-message t) ;;-------------------------关闭启动时的`开机画面'------------

(fset 'yes-or-no-p 'y-or-n-p) ;;------------用y|n取代 yes|no------------------------

(setq lazy-lock-defer-on-scrolling t) ;*************语法显示的上大文件移动时慢
(setq font-lock-support-mode 'lazy-lock-mode)
(setq font-lock-maximum-decoration t)

(scroll-bar-mode nil)

(setq scroll-margin 1
      scroll-conservatively 10000)

;(setq default-major-mode 'text-mode)

(mouse-avoidance-mode 'animate)



;********************* INSERT TIME *******************************8
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
;(setq display-time-24hr-format t)
;(setq display-time-day-and-date -1)
;(display-time)
;(setq display-time-use-mail-icon t)
;(setq display-time-interval 10)
;(display-time-mode -1)


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



; ***************** 个人信息 ***********************
(setq user-full-name "Anduo Wang")
(setq user-mail-address "wadaries@gmail.com")



; ********** highlight current line **********


