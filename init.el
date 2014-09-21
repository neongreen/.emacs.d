(add-to-list 'load-path user-emacs-directory)

;; Load “customize”d variables.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
