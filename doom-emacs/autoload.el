;;;###autoload
(defun treemacs-increase-width ()
  "Increase the width of treemacs by 5."
  (interactive)
  (setq treemacs-width (+ treemacs-width 5))
  (treemacs--set-width treemacs-width))

;;;###autoload
(defun treemacs-decrease-width ()
  "Decrease the width of treemacs by 5."
  (interactive)
  (setq treemacs-width (- treemacs-width 5))
  (treemacs--set-width treemacs-width))
