;;;;emacs config file
(custom-set-variables
;;custom-set-variables was added by Custom.
;;If you edit it by hand, you could mess it up, so be careful.
;;Your init file should contain only one such instance.
;;If there is more than one, they won't work right.
'(inhibit-startup-screen t)
'(initial-buffer-choice t)

'(initial-scratch-message nil))

'(custom-set-faces
;;custom-set-faces was added by Custom
;;If you edit it by hand, you could mess it up, so be careful.
;;Your init file should contain only one such instance.
;;If there is more than one, they won't work right.
)

;;;Add to emacs load path
;(add-to-list 'load-path "~/.emacs.d/")
;(add-to-list 'load-path "~/.emacs.d/plugins/")
;(add-to-list 'load-path "~/.emacs.d/plugins/autocomplete")

;;;put scrollbar on the right side
(setq scroll-bar-mode-explicit t)
(set-scroll-bar-mode 'right)

(setq-default indent-tabs-mode nil)		;always replace tabs with spaces
(setq-default tab-width 4)     			;set tab width to 4 for all buffers
(defvaralias 'c-basic-offset 'tab-width)	;alias different tab-size/indentation variables as tab width
(defvaralias 'cperl-indent-level 'tab-width)	;same as above

;;;Auto indent when yanking
(dolist (command '(yank yank-pop))
   (eval `(defadvice ,command (after indent-region activate)
            (and (not current-prefix-arg)
                 (member major-mode '(emacs-lisp-mode lisp-mode
                                                      clojure-mode    scheme-mode
                                                      haskell-mode    ruby-mode
                                                      rspec-mode      python-mode
                                                      c-mode          c++-mode
                                                      objc-mode       latex-mode
                                                      plain-tex-mode))
                 (let ((mark-even-if-inactive transient-mark-mode))
                   (indent-region (region-beginning) (region-end) nil))))))