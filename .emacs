; Used when emacs starts

; Enable line num at startup
(require 'linum)
(global-linum-mode t)
; Add space after the number
(setq linum-format "%d ")

; Enable ido mode at startup
(require 'ido)
(ido-mode t)

; No backup files to be made
(setq make-backup-files nil)

; Disable startup message
(setq inhibit-startup-message t)

; Change yes-to-no to y-to-n
(fset `yes-or-no-p `y-or-n-p)

; Goto-line short-cut key                                                                                                   
(global-set-key "\C-l" 'goto-line)

; Add autocomplete to emacs
(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

; Custom python-mode
(setq py-install-directory "~/.emacs.d/python-mode.el-6.1.1")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

; Set ipython for emacs
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

; Use el-get, it installs package as well as required dependencies.
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(el-get 'sync)

; install emacs for python
(load-file "/Users/vdkhadke/.emacs.d/emacs-for-python/epy-init.el")

; Set a visual boundary indicator at 70 characters to check and
; possible truncate lines > 70 characters.
 (add-to-list 'load-path "~/.emacs.d/fill-column-indicator-1.83")
 (require 'fill-column-indicator)
 (define-globalized-minor-mode
 global-fci-mode fci-mode (lambda () (fci-mode 1)))
 (global-fci-mode t)

; Add color theme for emacs
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)
     )
)

; Set meta X as ^X ^M
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

; Set up SLIME for Common LISP
(add-to-list 'load-path "/opt/local/share/emacs/site-lisp/slime")
(setq slime-lisp-implementations
     `((sbcl ("/opt/local/bin/sbcl"))
      (abcl ("/opt/local/bin/abcl"))
       (clisp ("/opt/local/bin/clisp"))))
(require 'slime)
(slime-setup  '(slime-repl slime-asdf slime-fancy slime-banner))


; Open compressed files in emacs
(auto-compression-mode 1)

; For mac, the keybindings
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'meta)

)
