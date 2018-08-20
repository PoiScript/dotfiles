;;; funcs.el --- poi-ui layer functions file for Spacemacs.
;;
;; Copyright (c) 2018 Alex Lin (poi)
;;
;; Author: Alex Lin (poi) <poiscript@gmail.com>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun buffer-encoding-abbrev ()
  (let ((buf-coding (format "%s" buffer-file-coding-system)))
    (if (string-match "\\(dos\\|unix\\|mac\\)" buf-coding)
        (match-string 1 buf-coding)
      buf-coding)))

(defun mode-line-fill-right (face reserve)
  (unless reserve
    (setq reserve 20))
  (when (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " "
              'display `((space :align-to (- (+ right right-fringe right-margin) ,reserve)))
              'face face))

(defun reserve-middle/right ()
  (+ 1 (length (format-mode-line mode-line-align-right))))

(setq mode-line-align-left
      '(
        " "
        (:eval (propertize (winum-get-number-string)))
        " "

        (:eval (if buffer-read-only "% " (if (buffer-modified-p) "* " "- ")))

        ;; File Size
        (:eval (propertize "%I "))

        ;; Buffer Name
        (:eval (propertize "%b " 'face 'font-lock-constant-face))

        ;; anzu
        ;; (:eval (anzu--mode-line-format))

        ;; Major Mode
        (:eval (propertize "%m " 'face 'font-lock-keyword-face))

        ;; Minor Modes
        (:eval (minor-mode-alist))
        " "
        ;; git info
        (:eval `(vc-mode vc-mode))

        (:eval (list (nyan-create)))
        ))


(setq mode-line-align-right
      '(
        ;; Line ending
        (:eval (buffer-encoding-abbrev)) " "

        ;; Lines and Columns
        (:eval (propertize "%02l")) ":"
        (:eval (propertize "%02c")) " "

        ;; Position
        (:eval (propertize "%p"))
        ))
