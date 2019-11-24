;;; emacs --- Main emacs config

;;; Commentary:

;;; Code:
(defvar show-paren-delay)
(defvar use-package-always-ensure)
(defvar desktop-restore-eager)
(defvar tags-revert-without-query)
(defvar desktop-load-locked-desktop)

(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil
 select-enable-clipboard t
 desktop-restore-eager 5
 tags-revert-without-query t
 desktop-load-locked-desktop t
)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
   (when (file-exists-p custom-file)
       (load custom-file))

(ido-mode 1)
;; character level diffs
(setq-default ediff-forward-word-function 'forward-char)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; modes
(electric-indent-mode 0)

;; global keybindings
(global-unset-key (kbd "C-z"))

;; the package manager
(require 'package)
(setq
 package-archives '(("elpa"         . "http://elpa.gnu.org/packages/")
                    ("org"          . "http://orgmode.org/elpa/")
                    ("melpa"        . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)
                              ("melpa"        . 2)
                              ("elpa"         . 3)
                              ("org"          . 4)
 )
)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(setq debug-on-error t)

(load "~/.emacs.d/config/init-utils.el")

(use-package smex)
(use-package magit)
(use-package git-gutter)
(use-package ace-window)
(use-package avy)
(use-package csv-mode)
(use-package elmacro)
(use-package key-chord)
(use-package smartparens)
(use-package which-key)
(use-package undo-tree)
(use-package bind-key)
(use-package projectile)
(use-package ag)
(use-package helm)
(use-package helm-ag)
(use-package helm-projectile)
(use-package helm-etags-plus)
(use-package helm-swoop)
(use-package nyan-mode)
(use-package yasnippet
  :pin melpa
)
(use-package monokai-theme)
(use-package eno)
(use-package vlf)
(use-package markdown-mode)
(use-package git-timemachine)
(use-package suggest)
(use-package dockerfile-mode)
(use-package zoom-window)
(use-package hydra)
(use-package yaml-mode)
(use-package idris-mode)
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(load-theme 'monokai t)

(when (not package-archive-contents)
  (package-refresh-contents))

;; remember all open files
(desktop-save-mode 1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; enable mandatory modes
(global-git-gutter-mode +1)

(show-paren-mode 1)
(column-number-mode 1)

;; disable gui-related nonsens
(tool-bar-mode 0)
(menu-bar-mode 0)

;; prompt only y or no
(fset `yes-or-no-p `y-or-n-p)

(elmacro-mode 1)

;; This is bound to f11 in Emacs 24.4
(toggle-frame-fullscreen)
;; Who uses the bar to scroll?
(scroll-bar-mode 0)

;;(auto-package-update-maybe)

(which-key-mode)
(global-undo-tree-mode 1)

(require 'vlf-setup)
(setq line-move-visual nil)

;; custom kbd mappings
(global-set-key (kbd "C-x C-m") 'magit-status)
(global-set-key (kbd "C-x R") 'magit-ediff-resolve)
(global-set-key (kbd "C-c /") 'toggle-comment-on-line)
(global-set-key (kbd "C-c f g") 'find-grep)
(global-set-key (kbd "C-c j") 'avy-goto-subword-1)
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "C-c C-s m") 'ace-maximize-window)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-c C-f") 'helm-projectile-find-file-dwim)
(global-set-key (kbd "C-.") 'goto-last-change)
(global-set-key (kbd "C-c [") 'previous-buffer)
(global-set-key (kbd "C-c ]") 'next-buffer)
(global-set-key (kbd "S-C-l") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-h") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-j") 'shrink-window)
(global-set-key (kbd "S-C-k") 'enlarge-window)
(global-set-key (kbd "C-c u") 'undo-tree-visualize)
(global-set-key (kbd "C-c d") 'desktop-change-dir)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "sw" 'ace-swap-window)
(key-chord-define-global "df" 'helm-do-ag-project-root)
(key-chord-define-global "e[" 'replace-regexp)
(key-chord-define-global "e]" 'projectile-replace-regexp)
(key-chord-define-global "r[" 'replace)
(key-chord-define-global "r]" 'projectile-replace)
(key-chord-define-global "lm" 'linum-mode)

(require 'eno)
(key-chord-define-global "jk" 'eno-word-goto)
(global-set-key (kbd "C-x SPC") 'toggle-window-split)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'nyan-mode)
(nyan-mode 1)

(require 'yasnippet)
(yas-global-mode 1)

(require 'imenu)

(require 'helm-etags-plus)
(global-set-key (kbd "C-c l") 'helm-etags-plus-select)
(global-set-key (kbd "C-c h") 'helm-etags-plus-history-go-back)

(require 'zoom-window)
(global-set-key (kbd "C-x C-z") 'zoom-window-zoom)

(load "~/.emacs.d/config/init-evil.el")
(load "~/.emacs.d/config/init-haskell.el")
(load "~/.emacs.d/config/init-org.el")
(load "~/.emacs.d/config/init-scala.el")

(use-package nix-mode
  :mode "\\.nix\\'")

(provide 'emacs)
(and window-system (server-start))
;;; emacs ends here
