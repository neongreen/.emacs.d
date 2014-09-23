(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

;; Required libraries.

(require 'multiple-cursors)
(require 'expand-region)
(require 'magit)
(require 'utils)

;; Movement and navigation.

(define-key my-keys-minor-mode-map (kbd "C-1") 'beginning-of-buffer)
(define-key my-keys-minor-mode-map (kbd "C-2") 'end-of-buffer)
(define-key my-keys-minor-mode-map (kbd "C-9") 'my/move-beginning-of-line)
(define-key my-keys-minor-mode-map (kbd "C-0") 'move-end-of-line)
(define-key my-keys-minor-mode-map (kbd "C-k") 'my/scroll-down-some)
(define-key my-keys-minor-mode-map (kbd "C-l") 'my/scroll-up-some)
(define-key my-keys-minor-mode-map (kbd "C-/") 'next-error)
(define-key my-keys-minor-mode-map (kbd "M-/") 'previous-error)

;; Regions.

(define-key my-keys-minor-mode-map (kbd "C-a") 'mark-paragraph)
(define-key my-keys-minor-mode-map (kbd "M-a") 'mark-whole-buffer)
(define-key my-keys-minor-mode-map (kbd "C-,") 'mc/mark-next-like-this)
(define-key my-keys-minor-mode-map (kbd "C-n") 'er/expand-region)


;; Editing.

(define-key my-keys-minor-mode-map (kbd "C-d")   'kill-line)
(define-key my-keys-minor-mode-map (kbd "M-=")   'align-regexp)
(define-key my-keys-minor-mode-map (kbd "<tab>") 'dabbrev-expand)
(define-key my-keys-minor-mode-map (kbd "C-<")   'my/indent-left)
(define-key my-keys-minor-mode-map (kbd "C->")   'my/indent-right)
(define-key my-keys-minor-mode-map (kbd "C-'")   'my/duplicate)

;; Macros.

(define-key my-keys-minor-mode-map (kbd "C-(") 'kmacro-start-macro)
(define-key my-keys-minor-mode-map (kbd "C-)") 'kmacro-end-macro)
(define-key my-keys-minor-mode-map (kbd "C-.") 'kmacro-end-and-call-macro)

;; Search and replacement.

(define-key my-keys-minor-mode-map (kbd "C-s") 'isearch-forward-regexp)
(define-key my-keys-minor-mode-map (kbd "C-r") 'query-replace-regexp)

;; Files.

(define-key my-keys-minor-mode-map (kbd "C-f") 'save-buffer)
(define-key my-keys-minor-mode-map (kbd "C-o") 'find-file)
(define-key my-keys-minor-mode-map (kbd "M-r") 'revert-buffer)

;; Windows and buffers.

(define-key my-keys-minor-mode-map (kbd "C-t") 'switch-to-buffer)
(define-key my-keys-minor-mode-map (kbd "M-t") 'ibuffer)
(define-key my-keys-minor-mode-map (kbd "C-w") 'delete-window)
(define-key my-keys-minor-mode-map (kbd "M-w") 'kill-buffer)
(define-key my-keys-minor-mode-map (kbd "M-e") 'split-window-right)
(define-key my-keys-minor-mode-map (kbd "C-e") 'my/switch-to-next-window)

;; Display.

(define-key my-keys-minor-mode-map (kbd "C--") 'text-scale-decrease)
(define-key my-keys-minor-mode-map (kbd "C-=") 'text-scale-increase)

;; Magit.

(define-key my-keys-minor-mode-map (kbd "C-8") 'magit-status)

;; End of key definitions.

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)

(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

(provide 'keys)
