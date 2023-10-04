;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
                     '(("n.video" "* [ ] Script\n* [ ] Video Recording\n* [ ] Voice Over\n* [ ] Thumbnail\n* [ ] Upload\n* [ ] Links\n  -\n" "new video" nil nil nil "/Users/markolson/Library/CloudStorage/Dropbox/mho_dot-files/.doom.d/snippets/org-mode/new video" nil nil)
                       ("lp" "**** PROJ Plan Lessons Week $1\n***** TODO M ma3c :ma3c:tk21:\n***** TODO M ma2b :ma2b:ek21b:\n***** TODO M mentor :tk22:\n***** TODO T prgm1 :prgm1:tk21:\n***** TODO T ma2c                                                 :tk22:ma2c:\n***** TODO W ma2c                                                 :ma2c:tk22:\n***** TODO W ma2c                                                 :ma2c:tk22:\n***** TODO W prgm1                                               :prgm1:tk21:\n***** TODO R ma3c                                                 :ma3c:na21:\n***** TODO R ma3c                                                 :ma3c:tk21:\n***** TODO R ma2c                                                 :ma2c:tk22:\n***** TODO F ma3c                                                 :ma3c:na21:\n***** TODO F ma2b                                                :ma2b:ek21b:\n$0" "lp_plan-lessons" nil nil nil "/Users/markolson/Library/CloudStorage/Dropbox/mho_dot-files/.doom.d/snippets/org-mode/lp_plan-lesson" nil nil)
                       (">iobjv" "${1:$$(yas-choose-value '(\"defn\" \"objv\"))}-${2:TagID}\n#+transclude: [[file:~/GitHub/mhoTeX/0-tex/tex_core-$2.tex]]\n- $0" "insert objv" t nil nil "/Users/markolson/Library/CloudStorage/Dropbox/mho_dot-files/.doom.d/snippets/org-mode/insert objv" nil nil)
                       ("ib.exam" "* Paper 1\n** TZ1\n-\n** TZ2\n-\n* Paper 2\n** TZ1\n-\n** TZ2\n-" "ib exam paper" nil nil nil "/Users/markolson/Library/CloudStorage/Dropbox/mho_dot-files/.doom.d/snippets/org-mode/ib exam paper" nil nil)))


;;; Do not edit! File generated at Fri Mar 31 10:54:32 2023
