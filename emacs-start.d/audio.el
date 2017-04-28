;************************ AUDIO CONFIGURATION **************
;******************************* EMMS ***********************
(require 'emms-setup)
(emms-standard)
(emms-default-players)

;; Show the current track each time EMMS
;; starts to play a track with "NP : "
(add-hook 'emms-player-started-hook 'emms-show)
(setq emms-show-format "dog's on: %s")
        
;; When asked for emms-play-directory,
;; always start from this one 
(setq emms-source-file-default-directory "~/Pond/music")
        
;; Want to use alsa with mpg321 ? 
(setq emms-player-mpg321-parameters '("-o" "alsa"))

(global-set-key (kbd "ESC O c") 'emms-next)
(global-set-key (kbd "ESC O d") 'emms-previous)
(global-set-key [(control ?c) ?m ?w] 'emms-show)
(global-set-key [(control ?c) ?m ?n] 'emms-next)
(global-set-key [(control ?c) ?m ?p] 'emms-previous)
(global-set-key [(control ?c) ?m ?s] 'emms-stop)
(global-set-key [(control ?c) ?m ?i] 'fc-emms-insert)
(global-set-key [(control ?c) ?m ?f] 'emms-play-file)
(global-set-key [(control ?c) ?m ?F] 'emms-play-directory)

;***************************** AMIXER ***********************
(load "~/Pond/sword/emacs-el-files/amixer.el")

(require 'amixer)
;(setq amixer-mixer-program "aumix"
;      amixer-volume-increment 3
;      amixer-master-volume 70)

    (global-set-key [(control ?c) ?# ?+] 'amixer-increment-volume)
    (global-set-key [(control ?c) ?# ?-] 'amixer-decrement-volume)
    (global-set-key [(control ?c) ?# ?v] 'amixer-set-volume)

;(global-set-key (kbd "C-c -") 'amixer-decrement-volume)
;(global-set-key (kbd "C-c +") 'amixer-increment-volume)



;******************** MPG123 ***************************
(autoload 'mpg123 "mpg123" "A Front-end to mpg123" t)
(setq mpg123-need-slider nil)
(setq mpg123-display-slider nil)