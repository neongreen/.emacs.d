(require 'noflet)

(defcustom my/kill-as-delete nil
  "If non-nil, all killing commands won't place anything in the kill ring."
  :type 'boolean
  :group 'killing)

(defcustom my/killing-commands
  '(kill-word backward-kill-word kill-line)
  "Specify which commands count as killing commands."
  :type '(repeat function)
  :group 'killing)

(dolist (cmd my/killing-commands)
  (eval
  `(defadvice ,cmd (around kill-ad activate)
     (noflet ((kill-region (beg end) 
                (if my/kill-as-delete 
                  (delete-region beg end)
                  (kill-region   beg end))))
       ad-do-it))))

(provide 'kill-as-delete)
