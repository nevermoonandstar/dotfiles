(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(c-set-offset (quote defun-close) t)
 '(column-number-mode t)
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(global-font-lock-mode 1)
 '(global-linum-mode 1)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(markdown-command "~/Markdown_1.0.1/markdown.pl")
 '(markdown-command-needs-filename t)
 '(markdown-enable-math t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tab-always-indent 1)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(w32-send-sys-command 61488))

(require 'package)
(require 'cl) ;; Required for milkypostman's powerline
(package-initialize)
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
                          ("gnu" . "http://elpa.gnu.org/packages/")
                          ("marmalade" . "http://marmalade-repo.org/packages/")
                          ("melpa" . "http://melpa.milkbox.net/packages/")
                          ))
(setq-default indent-tabs-mode nil) ;tabs are spaces
(setq-default tab-width 4) ;tabs are 4 wide
(setq backup-inhibited t) ;no #files# everywhere
(setq auto-save-default nil) ;no ~files everywhere
(setq make-backup-files nil) ;and I mean it
(setq auto-complete-mode t) ;tab auto-completes commands

(if window-system ;84x25 window please, but may have to start emacs with arg:
      (set-frame-size (selected-frame) 84 25)) ;-geometry 84x25
(setq frame-title-format "Etherium") ;Set window title to this.
(global-hi-lock-mode 1) ;highlight mode everywhere
(menu-bar-mode 0) ;no menu bar
(evil-mode 1) ;vim keys, requires evil package from MELPA

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "monoOne" :foundry "unknown" :slant normal :weight normal :height 143 :width normal)))))

;(when (>= emacs-major-version 24)
;  (require 'package)
;  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;  )

;; Pear coding standards : http://pear.php.net/manual/en/standards.indenting.php
(defun pear/php-mode-init () 
;  "Set some buffer-local variables."
  (setq case-fold-search t
    indent-tabs-mode nil
    fill-column 78
    c-basic-offset 4)
  (c-set-offset 'arglist-cont 0)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'case-label 2)
  (c-set-offset 'arglist-close 0)
  (c-set-style "k&r")
  (c-set-offset 'brace-list-close 0) ;Whitesmith overindents close braces
  (c-set-offset 'defun-close 0))     ;So this is to put them in line during electrics.
(add-hook 'php-mode-hook 'pear/php-mode-init) ;correct php indents

(defun whitesmith-mode ()
  "Switch to Whitesmith Indent Mode without the overextended close braces."
  (interactive)
  (c-set-style "whitesmith")
  (c-set-offset 'brace-list-close 0)
  (c-set-offset 'defun-close 0)
)

(add-hook 'html-mode-hook 'web-mode) ;use web-mode package on html files

(global-set-key [f5] 'whitesmith-mode)
(global-set-key (kbd "C-M-/") 'hippie-expand)
(global-set-key (kbd "M-/") 'auto-complete)
(global-set-key [f10] (lambda () (interactive) (highlight-lines-matching-regexp ".\\{81\\}" 'hi-blue)))
(global-set-key [f11] (lambda () (interactive) (menu-bar-mode 0)))
(global-set-key [f12] (lambda () (interactive) (menu-bar-mode 1)))

(load-theme 'solarized-dark)
(add-to-list 'load-path "~/.emacs.d/vendor/powerline")
(require 'powerline)
(powerline-default-theme)
