(deftheme base-16 "The base-16 color theme for Emacs")

(let ((class '((class color) (min-colors 89)))
      (base-16-bg             "black")
      (base-16-fg             "white")
      (base-16-black          "black")
      (base-16-red            "red")
      (base-16-green          "green")
      (base-16-yellow         "yellow")
      (base-16-blue           "blue")
      (base-16-magenta        "magenta")
      (base-16-cyan           "cyan")
      (base-16-white          "white")
      (base-16-brightblack    "brightblack")
      (base-16-brightred      "brightred")
      (base-16-brightgreen    "brightgreen")
      (base-16-brightyellow   "brightyellow")
      (base-16-brightblue     "brightblue")
      (base-16-brightmagenta  "brightmagenta")
      (base-16-brightcyan     "brightcyan")
      (base-16-brightwhite    "brightwhite"))

  (custom-theme-set-faces

   'base-16

   ;; Base
   
   `(cursor ((t (:background ,base-16-white :foreground ,base-16-bg))))
   `(fringe ((t (:foreground ,base-16-bg :background ,base-16-bg))))
   `(highlight ((t (:background ,base-16-brightblack))))
   `(hl-line ((t (:background ,base-16-brightblack))))
   `(region ((t (:background ,base-16-brightblack)) (t :inverse-video t)))
   `(warning ((t (:foreground ,base-16-yellow :weight bold))))
   `(vertical-border ((t (:foreground ,base-16-brightblack
                          :background ,base-16-brightblack))))
   `(minibuffer-prompt ((t (:foreground ,base-16-blue :background ,base-16-bg
                            :box nil))))

   ;; Font Lock

   `(font-lock-builtin-face ((t (:foreground ,base-16-brightred))))
   `(font-lock-comment-face ((t (:foreground ,base-16-brightblack))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,base-16-brightblack))))
   `(font-lock-constant-face ((t (:foreground ,base-16-brightred))))
   `(font-lock-doc-string-face ((t (:foreground ,base-16-white))))
   `(font-lock-function-name-face ((t (:foreground ,base-16-blue))))
   `(font-lock-keyword-face ((t (:foreground ,base-16-magenta))))
   `(font-lock-negation-char-face ((t (:foreground ,base-16-blue))))
   `(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
   `(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
   `(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
   `(font-lock-string-face ((t (:foreground ,base-16-green))))
   `(font-lock-type-face ((t (:foreground ,base-16-blue))))
   `(font-lock-variable-name-face ((t (:foreground ,base-16-yellow))))
   `(font-lock-warning-face ((t (:foreground ,base-16-brightred))))

   ;; Mode line

   `(mode-line ((t (:background ,base-16-brightblack :box nil))))
   `(mode-line-buffer-id ((t (:weight bold))))
   `(mode-line-inactive ((t (:background ,base-16-brightblack :box nil))))

   ;; Search

   `(isearch ((t (:background ,base-16-red :weight bold))))
   `(isearch-fail ((t (:foreground ,base-16-red :background ,base-16-bg))))
   `(linum ((t (:foreground ,base-16-brightblack :background ,base-16-bg))))

   ;; Dired

   `(dired-symlink ((t (:foreground ,base-16-cyan :background ,base-16-bg))))

   ;; Ivy

   `(ivy-highlight-face ((t (:foreground ,base-16-blue
                             :background ,base-16-bg))))))

(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'base-16)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; base-16.el ends here
