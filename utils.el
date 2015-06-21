(require 'thingatpt)

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

(provide 'utils)
