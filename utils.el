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

(provide 'utils)
