;; (custom-set-variables
;; ;;  '(bar-cursor-mode t nil (bar-cursor))
;; ;;  '(bm-persistent-face (quote bold-italic))
;; ;;  '(case-fold-search t)
;; ;;  '(column-number-mode t)
;; ;;  '(display-battery-mode t)
;; ;;  '(fringe-mode 0 nil (fringe))
;; ;;  '(highlight-current-line-globally t nil (highlight-current-line))
;;  '(proof-shrink-windows-tofit t)
;;  ;; '(save-place t nil (saveplace))
;;  ;; '(show-paren-mode t nil (paren))
;;  ;; '(speedbar-use-images nil)
;;  ;; '(uniquify-buffer-name-style (quote forward) nil (uniquify))
;;  )

;*****************************DESKTOP and SESSION *********************
;(require 'session)
;  (add-hook 'after-init-hook 'session-initialize)

;(load "desktop") 
;(desktop-load-default) 
;(desktop-read)

;****************************** BATTERY ********************************
;(require 'battery)
;(setq battery-mode-line-format "[%b%p%% %t]"
;      battery-mode-line-string
;      (battery-format battery-mode-line-format
;                      (funcall battery-status-function)))
;;------------------------------�Զ�����------------------------------
;(run-with-timer 0 battery-update-interval
;                'battery-update-handler)
;Ȼ��� batter-mode-line-string �ӵ� `global-mode-line-string' ��� okay
;������������������ӣ�"68% 2:11".
;(display-battery)



