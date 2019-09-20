(deftheme panorama "The panorama color theme for Emacs")

(let ((class '((class color) (min-colors 89)))
      (panorama-bg             "#121212")
      (panorama-fg             "#f8f8f0")
      (panorama-orange         "#ffb700")
      (panorama-pink           "#ff2c4b")
      (panorama-red            "#f43841")
      (panorama-yellow         "#d7ff00")
      (panorama-green          "#3fff00")
      (panorama-wine           "#960050")
      (panorama-teal           "#008080")
      (panorama-aqua           "#00ffff")
      (panorama-blue           "#0097ff")
      (panorama-slateblue      "#7070f0")
      (panorama-purple         "#af5fff")
      (panorama-lightgray      "#444444")
      (panorama-darkgray       "#333333"))

  (custom-theme-set-faces
   
   'panorama


   ;; base

   `(default ((t (:background ,panorama-bg :foreground ,panorama-fg))))
   `(cursor ((t (:background ,panorama-fg :foreground ,panorama-bg))))
   `(fringe ((t (:foreground ,panorama-bg :background ,panorama-bg))))
   `(highlight ((t (:background ,panorama-lightgray))))
   `(region ((t (:background ,panorama-lightgray)) (t :inverse-video t)))
   `(warning ((t (:foreground ,panorama-yellow :weight bold))))
   `(vertical-border ((t (:foreground ,panorama-darkgray
			  :background ,panorama-bg))))
   `(minibuffer-prompt ((t (:foreground ,panorama-blue :background ,panorama-bg
                            :box nil))))

   ;; font lock

   `(font-lock-builtin-face ((t (:foreground ,panorama-orange))))
   `(font-lock-comment-face ((t (:foreground ,panorama-lightgray))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,panorama-lightgray))))
   `(font-lock-constant-face ((t (:foreground ,panorama-orange))))
   `(font-lock-doc-string-face ((t (:foreground ,panorama-lightgray))))
   `(font-lock-function-name-face ((t (:foreground ,panorama-blue))))
   `(font-lock-keyword-face ((t (:foreground ,panorama-pink))))
   `(font-lock-negation-char-face ((t (:foreground ,panorama-wine))))
   `(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
   `(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
   `(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
   `(font-lock-string-face ((t (:foreground ,panorama-green))))
   `(font-lock-type-face ((t (:foreground ,panorama-blue))))
   `(font-lock-variable-name-face ((t (:foreground ,panorama-yellow))))
   `(font-lock-warning-face ((t (:foreground ,panorama-orange))))

   ;; mode line

   `(mode-line ((t (:foreground ,panorama-fg :background ,panorama-lightgray
                    :box nil))))
   `(mode-line-buffer-id ((t (:weight bold))))
   `(mode-line-inactive ((t (:foreground ,panorama-fg
                             :background ,panorama-darkgray
                             :box nil))))

   ;; search

   `(isearch ((t (:foreground ,panorama-fg :background ,panorama-red
                  :weight bold))))
   `(isearch-fail ((t (:foreground ,panorama-red :background ,panorama-bg))))
   `(linum ((t (:foreground ,panorama-darkgray
                :background ,panorama-bg))))

   ;; dired

   `(dired-symlink ((t (:foreground ,panorama-aqua
                        :background ,panorama-bg))))

   ;; ivy

   `(ivy-highlight-face ((t (:foreground ,panorama-blue
                             :background ,panorama-bg))))))

(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                    (file-name-directory load-file-name))))

(provide-theme 'panorama)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; panorama.el ends here
