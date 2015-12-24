(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-by-copying t)
 '(backup-directory-alist (quote (("." . "~/.saves"))))
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(delete-old-versions t)
 '(dired-auto-revert-buffer t)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(electric-indent-mode nil)
 '(fill-column 77)
 '(haskell-indentation-show-indentations nil)
 '(haskell-indentation-starter-offset 2)
 '(haskell-interactive-mode-eval-pretty t)
 '(haskell-interactive-popup-errors nil)
 '(haskell-mode-hook
   (quote
    (turn-on-haskell-indentation interactive-haskell-mode)) t)
 '(haskell-process-log t)
 '(haskell-process-suggest-language-pragmas nil)
 '(haskell-process-suggest-no-warn-orphans nil)
 '(haskell-process-suggest-overloaded-strings nil)
 '(haskell-process-suggest-remove-import-lines nil)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-tags-on-save t)
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(initial-buffer-choice (quote remember-notes))
 '(kept-new-versions 6)
 '(kill-whole-line t)
 '(markdown-hr-strings
   (quote
    ("-----------------------------------------------------------------------------" "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *" "---------------------------------------" "* * * * * * * * * * * * * * * * * * * *" "---------" "* * * * *")))
 '(menu-bar-mode nil)
 '(my/kill-as-delete t)
 '(scroll-bar-mode nil)
 '(split-width-threshold 100)
 '(text-scale-mode-step 1.1)
 '(tool-bar-mode nil)
 '(undo-limit 8000000)
 '(undo-strong-limit 12000000)
 '(use-dialog-box nil)
 '(word-wrap t)
 '(yas-indent-line (quote fixed)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 102 :width normal))))
 '(font-lock-comment-face ((t (:inherit highlight))))
 '(font-lock-doc-face ((t (:foreground "#6c71c4" :slant normal))))
 '(variable-pitch ((t (:height 1.225 :family "Sans")))))
