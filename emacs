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
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)
                              ("melpa" . 2)
                              ("gnu" . 3)
 )
)

(declare-function el-get "el-get")
(declare-function el-get-bundle "el-get-bundle")

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.emacs.d/lisp")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(el-get-bundle 'frame-fns)
(el-get-bundle 'zoom-frm)

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
(use-package multiple-cursors)
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("6c62b1cd715d26eb5aa53843ed9a54fc2b0d7c5e0f5118d4efafa13d7715c56e" "38ba6a938d67a452aeb1dada9d7cdeca4d9f18114e9fc8ed2b972573138d4664" "0fb6369323495c40b31820ec59167ac4c40773c3b952c264dd8651a3b704f6b5" "196cc00960232cfc7e74f4e95a94a5977cb16fd28ba7282195338f68c84058ec" "51e228ffd6c4fff9b5168b31d5927c27734e82ec61f414970fc6bcce23bc140d" "c9e123d4ecd9ceb056806c6297336763e9e96eed6962bfc1d5252afcc2761610" default)))
 '(git-gutter:update-interval 2)
 '(org-agenda-files (quote ("~/notes/DOING.org")))
 '(package-selected-packages
   (quote
    (helm-swoop lsp-scala sbt-mode scala-mode company-lsp idris-mode yaml-mode smex evil-leader evil haskell-mode hydra haskell-emacs helm-etags-plus helm-tags helm-etags-select elm-mode zoom-frm which-key vlf suggest popup-imenu nyan-mode multiple-cursors monokai-theme markdown-mode key-chord imenu+ helm-projectile helm-ag git-timemachine git-gutter flycheck evil-tutor evil-surround evil-magit eno elmacro dockerfile-mode dired-imenu csv-mode auto-package-update ag ace-window)))
 '(safe-local-variable-values (quote ((python-shell-interpreter . "python3"))))
 '(zoom-window-mode-line-color "DarkGreen"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; remember all opened files
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
(global-set-key (kbd "C-c m c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-m") 'mc/mark-all-like-this)
(global-set-key (kbd "C-x C-m") 'magit-status)
(global-set-key (kbd "C-x R") 'magit-ediff-resolve)
(global-set-key (kbd "C-c /") 'toggle-comment-on-line)
(global-set-key (kbd "C-+") 'zoom-frm-in)
(global-set-key (kbd "C--") 'zoom-frm-out)
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

(provide 'emacs)
(and window-system (server-start))
;;; emacs ends here
