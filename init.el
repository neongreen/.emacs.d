;; Add .emacs.d to the list of folders to load Lisp files from. “t” means
;; that .emacs.d would be added to the end, which is done so that there won't
;; be conflicts between my files and files of various libraries.
(add-to-list 'load-path user-emacs-directory t)

;; Initialise package system.
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Get path from shell.
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Prevent the Magit upgrade warning from showing every time.
(setq magit-last-seen-setup-instructions "1.4.0")

;; Persist minibuffer history.
(savehist-mode 1)

;; Load haskell-mode.
(require 'haskell)

(require 'projectile)

;; Autocompletion
(require 'company-tabnine)
(add-to-list 'company-backends #'company-tabnine)
(company-tng-configure-default)
(setq company-frontends
      '(company-tng-frontend
        company-pseudo-tooltip-frontend
        company-echo-metadata-frontend))

;; When inside a project, even if there is a cabal file in the current
;; folder, use the project folder to generate tags. This is useful for
;; projects with several services or subprojects.
(defadvice haskell-cabal--find-tags-dir (around project-tags act)
  (setq ad-return-value
    (if (projectile-project-root)
      (projectile-project-root)
      ad-do-it)))

;; Rust
(require 'rust-mode)

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

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

;; Smaller fringes
(fringe-mode '(4 . 4))

;; Open .ihdf files (Intermediate Haskell) as Markdown
(add-to-list 'auto-mode-alist '("\\.ihdf\\'" . markdown-mode))

(add-hook 'markdown-mode-hook (lambda () (company-mode -1)))

;; Open .js files with web-mode
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))

;; Open .mustache files with web-mode
(add-to-list 'auto-mode-alist '("\\.mustache$" . web-mode))

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
(put 'downcase-region 'disabled nil)

;; Let magit work with Github pull-requests

(require 'magit-gh-pulls)
(add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)

;; Whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Better diff colors for solarized-theme
;;
;; https://github.com/bbatsov/solarized-emacs/issues/194#issuecomment-395270416

(dolist (face-map '((smerge-base                 . magit-diff-base)
                    (smerge-lower                . magit-diff-added)
                    (smerge-markers              . magit-diff-conflict-heading)
                    (smerge-refined-added        . magit-diff-added-highlight)
                    (smerge-refined-removed      . magit-diff-removed-highlight)
                    (smerge-upper                . magit-diff-removed)))
  (let* ((face (car face-map))
         (alias (cdr face-map)))
    (put face 'theme-face nil)
    (put face 'face-alias alias)))

;; https://github.com/company-mode/company-mode/issues/745
(require 'company-posframe)
(company-posframe-mode 1)

;; Remove line continuation marks
(setf (cdr (assq 'continuation fringe-indicator-alist))
      '(nil vertical-bar)
      )
