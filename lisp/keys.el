(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

;; Defining keys with general is much more convenient

(require 'general)
(setq general-default-keymaps 'my-keys-minor-mode-map)

;; Required libraries

(require 'multiple-cursors)
(require 'expand-region)
(require 'magit)
(require 'findr)
(require 'utils)
(require 'avy)
(require 'neotree)
(require 'hindent)
(require 'ivy)
(require 'god-mode)
(require 'js)
(require 'jsx-mode)
(require 'rjsx-mode)
(require 'web-mode)
(require 'counsel)
(require 'phi-search)
(require 'crux)
(require 'projectile)

;; Make C-i different from TAB

(define-key input-decode-map [?\C-i] [C-i])

;; Stuff

(defun select-current-line ()
  "Select the current line"
  (interactive)
  (move-beginning-of-line 1)
  (push-mark nil nil t)
  (forward-line 1))

(define-key my-keys-minor-mode-map (kbd "M-x") 'counsel-M-x)

;; Movement and navigation

(general-define-key
  "C-j" 'my/move-beginning-of-line
  "C-;" 'move-end-of-line
  "M-j" 'beginning-of-buffer
  "M-;" 'end-of-buffer

  "M-k" 'left-word
  "M-l" 'right-word

  "C-k" 'my/scroll-down-some
  "C-l" 'my/scroll-up-some
  "C-c l" 'recenter-top-bottom

  "C-/" 'next-error
  "M-/" 'previous-error

  "M-i" 'avy-goto-word-or-subword-1
  "<C-i>" 'my/goto-char-or-expand
  "C-p" 'avy-goto-line

  "C-b" 'my/push-mark
  "M-b" 'my/pop-mark

  "C-r" 'goto-line
)

;; Regions

(define-key my-keys-minor-mode-map (kbd "C-a") 'mark-paragraph)
(define-key my-keys-minor-mode-map (kbd "M-a") 'mark-whole-buffer)

(define-key my-keys-minor-mode-map (kbd "C-,") 'mc/mark-next-like-this)

(define-key my-keys-minor-mode-map (kbd "C-n") 'er/expand-region)
(define-key my-keys-minor-mode-map (kbd "M-n") 'er/mark-inside-pairs)

;; Editing

(general-define-key
  "C-(" 'kmacro-start-macro
  "C-)" 'kmacro-end-macro
  "C-." 'kmacro-end-and-call-macro
  "M-s C-c" 'cua-copy-region  ;; Ordinary C-c doesn't work in macros
  "M-s C-x" 'cua-cut-region
  "C-S-<backspace>" 'backward-kill-sexp
  "C-d" 'my/kill-whole-line
  "M-=" 'align-regexp
  "C-<" 'my/indent-left
  "C->" 'my/indent-right
  "C-'" 'my/duplicate
  "M-d" 'my/one-space
  "C-\\" 'insert-char
  "M--" (lambda () (interactive) (insert "–"))
  "M-_" (lambda () (interactive) (insert "—"))
  "M-u" 'upcase-char
)

;; Disable rectangle selection

(require 'cua-base)
(define-key cua-global-keymap [C-return] nil)

;; Macros

(general-define-key
  "C-(" 'kmacro-start-macro
  "C-)" 'kmacro-end-macro
  "C-." 'kmacro-end-and-call-macro

  "M-s C-c" 'cua-copy-region  ;; Ordinary C-c doesn't work in macros
  "M-s C-x" 'cua-cut-region
)

;; Information

(general-define-key
  "M-s c" 'count-words
  "M-s i" 'describe-char
)

;; Search and replacement

(general-define-key
  "C-s"     'phi-search
  "M-r"     'query-replace-regexp
  "M-s r"   'my/projectile-ag-regexp
  "M-s M-r" 'projectile-ag
  "M-s f"   'findr-query-replace
  "M-s M-o" 'my/occur-region
)

;; Files

(general-define-key
  "C-f"     (general-simulate-keys "C-x C-s")

  "M-o"     'projectile-switch-project
  "C-o"     'projectile-find-file
  "C-c C-o" 'find-file

  "C-x C-r" 'my/rename-current-buffer-file

  "C-4"     'neotree-toggle
)

;; Windows and buffers

(general-define-key
  "C-t"   'ivy-switch-buffer
  "C-c k" 'my/switch-to-previous-buffer
  "M-t"   'ibuffer

  "C-w"   'delete-window
  "M-w"   'kill-buffer

  "M-e"   'split-window-right
  "C-e"   'my/switch-to-next-window
  "C-c o" 'clone-indirect-buffer
  "C-c e" 'crux-transpose-windows
)

;; Display

(general-define-key
  "C--"     'text-scale-decrease
  "C-="     'text-scale-increase

  "M-s v"   'variable-pitch-mode
  "M-s t"   'my/switch-theme

  "M-s h h" 'hl-line-mode
  "M-s h ." 'hlt-highlight-symbol
  "M-s h ," 'hlt-unhighlight-symbol
)

;; Compilation

(general-define-key
  "C-c r" 'recompile
)

;; Magit

(define-key my-keys-minor-mode-map (kbd "C-8") 'magit-status)

;; Haskell

(general-define-key :keymaps 'haskell-mode-map
  "C-y" 'haskell-mode-jump-to-tag
  "M-y" 'my/haskell-mode-ask-for-tag
  "C-c C-p" 'haskell-process-restart
  "C-c C-o" 'haskell-session-change-target
  "C-c v a" 'haskell-cabal-add-dependency
  "C-c y" 'haskell-hoogle
  "C-c <C-i>" 'haskell-mode-show-type-at
  "M-q" 'hindent-reformat-decl-or-fill
)

;; Javascript

(define-key js-mode-map (kbd "RET") 'newline-and-indent)
(define-key jsx-mode-map (kbd "RET") 'newline-and-indent)
(define-key web-mode-map (kbd "RET") 'newline-and-indent)
(define-key rjsx-mode-map (kbd "<") 'self-insert-command)

;; CSS

(require 'css-mode)
(define-key css-mode-map (kbd "RET") 'newline-and-indent)

;; Mustache

(require 'mustache-mode)
(define-key mustache-mode-map (kbd "RET") 'newline-and-indent)

;; Rust

(define-key rust-mode-map (kbd "RET") 'newline-and-indent)

;; YAML

(require 'yaml-mode)
(define-key yaml-mode-map (kbd "RET") 'newline-and-indent)

;; Autocomplete

(require 'company)
(general-define-key :keymaps 'company-active-map
  (quote [(ctrl return)]) 'company-complete-selection
  "C-0" 'company-complete-number
  "C-1" 'company-complete-number
  "C-2" 'company-complete-number
  "C-3" 'company-complete-number
  "C-4" 'company-complete-number
  "C-5" 'company-complete-number
  "C-6" 'company-complete-number
  "C-7" 'company-complete-number
  "C-8" 'company-complete-number
  "C-9" 'company-complete-number
)

;; Snippets

(define-key my-keys-minor-mode-map (kbd "M-s M-s") 'yas-new-snippet)

;; Calc

(define-key my-keys-minor-mode-map (kbd "C-c c") 'quick-calc)

;; Ivy

(general-define-key :keymaps 'ivy-minibuffer-map
  "M-RET" 'ivy-immediate-done
)

;; Elm
(require 'elm-mode)

(define-key elm-mode-map (kbd "RET") 'newline-and-indent)

;; End of key definitions.

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)

(defun disable-my-keys ()
  (my-keys-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'disable-my-keys)

(provide 'keys)
