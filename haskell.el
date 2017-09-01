;; This enables Haskell-mode. Useful tips:
;;
;;   * [C-c C-b] shows the REPL buffer.
;;
;;   * To enable tag generation, you have to install hasktags from Hackage.
;;     After that you will be able to instantly jump to function definitions
;;     with [M-.].
;;
;;   * [C-c C-t] shows type of function at point.
;;
;;   * [M-x imenu] provides an index of functions defined in module.

(require 'haskell-mode)
(require 'projectile)

(add-to-list 'exec-path "/home/yom/.cabal/bin/")

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(defadvice haskell-cabal--find-tags-dir (around csl-tags act)
  (setq ad-return-value
    (if (equal (projectile-get-project-directories) '("/home/yom/code/csl/"))
      "/home/yom/code/csl/"
      ad-do-it)))

(provide 'haskell)
