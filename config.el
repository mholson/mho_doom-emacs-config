;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Mark Olson"
      user-mail-address "markolsonse@icloud.com"
      )

;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;;  FONTS
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Source Code Pro" :size 22))
;;      doom-variable-pitch-font (font-spec :family "Iosevka Aile Thin" :size 18))
;;(setq doom-font (font-spec :family "JetBrains Mono" :weight 'light :size 18))
;;      doom-variable-pitch-font (font-spec :family "Iosevka Aile" :weight 'light :height 1.3))
;;      doom-serif-font (font-spec : "JetBrains Mono" :weight 'light :height 190)
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!


;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;;  THEMES
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)
;;(setq doom-theme 'doom-palenight)
(setq doom-theme 'doom-nord-aurora)
;;(setq doom-theme 'doom-xcode)
;;(setq doom-theme 'doom-rose-pine-moon)
;;(after! doom-themes
;;   (load-theme 'doom-nano-dark t))
;; (after! doom-themes
;;   (load-theme 'doom-nano-light t))
;; Let the desktop background show through
;;(set-frame-parameter (selected-frame) 'alpha '(97 . 100))
;;(add-to-list 'default-frame-alist '(alpha . (90 . 90)))
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;;  GENERAL SETTINGS
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
(setq-default
 delete-by-moving-to-trash t
 window-combination-resize t
 x-stretch-cursor t)
(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      truncate-string-ellipsis "…"                ; Unicode ellispis are nicer than "...", and also save /precious/ space
      password-cache-expiry nil                   ; I can trust my computers ... can't I?
      scroll-preserve-screen-position 'always
      scroll-margin 4)                            ; It's nice to maintain a little margin

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

(add-to-list 'default-frame-alist '(height . 34))
(add-to-list 'default-frame-alist '(width  . 80))

;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;;  DOOM MODELINE
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;; Modified Buffer Color
;; Use ORANGE instead of RED for modifed buffer
(custom-set-faces!
  '(doom-modeline-buffer-modified :foreground "orange"))

;; (use-package! doom-nano-modeline
;;   :config
;;   (doom-nano-modeline-mode 1)
;;   (global-hide-mode-line-mode 1))
;;
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;;  BROWSER
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
(setq browse-url-browser-function 'browse-url-chrome)
(setq browse-url-chrome-program "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome")
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;;  LATEX
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
(setenv "PATH" "/usr/local/bin:/Library/TeX/texbin/:$PATH" t)
(setq TeX-save-query nil
      TeX-show-compilation t
      TeX-command-extra-options "-shell-escape")
(after! latex
  (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t)))
(setq +latex-viewers '(skim preview))
(setq TeX-view-program-list
      '(("Preview" "/usr/bin/open -a Preview.app %o")
        ("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline -r -b %n %o %b")))
(setq TeX-view-program-selection
      '((output-dvi "Skim") (output-pdf "Skim") (output-html "open")));;
(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-start-server t)
(setq TeX-source-correlate-method 'synctex)

(when (>= 28 emacs-major-version)
  (add-hook 'latex-mode-hook #'TeX-latex-mode))

;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;; SNIPPETS
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;; assign yasnippet dir
(after! yasnippet
  (setq yas-snippet-dirs '("~/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets")))
;; enabling nested snippets
(setq yas-triggers-in-field t)
;; For some file types, we overwrite defaults in the snippets directory,
;; others need to have a template assigned.

(use-package laas
  :hook (LaTeX-mode . laas-mode)
  :config ; do whatever here
  (aas-set-snippets 'laas-mode
    "jf" (lambda () (interactive)
           (yas-expand-snippet "\\\\( $1 \\\\) $0"))
    "ägp" (lambda () (interactive)
            (yas-expand-snippet "\\graphicspath{{\\string~/Library/CloudStorage/Dropbox/assets/}}"))
    "ääm" (lambda () (interactive)
            (yas-expand-snippet "\\inputminted{python}{0-tex/py_code-${1:tagID}.py}"))
    ;; set condition!
    :cond #'texmathp ; expand only while in math
    "==" "&="
    "bfb" "\\framebreak%"
    "d1" "\\diff{y}{x}"
    "d2" "\\diff[2]{y}{x}"
    "dx" "\\dl x"
    "dy" "\\dl y"
    "ee" "^"
    "fx" "f(x)"
    "fp" "\\fprime"
    "ffp" "\\fprime (x)"
    "fffp" "\\fprime\\fprime (x)"
    "gx" "g(x)"
    "gp" "g'(x)"
    "ggp" "g''(x)"
    "hx" "h(x)"
    "jg" "\\\\"
    "lg" "\\lg"
    "lc" "\\$0"
    "mst" "\\suchthat"
    "nn" "\\oneg"
    "xx" "\\cdot"
    ;; bind to functions!
    "cr" (lambda () (interactive)
           (yas-expand-snippet "\\cRed{${1:arg}}$0"))
    "sv" (lambda () (interactive)
           (yas-expand-snippet "\\farg{${1:arg}}$0"))
    "ssv" (lambda () (interactive)
            (yas-expand-snippet "\\fargpass{${1:arg}}$0"))
    "sssv" (lambda () (interactive)
             (yas-expand-snippet "\\fargr{${1:arg}}$0"))
    "sit" (lambda () (interactive)
            (yas-expand-snippet "\\shortintertext{$1}$0"))
    "uu" (lambda () (interactive)
           (yas-expand-snippet "\\qty{${1:num}}{${2:unit}}$0"))
    "äf" (lambda () (interactive)
           (yas-expand-snippet "\\dfrac{${1:num}}{${2:den}}$0"))
    "ääf" (lambda () (interactive)
            (yas-expand-snippet "\\rfrac{${1:num}}{${2:den}}$0"))
    "äääf" (lambda () (interactive)
             (yas-expand-snippet "\\frac{${1:num}}{${2:den}}$0"))
    "åå" (lambda () (interactive)
           (yas-expand-snippet "\\mpar{${1:arg}}$0"))
    "åä" (lambda () (interactive)
           (yas-expand-snippet "\\sqpar{${1:terms}}$0"))
    "äa" (lambda () (interactive)
           (yas-expand-snippet "\\abs{${1:arg}}$0"))
    "äb" (lambda () (interactive)
           (yas-expand-snippet "\\set{${1:terms}}$0"))
    "äi" (lambda () (interactive)
           (yas-expand-snippet "\\ds\\int {${1:integrand}}, \\dl{${2:x}}$0"))
    "ääi" (lambda () (interactive)
            (yas-expand-snippet "\\defint{${1:integrand}}{${2:lower lim}}{${3:upper lim}} \\, \\dl{${2:x}}$0"))
    "äääi" (lambda () (interactive)
             (yas-expand-snippet "\\ieval{${1:integrand}}{${2:lower lim}}{${3:upper lim}}$0"))
    "äl" (lambda () (interactive)
           (yas-expand-snippet "\\dstylim{${1:var}}{${2:to}}{${3:expression}}$0"))
    "äs" (lambda () (interactive)
           (yas-expand-snippet "\\sqrt{${1:arg}}$0"))
    "ääs" (lambda () (interactive)
            (yas-expand-snippet "\\sqrt[${1:root}]{${2:arg}}$0"))
    "äääs" (lambda () (interactive)
             (yas-expand-snippet "\\set{${1:terms}}$0"))
    "ät" (lambda () (interactive)
           (yas-expand-snippet "\\text{${1:text}}$0"))
    ;; add accent snippets
    :cond #'laas-object-on-left-condition
    ;; ";sr" (lambda () (interactive) (laas-wrap-previous-object "sqrt"))
    ))


;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;; CALC
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;; Thank you https://github.com/tecosaur/emacs-config/
(use-package! calctex
  :commands calctex-mode
  :init
  (add-hook 'calc-mode-hook #'calctex-mode)
  :config
  (setq calctex-additional-latex-packages "
\\usepackage[usenames]{xcolor}
\\usepackage{soul}
\\usepackage{adjustbox}
\\usepackage{amsmath}
\\usepackage{amssymb}
\\usepackage{siunitx}
\\usepackage{cancel}
\\usepackage{mathtools}
\\usepackage{mathalpha}
\\usepackage{xparse}
\\usepackage{arevmath}"
        calctex-additional-latex-macros
        (concat calctex-additional-latex-macros
                "\n\\let\\evalto\\Rightarrow"))
  (defadvice! no-messaging-a (orig-fn &rest args)
    :around #'calctex-default-dispatching-render-process
    (let ((inhibit-message t) message-log-max)
      (apply orig-fn args)))
  ;; Fix hardcoded dvichop path (whyyyyyyy)
  (let ((vendor-folder (concat (file-truename doom-local-dir)
                               "straight/"
                               (format "build-%s" emacs-version)
                               "/calctex/vendor/")))
    (setq calctex-dvichop-sty (concat vendor-folder "texd/dvichop")
          calctex-dvichop-bin (concat vendor-folder "texd/dvichop")))
  (unless (file-exists-p calctex-dvichop-bin)
    (message "CalcTeX: Building dvichop binary")
    (let ((default-directory (file-name-directory calctex-dvichop-bin)))
      (call-process "make" nil nil nil))))

(setq calc-angle-mode 'rad  ; radians are rad
      calc-symbolic-mode t) ; keeps expressions like \sqrt{2} irrational for as long as possible

(global-set-key (kbd "C-c e") #'calc-embedded)
(map! :after calc
      :map calc-mode-map
      :localleader
      :desc "Embedded calc (toggle)" "e" #'calc-embedded)
(map! :after org
      :map org-mode-map
      :localleader
      :desc "Embedded calc (toggle)" "E" #'calc-embedded)
(map! :after latex
      :localleader
      :map latex-mode-map
      :desc "Embedded calc (toggle)" "e" #'calc-embedded)

(defvar calc-embedded-trail-window nil)
(defvar calc-embedded-calculator-window nil)

(defadvice! calc-embedded-with-side-pannel (&rest _)
  :after #'calc-do-embedded
  (when calc-embedded-trail-window
    (ignore-errors
      (delete-window calc-embedded-trail-window))
    (setq calc-embedded-trail-window nil))
  (when calc-embedded-calculator-window
    (ignore-errors
      (delete-window calc-embedded-calculator-window))
    (setq calc-embedded-calculator-window nil))
  (when (and calc-embedded-info
             (> (* (window-width) (window-height)) 1200))
    (let ((main-window (selected-window))
          (vertical-p (> (window-width) 80)))
      (select-window
       (setq calc-embedded-trail-window
             (if vertical-p
                 (split-window-horizontally (- (max 30 (/ (window-width) 3))))
               (split-window-vertically (- (max 8 (/ (window-height) 4)))))))
      (switch-to-buffer "*Calc Trail*")
      (select-window
       (setq calc-embedded-calculator-window
             (if vertical-p
                 (split-window-vertically -6)
               (split-window-horizontally (- (/ (window-width) 2))))))
      (switch-to-buffer "*Calculator*")
      (select-window main-window))))
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;; Python
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

(setq org-babel-python-command "~/anaconda3/bin/python")
(after! python
  (setq python-shell-interpreter "~/anaconda3/bin/python"))
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;; ORG-MODE
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Library/CloudStorage/Dropbox/org/")
;; (setq org-roam-directory "~/Github/mhoOrgRoam/")
(setq org-roam-directory "~/Library/CloudStorage/Dropbox/mho_org-roam/")
;; Adding Babel Languages
;; (Org-Babel-Do-Load-Languages
;;  'Org-Babel-Load-Languages
;;  '((Js . T)
;;    (Latex . T)
;;    (Python . T)))
(after! org

  ;; C-c c is for capture, it’s good enough for me
  (global-set-key (kbd "C-c a") #'org-agenda)
  (global-set-key (kbd "C-c c") #'org-capture)

  ;; Org Capture Templates
  (setq org-capture-templates
        (quote (("i" "inbox (general)" entry (file+headline "~/Library/CloudStorage/Dropbox/org/gtd.org" "Inbox")
                 (file "~/Library/CloudStorage/Dropbox/org/template_inbox.org"))
                ("f" "task from [f]ile into inbox" entry (file+headline "~/Library/CloudStorage/Dropbox/org/gtd.org" "Inbox")
                 (file "~/Library/CloudStorage/Dropbox/org/template_file.org"))
                ("p" "[p]roject" entry (file+headline "~/Library/CloudStorage/Dropbox/org/gtd.org" "Inbox")
                 (file "~/Library/CloudStorage/Dropbox/org/template_project.org"))
                ("l" "web link" entry (file+headline "~/Library/CloudStorage/Dropbox/org/gtd.org" "Inbox")
                 (file "~/Library/CloudStorage/Dropbox/org/template_weblink.org"))
                ("e" "exam" entry (file+headline "~/Library/CloudStorage/Dropbox/org/gtd.org" "Inbox")
                 (file "~/Library/CloudStorage/Dropbox/org/template_exam.org"))
                ("g" "gmail" entry (file+headline "~/Library/CloudStorage/Dropbox/org/gtd.org" "Inbox")
                 (file "~/Library/CloudStorage/Dropbox/org/template_gmail.org"))
                )))

  ;; Skip finished items
  (setq org-agenda-todo-ignore-scheduled t)
  (setq org-agenda-todo-ignore-deadline t)
  (setq org-agenda-skip-deadline-if-done t)
  (setq org-agenda-skip-scheduled-if-done t)

  ;; TODOs Keywords
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "IN_PROGRESS(i)" "MEET(m)" "PROJ(p)" "|" "DONE(d)")
          (sequence "WAIT(w)" "HOLD(h)" "|" "CANCEL(c)")))

  ;; Add Week numbers to Agenda Calendar
  (setq calendar-week-start-day 1)
  (copy-face font-lock-constant-face 'calendar-iso-week-face)
  (set-face-attribute 'calendar-iso-week-face nil
                      :height 1.0
                      :foreground "#D08770")
  (setq calendar-intermonth-text
        '(propertize
          (format "%2d"
                  (car
                   (calendar-iso-from-absolute
                    (calendar-absolute-from-gregorian (list month day year)))))
          'font-lock-face 'calendar-iso-week-face))
  (setq calendar-intermonth-header
        (propertize "Wk"                  ; or e.g. "KW" in Germany
                    'font-lock-face 'calendar-iso-week-header-face))
  ;; Set default org image to 550
  (setq org-image-actual-width (list 550))

  ;; Add timestamp to completed tasks
  (setq org-log-done 'time
        org-log-into-drawer t
        org-log-state-notes-insert-after-drawers nil)
  ;; Hide emphasis markers on formatted text
  (setq org-hide-emphasis-markers t)
  )
;; Load org-faces to make sure we can set appropriate faces
(require 'org-faces)

;; Make sure certain org faces use the fixed-pitch face when variable-pitch-mode is on
(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-table nil :inherit 'fixed-pitch)
(set-face-attribute 'org-formula nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

(after! hl-todo
  (setq hl-todo-keyword-faces
        `(("MEET" . "#81A1C1")
          ("NEXT" . "#D08770")
          ("IN_PROGRESS" . "#D08770")
          ("TODO" . "#88C0D0")
          ("WAIT" . "#EBCB8B")
          ("PROJ" . "#B48EAD")
          )))

;; ORG-SUPER AGENDA
(after! org-agenda
  (let ((inhibit-message t))
    (org-super-agenda-mode)))

(setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-block-separator nil
      org-agenda-tags-column 100 ;; from testing this seems to be a good value
      org-agenda-compact-blocks t)

(setq org-agenda-custom-commands
      '(("o" "Overview"
         ((agenda "" ((org-agenda-span 'day)
                      (org-super-agenda-groups
                       '((:name "Today"
                          :time-grid t
                          :date today
                          :todo "TODAY"
                          :scheduled today
                          :order 1)))))
          (alltodo "" ((org-agenda-overriding-header "")
                       (org-super-agenda-groups
                        '((:name "In Progres"
                           :todo "IN_PROGRESS"
                           :order 0)
                          (:name "Important"
                           :tag "Important"
                           :priority "A"
                           :order 1)
                          (:name "Due Today"
                           :deadline today
                           :order 2)
                          (:name "Due Soon"
                           :deadline future
                           :order 3)
                          (:name "Overdue"
                           :deadline past
                           :face error
                           :order 4)
                          (:name "Projects"
                           :todo "PROJ"
                           :auto-parent t
                           :order 10
                           :not (:todo "TODO"))
                          (:name "Work"
                           :tag "work"
                           :auto-parent t
                           :order 12)
                          (:name "Home"
                           :tag "home"
                           :order 13)
                          (:discard (:todo "DONE"))))))))))
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;; ORG-TRANSCLUSION
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

;; Org-transclusion https://github.com/nobiot/org-transclusion
(use-package! org-transclusion
  :after org
  :init
  (map!
   :map global-map "C-ö C-h" #'org-transclusion-remove-all
   :map global-map "C-ö C-v" #'org-transclusion-add
   :leader
   :prefix "n"
   :desc "Org Transclusion Mode" "t" #'org-transclusion-mode))

;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;; ORG-ROAM
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

(use-package! org-roam
  :config
  (cl-defmethod org-roam-node-slug ((node org-roam-node))
    "Return the slug of NODE."
    (let ((title (org-roam-node-title node))
          (slug-trim-chars '(;; Combining Diacritical Marks https://www.unicode.org/charts/PDF/U0300.pdf
                             768 ; U+0300 COMBINING GRAVE ACCENT
                             769 ; U+0301 COMBINING ACUTE ACCENT
                             770 ; U+0302 COMBINING CIRCUMFLEX ACCENT
                             771 ; U+0303 COMBINING TILDE
                             772 ; U+0304 COMBINING MACRON
                             774 ; U+0306 COMBINING BREVE
                             775 ; U+0307 COMBINING DOT ABOVE
                             776 ; U+0308 COMBINING DIAERESIS
                             777 ; U+0309 COMBINING HOOK ABOVE
                             778 ; U+030A COMBINING RING ABOVE
                             779 ; U+030B COMBINING DOUBLE ACUTE ACCENT
                             780 ; U+030C COMBINING CARON
                             795 ; U+031B COMBINING HORN
                             803 ; U+0323 COMBINING DOT BELOW
                             804 ; U+0324 COMBINING DIAERESIS BELOW
                             805 ; U+0325 COMBINING RING BELOW
                             807 ; U+0327 COMBINING CEDILLA
                             813 ; U+032D COMBINING CIRCUMFLEX ACCENT BELOW
                             814 ; U+032E COMBINING BREVE BELOW
                             816 ; U+0330 COMBINING TILDE BELOW
                             817 ; U+0331 COMBINING MACRON BELOW
                             )))
      (cl-flet* ((nonspacing-mark-p (char) (memq char slug-trim-chars))
                 (strip-nonspacing-marks (s) (string-glyph-compose
                                              (apply #'string
                                                     (seq-remove #'nonspacing-mark-p
                                                                 (string-glyph-decompose s)))))
                 (cl-replace (title pair) (replace-regexp-in-string (car pair) (cdr pair) title)))
        (let* ((pairs `(("[^[:alnum:][:digit:]]" . "_") ;; convert anything not alphanumeric
                        ("__*" . "_")                   ;; remove sequential underscores
                        ("^_" . "")                     ;; remove starting underscore
                        ("_$" . "")))                   ;; remove ending underscore
               (slug (-reduce-from #'cl-replace (strip-nonspacing-marks title) pairs))) slug))))
  (setq org-roam-node-display-template
        (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (setq org-roam-capture-templates
        '(("d" "Default " plain
           "%?"
           :if-new (file+head "${slug}.org"
                              ":PROPERTIES:
:ROAM_ALIASES: ${slug}
:END:
#+title: ${title}
#+date: %<%Y-%m-%d>\n")
           :immediate-finish t
           :unnarrowed t)
          ("r" "reference" plain "%?"
           :if-new
           (file+head "${slug}.org" "#+title: ${title}\n")
           :immediate-finish t
           :unnarrowed t)))
  (require 'citar)
  (defun mho/org-roam-node-from-cite (keys-entries)
    (interactive (list (citar-select-ref :multiple nil :rebuild-cache t)))
    (let ((title (citar--format-entry-no-widths (cdr keys-entries)
                                                "${author editor} :: ${title}")))
      (org-roam-capture- :templates
                         '(("r" "reference" plain "%?" :if-new
                            (file+head "${citekey}.org"
                                       ":PROPERTIES:
:ROAM_REFS: @${citekey}
:END:
#+title: ${title}\n")
                            :immediate-finish t
                            :unnarrowed t))
                         :info (list :citekey (car keys-entries))
                         :node (org-roam-node-create :title title)
                         :props '(:finalize find-file)))))
(use-package! websocket
  :after org-roam)
(use-package! org-roam-ui
  :after org-roam ;; or :after org
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  ;;  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;; ORG-DEF
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

(use-package! deft
  :config
  (setq deft-directory org-roam-directory
        deft-recursive t
        deft-strip-summary-regexp ":PROPERTIES:\n\\(.+\n\\)+:END:\n"
        deft-use-filename-as-title t))

;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;; Mode-Line Settings
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

(display-time-mode 1)                             ; Enable time in the mode-line

(unless (string-match-p "^Power N/A" (battery))   ; On laptops...
  (display-battery-mode 1))                       ; it's nice to know how much power you have

;; Load whichkey a little faster
(setq which-key-idle-delay 0.5)

;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;; Keyboard Settings
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

(setq mac-option-modifier nil
      mac-command-modifier 'meta
      mac-right-command-modifier 'control
      mac-control-modifier 'super
      mac-function-modifier 'hyper)

;; Old depricated setting for mac keyboard bindings
;; https://nickdrozd.github.io/2019/12/28/emacs-mac-mods.html
;; setq ns-option-modifier nil
;;      ns-command-modifier 'meta
;;      ns-right-command-modifier 'control
;;      ns-control-modifier 'super
;;      ns-function-modifier 'hyper)

;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;; KEYBINDINGS
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
(global-set-key (kbd "C-å") 'sp-wrap-curly)
(global-set-key (kbd "C-ä") 'sp-up-sexp)
(global-set-key (kbd "M-w") 'save-buffer)

;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;; BIBLIOGRAPHY
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
(use-package citar
  :bind (("C-c b" . citar-insert-citation)
         :map minibuffer-local-map
         ("M-b" . citar-insert-preset))
  :custom
  (citar-bibliography '("~/Library/CloudStorage/Dropbox/mho_org-roam/0-mhoRef.bib"))
  (citar-notes-paths '("~/Library/CloudStorage/Dropbox/mho_org-roam")))
(require 'org-zotxt-noter)
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
