;;--------------------------wdired, before dired's loaded------------------
(load "/usr/local/share/emacs/site-lisp/wdired.el")
(add-hook 'dired-load-hook
           '(lambda ()
              (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
              (define-key dired-mode-map
                [menu-bar immediate wdired-change-to-wdired-mode]
                '("Edit File Names" . wdired-change-to-wdired-mode))))

;;--为什么不能像Windows下编辑器那样, 高亮显示要拷贝的区域----
(transient-mark-mode t)

(setq search-highlight           t) ; Highlight search object
(setq query-replace-highlight    t) ; Highlight query objectp
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening

;;-------------------------语法加亮--------------------------
;;(global-font-lock-mode t)
(global-font-lock-mode 1)

;;-------------------------关闭错误提示的Beep音--------------
(setq visible-bell t)

;;-------------------------关闭启动时的`开机画面'------------
(setq inhibit-startup-message t)

;;-------------------------显示列号--------------------------
(setq column-number-mode t)
;(setq line-number-mode t)
;(setq hl-line-mode t)

;;-------------------------括号匹配--------------------------
;;括号匹配时显示另一端的括号，而不是跳过去
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;-------------------------标题拦显示buffer的名字------------
(setq frame-title-format "%b")


;;;;load mule-gbk
;;(require 'mule-gbk)
;;;; Setup GBK environment
;;(set-terminal-coding-system 'chinese-gbk)
;;(set-keyboard-coding-system 'chinese-gbk)
;;(set-language-environment 'chinese-gbk)
;;(setq locale-coding-system 'chinese-gbk)
;;(setq current-language-environment "Chinese-GBK")
;;;; Setup X Selection for mule-gbk
;;(mule-gbk-selection-setup)
;;(prefer-coding-system 'gbk)

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
(set-clipboard-coding-system 'ctext)


(tool-bar-mode -1) ;;不要如此大的工具条

(setq-default make-backup-files nil) ;;不生成临时文件

;;-------------tab不要让pc喇叭滴滴叫------------------
(setq visible-bell t)

;;------------用y|n取代 yes|no------------------------
(fset 'yes-or-no-p 'y-or-n-p)


;;added june 4
;;(add-to-list 'load-path "/directory/with/emacs-wiki/")
;;(add-to-list 'load-path "/directory/with/planner/")
;;(require 'planner)

;(add-to-list 'load-path "/path/to/emacs-wiki")
;(add-to-list 'load-path "/path/to/planner")
;(add-to-list 'load-path "/path/to/remember")
(require 'planner)
(require 'emacs-wiki)
(require 'emacs-wiki-menu)

(global-set-key (kbd "<f9> t") 'planner-create-task-from-buffer)

;;added june 5
(require 'remember-planner)
(setq remember-handler-functions '(remember-planner-append))
(setq remember-annotation-functions planner-annotation-functions)

;; Move unfinished tasks to today's page
(setq planner-carry-tasks-forward t)
;; Scan three pages in the past
(plan)

;; Add the directories to your load path
;;(add-to-list 'load-path "/path/to/emacs-wiki")
;; Load emacs-wiki

(load "emacs-wiki")
(setq emacs-wiki-charset-default "gb2312")
(setq emacs-wiki-coding-default 'gb2312)
;(setq emacs-wiki-style-sheet "<link rel=\"stylesheet\" type=\"text/css\" href=\"f.css\">")                      


;; emacs preview
(defun emacs-wiki-preview-source ()
  (interactive)
  (emacs-wiki-publish-this-page)
  (find-file (emacs-wiki-published-file)))

(defun emacs-wiki-preview-html ()
  (interactive)
  (emacs-wiki-publish-this-page)
  (browse-url (emacs-wiki-published-file)))

(add-hook 'emacs-wiki-mode-hook
  (lambda ()
    (define-key emacs-wiki-mode-map (kbd "C-c C-h") 'emacs-wiki-preview-html)
    (define-key emacs-wiki-mode-map (kbd "C-c C-c") 'emacs-wiki-preview-source)
  ))


;;--------------为啥语法显示的大文件在移动时如此之慢-----------------
;;(setq lazy-lock-defer-on-scrolling t)
;;(setq font-lock-support-mode 'lazy-lock-mode)
;;(setq font-lock-maximum-decoration t)


;;拷贝去乱码
;;(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;;(set-selection-coding-system 'chinese-iso-8bit-with-esc)

;;----------------------------------display time-----------------------
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)

;----------------------------------显示列------------------------------
;(setq column-number-mode t)


;;(set-clipboard-coding-system 'ctext)



;;-----------------supporting mutiple wiki projects in emacs-------------
(setq emacs-wiki-projects
'(("Hook" .
((emacs-wiki-directories . ("~/WikiProj/wiki/hook"))
(emacs-wiki-project-server-prefix . "../wiki/")
(emacs-wiki-publishing-directory
. "~/personal-site/site/hook")))
("Arrow" .
((emacs-wiki-directories . ("~/WikiProj/wiki/arrow"))
(emacs-wiki-project-server-prefix . "../wiki/")
(emacs-wiki-publishing-directory
. "~/personal-site/site/arrow")))
("Leopard" .
((emacs-wiki-directories . ("~/WikiProj/wiki/leopard"))
(emacs-wiki-project-server-prefix . "../project/")
(emacs-wiki-publishing-directory
. "~/personal-site/site/leopard"))
)))


;;------------------- use Common Lisp--------------------------------
(require 'cl)
(require 'cl-19)

;;------------------- 发现 emacs 自带的 bs.el 更好用------------------
(global-set-key "\C-x\C-b" 'bs-show)    ;; or another key
(global-set-key "\M-P"  'bs-cycle-previous)
(global-set-key "\M-N"  'bs-cycle-next)

;-------------------------- Emacs PVS ---------------------------------
;(load "/home/dog/pvs/emacs")

;;-------------------- Emacs HOL mode---------------------------------
;;(autoload 'hol98 "/home/dog/HOL/hol/tools/hol-mode"
;;  "Runs a HOL98 session in a comint window.
;;With a numeric prefix argument, runs it niced to that level
;;or at level 10 with a bare prefix. " t)
(load "/home/dog/HOL/hol/tools/hol98-mode")

(put 'upcase-region 'disabled nil)

;; facncy tables in emacs-wiki
;; (require 'emacs-wiki-table)

;;----------------------- 自动插入时间-----------------------------
(defun my-insert-date ()
  (interactive)
  (insert (format-time-string "%Y/%m/%d %H:%M:%S" (current-time))))

(global-set-key (kbd "C-c m d") 'my-insert-date)
;-----------------------------------------------------------------


;----------------------- bookmarksIterator.el-------------------
;;(load "/usr/local/share/emacs/site-lisp/bookmarksIterator.el")
;;(require 'bookmark-iterator)
;------------------------------------------------------------------


;--------------------bm.el-----------------------------------------
(load "/usr/local/share/emacs/site-lisp/bm-1.29")
(require 'bm) 

(autoload 'bm-toggle   "bm" "Toggle bookmark in current buffer." t)
(autoload 'bm-next     "bm" "Goto bookmark."                     t)
(autoload 'bm-previous "bm" "Goto previous bookmark."            t)

(global-set-key (kbd "<C-f2>") 'bm-toggle)
;(global-set-key (kbd "<f26>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)
;(global-set-key (kbd "<f14>") 'bm-previous)
(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(bm-persistent-face (quote bold-italic))
 '(case-fold-search t)
 '(current-language-environment "Chinese-GB")
 '(default-input-method "chinese-py-punct")
 '(global-font-lock-mode t nil (font-lock))
 '(jde-mode-abbreviations (append (quote (("as" . "assert") ("nen" . "!= null;") ("et" . "\\elemtype") ("ev" . "\\everything") ("exi" . "\\exists") ("fo" . "\\fields_of") ("fa" . "\\forall") ("fr" . "\\fresh") ("invf" . "\\invariant_for") ("ii" . "\\is_initialized") ("lbln" . "\\lblneg") ("lblp" . "\\lblpos") ("ls" . "\\lockset") ("max" . "\\max") ("min" . "\\min") ("nne" . "\\nonnullelements") ("no" . "\\nothing") ("nm" . "\\not_modified") ("ns" . "\\not_specified") ("numo" . "\\num_of") ("old" . "\\old") ("oth" . "\\other") ("prod" . "\\product") ("rea" . "\\reach") ("res" . "\\result") ("sut" . "\\such_that") ("sum" . "\\sum") ("ty" . "\\type") ("to" . "\\typeof") ("TY" . "\\TYPE") ("abb" . "abrupt_behavior") ("accr" . "accessible_redundantly") ("acc" . "accessible") ("al" . "also") ("ar" . "assert_redundantly") ("assir" . "assignable_redundantly") ("assi" . "assignable") ("assr" . "assume_redundantly") ("ass" . "assume") ("ax" . "axiom") ("be" . "behavior") ("brr" . "breaks_redundantly") ("brks" . "breaks") ("cr" . "callable_redundantly") ("cal" . "callable") ("ci" . "choose_if") ("dr" . "decreases_redundantly") ("dcs" . "decreases") ("dcr" . "decreasing_redundantly") ("dc" . "decreasing") ("depr" . "depends_redundantly") ("dep" . "depends") ("divr" . "diverges_redundantly") ("div" . "diverges") ("durr" . "duration_redundantly") ("dur" . "duration") ("enr" . "ensures_redundantly") ("en" . "ensures") ("exam" . "example") ("eb" . "exceptional_behavior") ("ee" . "exceptional_example") ("exsr" . "exsures_redundantly") ("exs" . "exsures") ("forall" . "forall") ("fe" . "for_example") ("gh" . "ghost") ("implt" . "implies_that") ("help" . "helper") ("hbr" . "hence_by_redundantly") ("hb" . "hence_by") ("init" . "initializer") ("ini" . "initially") ("ins" . "instance") ("invr" . "invariant_redundantly") ("inv" . "invariant") ("lir" . "loop_invariant_redundantly") ("li" . "loop_invariant") ("mair" . "maintaining_redundantly") ("mai" . "maintaining") ("mbr" . "measured_by_redundantly") ("mb" . "measured_by") ("mp" . "model_program") ("model" . "model") ("modir" . "modifiable_redundantly") ("modi" . "modifiable") ("modr" . "modifies_redundantly") ("mod" . "modifies") ("mb" . "monitored_by") ("mo" . "monitored") ("nn" . "non_null") ("nb" . "normal_behavior") ("ne" . "normal_example") ("nw" . "nowarn") ("old" . "old") ("or" . "or") ("post" . "post") ("pre" . "pre") ("pure" . "pure") ("ri" . "readable_if") ("ref" . "refine") ("repr" . "represents_redundantly") ("rep" . "represents") ("reqr" . "requires_redundantly") ("req" . "requires") ("rr" . "returns_redundantly") ("rets" . "returns") ("set" . "set") ("sigr" . "signals_redundantly") ("sig" . "signals") ("spr" . "spec_protected") ("spu" . "spec_public") ("stati" . "static_initializer") ("subc" . "subclassing_contract") ("uninit" . "uninitialized") ("unr" . "unreachable") ("weak" . "weakly") ("whr" . "when_redundantly") ("wh" . "when") ("wsr" . "working_space_redundantly") ("ws" . "working_space") ("==>" . "==>") ("<==" . "<==") ("<==>" . "<==>") ("<!>" . "<=!=>") ("->" . "->") ("->" . "<-") (".." . "..") ("{|" . "{|") ("|}" . "|{") ("infdesc" . "(* informal description *)") ("depe" . "depends store-ref-expression <- store-ref-list ;") ("ense" . "ensures Q;") ("exe" . "(\\exists Type t; G(t); P(t));") ("fae" . "(\\forall Type t; G(t); P(t));") ("mode" . "modifies \\everything;") ("modn" . "modifies \\nothing;") ("repe" . "represents store-ref-expression <- spec-expression ;") ("repst" . "represents store-ref-expression \\such_that spec-expression ;") ("reqe" . "requires P;") ("sige" . "signals (Expression e) R;") ("exse" . "exsures (Expression e) R;") ("oe" . "\\old()") ("sume" . "(\\sum Type t, G(t); P(t));") ("prode" . "(\\product Type t, G(t); P(t));") ("maxe" . "(\\max Type t, G(t); P(t));") ("minee" . "(\\min Type t, G(t); P(t));") ("numoe" . "(\\num_of Type t, G(t); P(t));") ("hspec" . "    //@ behavior
   //@   requires P;
    //@   diverges \\not_specified;
    //@   assignable X;
    //@   when \\not_specified;
    //@   ensures Q;
    //@   signals (Exception) R;") ("lspec" . "    //@ requires P;
    //@ assignable X;
    //@ ensures Q;
    //@ signals (Exception) R;") ("pubnhspec" . "    //@ public normal_behavior
    //@   requires P;
    //@   diverges \\not_specified;
    //@   assignable X;
    //@   when \\not_specified;
    //@   ensures Q;") ("pronhspec" . "    //@ protected normal_behavior
    //@   requires P;
    //@   diverges \\not_specified;
    //@   assignable X;
    //@   when \\not_specified;
    //@   ensures Q;") ("prinhspec" . "    //@ private normal_behavior
    //@   requires P;
    //@   diverges \\not_specified;
    //@   assignable X;
    //@   when \\not_specified;
    //@   ensures Q;") ("nhspec" . "    //@ normal_behavior
    //@   requires P;
    //@   diverges \\not_specified;
    //@   assignable X;
    //@   when \\not_specified;
    //@   ensures Q;") ("pubehspec" . "    //@ public exceptional_behavior
    //@   requires P;
    //@   diverges \\not_specified;
    //@   assignable X;
    //@   when \\not_specified;
    //@   signals (Exception) R;") ("proehspec" . "    //@ protected exceptional_behavior
    //@   requires P;
    //@   diverges \\not_specified;
    //@   assignable X;
    //@   when \\not_specified;
    //@   signals (Exception) R;") ("priehspec" . "    //@ private exceptional_behavior
    //@   requires P;
    //@   diverges \\not_specified;
    //@   assignable X;
    //@   when \\not_specified;
    //@   signals (Exception) R;") ("ehspec" . "    //@ exceptional_behavior
    //@   requires P;
    //@   diverges \\not_specified;
    //@   assignable X;
    //@   when \\not_specified;
    //@   signals (Exception) R;"))) jde-mode-abbreviations))
 '(show-paren-mode t nil (paren))
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(bm-face ((t (:background "cyan" :foreground "white"))))
 '(bold-italic ((t (:background "cyan" :foreground "white" :slant italic :weight bold)))))

;; make bookmarks persistent as default
(setq-default bm-buffer-persistence t)
;; Loading the repository from file when on start up.
(add-hook' after-init-hook 'bm-repository-load)

;; Restoring bookmarks when on file find.
(add-hook 'find-file-hooks 'bm-buffer-restore)

;; Saving bookmark data on killing a buffer
(add-hook 'kill-buffer-hook 'bm-buffer-save)

   ;; Saving the repository to file when on exit.
   ;; kill-buffer-hook is not called when emacs is killed, so we
   ;; must save all bookmarks first.
   (add-hook 'kill-emacs-hook '(lambda nil
 	  		             (bm-buffer-save-all)
			             (bm-repository-save)))

   ;; Update bookmark repository when saving the file.
   (add-hook 'after-save-hook 'bm-buffer-save)

   ;; Restore bookmarks when buffer is reverted.
(add-hook 'after-revert-hook 'bm-buffer-restore)

;; Restoring bookmarks when on file find.
(add-hook 'find-file-hooks 'bm-buffer-restore)
;; make sure bookmarks is saved before check-in (and revert-buffer)
(add-hook 'vc-before-checkin-hook 'bm-buffer-save)

   ;; make sure bookmarks is saved before check-in (and revert-buffer)
   (add-hook 'vc-before-checkin-hook 'bm-buffer-save)


;;-------M-x shell进入shell-mode出现乱码？怎么修改颜色和字体？--------
;;(setq ansi-color-for-comint-mode t)

;--------------------------global bindings----------------------------
(global-set-key (kbd "<C-^>") 'enlarge-window)
(global-set-key (kbd "<f9> e") 'eshell)
(global-set-key (kbd "<f9> s") 'shell)
(global-set-key (kbd "<f8>") 'other-window)
(global-set-key (kbd "<f9> w") 'emacs-wiki-mode)
(global-set-key (kbd "<f9> p") 'plan)
(global-set-key (kbd "<f9> r") 'remember)
(global-set-key (kbd "<f9> d") 'kill-buffer)
(global-set-key (kbd "<f5>") 'ispell-word)
;(global-set-key (kbd "<M-p>") 'backward-kill-word)

;;-------------------------playing mp3---------------------------------
;;(autoload 'mpg123 "mpg123" "A Front-end to mpg123" t)


;;-----------------------amixer----------------------------------------
(load "/usr/local/share/emacs/site-lisp/amixer.el")
(require 'amixer)
(setq amixer-mixer-program "aumix"
      amixer-volume-increment 3
      amixer-master-volume 70)
(global-set-key (kbd "C-c -") 'amixer-decrement-volume)
(global-set-key (kbd "C-c +") 'amixer-increment-volume)

;;-------------------------ido.el--------------------------------------
   (require 'ido)
   (ido-mode t)


;; added july 27
;; http://www.sfu.ca/~gswamina/EmacsWikiBlog.html
;;-----------------------using latex in emacs-wiki---------------------
(require 'emacs-wiki)
(load "~/.elisp/latex2png.el")
(load "~/.elisp/emacs-wiki-blog.el")
(load "~/.elisp/plog.el")

;; Inline LaTex
(push '("latex" t t t gs-latex-tag) emacs-wiki-markup-tags)
(setq gs-latex2png-scale-factor 1.7)

;; PLOG
(push '("thumb" t t t gs-emacs-wiki-thumbnail-tag) emacs-wiki-markup-tags)

;----------------------------sml----------------------------------------
(defun my-mosml-setup () "Configure inferior SML mode for Moscow ML"
    (load-library "sml-mosml"))
  (add-hook 'inferior-sml-load-hook 'my-mosml-setup)

;;---------------------------reach info not in `dir'--------------------
;     (require 'info)
;     (setq Info-directory-list
;	   (cons (expand-file-name "/home/dog/Desktop/infoman")
;            Info-directory-list))



;;----------------------install jml.el-------------------------------------
(load "/home/dog/jv/jml/JML/etc/emacs/jml.el")
;;(require 'JML)

;;----------------------sample in CC mode----------------------------------
     (defconst my-c-style
       '((c-tab-always-indent        . t)
         (c-comment-only-line-offset . 4)
         (c-hanging-braces-alist     . ((substatement-open after)
                                        (brace-list-open)))
         (c-hanging-colons-alist     . ((member-init-intro before)
                                        (inher-intro)
                                        (case-label after)
                                        (label after)
                                        (access-label after)))
         (c-cleanup-list             . (scope-operator
                                        empty-defun-braces
                                        defun-close-semi))
         (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                        (substatement-open . 0)
                                        (case-label        . 4)
                                        (block-open        . 0)
                                        (knr-argdecl-intro . -)))
         (c-echo-syntactic-information-p . t)
         )
       "My C Programming Style")
     
     ;; offset customizations not in my-c-style
     (setq c-offsets-alist '((member-init-intro . ++)))
     
     ;; Customizations for all modes in CC Mode.
     (defun my-c-mode-common-hook ()
       ;; add my personal style and set it for the current buffer
       (c-add-style "PERSONAL" my-c-style t)
       ;; other customizations
       (setq tab-width 8
             ;; this will make sure spaces are used instead of tabs
             indent-tabs-mode nil)
       ;; we like auto-newline and hungry-delete
       (c-toggle-auto-hungry-state 1)
       ;; key bindings for all supported languages.  We can put these in
       ;; c-mode-base-map because c-mode-map, c++-mode-map, objc-mode-map,
       ;; java-mode-map, idl-mode-map, and pike-mode-map inherit from it.
       (define-key c-mode-base-map "\C-m" 'c-context-line-break)
       )
     
     (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)



;;------------------------------battery------------------------------
(require 'battery)
(setq battery-mode-line-format "[%b%p%% %t]"
      battery-mode-line-string
      (battery-format battery-mode-line-format
                      (funcall battery-status-function)))
;;------------------------------自动更新------------------------------
(run-with-timer 0 battery-update-interval
                'battery-update-handler)
;然后把 batter-mode-line-string 加到 `global-mode-line-string' 里就 okay
;啦，看起来是这个样子，"68% 2:11".


;;-----------------------------desktop and session-----------------------
(load "desktop") 
(desktop-load-default) 
(desktop-read)

;; (require 'session)
;; (add-hook 'after-init-hook 'session-initialize)
;----------------------------------------------------------------------
;(require 'ibuffer)
;(global-set-key (kbd "C-x C-b") 'ibuffer)
;----------------------------------------------------------------------

;-----------------------------to use emacsclient----------------------
;(server-start)
;; bind set-mark-command to S-SPC
;;------------------------bind set mark to C-z------------------------
(global-unset-key "\C-z")
(global-set-key "\C-z" 'set-mark-command)

;----------------------------color theme-------------------------------
(require 'color-theme)
;(color-theme-subtle-hacker)
;(color-theme-gnome-2)

;--------------------------tabbar-----------------------------------------
(load "/home/dog/sword/emacs/tabbar.el")
(require 'tabbar)
(tabbar-mode)

;(global-set-key (kbd "<C-f2>") 'bm-toggle)
;(global-set-key (kbd "C-c [") 'tabbar-backward-group)
;(global-set-key (kbd "<M-f1>") 'tabbar-backward-group)
(global-set-key (kbd "<f11>") 'tabbar-backward)

;(global-set-key (kbd "C-c ]") 'tabbar-forward-group)
;(global-set-key (kbd "<M-f2>") 'tabbar-forward-group)
(global-set-key (kbd "<f12>") 'tabbar-forward)

;(global-set-key (kbd "M-[") 'tabbar-backward)
(global-set-key (kbd "<M-f11>") 'tabbar-backward-group)

;(global-set-key (kbd "M-]") 'tabbar-forward)
(global-set-key (kbd "<M-f12>") 'tabbar-forward-group)

;---------------------------滚动条-----------------------------------------
;(menu-bar-mode t/nil)                   ;菜单
;(tool-bar-mode t/nil)                   ;工具栏
;(scroll-bar-mode nil/'right/'left)      ;滚动条，X下可选左右，win下只能在右边
;;---(scroll-bar-mode nil/'right/'left)
(scroll-bar-mode nil)


(global-set-key (kbd "C-c s") 'speedbar-get-focus)


;--------------------------emms----------------------------------------
     (require 'emms)
     (require 'emms-player-simple)
     (require 'emms-source-file)
     (setq emms-player-list '(;emms-player-mpg321
                              ;emms-player-ogg123
                              emms-player-mplayer)
           emms-source-list '((emms-source-directory-tree "~/entern/")))
          ;; Show the current track each time EMMS
         ;; starts to play a track with "Now Play : "
        (add-hook 'emms-player-started-hook 'emms-show)
        (setq emms-show-format "dog's on: % s")
        
          ;; When asked for emms-play-directory,
          ;; always start from this one 
        (setq emms-source-file-default-directory "~/entern/")
        
          ;; Want to use alsa with mpg321 ? 
;        (setq emms-player-mpg321-parameters '("-o" "alsa"))

     (global-set-key (kbd "ESC O c") 'emms-next)
     (global-set-key (kbd "ESC O d") 'emms-previous)
     (global-set-key [(control ?c) ?m ?w] 'emms-show)
     (global-set-key [(control ?c) ?m ?n] 'emms-next)
     (global-set-key [(control ?c) ?m ?p] 'emms-previous)
     (global-set-key [(control ?c) ?m ?s] 'emms-stop)
     (global-set-key [(control ?c) ?m ?i] 'fc-emms-insert)
     (global-set-key [(control ?c) ?m ?f] 'emms-play-file)


     (require 'emms-default)
          (emms-setup 'tiny "~/entern/")


;;--------------------------install Dired-X, from info------------------
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


;----------------------------color theme-------------------------------
(require 'color-theme)
(color-theme-subtle-hacker)
;(color-theme-gnome-2)

;-----------------------------removed temerally--------------------------
;;-------------------activate auctex, from info--------------------------
;;(setq load-path (cons "~/" load-path))
;;(load "/usr/share/emacs21/site-lisp/tex-site.el")

;(require 'tex-site)

;;------------------------activate AUCTeX--------------------------
(require 'tex-site)

;; make AUCTeX aware of style files and multi-file
;; documents right away, insert the following in your `.emacs' file.
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;;------------------- entering reftex mode---------------------------
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
;--------------------------------removed temrarally-----------------

