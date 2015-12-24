;; Add .emacs.d to the list of folders to load Lisp files from. “t” means
;; that .emacs.d would be added to the end, which is done so that there won't
;; be conflicts between my files and files of various libraries.
(add-to-list 'load-path user-emacs-directory t)

;; Initialise package system.
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Prevent the Magit upgrade warning from showing every time.
(setq magit-last-seen-setup-instructions "1.4.0")

;; Load haskell-mode.
(require 'haskell)

;; Load custom keybindings.
(require 'keys)

;; Enable kill-as-delete.
(require 'kill-as-delete)

;; Load Yasnippet.
(require 'yasnippet)
(yas-global-mode 1)

;; Get rid of annoying “yes or no” questions.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Specify which keys count as “nice” keys for ace-jump.
(setq ace-jump-mode-move-keys
  (string-to-list "eklioswadfxcrvn,hm./"))

;; Prompt for directory creation automatically when saving a file.
;; (When creating a file in an unexistent directory.)
(add-hook 'before-save-hook
  (lambda ()
    (when buffer-file-name
      (let ((dir (file-name-directory buffer-file-name)))
        (when (and (not (file-exists-p dir))
                   (y-or-n-p (format "Create directory %s does not exist. Create it?" dir)))
          (make-directory dir t))))))

;; Load “customize”d variables.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
