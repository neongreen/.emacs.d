;;; -*- lexical-binding: t -*-

(require 'thingatpt)
(require 'haskell-cabal)
(require 'haskell-mode)
(require 'yasnippet)
(require 'avy)
(require 'org)

(defun my/one-space ()
  "Just one space."
  (interactive)
  (just-one-space -1))

(defun my/indent-left ()
  "Shift code block one column to the left."
  (interactive)
  (indent-code-rigidly
   (region-beginning) (region-end)
   -1))

(defun my/indent-right ()
  "Shift code block one column to the right."
  (interactive)
  (indent-code-rigidly
   (region-beginning) (region-end)
   1))

(defun my/duplicate ()
  (interactive)
  (if mark-active
    (my/duplicate-region)
    (my/duplicate-line)))

(defun my/duplicate-line ()
  (let ((text (buffer-substring (point)
                                (beginning-of-thing 'line))))
    (forward-line)
    (push-mark)
    (insert text)
    (open-line 1)))

(defun my/duplicate-region ()
  (let* ((end (region-end))
         (text (buffer-substring (region-beginning)
                                 end)))
    (goto-char end)
    (insert text)
    (push-mark end)
    (setq deactivate-mark nil)
    (exchange-point-and-mark)))

(defun my/push-mark ()
  (interactive)
  (cua-set-mark)
  (cua-set-mark))

(defun my/pop-mark ()
  (interactive)
  (cua-set-mark 0))

(defun my/switch-to-next-window ()
  "Switch to the next window"
  (interactive)
  (other-window 1))

(defun my/move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first. If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(defun my/scroll-down-some ()
  "Move buffer several lines down (i.e. point goes up)."
  (interactive)
  (cua-scroll-down 18))

(defun my/scroll-up-some ()
  "Move buffer several lines up (i.e. point goes down)."
  (interactive)
  (cua-scroll-up 18))

(defun my/occur-region ()
  "Call occur on selected text; if no text is selected, use word at point."
  (interactive)
  (occur (regexp-quote
           (if (use-region-p)
             (buffer-substring (region-beginning) (region-end))
             (word-at-point)))))

(defun my/rename-current-buffer-file ()
  "Rename current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun my/switch-theme ()
  "Switch between light and dark themes."
  (interactive)
  (let ((is-light (find 'solarized-light custom-enabled-themes)))
    (dolist (theme custom-enabled-themes)
      (disable-theme theme))
    (load-theme (if is-light 'solarized-dark 'solarized-light))))

(defun my/switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun my/haskell-mode-ask-for-tag ()
  "Ask for a tag to jump to."
  (interactive)
  (let ((tags-file-dir (haskell-cabal--find-tags-dir))
        (tags-revert-without-query t))
    (when tags-file-dir
      (let ((tags-file-name (concat tags-file-dir "TAGS"))
            (current-prefix-arg '(0)))
        (call-interactively 'xref-find-definitions)))))

(defun my/goto-char-or-expand ()
  "Expand a snippet; if there's no expandable snippet, run avy."
  (interactive)
  (unless (yas-expand)
    (call-interactively 'avy-goto-char-in-line)))

(defun my/rgrep ()
  "rgrep without ivy"
  (interactive)
  (let ((completing-read-function 'completing-read-default)
        (completion-in-region-function 'completion--in-region))
    (call-interactively 'rgrep)))

(defun my/projectile-add-known-project-and-save ()
  "Add a project and update the list of known projects."
  (interactive)
  (call-interactively 'projectile-add-known-project)
  (projectile-save-known-projects))

(defun my/projectile-ag-regexp ()
  "Search in a project (with a regex)."
  (interactive)
  (let ((current-prefix-arg '(4)))
    (call-interactively 'projectile-ag)))

(defun my/kill-whole-line ()
  "Kill a line without putting it into the kill ring."
  (interactive)
  (delete-region (line-beginning-position) (1+ (line-end-position))))

(defun my/toggle-window-split ()
  "Switch between horizontal and vertical window split."
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
         (next-win-buffer (window-buffer (next-window)))
         (this-win-edges (window-edges (selected-window)))
         (next-win-edges (window-edges (next-window)))
         (this-win-2nd (not (and (<= (car this-win-edges)
                     (car next-win-edges))
                     (<= (cadr this-win-edges)
                     (cadr next-win-edges)))))
         (splitter
          (if (= (car this-win-edges)
             (car (window-edges (next-window))))
          'split-window-horizontally
        'split-window-vertically)))
    (delete-other-windows)
    (let ((first-win (selected-window)))
      (funcall splitter)
      (if this-win-2nd (other-window 1))
      (set-window-buffer (selected-window) this-win-buffer)
      (set-window-buffer (next-window) next-win-buffer)
      (select-window first-win)
      (if this-win-2nd (other-window 1))))))

(defun my/reload-dir-locals-for-current-buffer ()
  "reload dir locals for the current buffer"
  (interactive)
  (let ((enable-local-variables :all))
    (hack-dir-local-variables-non-file-buffer)))

(defun my/reload-dir-locals ()
  "For every buffer with the same `default-directory` as the
current buffer's, reload dir-locals."
  (interactive)
  (let ((dir default-directory))
    (dolist (buffer (buffer-list))
      (with-current-buffer buffer
        (when (equal default-directory dir))
        (my/reload-dir-locals-for-current-buffer)))))

(provide 'utils)
