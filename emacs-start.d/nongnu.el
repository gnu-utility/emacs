(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;****************************** framemove: move focus across frames *************************
;; **************************************** C-x 5 2, creating frames
(add-to-list 'load-path "/Users/anduo/Pond/sword/emacs-el-files/")
(load "/Users/anduo/Pond/sword/emacs-el-files/framemove.el")
(require 'framemove)
(framemove-default-keybindings)

;****************************** COLOR THEME *************************
(add-to-list 'load-path "/Users/anduo/Pond/sword/emacs-el-files/color-theme/")
(load "/Users/anduo/Pond/sword/emacs-el-files/color-theme/color-theme.el")
(require 'color-theme)

  ;; M-x set-variable RET color-theme-is-global nil
  ;;   M-x color-theme-blue-sea


;; (let ((color-theme-is-global nil))
;;         (select-frame (make-frame))
;;         (color-theme-aliceblue)
;;         (select-frame (make-frame))
;;         (color-theme-snowish))

;************************************************************

;************************************************************
;****************************** Postgres *************************
(setq sql-postgres-program "/usr/local/bin/psql")

;******************** WordNet ********************
(load "/Users/anduo/Pond/sword/emacs-el-files/xwl-wordnet.el")
(require 'xwl-wordnet)
(global-set-key (kbd "M-s") 'wordnet-search)


;************************** MUTT mode **************************
(load "/Users/anduo/Pond/sword/emacs-el-files/mutt.el")
(require 'mutt)


;*************************** Title TIME *************************
(load "/Users/anduo/Pond/sword/emacs-el-files/title-time.el")
(require 'title-time)

(setq display-time-day-and-date t)
(setq display-time-interval 30)
 (setq display-time-24hr-format nil)
 (setq display-time-string-forms
       (quote
        ((if (and (not display-time-format)
		 display-time-day-and-date)
	    (format-time-string "%a %b %e   " now) "  ")
	(format-time-string
	 (or display-time-format
	     (if display-time-24hr-format "%H:%M" "%-I:%M%p")) now)
	"    Load" load "    " (if mail " Mail" "")))
       )


;************************************************************
;***************************** TABLE **************************8
(load "/Users/anduo/Pond/sword/emacs-el-files/table.el")
(require 'table)
(autoload 'table-insert "table" "WYGIWYS table editor")


;************************************************************
;******************** tabbar.el *********************
(load "/Users/anduo/Pond/sword/emacs-el-files/tabbar.el")
(require 'tabbar)
(tabbar-mode)
(global-set-key (kbd "<f10>") 'tabbar-mode)

(global-set-key (kbd "<f11>") 'tabbar-backward)
(global-set-key (kbd "<f12>") 'tabbar-forward)
(global-set-key (kbd "<M-f11>") 'tabbar-backward-group)
(global-set-key (kbd "<M-f12>") 'tabbar-forward-group)

;(global-set-key (kbd "M-]") 'tabbar-forward)
;(global-set-key (kbd "C-c [") 'tabbar-backward-group)
;(global-set-key (kbd "C-c ]") 'tabbar-forward-group)
;(global-set-key (kbd "M-[") 'tabbar-backward)


;************************************************************
;; ;*********************** bm.el *************************
;; ;******************* http://www.nongnu.org/bm/ **********
(load "/Users/anduo/Pond/sword/emacs-el-files/bm-1.32.el")
(require 'bm) 

(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)

;; (autoload 'bm-toggle   "bm" "Toggle bookmark in current buffer." t)
;; (autoload 'bm-next     "bm" "Goto bookmark."                     t)
;; (autoload 'bm-previous "bm" "Goto previous bookmark."            t)

;; ;; make bookmarks persistent as default
(setq-default bm-buffer-persistence t)
;; ;; Loading the repository from file when on start up.
(add-hook' after-init-hook 'bm-repository-load)

;; ;; Restoring bookmarks when on file find.
(add-hook 'find-file-hooks 'bm-buffer-restore)

;; ;; Saving bookmark data on killing a buffer
(add-hook 'kill-buffer-hook 'bm-buffer-save)

;;    ;; Saving the repository to file when on exit.
;;    ;; kill-buffer-hook is not called when emacs is killed, so we
;;    ;; must save all bookmarks first.
;;    (add-hook 'kill-emacs-hook '(lambda nil
;;  	  		             (bm-buffer-save-all)
;; 			             (bm-repository-save)))

;; Update bookmark repository when saving the file.
(add-hook 'after-save-hook 'bm-buffer-save)

   ;; Restore bookmarks when buffer is reverted.
(add-hook 'after-revert-hook 'bm-buffer-restore)

;; Restoring bookmarks when on file find.
(add-hook 'find-file-hooks 'bm-buffer-restore)
;; make sure bookmarks is saved before check-in (and revert-buffer)
(add-hook 'vc-before-checkin-hook 'bm-buffer-save)

;; ;; make sure bookmarks is saved before check-in (and revert-buffer)
;; (add-hook 'vc-before-checkin-hook 'bm-buffer-save)


;****************************** sql auto completion **********
;; (load "/home/anduo/Pond/sword/emacs-el-files/pg.el")
;; (require 'pg)

;; (add-to-list 'load-path "/home/anduo/Pond/sword/emacs-el-files/")
;; (require 'cl-lib)

;; (load "/home/anduo/Pond/sword/emacs-el-files/sql.el")

;; (load "/home/anduo/Pond/sword/emacs-el-files/sql-completion.el")

;; (require 'sql)

;; (defun sql-remove-continuing-prompts (output)
;;   (concat "\n" (replace-regexp-in-string (concat sql-database "[^=()]# ") "" output)))

;; (defun sqli-add-hooks ()
;;   (add-hook 'comint-preoutput-filter-functions 'sql-remove-continuing-prompts))

;; (add-hook 'sql-interactive-mode-hook 'sqli-add-hooks)

;; (defun my-sql-save-history-hook ()
;;     (let ((lval 'sql-input-ring-file-name)
;;           (rval 'sql-product))
;;       (if (symbol-value rval)
;;           (let ((filename
;;                  (concat "~/.emacs.d/sql/"
;;                          (symbol-name (symbol-value rval))
;;                          "-history.sql")))
;;             (set (make-local-variable lval) filename))
;;         (error
;;          (format "SQL history will not be saved because %s is nil"
;;                  (symbol-name rval))))))
;; (add-hook 'sql-interactive-mode-hook 'my-sql-save-history-hook)

;; (defcustom sql-postgres-data-dictionary
;;   (concat
;;    "SELECT '(\"' || c.relname || '\" \"' || a.attname ||'\")' "
;;    "FROM pg_class AS c "
;;    "LEFT JOIN pg_attribute AS a ON c.oid = a.attrelid "
;;    "WHERE c.relkind='r' "
;;    "ORDER BY c.relname; ")
;;   "SQL Statement to determine all tables and columns."
;;   :group 'SQL
;;   :type 'string)

;; (defun save-sql-data-dictionary ()
;;   (let ((file "~/.emacs.d/sql/sql-data-dictionary"))
;;     (with-temp-buffer
;;       (pp sql-data-dictionary (current-buffer))
;;       (write-region (point-min) (point-max) file))))

;; (defun load-sql-postgres-data-dictionary ()
;;   "Read the contents of a file and return as a string."
;;   (let ((file "~/.emacs.d/sql/sql-data-dictionary"))
;;     (if (file-exists-p file)
;;         (setq sql-data-dictionary
;;               (with-temp-buffer
;;                 (insert-file-contents file)
;;                 (read (current-buffer)))))))

;; (defun generate-sql-postgres-data-dictionary ()
;;   (interactive)
;;   (setq sql-data-dictionary
;;         (sql-data-dictionary sql-postgres-data-dictionary))
;;   (save-sql-data-dictionary))

;; (load-sql-postgres-data-dictionary)

;; (define-key sql-interactive-mode-map (kbd "TAB") 'sql-complete)

;; (define-abbrev-table 'sql-mode-abbrev-table ())
;; (add-hook 'sql-interactive-mode-hook
;;           (lambda ()
;;             (abbrev-mode 1)
;;             (setq local-abbrev-table sql-mode-abbrev-table)))


(eval-after-load 'gnuplot-mode
  '(add-hook 'gnuplot-mode-hook
             (lambda ()
               (flyspell-prog-mode)
               (add-hook 'before-save-hook
                         'whitespace-cleanup nil t))))
