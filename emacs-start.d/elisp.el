;******************* 计算中英文单词数目**********************
;******************http://learn.tsinghua.edu.cn:8080/2005211356/emacs/EmacsTip.html#sec2

(defun ywb-count-word-region ()
  (interactive)
  (let ((beg (point-min)) (end (point-max))
        (word 0) (other 0))
    (if mark-active
        (setq beg (region-beginning)
              end (region-end)))
    (save-excursion
      (goto-char beg)
      (while (< (point) end)
        (cond ((not (equal (car (syntax-after (point))) 2)) ; not a word
               (forward-char))
              ((< (char-after) 128)     ; is a english word
               (progn
                 (setq word (1+ word))
                 (forward-word)))
              (t
               (setq other (1+ other))
               (forward-char)))))
    (message "enlish word: %d\nother char: %d"
             word other)))