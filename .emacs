(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes nil)
 '(inhibit-startup-screen t)
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Mono for Powerline" :foundry "CTDB" :slant normal :weight normal :height 158 :width normal)))))

;; MELPA Package
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; Custom Key Binding ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )
(global-set-key (kbd "C-d") 'duplicate-line)

; Switch Buffers
(global-set-key (kbd "C-<left>")  'previous-buffer)
(global-set-key (kbd "C-<right>") 'next-buffer)

;; Powerline Config
(require 'powerline)
(powerline-default-theme)
(setq powerline-default-separator 'slant)

;; Custom Theme ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (load-theme 'atom-one-dark t)
(load-theme 'monokai t)
;; (load-theme 'arjen-grey t)
;; (load-theme 'gruvbox t)

;; Yasnippet Config ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; Angular Snippet Config ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'angular-snippets)

;; Indent Guide Config
(indent-guide-global-mode)
;; (set-face-background 'indent-guide-face "dimgray")
;; (setq indent-guide-delay 0.1)
;; (setq indent-guide-recursive t)
;; (setq indent-guide-char ":")

;; Smart Parens Config ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; (require 'smartparens-config)
; (smartparens-global-mode t)

;; Neo Tree Config ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'neotree)
; (global-set-key (kbd "C-.") 'neotree-toggle)
(setq neo-theme (if window-system 'nerd))
(setq neo-window-width 35)

; Use with evil mode
(add-hook 'neotree-mode-hook
    (lambda ()
      (define-key evil-normal-state-local-map (kbd "o") 'neotree-enter)
      (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
      (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)))

;; Wind Move Config
(windmove-default-keybindings 'meta)
; (global-set-key (kbd "C-c <left>")  'windmove-left)
; (global-set-key (kbd "C-c <right>") 'windmove-right)
; (global-set-key (kbd "C-c <up>")    'windmove-up)
; (global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-h")  'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key (kbd "C-k")    'windmove-up)
(global-set-key (kbd "C-j")  'windmove-down)

;; Auto Complete Config
(ac-config-default)

;; Linum Relative Config ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'linum-relative)
(setq linum-relative-format " %3s ")
(setq linum-relative-current-symbol "")
(linum-relative-in-helm-p)
(linum-relative-on)
(add-hook 'prog-mode-hook 'linum-relative-mode)
(add-hook 'css-mode-hook 'linum-relative-mode)

;; Web Beautify Config ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'web-beautify)
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'js
  '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'sgml-mode
  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))

(eval-after-load 'web-mode
  '(define-key web-mode-map (kbd "C-c b") 'web-beautify-html))

(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

;; Web Mode Config
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

;; Emmet Mode Config
(require 'emmet-mode)

;; Evil Mode Config
(require 'evil)
(evil-mode 1)

;; Powerline Evil Config
; (require 'powerline-evil)

;; Rainbow Delimeters Config
;; (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Highlight Symbol Config
(require 'highlight-symbol)
(global-set-key (kbd "C-;") 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;; Helm Config
(require 'helm-config)
(require 'helm)
(require 'helm-themes)
(global-set-key (kbd "M-x") 'helm-M-x)

;; PHP Mode Config
(require 'php-mode)

;; AC JS2 Mode Config
(add-hook 'js2-mode-hook 'ac-js2-mode)

;; AC HTML Config
(add-to-list 'web-mode-ac-sources-alist
             '("html" . (ac-source-html-tag
                         ac-source-html-attr
                         ac-source-html-attrv)))

;; Smooth Scrolling Config ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

;; Multiple Cursors Config ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'multiple-cursors)
(global-set-key (kbd "C-'") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Editor Config
; (setq-default line-spacing 10)
; (setq-default cursor-type 'bar)

