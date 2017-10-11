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

;; Record keybinding usage statistics.
(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

;; Load haskell-mode.
(require 'haskell)

(require 'projectile)

(defadvice haskell-cabal--find-tags-dir (around csl-tags act)
  (setq ad-return-value
    (if (equal (projectile-get-project-directories) '("/home/yom/code/csl/"))
      "/home/yom/code/csl/"
      ad-do-it)))

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
(put 'upcase-region 'disabled nil)

;; Open .ihdf files (Intermediate Haskell) as Markdown
(setq auto-mode-alist (append '(("\\.ihdf$" . markdown-mode))
      auto-mode-alist))

;; In org-mode, recalculate & realign all tables on save, etc

(require 'org)

(add-hook 'org-mode-hook
  (lambda ()
    (add-hook 'before-save-hook 'my/org-update nil 'local)))

(defun my/org-update ()
  (interactive)
  (org-map-entries (lambda ()
    (call-interactively 'org-update-statistics-cookies)))
  (org-map-dblocks (lambda ()
    (org-update-dblock)
    (redisplay)
    (re-search-forward org-table-any-line-regexp nil t)
    (beginning-of-line 1)
    (when (looking-at org-table-line-regexp)
      (save-excursion (org-table-align))))))
