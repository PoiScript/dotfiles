;;; packages.el --- poi-ui layer packages file for Spacemacs.
;;
;; Copyright (c) 2018 Alex Lin (poi)
;;
;; Author: Alex Lin (poi) <poiscript@gmail.com>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst poi-ui-packages
  '((poi-modeline :location built-in)
    nyan-mode))

(defun poi-ui/init-poi-modeline ()
  (setq-default
   mode-line-format
   (list
    mode-line-align-left
    '(:eval (mode-line-fill-right 'mode-line (reserve-middle/right)))
    mode-line-align-right)))

(defun poi-ui/post-init-diminish ()
  (progn
    (eval-after-load "ivy"
      '(diminish 'ivy-mode))
    (eval-after-load "projectile"
      '(diminish 'projectile-mode))
    ;; (evel-after-load 'hybrid
    ;;   (diminish 'hybrid-mode))
    (with-eval-after-load 'whitespace
      (diminish 'whitespace-mode))
    (with-eval-after-load 'smartparens
      (diminish 'smartparens-mode))
    (with-eval-after-load 'which-key
      (diminish 'which-key-mode))))

(defun poi-ui/init-nyan-mode ()
  (setq nyan-wavy-trail t)
  (setq nyan-animate-nyancat t)
  (nyan-mode)
  ;; explicitly re-enable the cat for the first GUI client
  (spacemacs|do-after-display-system-init
   (nyan-mode -1)
   (nyan-mode)))
