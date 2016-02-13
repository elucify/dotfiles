
;; GLOBAL SETKEYs
;; Use control-h for backspace (on ibm3151, "CONTROL-8" is a
;; little annoying.)  This means redefining HELP key from ^H to ^X^H.
(define-key global-map "\C-x?"	'help-command)

(setq-default indent-tabs-mode nil)	; use spaces for tabs always.

(global-set-key "\C-c'"		'register-to-point)
(global-set-key "\C-c<"		'tab-region-left)
(global-set-key "\C-c>"		'tab-region-right)
(global-set-key "\C-c\<"	'rindent-rigidly)
(global-set-key "\C-c\>"	'indent-rigidly)
(global-set-key "\C-c!"		'revert-buffer)
(global-set-key "\C-c?"		'what-line)
(global-set-key "\C-c|"		'split-window-horizontally)
(global-set-key "\C-c-"		'split-window-vertically)
(global-set-key "\C-cf"		'font-lock-fontify-buffer)
(global-set-key "\C-c\C-b" 	're-search-backward)
(global-set-key "\C-c\C-c" 	'toggle-case-variables)
(global-set-key "\C-c\C-f"	're-search-forward)
(global-set-key "\C-c\C-r"	're-replace-regexp)
(global-set-key "\C-c\C-s"	'isearch-forward-regexp)
(global-set-key "\C-ce"		'eval-region)
(global-set-key "\C-h"		'backward-delete-char)
(global-set-key "\C-r"		'isearch-backward-regexp)
(global-set-key "\C-s"		'isearch-forward-regexp)
;; (global-set-key "\C-x!"		'shell-command)
(global-set-key "\C-x'"		'point-to-register)
(global-set-key "\C-x,"		'goto-line)
(global-set-key "\C-x\C-b"	'buffer-menu)
(global-set-key "\C-x\C-g"	'goto-line)
(global-set-key "\C-x\C-h"	'help-command)
(global-set-key "\C-xw"		'copy-region-as-kill)
(global-set-key "\M- "		'set-mark-command)
(global-set-key "\M-\C-r"	'isearch-backward)
(global-set-key "\M-\C-s"	'isearch-forward)
(global-set-key [?\C-x left]	'scroll-left)
(global-set-key [?\C-x right]	'scroll-right)
(global-set-key [?\C-x up]	'scroll-both)
(global-set-key "\C-x\C-c"	'Query-kill)
(global-set-key "\C-x\""	'html-insert-quot)
(global-set-key "\C-x\<"	'html-insert-lt)
(global-set-key "\C-x\>"	'html-insert-gt)

;; Linux console keys
(global-set-key "\M-Ow"		'beginning-of-buffer)
(global-set-key "\M-Oq"		'end-of-buffer)
(global-set-key "\M-Oy"		'scroll-up)
(global-set-key "\M-Os"		'scroll-down)
(global-set-key "\M-On"		'delete-char)
(global-set-key "\M-Op"		'overwrite-mode)
(global-set-key "\M-Ox"		'previous-line)
(global-set-key "\M-Or"		'next-line)
(global-set-key "\M-Ot"		'backward-char)
(global-set-key "\M-Ov"		'forward-char)
(global-set-key "\M-O/"		're-search-forward)
(global-set-key "\M-O?"		're-search-backward)
(global-set-key "\M-OP"		're-replace-regexp)
(global-set-key [M-right]	'indent-a-line)

;; X Colors
(defun set-x-colors () "Configure colors for X font lock mode" (set-face-background 'modeline "SlateBlue") (set-face-foreground 'modeline "green") (set-face-foreground 'bold-italic "red") (set-face-foreground 'italic "blue") (set-face-background 'italic "white") (set-face-background 'region "yellow") (set-face-foreground 'underline "firebrick")
)

;; Set X colors if DISPLAY is set.
(cond ((getenv "DISPLAY")(set-x-colors)))

;; Display time.
;;(setq display-time-day-and-date t)
;;(display-time)

;; GLOBAL SETQs
(add-hook 'lisp-interaction-mode-hook 'init-case-variables)
(add-hook 'lisp-mode-hook 'init-case-variables)
(add-hook 'shell-mode-hook 'python-mode-hook-fn)

(setq search-delete-char 8)
(line-number-mode t)

;; Undisable advanced options
(put 'eval-expression 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

;; python OK this sucks
;(load-file "~/.emacs.d/emacs-for-python/epy-init.el")
;(add-to-list 'load-path "~/.emacs.d/emacs-for-python/") ;; tell where to load the various files
;(require 'epy-setup)      ;; It will setup other loads, it is required!
;(require 'epy-python)     ;; If you want the python facilities [optional]
;(require 'epy-completion) ;; If you want the autocompletion settings [optional]
;(require 'epy-editing)    ;; For configurations related to editing [optional]
;(require 'epy-bindings)   ;; For my suggested keybindings [optional]
;; End python

;; python something simpler...
(add-to-list 'load-path "~/.emacs.d")
(require 'python)

(add-hook 'python-mode-hook
          (lambda () (setq forward-sexp-function nil)))



; Change shitty default indentation for CSS mode
(setq cssm-indent-function #'cssm-c-style-indenter)

;; I should probably learn to use autoload

(setq auto-mode-alist (cons '("\.pl$" . perl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.pc$" . c-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ec$" . c-mode) auto-mode-alist)) 
(setq auto-mode-alist (cons '("\\.tar$" . tar-mode) auto-mode-alist)) 
(setq auto-mode-alist (cons '("\\.tcl$" . tcl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.js$" . js2-mode) auto-mode-alist))
(autoload 'tar-mode "tar-mode")
(autoload 'tcl-mode "tcl-mode")
(autoload 'css-mode "css-mode")
(setq auto-mode-alist       
     (cons '("\\.css\\'" . css-mode) auto-mode-alist))

(autoload 'javascript-mode "javascript-mode" "JavaScript mode" t)
(setq auto-mode-alist (append '(("\\.js$" . javascript-mode))
	   auto-mode-alist))

;; XSL mode
(autoload 'xsl-mode "xslide" "Major mode for XSL stylesheets." t)

;; Turn on font lock when in XSL mode
(add-hook 'xsl-mode-hook
	  'turn-on-font-lock)

(setq auto-mode-alist
      (append
       (list
	'("\\.fo" . xsl-mode)
	'("\\.xsl" . xsl-mode)
	'("\\.xslt" . xsl-mode))
       auto-mode-alist))

;; Uncomment if using abbreviations
;; (abbrev-mode t)
;;;;;;;;;;; End XSL-mode ("xslide")

;; Add nxml mode
(setq load-path (cons "~/Library/Emacs/nxml-mode" load-path))
(autoload 'nxml-mode "nxml-mode")
(setq auto-mode-alist
     (cons '("\\.\\(xml\\|rng\\|xhtml\\)\\'" . nxml-mode)
     auto-mode-alist))

(add-hook 'nxml-mode-hook 'nxml-mode-hook-fn)

(defun nxml-mode-hook-fn () "Hook for nxml mode"
  (local-set-key "\C-cf"
                 'nxml-fontify-buffer)
  (auto-fill-mode)
)
;;;

;; Add python mode
(setq load-path (cons "~/Library/Emacs" load-path))
(autoload 'python-mode "python-mode")
(setq auto-mode-alist
     (cons '("\\.\\(py\\)\\'" . python-mode)
     auto-mode-alist))

(add-hook 'python-mode-hook 'python-mode-hook-fn)

(defun python-mode-hook-fn () "Hook for python mode"
  (font-lock-mode)
  (local-set-key "\C-cf"
                 'font-lock-fontify-buffer)
  (local-set-key "\C-c\C-r"
                 're-replace-regexp)
  (local-set-key [mouse-4]
                 'previous-line)
  (local-set-key [mouse-5]
                 'next-line)
)
;;;


;;; Add tidy mode
;; HTML Tidy Mode

;; http://discus.anu.edu.au/~kahlil/emacs/tidy.el
(setq load-path (cons "~/Library/Emacs" load-path))
(autoload 'tidy-buffer "tidy" "Run Tidy HTML parser on current buffer" t)
(autoload 'tidy-parse-config-file "tidy" "Parse the `tidy-config-file'" t)
(autoload 'tidy-save-settings "tidy" "Save settings to `tidy-config-file'" t)
(autoload 'tidy-build-menu  "tidy" "Install an options menu for HTML Tidy." t)
(add-hook 'html-helper-mode-hook #'(lambda ()
				     (tidy-build-menu html-helper-mode-map)))
(add-hook 'html-mode-hook #'(lambda ()
			      (local-set-key [(control c) (control c)] 'tidy-buffer)))


;;
;; Indents everything from a to b by x columns
;;
(defun rindent-rigidly (a b &optional x) 
     (interactive "rp")
     (message (format "x = %d") x)
     (indent-rigidly a b x)
)



;; Run RCSDIFF on the buffer.
;;(defun rcsdiff-buffer () "Run rcsdiff on the file in the current buffer."
;;(interactive)
;;(let ((bname (buffer-file-name)))
;;      (cond ((null bname)(message "Buffer is not associated with a file"))
;;	   (t (shell-command (concat "rcsdiff " bname))))))

;; Report what's out
;;(defun whatsout () "Report what files are checked out of RCS"
;;(interactive)
;;(shell-command "rlog -L -R RCS/*"))


;; Query before killing (catches accidental \C-xc)
(defun Query-kill () "Query, kill if true."
(interactive)
(cond ((y-or-n-p "Are you sure you want to exit emacs?")
       (save-buffers-kill-emacs))))

;; Set font-lock-mode only if DISPLAY is set in env
(defun x-font-lock-mode () 
  "Set font-lock-mode only if DISPLAY is set in environment"
  (cond ((getenv "DISPLAY") (font-lock-mode 1)))
)

;; sql interface -- cool!
;;(defun sql-region ()
;;  "Run sqlplus on region. Replace region with results."
;;  (interactive)
;;  (shell-command-on-region 
;;   (region-beginning) (region-end) "~mj/bin/runsql" t t)
;;)

;; bc in window
;; (defun calc () "Runs \"bc\" in an emacs buffer."
;; (interactive)
;; (switch-to-buffer (make-shell "Calculator" "/usr/bin/bc")) ;; )


;; Shift region left and right
(defun tab-region-right () "Shift region tab-width columns right"
  (interactive)
  (indent-code-rigidly (region-beginning) (region-end) tab-width)
)

(defun tab-region-left () "Shift region tab-width columns right"
  (interactive)
  (indent-code-rigidly (region-beginning) (region-end) (* -1 tab-width))
)

;; Show X font whose name is at start of line
(fset 'show-font
   [4194336 5 2 6 24 119 escape 120 115 104 101 108 108
   45 99 111 109 109 97 110 100 return 120 102 100 32 45
   102 110 32 39 25 39 return]
)

;; Shut off case globbing
(defun init-case-variables () "Internal init function"
  (setq case-replace t)
  (setq case-fold-search t)
)

;; I get tired of typing this all the time
(defun hor () "Shortcut for split-window-horizontally"
  (interactive)
  (split-window-horizontally))

;; Scroll both windows
(defun scroll-both (&optional n) "Scroll both windows the same amount. Optional argument tells how many lines to scroll."
  (interactive)
  (scroll-up n)
  (scroll-other-window n)
)

;; Replace regexp delimited by current region.
(defun re-replace-regexp (regexp to-string &optional delimited)
  "Replace-regexp, with replacements limited to current region."
  (interactive "sRegion replace regexp: \nsReplace regexp %s with: \nP")
  (narrow-to-region (region-beginning) (region-end))
  (goto-char (region-beginning))
  (perform-replace regexp to-string nil t delimited)
  (widen)
  (message "Done")
)

;; Working version; uses `save-restriction' and `widen'
(defun count-words-region (beginning end)  
  "Print number of words in the region."     (interactive "r")
    ;;; 1. Set up appropriate conditions.     (save-restriction
  (widen)   (message "Counting words in region ... ")
  (save-excursion    (goto-char beginning)
         (let ((count 0))    ;;; 2. Run the while loop.    
          (while (< (point) end)       (re-search-forward "\\w+\\W+")
            (setq count (1+ count)))    ;;; 3. Send a message to the user.
          (cond ((zerop count)
            (message "The region does NOT have any words."))
           ((= 1 count) (message "The region has 1 word."))
           (t (message "The region has %d words." count))))))

;; toggle the "case-replace" variable.
(defun toggle-case-replace (&optional shutup)
"Toggle the case-replace variable. Optional parameter, if non-nil, causes quiet operation."
  (interactive)
  (setq case-replace (not case-replace))
  (cond ((not shutup) (message "Replacement %s translate case"
     (cond (case-replace "will")(t "will not"))))))

;; toggle the "case-fold-search" variable
(defun toggle-case-fold-search (&optional shutup)
"Toggle the case-fold-search variable. Optional parameter, if non-nil, causes quiet operation."
  (interactive)
  (setq case-fold-search (not case-fold-search))
  (cond ((not shutup) (message "Searches %s be case-sensitive"
     (cond (case-fold-search "will not")(t "will")))))
)

;; toggle both case-fold-search and case-replace
(defun toggle-case-variables ()
   "Toggle both case-fold-search and case-replace."
   (interactive)
   (toggle-case-fold-search t)
   (toggle-case-replace t)
   (message "Searches %s be case-sensitive, replaces %s translate case"
     (cond (case-fold-search "will not")(t "will"))
     (cond (case-replace "will")(t "will not")))
)

;; I like autoindent, but not all those damn auto newlines.
(defun electric-c-newline ()
  "Insert newline and do autoindent."
  (interactive)
  (newline)
;;  (if c-auto-newline
;;      (c-indent-line))
)

(defun pdb () "Run previous perldb command"
  (interactive)
  (repeat-matching-complex-command "perldb")
)

;; Hook for emacs lisp
(add-hook 'emacs-lisp-mode-hook 'emacs-lisp-mode-hook-fn)
(defun emacs-lisp-mode-hook-fn () "Hook for emacs lisp"
  (init-case-variables)
  (x-font-lock-mode)
)

;; Hooks for SGML mode
(fset 'sgml-insert-quot "&quot;")
(fset 'sgml-insert-lt "&lt;")
(fset 'sgml-insert-gt "&gt;")
(fset 'sgml-insert-amp "&amp;")

(add-hook 'sgml-mode-hook 'sgml-mode-hook-fn)
(defun sgml-mode-hook-fn () "Hook for SGML mode"
;;   (local-set-key "\"" 'sgml-insert-quot)
;;   (local-set-key "<" 'sgml-insert-lt)
;;   (local-set-key ">" 'sgml-insert-gt)
;;   (local-set-key "&" 'sgml-insert-amp)
)

;; Hooks for c-mode
(add-hook 'c-mode-hook 'c-mode-hook-fn)
(add-hook 'c++-mode-hook 'c-mode-hook-fn)

(setq c-default-style "bsd")
(setq c-indentation-style "bsd")

(defun c-mode-hook-fn () "Runs when C mode invoked."
  (interactive)
  (message "C mode")
  (x-font-lock-mode)
  (font-lock-mode t)
  (init-case-variables)
  (setq indent-tabs-mode nil)	; use spaces for tabs
  (setq c-tab-always-indent t)	; Always indent tabs
  ;;  (setq c-auto-newline nil)

;;  (setq c-indent-level 2)
;;  (setq c-continued-statement-offset 2)
;;  (setq c-continued-brace-offset -2)
;;  (setq c-brace-offset 0)
;;  (setq c-brace-imaginary-offset 0)
;;  (setq c-label-offset -3)
  (c-set-style "gnu")
  (setq c-basic-offset 4)

  (setq c-macro-preprocessor "/lib/cpp -I. -I../../include -C")
  (local-set-key "\C-cc" 'compile)
  (local-set-key "\C-c\C-i" 'indent-c-region)
)

;; Font-size
(set-face-attribute 'default nil :height 120)

;; Hooks for font-lock-mode
;; (add-hook 'font-lock-mode-hook 'font-lock-mode-hook-fn)

;; (defun font-lock-mode-hook-fn ()
;;   "Run when font-lock-mode invoked"
;;   (defvar font-lock-type-face 'bold "Type face for fonts")
;;   (setq font-lock-keywords (append font-lock-keywords '(
;;    ( "\\<\\(Ll[12]e?\\|St\\|Ht[le]*\\|[ui][0-9]*_t\\|ptr_t\\|\\)\\>[ \t\n]+\\*?\\([a-zA-Z0-9_]+\\)"
;;       2 'bold-italic)
;;    ( "\\<\\(Ll[12]e?\\|St\\|Ht[le]*\\|[ui][0-9]*_t\\|ptr_t\\)\\>[ \t\n]"
;;       1 font-lock-type-face)
;; ))))

(defun indent-c-region ()
  "Indent current region as C code"
  (interactive)
  (c-indent-region (region-beginning) (region-end))
)

;; Hooks for dired
(add-hook 'dired-mode-hook 'dired-mode-hook-fn)

(defun dired-mode-hook-fn () "Runs when dired mode is invoked."
  (local-set-key "\C-M" 'dired-find-file)
  (local-set-key "\033A" 'previous-line)
  (local-set-key "\033B" 'next-line)
  (local-set-key "j" 'next-line)
  (local-set-key "k" 'previous-line)
  (init-case-variables)
)

;; Hook for buffer menu
(add-hook 'buffer-menu-mode-hook 'buffer-menu-mode-hook-fn)

(defun buffer-menu-mode-hook-fn ()
  "Runs when buffer menu mode is invoked."
  (local-set-key "\C-m" 'Buffer-menu-1-window)
  (local-set-key "F" 'find-file)
  (local-set-key "0" 'delete-window)
  (local-set-key "\033A" 'previous-line)
  (local-set-key "\033B" 'next-line)
  (local-set-key "j" 'next-line)
  (local-set-key "k" 'previous-line)
  (init-case-variables)
)

;; Hooks for info mode
(add-hook 'info-mode-hook 'info-mode-hook-fn)

(defun info-mode-hook-fn ()
  "Runs when info mode is invoked."
  (message "Info mode")
  (local-set-key "\C-M" 'Info-menu)
  (local-set-key "\033A" 'previous-line)
  (local-set-key "\033B" 'next-line)
  (local-set-key "j" 'next-line)
  (local-set-key "k" 'previous-line)
  (local-set-key [down-mouse-1] 'Info-follow-nearest-node)
  (init-case-variables)
  (x-font-lock-mode)
)

;; Hooks for tcl mode
(add-hook 'tcl-mode-hook 'tcl-mode-hook-fn)

(defun tcl-mode-hook-fn ()
  "Runs when tcl mode is invoked. Supposedly."
  (message "TCL MODE!")

  (x-font-lock-mode)
  (setq font-lock-keywords '(
   ("^proc +\\([^ \t\n{]+\\)" 1 'bold-italic)
   ("^[ \t]*\\(#.*\\)" 1 'font-lock-comment-face)))
  (font-lock-fontify-buffer)
  (init-case-variables)
)

;; Resize minibuffer when needed
;;(load "rsz-mini.el")

;; Shift+cursor motion sets region
;;(load "s-region.el")

;; Drag menu bar
;;(load "mldrag.el")
;;(global-set-key [mode-line down-mouse-1] 'mldrag-drag-mode-line) ;;(global-set-key [vertical-line down-mouse-1] 'mldrag-drag-vertical-line) ;;(global-set-key [vertical-scroll-bar S-down-mouse-1]
;;                  'mldrag-drag-vertical-line)

;; Set up perl mode
(add-hook 'perl-mode-hook 'perl-mode-hook-fn)

;; Load perl mode and make it automatic for .pl files.
;; Also, set perl-mode-hook
;;(load "perl-mode.elc")
;;(load "perldb.elc")

(defun perl-mode-hook-fn () "Runs when perl mode is invoked."
  (setq perl-continued-statement-offset 2)
  (setq perl-continued-brace-offset -2)
  (setq perl-indent-level 4)
  (setq perl-tab-always-indent t)
  (setq perl-tab-to-comment nil)
  (x-font-lock-mode)
  (init-case-variables)
)

(defun cdbook () "Change directory to C++ Tookit book directory"
  (interactive)
  (cd "~/Projects/ws/internal/books/prod/data/toolkit/xml")
  (find-file ".")
  (font-lock-fontify-buffer)
)

(global-set-key [S-delete]	'backward-delete-char-untabify)
(global-set-key [C-delete]	'backward-delete-char-untabify)

;;
;; Macros and their bindings
;;

(fset 'jw-codify
   [?< ?c ?o ?d ?e ?> ?\C-x ?\C-x ?< ?/ ?c ?o ?d ?e ?>]) (global-set-key "\C-cC" 'jw-codify)

(fset 'jw-tagify
   [?< ?c ?o ?d ?e ?> ?& ?l ?t ?; ?\C-x ?\C-x ?& ?g ?t ?; ?< ?/ ?c ?o ?d ?e ?. backspace ?>]) (global-set-key "\C-ct" 'jw-tagify)

(fset 'jw-linkify
   [?< ?a ?  ?h ?r ?e ?f ?= ?" ?\C-x ?\C-x ?\M-w ?" ?> return ?\C-y ?< ?/ ?a ?>]) (global-set-key "\C-cl" 'jw-linkify)

;; (fset 'html-insert-quot "&quot;")
;; (fset 'html-insert-lt "&lt;")
;; (fset 'html-insert-gt "&gt;")

(fset 'indent-a-line
   [tab ?\C-a ?\C-n])

;; This is to update CSS files in My NCBI
(fset 'update-css-files
   [?\C-a ?\C-s ?@ ?i ?m ?p ?o ?r ?t ?\C-m ?\C-a ?\C-n ?\C-  ?\C-s ?E ?N ?D ?@ ?i ?m ?p ?o ?r ?t ?\C-m ?\C-a ?\C-w ?\C-p ?\C-s ?\" ?\C-m ?\C-  ?\C-s ?\" ?\C-m ?\C-b ?\C-x ?w ?\C-a ?\C-n escape ?x ?i ?n ?s tab ?f tab return ?\C-y return ?\C-a ?\C-x ?\C-s])

(global-set-key "\C-c#" 'update-css-files)

(fset 'follow-css-link
   [?\C-a ?\C-s ?\" ?\C-m ?\C-  ?\C-s ?\" ?\C-m ?\C-b ?\C-x ?w ?\C-a ?\C-x ?\C-f ?\C-y return])

(global-set-key "\C-c@" 'follow-css-link)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(display-time)

(message "GNU Emacs ready...")
