(require 'ob-tangle)

(define-derived-mode fish-mode conf-unix-mode "fish")
(define-derived-mode gitconfig-mode conf-unix-mode "gitconfig")
(define-derived-mode toml-mode conf-unix-mode "toml")

(dolist (file command-line-args-left)
  (with-current-buffer (find-file-noselect file)
    (org-babel-tangle)))
