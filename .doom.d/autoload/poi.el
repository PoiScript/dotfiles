;;; ~/.doom.d/autoload/poi.el -*- lexical-binding: t; -*-

(require 'dbus)

;;;###autoload
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

;;;###autoload
(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

;;;###autoload
(defun insert-inline-math ()
  (interactive)
  (insert "$$")
  (backward-char 1)
  (fcitx--toggle-dbus))

;;;###autoload
(defun insert-display-math ()
  (interactive)
  (insert "\\[\\]")
  (backward-char 2)
  (fcitx--toggle-dbus))

;;;###autoload
(defun fcitx--toggle-dbus ()
  (dbus-call-method
   :session
   "org.fcitx.Fcitx"
   "/inputmethod"
   "org.fcitx.Fcitx.InputMethod"
   "ToggleIM"))
