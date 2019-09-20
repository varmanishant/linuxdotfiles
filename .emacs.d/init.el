; User Interface

(setq mode-line-format nil)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(toggle-frame-maximized)
(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-10.5"))

; Packages

(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(setq package-enable-at-startup nil)

(defun require-package (package)
  (unless (or (package-installed-p package)
              (require package nil 'noerror))
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(package-initialize)

(require-package 'counsel)
(require-package 'company)
(require-package 'evil)
(require-package 'evil-leader)
(require-package 'evil-surround)
(require-package 'flycheck)
(require-package 'ivy)
(require-package 'magit)
(require-package 'markdown-mode)
(require-package 'minimap)
(require-package 'swiper)
(require-package 'treemacs)
(require-package 'xclip)

; Settings

(show-paren-mode)
(column-number-mode)
(recentf-mode 1)
(xterm-mouse-mode 1)

(setq ido-use-virtual-buffers nil)
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq recentf-max-menu-items 25)
(setq use-dialog-box nil)
(setq-default fill-column 79)
(setq-default message-log-max nil)

(add-hook 'dired-mode-hook 'hl-line-mode)
(add-hook 'package-menu-mode-hook 'hl-line-mode)
(add-hook 'buffer-menu-mode-hook 'hl-line-mode)

(global-set-key [escape] 'keyboard-escape-quit)
(define-key isearch-mode-map [escape] 'isearch-abort)

(add-hook 'minibuffer-exit-hook
  '(lambda () (let ((buffer "*Completions*"))
    (and (get-buffer buffer) (kill-buffer buffer)))))

(setq initial-scratch-message nil)

(add-hook 'html-mode-hook
  (lambda ()
    (set (make-local-variable 'sgml-basic-offset) 4)))

(add-hook 'python-mode-hook
  (lambda ()
    (setq tab-width 4)
    (setq python-indent 4)))

; Theme

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(setq custom-safe-themes t)

(defadvice load-theme (before theme-dont-propagate activate)
  (mapc #'disable-theme custom-enabled-themes))

(if (display-graphic-p)
    (load-theme 'panorama t)
  (load-theme 'base-16 t))

; Company

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'python-mode-hook 'my-python-mode-hook)
(defun my-python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

; Dired

(setq dired-listing-switches "-aBhl --group-directories-first")

(defun my-open-dired-here ()
  (interactive)
  (dired default-directory))

; Evil

(global-evil-leader-mode)
(global-evil-surround-mode)
(evil-mode)
(setq evil-move-cursor-back nil)

(evil-set-initial-state 'treemacs-mode 'emacs)
(evil-set-initial-state 'magit-log-edit-mode 'emacs)

(define-key evil-normal-state-map " " 'execute-extended-command)
(define-key evil-normal-state-map "s" 'save-buffer)
(define-key evil-normal-state-map "[b" 'evil-prev-buffer)
(define-key evil-normal-state-map "]b" 'evil-next-buffer)

(defun evil-open-below-normal ()
  (interactive)
  (evil-open-below 1)
  (evil-previous-line)
  (evil-normal-state))

(defun evil-open-above-normal ()
  (interactive)
  (evil-open-above 1)
  (evil-next-line)
  (evil-normal-state))

(evil-leader/set-key
    "\\" 'evil-switch-to-windows-last-buffer
    "a" 'mark-whole-buffer
    "b" 'switch-to-buffer
    "m" 'buffer-menu
    "c" 'close
    "e" 'my-open-dired-here
    "F" 'counsel-fzf
    "f" 'counsel-git
    "g" 'magit-status
    "i" 'ivy-mode
    "l" 'eval-buffer
    "F" 'counsel-fzf
    "o" 'find-file
    "r" 'recentf-open-files-compl
    "s" 'counsel-rg
    "t" 'treemacs
    "x" 'kill-this-buffer
    "X" 'kill-buffer
    "q" 'save-buffers-kill-emacs
    "<up>" 'evil-open-above-normal
    "<down>" 'evil-open-below-normal)

; Ido

(ido-mode 0)

; Ivy

(ivy-mode 0)

; Magit

(defadvice magit-status (around magit-fullscreen activate)
     (window-configuration-to-register :magit-fullscreen)
     ad-do-it
     (delete-other-windows))

; Recentf

(defun recentf-open-files-compl ()
    (interactive)
    (let* ((all-files recentf-list)
    (tocpl (mapcar (function
        (lambda (x) (cons (file-name-nondirectory x) x))) all-files))
    (prompt (append '("Recentf open file: ") tocpl))
    (fname (completing-read (car prompt) (cdr prompt) nil nil)))
    (find-file (cdr (assoc-ignore-representation fname tocpl)))))

; Swiper

(global-set-key (kbd "C-s") 'swiper)

; Xclip

(xclip-mode 1)
