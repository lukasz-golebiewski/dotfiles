(use-package ensime
  :ensure t
  :pin melpa)

(use-package sbt-mode
  :pin melpa)

(use-package scala-mode
  :pin melpa)

(require 'hydra)
(global-set-key (kbd "C-c s") 'sbt-hydra)
