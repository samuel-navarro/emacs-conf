;; ---------------------------------------------------------------------------
;; Linum (line numbers) M-x linum-mode to enable
;; ---------------------------------------------------------------------------
(load-file "~/.emacs.d/linum/linum.el")
(require 'linum)
(setq linum-format "%d ")
(add-hook 'find-file-hook (lambda () (linum-mode 1)))



;; ---------------------------------------------------------------------------
;; Smooth scrolling
;; ---------------------------------------------------------------------------
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time



;; ---------------------------------------------------------------------------
;; Highlighting
;; ---------------------------------------------------------------------------
;; highlight region between point and mark
(transient-mark-mode t)
;; highlight during query
(setq query-replace-highlight t)
;; highlight incremental search
(setq search-highlight t)
;; Show matching parenthesis. How can you live without it.
(show-paren-mode t)

;; ---------------------------------------------------------------------------
;; Package install from MELPA
;;----------------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; ---------------------------------------------------------------------------
;; Editing modes
;;----------------------------------------------------------------------------
(load-file "~/.emacs.d/cmake-mode.el")
(require 'cmake-mode)

(require 'log-edit)
(require 'vc-git)

(setq auto-mode-alist
      '(("\\.[Cc][Oo][Mm]\\'" . text-mode)
	("\\.bat\\'" . bat-generic-mode)
	("\\.inf\\'" . inf-generic-mode)
	("\\.rc\\'" . rc-generic-mode)
	("\\.reg\\'" . reg-generic-mode)
	("\\.cob\\'" . cobol-mode)
	("\\.cbl\\'" . cobol-mode)
	("\\.te?xt\\'" . text-mode)
	("\\.c\\'" . c-mode)
	("\\.h\\'" . c++-mode)
        ("\\.adoc\\'" . adoc-mode)
        ("\\.d\\'" . d-mode)
	("\\.tex$" . LaTeX-mode)
	("\\.sty$" . LaTeX-mode)
	("\\.bbl$" . LaTeX-mode)
	("\\.bib$" . BibTeX-mode)
	("\\.el\\'" . emacs-lisp-mode)
	("\\.scm\\'" . scheme-mode)
	("\\.l\\'" . lisp-mode)
	("\\.lisp\\'" . lisp-mode)
	("\\.f\\'" . fortran-mode)
	("\\.F\\'" . fortran-mode)
	("\\.for\\'" . fortran-mode)
	("\\.p\\'" . pascal-mode)
	("\\.pas\\'" . pascal-mode)
	("\\.ad[abs]\\'" . ada-mode)
	("\\.\\([pP][Llm]\\|al\\)\\'" . perl-mode)
	("\\.cgi$"  . perl-mode)
	("\\.s?html?\\'" . sgml-mode)
	("\\.idl\\'" . c++-mode)
	("\\.cc\\'" . c++-mode)
	("\\.hh\\'" . c++-mode)
	("\\.hpp\\'" . c++-mode)
	("\\.C\\'" . c++-mode)
	("\\.H\\'" . c++-mode)
	("\\.cpp\\'" . c++-mode)
	("\\.[cC][xX][xX]\\'" . c++-mode)
	("\\.hxx\\'" . c++-mode)
	("\\.c\\+\\+\\'" . c++-mode)
	("\\.h\\+\\+\\'" . c++-mode)
	("\\.m\\'" . octave-mode)
	("\\.java\\'" . java-mode)
	("\\.ma?k\\'" . makefile-mode)
	("\\(M\\|m\\|GNUm\\)akefile\\(\\.in\\)?" . makefile-mode)
	("\\.am\\'" . makefile-mode)
	("\\.mms\\'" . makefile-mode)
        ("CMakeLists.txt\\'" . cmake-mode)
        ("\\.cmake\\'" . cmake-mode)
	("\\.texinfo\\'" . texinfo-mode)
	("\\.te?xi\\'" . texinfo-mode)
	("\\.s\\'" . asm-mode)
	("\\.S\\'" . asm-mode)
	("\\.asm\\'" . asm-mode)
	("ChangeLog\\'" . change-log-mode)
	("change\\.log\\'" . change-log-mode)
	("changelo\\'" . change-log-mode)
	("ChangeLog\\.[0-9]+\\'" . change-log-mode)
	("changelog\\'" . change-log-mode)
	("changelog\\.[0-9]+\\'" . change-log-mode)
	("\\$CHANGE_LOG\\$\\.TXT" . change-log-mode)
	("\\.scm\\.[0-9]*\\'" . scheme-mode)
	("\\.[ck]?sh\\'\\|\\.shar\\'\\|/\\.z?profile\\'" . sh-mode)
	("\\(/\\|\\`\\)\\.\\(bash_profile\\|z?login\\|bash_login\\|z?logout\\)\\'"
	 . sh-mode)
	("\\(/\\|\\`\\)\\.\\(bash_logout\\|[kz]shrc\\|bashrc\\|t?cshrc\\|esrc\\)\\'"
	 . sh-mode)
	("\\(/\\|\\`\\)\\.\\([kz]shenv\\|xinitrc\\|startxrc\\|xsession\\)\\'"
	 . sh-mode)
	("\\.mm\\'" . nroff-mode)
	("\\.me\\'" . nroff-mode)
	("\\.ms\\'" . nroff-mode)
	("\\.man\\'" . nroff-mode)
	("\\.[12345678]\\'" . nroff-mode)
	("\\.TeX\\'" . TeX-mode)
	("\\.sty\\'" . LaTeX-mode)
	("\\.cls\\'" . LaTeX-mode)
	("\\.clo\\'" . LaTeX-mode)
	("\\.bbl\\'" . LaTeX-mode)
	("\\.bib\\'" . BibTeX-mode)
	("\\.m4\\'" . m4-mode)
	("\\.mc\\'" . m4-mode)
	("\\.mf\\'" . metafont-mode)
	("\\.mp\\'" . metapost-mode)
	("\\.vhdl?\\'" . vhdl-mode)
	("\\.article\\'" . text-mode)
	("\\.letter\\'" . text-mode)
	("\\.tcl\\'" . tcl-mode)
	("\\.exp\\'" . tcl-mode)
	("\\.itcl\\'" . tcl-mode)
	("\\.itk\\'" . tcl-mode)
	("\\.icn\\'" . icon-mode)
	("\\.sim\\'" . simula-mode)
	("\\.mss\\'" . scribe-mode)
	("\\.f90\\'" . f90-mode)
	("\\.lsp\\'" . lisp-mode)
	("\\.awk\\'" . awk-mode)
	("\\.prolog\\'" . prolog-mode)
	("\\.tar\\'" . tar-mode)
	("\\.\\(arc\\|zip\\|lzh\\|zoo\\|jar\\)\\'" . archive-mode)
	("\\.\\(ARC\\|ZIP\\|LZH\\|ZOO\\|JAR\\)\\'" . archive-mode)
	("\\`/tmp/Re" . text-mode)
	("/Message[0-9]*\\'" . text-mode)
	("/drafts/[0-9]+\\'" . mh-letter-mode)
	("\\.zone\\'" . zone-mode)
	("\\`/tmp/fol/" . text-mode)
	("\\.y\\'" . c-mode)
	("\\.lex\\'" . c-mode)
	("\\.oak\\'" . scheme-mode)
	("\\.sgml?\\'" . sgml-mode)
	("\\.xml\\'" . sgml-mode)
	("\\.dtd\\'" . sgml-mode)
	("\\.ds\\(ss\\)?l\\'" . dsssl-mode)
	("\\.idl\\'" . c++-mode)
	("[]>:/\\]\\..*emacs\\'" . emacs-lisp-mode)
	("\\`\\..*emacs\\'" . emacs-lisp-mode)
	("[:/]_emacs\\'" . emacs-lisp-mode)
	("\\.org\\'" . org-mode)
	("\\.ml\\'" . lisp-mode)
	("\\.tex$" . LaTeX-mode)
	("\\.sty$" . LaTeX-mode)
	("\\.bbl$" . LaTeX-mode)
	("\\.bib$" . BibTeX-mode)
	("\\.cls$" . LaTeX-mode)
	("\\.clo$" . LaTeX-mode)
	("\\.pdf$" . doc-view-mode)))


(autoload 'cmake-mode "~/.emacs.d/cmake-mode.el" t)

;; ---------------------------------------------------------------------------
;; Behaviour
;; --------------------------------------------------------------------------
;; don't make pesky backup files
(setq make-backup-files nil)
;; don't use version numbers for backup files
(setq version-control 'never)
;; Open unidentified files in text mode
(setq default-major-mode 'text-mode)
;; Do only one line scrolling.
(setq scroll-step 1)
;; Don't wrap long lines.
(set-default 'truncate-lines t)
;; Make the region visible (but only up to the next operation on it)
(setq transient-mark-mode t)
;; Colours ("Colors" in some other languages)
;; Give me colours in major editing modes!!!!!
(require 'font-lock)
(global-font-lock-mode t)
;; Don't add new lines to the end of a file when using down-arrow key
(setq next-line-add-newlines nil)
;; Dont show the GNU splash screen
                    ;(setq inhibit-startup-message t)
;; Make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;; Delete selection when writing over it
(delete-selection-mode 1)

;; Make M-q equivalent to yank
(require 'bind-key)
(bind-key* "M-q" 'yank)


;; ---------------------------------------------------------------------------
;; Modeline
;; ---------------------------------------------------------------------------

;; Current line & column of cursor in the mode line (bar at the bottom)
(line-number-mode 1)
(setq column-number-mode t)
;; show current function in modeline
(which-func-mode t)
;; Display time in the mode line
;; Put this line last to prove (by the time in the mode line)
;; that the .emacs loaded without error to this point.

;; Unnaproved (too long, use calendar)
;;(setq display-time-day-and-date t )

;; Unnaproved (too long, replace by short format)
;;(setq display-time-24hr-format t)
;;(display-time)

(display-time-mode 1)


;; ---------------------------------------------------------------------------
;; Development: Debugger
;; ---------------------------------------------------------------------------

;; GDB (Debugger)
;; Split windows for gdb screens
(setq gdb-many-windows t
      gdb-show-main t)



;; ---------------------------------------------------------------------------
;; Frames and windows sizes
;; ---------------------------------------------------------------------------
;; Disabling menubar, toolbar and scrollbar
(menu-bar-mode -1)
;(scroll-bar-mode -1)
;(tool-bar-mode -1)

;; (set-default-font "Terminus-12")
(setq default-frame-alist '((width . 120) (height . 43)))
;; (add-to-list 'default-frame-alist '(font . "Terminus-12"))
(add-to-list 'default-frame-alist '(foreground-color . "white"))
(add-to-list 'default-frame-alist '(background-color . "black"))

(setq initial-frame-alist '((width . 140) (height . 72)))

;; ---------------------------------------------------------------------------
;; No splash
;; ---------------------------------------------------------------------------
(setq inhibit-startup-message t)

;; ---------------------------------------------------------------------------
;; Advanced highlight (see also 'highlight' section)
;; ---------------------------------------------------------------------------
					;(setq search-highlight           t) ; Highlight search object
					;(setq query-replace-highlight    t) ; Highlight query object
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening
(set-face-background 'region "red") ; Set region background color
(set-face-foreground 'region "black") ; Set region foreground color
(set-face-background 'isearch-lazy-highlight-face "yellow") ; Set isearch background color
(set-face-foreground 'isearch-lazy-highlight-face "black") ; Set isearch foreground color
(set-face-background 'isearch "green") ; Set highlight background color
(set-face-foreground 'isearch "black") ; Set highlight foreground color
					; blue-white
					; green-black

;; ---------------------------------------------------------------------------
;; C indentation
;; ---------------------------------------------------------------------------
; Set basic indentation in c of 4 spaces
(setq-default c-default-style "linux"
              c-basic-offset 4)
;Auto indent
(add-hook 'c-mode-common-hook '(lambda ()
				 (local-set-key (kbd "RET") 'newline-and-indent)))
					; Auto-close braces
(setq electric-layout-rules '((?\{ . around) (?\} . around)))


;; ---------------------------------------------------------------------------
;; TABs vs Spaces
;; ---------------------------------------------------------------------------
(setq-default indent-tabs-mode 'nil)


;; ---------------------------------------------------------------------------
;; Compile
;; ---------------------------------------------------------------------------
					; Compile and handling regions for errors
(global-set-key (kbd "C-c c") 'compile)


;; ---------------------------------------------------------------------------
;; Regions
;; ---------------------------------------------------------------------------

;; Important keybinding C-M-\ for indent region

;; Comment and uncomment regions
(global-set-key (kbd "C-c ,") 'comment-region)
(global-set-key (kbd "C-c .") 'uncomment-region)


;; ---------------------------------------------------------------------------
;; TRAMP
;; ---------------------------------------------------------------------------

(require 'tramp)
(setq tramp-default-method "ssh")

;; C-x C-f /remotehost:filename  RET (or /method:user@remotehost:filename)
;; C-x C-f /su::/etc/hosts
;; C-x C-f /sudo::/etc/hosts

					; Enable for debugging purposes
(setq tramp-debug-buffer t)
(setq tramp-verbose 10)

;; /<user>@<host>:/path/to/file or
;; /<protocol>:<user>@<host>:/path/to/file,




;; ---------------------------------------------------------------------------
;; SEMANTIC
;; ---------------------------------------------------------------------------
(add-hook
 'c-mode-common-hook
 (lambda()
   (define-key c-mode-base-map
     (kbd "M-<right>") 'semantic-ia-fast-jump)))

(global-set-key
 (kbd "M-<left>")
 (lambda()(interactive) (set-mark-command 4)))
(global-set-key [M-up] 'pop-global-mark)

;; ---------------------------------------------------------------------------
;; EDIFF MODE
;; ---------------------------------------------------------------------------
(setq ediff-split-window-function 'split-window-horizontally)


;; ---------------------------------------------------------------------------
;; SCALE FONT
;; ---------------------------------------------------------------------------
(set-face-attribute 'default (selected-frame) :height 135)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (adoc-mode zygospore yasnippet ws-butler volatile-highlights use-package undo-tree sr-speedbar rtags rpm-spec-mode neotree json-mode iedit helm-swoop helm-projectile helm-gtags ggtags dtrt-indent d-mode company cmake-ide clean-aindent-mode anzu))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ---------------------------------------------------------------------------
;; HELM
;; ---------------------------------------------------------------------------
(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(with-eval-after-load 'helm
  (define-key helm-map (kbd "TAB") #'helm-maybe-exit-minibuffer))
(helm-mode 1)
