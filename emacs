;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package) ;; You might already have this line
;;
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize) ;; You might already have this line

;(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/local/bin/sbcl --dynamic-space-size 10000")
;(setq slime-contribs '(slime-fancy))

;(autoload 'enable-paredit-mode "~/.emacs.d/paredit.el" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(add-hook 'sly-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))

;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)
(setq slime-net-coding-system 'emacs-mule-unix)
(global-set-key "\C-cs" 'slime-selector)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(sly-quicklisp auctex helm-gtags helm-google helm paredit dired-k magit sml-mode rainbow-delimiters auto-complete ## auto-overlays)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;(ac-config-default)

;(require 'sql)
;(setq sql-postgres-program "/usr/local/bin/psql")

;;(load "/Users/swang/Downloads/github/HOL/tools/hol-mode.el")

;;(require 'sr-speedbar)

(add-to-list 'default-frame-alist '(font . "Literation Mono Powerline 14"))
(set-face-attribute 'default t :font "Literation Mono Powerline 14")

(setq display-line-numbers-type 'relative)

 	
(setq TeX-auto-save t)
(setq TeX-parse-self t)

(global-auto-complete-mode t)
(add-to-list 'ac-modes '(c++-mode))
