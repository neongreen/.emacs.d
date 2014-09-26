(require 'haskell-mode)

(add-to-list 'exec-path "/home/yom/.cabal/bin/")

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(provide 'haskell)
