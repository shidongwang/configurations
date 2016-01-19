(add-to-list 'load-path "~/Downloads/slime_clone/slime")
(require 'slime-autoloads)
(setq inferior-lisp-program "/opt/local/bin/sbcl")
 ;(setq inferior-lisp-program "/opt/local/bin/clisp")

(add-to-list 'slime-contribs 'slime-fancy)

(global-set-key (kbd "C-c s") 'slime-selector)

;(push "~/.emac.d/evil" 'load-path)
;(add-to-list 'load-path "~/.emacs.d/evil")
;(require 'evil)
;(evil-mode 1)
