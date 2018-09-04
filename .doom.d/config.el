;; -*- lexical-binding: t; -*-
;;; ~/.doom.d/config.el

;; packages
(after! org
  (setq org-log-done 'time)
  (setq org-agenda-files (file-expand-wildcards "~/org/calendar/*.org"))
  (remove-hook 'org-mode-hook #'doom|disable-line-numbers))

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
