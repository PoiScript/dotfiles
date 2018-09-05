;; -*- lexical-binding: t; -*-
;;; ~/.doom.d/config.el

;; packages
(after! org
  (setq org-log-done 'time)
  (plist-put org-format-latex-options :scale 2)
  (setq org-agenda-files (file-expand-wildcards "~/org/calendar/*.org"))
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
  (remove-hook 'org-mode-hook #'doom|disable-line-numbers))

(def-package! cdlatex
  :config
  (setq cdlatex-command-alist
        '(("lim"        "Insert \\lim_{}\\limits_{}"
           "\\lim\\limits_{?}"  cdlatex-position-cursor nil nil t)
          ("sin"        "Insert \\sin"
           "\\sin"       nil nil t t)
          ("cos"        "Insert \\cos"
           "\\cos"       nil nil t t)
          ("under"      "Insert \\underset{}{}"
           "\\underset{?}{}" cdlatex-position-cursor nil nil t)
          ("prod"       "Insert \\prod\\limits_{}"
           "\\prod\\limits_{?}" cdlatex-position-cursor nil nil t)
          ("txt"        "Insert \\text{}"
           "\\text{?}" cdlatex-position-cursor nil nil t)
          ("iintl"      "Insert \\iint\\limits_{}"
           "\\iint\\limits_{?}" cdlatex-position-cursor nil nil t)))
  (setq cdlatex-env-alist
        '(("cases" "\\begin{cases}\n?\n\\end{cases}\n" nil)
          ("aligned" "\\begin{aligned}\n?\n\\end{aligned}\n" nil))))

(def-package! fcitx
  :config
  (setq fcitx-active-evil-states '(insert emacs))
  (fcitx-aggressive-setup)
  (setq fcitx-use-dbus t))

(def-package! lsp-rust
  :hook (rust-mode . lsp-rust-enable))

(def-package! lsp-mode
  :commands (lsp-mode lsp-define-stdio-client))

(def-package! lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (set! :lookup 'lsp-ui-mode
    :definition #'lsp-ui-peek-find-definitions
    :references #'lsp-ui-peek-find-references)
  (set-face-attribute 'lsp-ui-sideline-symbol nil :box nil)
  (set-face-attribute 'lsp-ui-sideline-current-symbol nil :weight 'normal :box nil)
  (setq lsp-ui-doc-max-height 8
        lsp-ui-doc-max-width 35
        lsp-ui-sideline-ignore-duplicate t))

(def-package! company-lsp
  :after lsp-mode
  :config
  (set-company-backend! 'lsp-mode '(company-lsp))
  (setq company-lsp-enable-recompletion t))

;; key-binding
(map!
 :gnvime "C-/" #'comment-line)
