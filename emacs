;;;;emacs config file
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