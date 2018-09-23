(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-arguments (quote ("--smart-case" "--hidden" "--ignore" ".git")))
 '(ag-highlight-search t)
 '(backup-by-copying t)
 '(backup-directory-alist (quote (("." . "~/.saves"))))
 '(column-number-mode t)
 '(company-search-regexp-function (quote regexp-quote))
 '(compilation-ask-about-save nil)
 '(compilation-search-path (quote (nil "../" "../../")))
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(dabbrev-case-distinction nil)
 '(dabbrev-case-fold-search nil)
 '(dabbrev-case-replace nil)
 '(dabbrev-check-all-buffers nil)
 '(delete-old-versions t)
 '(dired-auto-revert-buffer t)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(electric-indent-mode nil)
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-sane-defaults)))
 '(fill-column 76)
 '(fiplr-ignored-globs
   (quote
    ((directories
      (".git" ".svn" ".hg" ".bzr" ".cabal-sandbox" ".stack-work" "dist" "bower_components" "node_modules" "output"))
     (files
      (".#*" "*~" "*.so" "*.jpg" "*.png" "*.gif" "*.pdf" "*.gz" "*.zip")))))
 '(fiplr-root-markers (quote (".git" ".svn" ".hg" ".bzr" "stack.yaml")))
 '(glasses-original-separator "-")
 '(glasses-separator "-")
 '(grep-command "grep --color -nH -e ")
 '(grep-files-aliases
   (quote
    (("all" . "* .[!.]* ..?*")
     ("el" . "*.el")
     ("ch" . "*.[ch]")
     ("c" . "*.c")
     ("cc" . "*.cc *.cxx *.cpp *.C *.CC *.c++")
     ("cchh" . "*.cc *.[ch]xx *.[ch]pp *.[CHh] *.CC *.HH *.[ch]++")
     ("hh" . "*.hxx *.hpp *.[Hh] *.HH *.h++")
     ("h" . "*.h")
     ("l" . "[Cc]hange[Ll]og*")
     ("m" . "[Mm]akefile*")
     ("tex" . "*.tex")
     ("texi" . "*.texi")
     ("asm" . "*.[sS]")
     ("hs" . "*.hs *.lhs *.cabal stack.yaml"))))
 '(grep-find-command
   (quote
    ("find -L . -type f -exec grep --color -nH -e  {} +" . 42)))
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" ".stack-work")))
 '(grep-find-template
   "find -L <D> <X> -type f <F> -exec grep <C> -nH -e <R> {} +")
 '(haskell-hoogle-command nil)
 '(haskell-hoogle-url "http://hoogle.haskell.org/?hoogle=%s")
 '(haskell-indentation-show-indentations nil)
 '(haskell-indentation-starter-offset 2)
 '(haskell-interactive-mode-eval-pretty t)
 '(haskell-interactive-popup-errors nil)
 '(haskell-interactive-prompt "> ")
 '(haskell-interactive-prompt2 "| ")
 '(haskell-mode-hook
   (quote
    (turn-on-haskell-indentation interactive-haskell-mode)))
 '(haskell-process-args-stack-ghci
   (quote
    ("--ghci-options=-ferror-spans -fshow-loaded-modules" "--no-build" "--no-load")))
 '(haskell-process-log t)
 '(haskell-process-show-debug-tips nil)
 '(haskell-process-suggest-language-pragmas t)
 '(haskell-process-suggest-no-warn-orphans nil)
 '(haskell-process-suggest-overloaded-strings t)
 '(haskell-process-suggest-remove-import-lines nil)
 '(haskell-process-type (quote stack-ghci))
 '(haskell-tags-on-save nil)
 '(hasky-stack-auto-target t)
 '(ido-enable-flex-matching t)
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(initial-buffer-choice (quote remember-notes))
 '(ivy-mode t)
 '(js-curly-indent-offset 0)
 '(js-indent-level 2)
 '(js2-missing-semi-one-line-override t)
 '(jsx-indent-level 2)
 '(kept-new-versions 6)
 '(kill-whole-line t)
 '(linum-relative-current-symbol "")
 '(magit-diff-refine-hunk (quote all))
 '(magit-push-always-verify nil)
 '(magit-stash-arguments nil)
 '(magit-use-overlays nil)
 '(markdown-hr-strings
   (quote
    ("-----------------------------------------------------------------------------" "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *" "---------------------------------------" "* * * * * * * * * * * * * * * * * * * *" "---------" "* * * * *")))
 '(markdown-indent-on-enter nil)
 '(menu-bar-mode nil)
 '(mouse-wheel-scroll-amount (quote (5 ((shift) . 1) ((control) . 5))))
 '(my/kill-as-delete t)
 '(neo-smart-open t)
 '(ns-command-modifier (quote control))
 '(org-special-ctrl-a/e nil)
 '(org-startup-indented nil)
 '(org-support-shift-select (quote always))
 '(org-tag-faces (quote (("5m" . "red") ("10m" . "firebrick"))))
 '(org-tags-column -85)
 '(package-selected-packages
   (quote
    (ace-jump-mode adoc-mode ag auto-complete auto-indent-mode avy browse-kill-ring+ coffee-mode counsel counsel-gtags counsel-projectile crux csv-mode dockerfile-mode dumb-jump elm-mode elpy exec-path-from-shell expand-region fill-column-indicator findr fiplr flow-minor-mode general ghci-completion gist github-issues god-mode haskell-mode hasky-extensions hasky-stack helm helm-projectile hindent hl-line+ ht jsx-mode linum-relative macrostep magit magit-gh-pulls markdown-mode multi-web-mode multiple-cursors mustache-mode neotree nim-mode noflet phi-search projectile pug-mode purescript-mode rainbow-delimiters rjsx-mode rudel rust-mode shell-pop smartparens smex smooth-scroll smooth-scrolling solarized-theme sublimity swiper swoop travis typescript-mode typo undo-tree undohist vue-html-mode vue-mode web-mode xterm-color yaml-mode yasnippet)))
 '(projectile-completion-system (quote grizzl))
 '(require-final-newline t)
 '(safe-local-variable-values
   (quote
    ((haskell-stylish-on-save)
     (haskell-tags-on-save)
     (eval add-to-list
           (quote auto-mode-alist)
           (quote
            ("\\.ihdf\\'" . markdown-mode)))
     (buffer-file-coding-system . utf-8-unix)
     (haskell-indentation-starter-offset . 4)
     (haskell-indentation-layout-offset . 4)
     (haskell-indentation-left-offset . 4)
     (haskell-stylish-on-save . t)
     (haskell-indent-spaces . 4))))
 '(scroll-bar-mode nil)
 '(sentence-end-double-space nil)
 '(show-paren-mode t)
 '(show-smartparens-global-mode nil)
 '(sp-show-pair-from-inside nil)
 '(split-width-threshold 120)
 '(tags-case-fold-search nil)
 '(text-scale-mode-step 1.1)
 '(tool-bar-mode nil)
 '(undo-limit 8000000)
 '(undo-strong-limit 12000000)
 '(use-dialog-box nil)
 '(version-control t)
 '(web-mode-enable-auto-indentation nil)
 '(web-mode-enable-auto-opening nil)
 '(web-mode-enable-auto-pairing nil)
 '(web-mode-enable-auto-quoting nil)
 '(web-mode-enable-element-content-fontification nil)
 '(web-mode-enable-part-face nil)
 '(word-wrap t)
 '(yas-indent-line (quote fixed))
 '(yas-snippet-dirs (quote ("~/.emacs.d/snippets")) nil (yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 130 :width normal :foundry "PfEd" :family "DejaVu Sans Mono"))))
 '(ag-match-face ((t (:foreground "red" :weight bold))))
 '(font-lock-comment-delimiter-face ((t (:inherit highlight :height 1.05 :family "sans"))))
 '(font-lock-comment-face ((t (:inherit highlight :height 1.05 :family "sans"))))
 '(font-lock-doc-face ((t (:foreground "#6c71c4" :slant normal :height 1.05 :family "sans"))))
 '(variable-pitch ((t (:height 1.0 :family "Sans")))))
