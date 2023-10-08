;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
                     '(("width" "#+attr_html: :width ${1:500px}" "#+attr_html: :width ..." nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/width" nil nil)
                       ("verse" "#+begin_verse\n`%`$0\n#+end_verse" "verse" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/verse" nil "verse")
                       ("todo" "TODO ${1:task description}" "TODO item" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/todo" nil "todo")
                       ("src" "#+begin_src $1\n`%`$0\n#+end_src" "#+begin_src" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/src" nil "src")
                       ("quote" "#+begin_quote\n`%`$0\n#+end_quote" "quote block" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/quote" nil "quote")
                       ("n.video" "* [ ] Script\n* [ ] Video Recording\n* [ ] Voice Over\n* [ ] Thumbnail\n* [ ] Upload\n* [ ] Links\n  -\n" "new video" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/new video" nil nil)
                       ("name" "#+name: $0\n" "name" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/name" nil "name")
                       ("matrix" "\\left \\(\n\\begin{array}{${1:ccc}}\n${2:v1 & v2} \\\\\n`%`$0\n\\end{array}\n\\right \\)" "matrix" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/matrix" nil "matrix")
                       ("lp" "**** PROJ Plan Lessons Week $1\n***** TODO M ma3c :ma3c:tk21:\n***** TODO M ma2b :ma2b:ek21b:\n***** TODO M mentor :tk22:\n***** TODO T prgm1 :prgm1:tk21:\n***** TODO T ma2c                                                 :tk22:ma2c:\n***** TODO W ma2c                                                 :ma2c:tk22:\n***** TODO W ma2c                                                 :ma2c:tk22:\n***** TODO W prgm1                                               :prgm1:tk21:\n***** TODO R ma3c                                                 :ma3c:na21:\n***** TODO R ma3c                                                 :ma3c:tk21:\n***** TODO R ma2c                                                 :ma2c:tk22:\n***** TODO F ma3c                                                 :ma3c:na21:\n***** TODO F ma2b                                                :ma2b:ek21b:\n$0" "lp_plan-lessons" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/lp_plan-lesson" nil nil)
                       ("jupyter" "#+begin_src jupyter-${1:$$(yas-choose-value '(\"python\" \"julia\" \"R\"))}${2: :session $3}${4: :async yes}\n`%`$0\n#+end_src\n" "#+begin_src jupyter-..." nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/jupyter" nil "jupyter")
                       (">iobjv" "${1:$$(yas-choose-value '(\"defn\" \"objv\"))}-${2:TagID}\n#+transclude: [[file:~/GitHub/mhoTeX/0-tex/tex_core-$2.tex]]\n- $0" "insert objv" t nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/insert objv" nil nil)
                       ("srci" "src_${1:language}[${2:header}]{${0:body}}\n" "Inline Source" t nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/inline_source" nil "srci")
                       ("inl" "src_${1:language}${2:[${3::exports code}]}{${4:code}}" "inline code" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/inline" nil "inl")
                       ("img" "#+attr_html: :alt $2 :align ${3:left} :class img\n[[${1:src}]${4:[${5:title}]}]\n`%`$0" "img" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/img" nil "img")
                       ("ib.exam" "* Paper 1\n** TZ1\n-\n** TZ2\n-\n* Paper 2\n** TZ1\n-\n** TZ2\n-" "ib exam paper" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/ib exam paper" nil nil)
                       ("head" "#+title:     ${1:untitled document}\n#+author:    ${2:`user-full-name`}\n#+email:     ${3:`user-mail-address`}\n" "org-file header" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/head" nil "head")
                       ("fig" "#+caption: ${1:caption}\n#+attr_latex: ${2:scale=0.75}\n#+name: fig-${3:label}\n" "figure" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/figure" nil "fig")
                       ("export" "#+begin_export ${1:type}\n`%`$0\n#+end_export" "export" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/export" nil "export")
                       ("ex" "#+begin_example\n`%`$0\n#+end_example\n" "example" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/example" nil "ex")
                       ("entry" "#+begin_html\n---\nlayout: ${1:default}\ntitle: ${2:title}\n---\n#+end_html\n`%`$0" "entry" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/entry" nil "entry")
                       ("elisp" "#+begin_src emacs-lisp :tangle yes\n`%`$0\n#+end_src" "elisp" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/elisp" nil "elisp")
                       ("dot" "#+begin_src dot :file ${1:file}.${2:svg} :results file graphics\n`%`$0\n#+end_src" "dot" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/dot" nil "dot")
                       ("srcjs" "#+begin_src js :results output\n$0\n#+end_src\n" "custom js src code block" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/custom js src code block" nil nil)
                       ("【【" "[[$0]]\n" "chinese【" nil nil
                        ((yas-wrap-around-region
                          (ignore-errors
                            (fcitx--deactivate)))
                         (yas-after-exit-snippet-hook
                          (lambda nil
                            (ignore-errors
                              (fcitx--activate)))))
                        "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/chinese_link" nil "chinese_link")
                       ("￥￥" "\\$$1\\$ $0\n" "Chinese$" nil nil
                        ((yas-wrap-around-region
                          (ignore-errors
                            (fcitx--deactivate)))
                         (yas-after-exit-snippet-hook
                          (lambda nil
                            (ignore-errors
                              (fcitx--activate)))))
                        "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/chinese_dollar" nil "chinese_dollar")
                       ("blog" "#+startup: showall indent\n#+startup: hidestars\n#+begin_html\n---\nlayout: default\ntitle: ${1:title}\nexcerpt: ${2:excerpt}\n---\n$0" "blog" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/blog" nil "blog")
                       ("<v"
                        (progn
                          (doom-snippets-expand :uuid "verse"))
                        "#+begin_verse block" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/begin_verse" nil nil)
                       ("<s"
                        (progn
                          (doom-snippets-expand :uuid "src"))
                        "#+begin_src ... block" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/begin_src" nil nil)
                       ("<q"
                        (progn
                          (doom-snippets-expand :uuid "quote"))
                        "#+begin_quote block" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/begin_quote" nil "<q")
                       ("<l" "#+begin_export latex\n`%`$0\n#+end_export\n" "#+begin_export latex block" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/begin_export_latex" nil "<l")
                       ("<h" "#+begin_export html\n`%`$0\n#+end_export\n" "#+begin_export html block" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/begin_export_html" nil "<h")
                       ("<a" "#+begin_export ascii\n`%`$0\n#+end_export\n" "#+begin_export ascii" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/begin_export_ascii" nil "<a")
                       ("<E"
                        (progn
                          (doom-snippets-expand :uuid "export"))
                        "#+begin_export ... block" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/begin_export" nil nil)
                       ("<e" "#+begin_example\n`%`$0\n#+end_example\n" "#+begin_example block" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/begin_example" nil "<e")
                       ("<c" "#+begin_comment\n`%`$0\n#+end_comment\n" "#+begin_comment block" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/begin_comment" nil "<c")
                       ("<C" "#+begin_center\n`%`$0\n#+end_center\n" "#+begin_center block" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/begin_center" nil "<C")
                       ("begin" "#+begin_${1:type} ${2:options}\n`%`$0\n#+end_$1" "begin" nil nil nil "/Users/molsonse/Library/CloudStorage/Dropbox/mho_dot-files/doom/snippets/org-mode/begin" nil "begin")))


;;; Do not edit! File generated at Thu Oct  5 15:35:20 2023
