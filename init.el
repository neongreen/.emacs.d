(add-to-list 'load-path user-emacs-directory)

;; Initialise package system.
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Load “customize”d variables.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Load custom keybindings.
(require 'keys)

;; Enable kill-as-delete.
(require 'kill-as-delete)

;; Load haskell-mode.
(require 'haskell)

;; Get rid of annoying “yes or no” questions.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Specify which keys count as “nice” keys for ace-jump.
(setq ace-jump-mode-move-keys
  (string-to-list "fwarsiokldxcvnhm,./"))
