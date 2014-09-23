(require 'haskell-mode)

(add-to-list 'exec-path "/home/yom/.cabal/bin/")

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(provide 'haskell)
