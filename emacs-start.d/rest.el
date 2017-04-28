;; (setq x-alt-keysym 'meta)

;================================================================
;================================= Emacs Wiki ==================
;================================================================
(load "emacs-wiki")

(setq emacs-wiki-projects
      `(("MyPanther" .
         ((emacs-wiki-directories . ("~/EmacsWiki/wiki/panther"))
          (emacs-wiki-project-server-prefix . "../wiki/")
          (emacs-wiki-publishing-directory
           . "~/EmacsWiki/personal-site/site/wiki")))
        ("ArrowAt" .
         ((emacs-wiki-directories . ("~/EmacsWiki/wiki/arrow"))
          (emacs-wiki-project-server-prefix . "../arrow/")
          (emacs-wiki-publishing-directory
           . "~/EmacsWiki/personal-site/site/arrow")))))

;(setq emacs-wiki-charset-default "gb2312")
;(setq emacs-wiki-coding-default 'gb2312)
;(setq emacs-wiki-style-sheet "<link rel=\"stylesheet\" type=\"text/css\" href=\"f.css\">")

;(global-set-key (kbd "<f9> w") 'emacs-wiki-mode)


(require 'planner)
(setq planner-directory "~/EmacsWiki/wiki/Plans")

(setq planner-project "Plans")

     (setq muse-project-alist
           '(("Plans"
              ("~/EmacsWiki/wiki/Plans"           ;; where your Planner pages are located
               :default "TaskPool" ;; use value of `planner-default-page'
               :major-mode planner-mode
               :visit-link planner-visit-link)

              ;; This next part is for specifying where Planner pages
              ;; should be published and what Muse publishing style to
              ;; use.  In this example, we will use the XHTML publishing
              ;; style.

              (:base "html"
                     ;; where files are published to
                     ;; (the value of `planner-publishing-directory', if
                     ;;  you have a configuration for an older version
                     ;;  of Planner)
                     :path "~/EmacsWiki/personal-site/site/Plans"))))


;; Move unfinished tasks to today's page
(setq planner-carry-tasks-forward t)
;; Scan three pages in the past
(plan)

(global-set-key (kbd "<f9> p") 'plan)
(global-set-key (kbd "<f9> t") 'planner-create-task-from-buffer)

(global-set-key (kbd "<f9> r") 'remember)
(require 'remember-planner)
(setq remember-handler-functions '(remember-planner-append))
(setq remember-annotation-functions planner-annotation-functions)



;********************** EMACS PVS *****************************
;(load "/home/dog/pvs/emacs")

;************************************************************
; mis
;************************************************************
;; (custom-set-faces
;;  '(bm-face ((t (:background "cyan" :foreground "white"))))
;;  '(bold-italic ((t (:background "cyan" :foreground "white" :slant italic :weight bold))))
;;  '(highlight-current-line-face ((t (:background "white"))))
;;  '(mode-line ((t (:background "grey75" :foreground "black"))))
;;  '(mode-line ((t (:background "grey75" :foreground "gray"))))
;;  '(region ((t (:background "gray20"))))
;;  '(region ((t (:background "gray"))))
;;  '(Show-paren-mismatch ((t (:background "hot pink" :foreground "white"))))
;;  '(trailing-whitespace ((t (:background "IndianRed")))))

;; (load-file "~/Pond/sword/emacs-start.d/tex.el")

;; ;;-------------
;; ;;Add color to the current GUD line (obrigado google)
;; (defvar gud-overlay
;; (let* ((ov (make-overlay (point-min) (point-min))))
;; (overlay-put ov 'face 'secondary-selection)
;; ov)
;; "Overlay variable for GUD highlighting.")

;; (defadvice gud-display-line (after my-gud-highlight act)
;; "Highlight current line."
;; (let* ((ov gud-overlay)
;; (bf (gud-find-file true-file)))
;; (save-excursion
;;   (set-buffer bf)
;;   (move-overlay ov (line-beginning-position) (line-end-position)
;;   (current-buffer)))))

;; (defun gud-kill-buffer ()
;; (if (eq major-mode 'gud-mode)
;; (delete-overlay gud-overlay)))

;; (add-hook 'kill-buffer-hook 'gud-kill-buffer)
;; ;;-------------------------------------------------------------

;; ;; research
;; ;; maude
;; (autoload 'maude-mode "maude-mode" "MAUDE mode" nil t)
;; (setq auto-mode-alist
;;       (append
;;        (list (cons "\\.maude$"  'maude-mode)
;;              (cons "\\.fm$"     'maude-mode)
;;              ;; (cons "\\.other-extensions$"     'maude-mode)
;;              )
;;        auto-mode-alist))

;; (setq maude-command "/home/anduo/Desktop/maude/maude.linux64")

;; ;;; SMV mode
;; (setq load-path (cons "/home/anduo/Pond/sword/emacs-el-files" load-path))
;; (autoload 'smv-mode "smv-mode" "SMV specifications editing mode." t)
;; (setq auto-mode-alist 
;;       (append  (list '("\\.smv$" . smv-mode) '("\\.ord$" . smv-ord-mode))
;; 	       auto-mode-alist))
;; (setq completion-ignored-extensions
;;       (cons ".ord" (cons ".opt" completion-ignored-extensions)))


;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
;;   ;; Your init file should contain only one such instance.
;;  '(bm-persistent-face (quote bold-italic))
;;  '(case-fold-search t)
;;  '(current-language-environment "Chinese-GB")
;;  '(default-input-method "chinese-py-punct")
;;  '(global-font-lock-mode t nil (font-lock))
;;  '(jde-mode-abbreviations (append (quote (("as" . "assert") ("nen" . "!= null;") ("et" . "\\elemtype") ("ev" . "\\everything") ("exi" . "\\exists") ("fo" . "\\fields_of") ("fa" . "\\forall") ("fr" . "\\fresh") ("invf" . "\\invariant_for") ("ii" . "\\is_initialized") ("lbln" . "\\lblneg") ("lblp" . "\\lblpos") ("ls" . "\\lockset") ("max" . "\\max") ("min" . "\\min") ("nne" . "\\nonnullelements") ("no" . "\\nothing") ("nm" . "\\not_modified") ("ns" . "\\not_specified") ("numo" . "\\num_of") ("old" . "\\old") ("oth" . "\\other") ("prod" . "\\product") ("rea" . "\\reach") ("res" . "\\result") ("sut" . "\\such_that") ("sum" . "\\sum") ("ty" . "\\type") ("to" . "\\typeof") ("TY" . "\\TYPE") ("abb" . "abrupt_behavior") ("accr" . "accessible_redundantly") ("acc" . "accessible") ("al" . "also") ("ar" . "assert_redundantly") ("assir" . "assignable_redundantly") ("assi" . "assignable") ("assr" . "assume_redundantly") ("ass" . "assume") ("ax" . "axiom") ("be" . "behavior") ("brr" . "breaks_redundantly") ("brks" . "breaks") ("cr" . "callable_redundantly") ("cal" . "callable") ("ci" . "choose_if") ("dr" . "decreases_redundantly") ("dcs" . "decreases") ("dcr" . "decreasing_redundantly") ("dc" . "decreasing") ("depr" . "depends_redundantly") ("dep" . "depends") ("divr" . "diverges_redundantly") ("div" . "diverges") ("durr" . "duration_redundantly") ("dur" . "duration") ("enr" . "ensures_redundantly") ("en" . "ensures") ("exam" . "example") ("eb" . "exceptional_behavior") ("ee" . "exceptional_example") ("exsr" . "exsures_redundantly") ("exs" . "exsures") ("forall" . "forall") ("fe" . "for_example") ("gh" . "ghost") ("implt" . "implies_that") ("help" . "helper") ("hbr" . "hence_by_redundantly") ("hb" . "hence_by") ("init" . "initializer") ("ini" . "initially") ("ins" . "instance") ("invr" . "invariant_redundantly") ("inv" . "invariant") ("lir" . "loop_invariant_redundantly") ("li" . "loop_invariant") ("mair" . "maintaining_redundantly") ("mai" . "maintaining") ("mbr" . "measured_by_redundantly") ("mb" . "measured_by") ("mp" . "model_program") ("model" . "model") ("modir" . "modifiable_redundantly") ("modi" . "modifiable") ("modr" . "modifies_redundantly") ("mod" . "modifies") ("mb" . "monitored_by") ("mo" . "monitored") ("nn" . "non_null") ("nb" . "normal_behavior") ("ne" . "normal_example") ("nw" . "nowarn") ("old" . "old") ("or" . "or") ("post" . "post") ("pre" . "pre") ("pure" . "pure") ("ri" . "readable_if") ("ref" . "refine") ("repr" . "represents_redundantly") ("rep" . "represents") ("reqr" . "requires_redundantly") ("req" . "requires") ("rr" . "returns_redundantly") ("rets" . "returns") ("set" . "set") ("sigr" . "signals_redundantly") ("sig" . "signals") ("spr" . "spec_protected") ("spu" . "spec_public") ("stati" . "static_initializer") ("subc" . "subclassing_contract") ("uninit" . "uninitialized") ("unr" . "unreachable") ("weak" . "weakly") ("whr" . "when_redundantly") ("wh" . "when") ("wsr" . "working_space_redundantly") ("ws" . "working_space") ("==>" . "==>") ("<==" . "<==") ("<==>" . "<==>") ("<!>" . "<=!=>") ("->" . "->") ("->" . "<-") (".." . "..") ("{|" . "{|") ("|}" . "|{") ("infdesc" . "(* informal description *)") ("depe" . "depends store-ref-expression <- store-ref-list ;") ("ense" . "ensures Q;") ("exe" . "(\\exists Type t; G(t); P(t));") ("fae" . "(\\forall Type t; G(t); P(t));") ("mode" . "modifies \\everything;") ("modn" . "modifies \\nothing;") ("repe" . "represents store-ref-expression <- spec-expression ;") ("repst" . "represents store-ref-expression \\such_that spec-expression ;") ("reqe" . "requires P;") ("sige" . "signals (Expression e) R;") ("exse" . "exsures (Expression e) R;") ("oe" . "\\old()") ("sume" . "(\\sum Type t, G(t); P(t));") ("prode" . "(\\product Type t, G(t); P(t));") ("maxe" . "(\\max Type t, G(t); P(t));") ("minee" . "(\\min Type t, G(t); P(t));") ("numoe" . "(\\num_of Type t, G(t); P(t));") ("hspec" . "    //@ behavior
;;    //@   requires P;
;;     //@   diverges \\not_specified;
;;     //@   assignable X;
;;     //@   when \\not_specified;
;;     //@   ensures Q;
;;     //@   signals (Exception) R;") ("lspec" . "    //@ requires P;
;;     //@ assignable X;
;;     //@ ensures Q;
;;     //@ signals (Exception) R;") ("pubnhspec" . "    //@ public normal_behavior
;;     //@   requires P;
;;     //@   diverges \\not_specified;
;;     //@   assignable X;
;;     //@   when \\not_specified;
;;     //@   ensures Q;") ("pronhspec" . "    //@ protected normal_behavior
;;     //@   requires P;
;;     //@   diverges \\not_specified;
;;     //@   assignable X;
;;     //@   when \\not_specified;
;;     //@   ensures Q;") ("prinhspec" . "    //@ private normal_behavior
;;     //@   requires P;
;;     //@   diverges \\not_specified;
;;     //@   assignable X;
;;     //@   when \\not_specified;
;;     //@   ensures Q;") ("nhspec" . "    //@ normal_behavior
;;     //@   requires P;
;;     //@   diverges \\not_specified;
;;     //@   assignable X;
;;     //@   when \\not_specified;
;;     //@   ensures Q;") ("pubehspec" . "    //@ public exceptional_behavior
;;     //@   requires P;
;;     //@   diverges \\not_specified;
;;     //@   assignable X;
;;     //@   when \\not_specified;
;;     //@   signals (Exception) R;") ("proehspec" . "    //@ protected exceptional_behavior
;;     //@   requires P;
;;     //@   diverges \\not_specified;
;;     //@   assignable X;
;;     //@   when \\not_specified;
;;     //@   signals (Exception) R;") ("priehspec" . "    //@ private exceptional_behavior
;;     //@   requires P;
;;     //@   diverges \\not_specified;
;;     //@   assignable X;
;;     //@   when \\not_specified;
;;     //@   signals (Exception) R;") ("ehspec" . "    //@ exceptional_behavior
;;     //@   requires P;
;;     //@   diverges \\not_specified;
;;     //@   assignable X;
;;     //@   when \\not_specified;
;;     //@   signals (Exception) R;"))) jde-mode-abbreviations))
;;  '(show-paren-mode t nil (paren))
;;  '(transient-mark-mode t)
;;  '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
