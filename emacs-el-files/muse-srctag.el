;;; muse-srctag.el ---  handle Muse src tag

;; Copyright (C) 2006  Free Software Foundation, Inc.

;; Author: Charles Wang <[EMAIL PROTECTED]>
;; Keywords:

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;;

;;; Code:


(require 'htmlize)
(require 'muse)
(require 'muse-html)

(add-to-list  'muse-html-markup-tags '("src" t t nil muse-srctag))

(defun muse-srctag(beg end attrs)
  "generate html representation of source code with syntax highlight."
  (goto-char beg)
  (let* ((mode (or (cdr (assoc "type" attrs)) "a.txt"))
         (mode-func (or (cdr (find-if (lambda (pair)
                                        (save-match-data
                                          (string-match (car pair) mode)))
                                      auto-mode-alist))
                        'fundamental-mode))
         (text (delete-and-extract-region beg end)))
    (save-restriction
      (narrow-to-region (point) (point))
      (insert (muse-markup-text 'begin-example))
      (insert
       (with-temp-buffer
         (insert text)
         (funcall mode-func)
         ;; the following is copy and modified from htmlize.el, in order to
         ;; remove the <html> header part. and using font-mode instead of
         ;; css mode.

         ;; Internal function; don't call it from outside this file.  Htmlize
         ;; current buffer, writing the resulting HTML to a new buffer, and
         ;; return it.  Unlike htmlize-buffer, this doesn't change current
         ;; buffer or use switch-to-buffer.

         (run-hooks 'htmlize-before-hook)
         ;; Convince font-lock support modes to fontify the entire buffer
         ;; in advance.
         (font-lock-fontify-buffer)
         (htmlize-ensure-fontified)
         (clrhash htmlize-extended-character-cache)
         (let* ((buffer-faces (htmlize-faces-in-buffer))
                (face-map (htmlize-make-face-map (adjoin 'default
                                                         buffer-faces)))
                (htmlbuf (get-buffer-create (generate-new-buffer-name " *temp")))
                (insert-text-method
                 ;; Get the inserter method, so we can funcall it inside
                 ;; the loop.  Not calling `htmlize-method' in the loop
                 ;; body yields a measurable speed increase.
                 (htmlize-method-function 'insert-text))
                ;; Declare variables used in loop body outside the loop
                ;; because it's faster to establish `let' bindings only
                ;; once.
                next-change text face-list fstruct-list)
           ;; This loop traverses and reads the source buffer, appending
           ;; the resulting HTML to HTMLBUF with `princ'.  This method is
           ;; fast because: 1) it doesn't require examining the text
           ;; properties char by char (htmlize-next-change is used to
           ;; move between runs with the same face), and 2) it doesn't
           ;; require buffer switches, which are slow in Emacs.
           (goto-char (point-min))
           (while (not (eobp))
             (setq next-change (htmlize-next-change (point) 'face))
             ;; Get faces in use between (point) and NEXT-CHANGE, and
             ;; convert them to fstructs.
             (setq face-list (htmlize-faces-at-point)
                   fstruct-list (delq nil (mapcar (lambda (f)
                                                    (gethash f face-map))
                                                  face-list)))
             ;; Extract buffer text, sans the invisible parts.  Then
             ;; untabify it and escape the HTML metacharacters.
             (setq text (htmlize-buffer-substring-no-invisible
                         (point) next-change))
             (setq text (htmlize-untabify text (current-column)))
             (setq text (htmlize-protect-string text))
             ;; Don't bother writing anything if there's no text (this
             ;; happens in invisible regions).
             (when (> (length text) 0)
               ;; Insert the text, along with the necessary markup to
               ;; represent faces in FSTRUCT-LIST.
               (funcall insert-text-method text fstruct-list htmlbuf))
             (goto-char next-change))
           (run-hooks 'htmlize-after-hook)
           (setq text (with-current-buffer htmlbuf (buffer-string)))
           (kill-buffer htmlbuf)
           text)
         ))
      (insert (muse-markup-text 'end-example))
      (muse-publish-mark-read-only (point-min) (point-max))
      (goto-char (point-max))
      )))


(provide 'muse-srctag)
;;; muse-srctag.el ends here