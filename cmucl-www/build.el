;;; build.el --- build process for CMUCL website
;;
;; Author: Eric Marsden <emarsden@laas.fr>
;;
;;
;; This script is used by the build process which transfers files from
;; CVS to the web staging area. It looks after certain conversions such as
;; last-modified information, footers, etc.
;;
;; @@URL@@ -> URL of this file
;; @@DATE@@ -> ISO-8601 date
;; @@FOOTER@@ -> include/footer.html
;; @@DTD@@
;; @@METAS@@ -> stylesheet, author info for <meta>
;; @@JUMPBAR@@
;;
;;
;; The script will normally only update files which are more recent
;; than the version in the staging directory. This can be overridden
;; by touching a file named "/tmp/build-el-force".
;;
;; TODO: items in the jumpbar are listed in alphabetical order instead
;; of relevance.
;;
;; Run this as
;;
;;      emacs -batch -q -l build.el -f wb-make



(require 'cl)

;; What should be our base url?  The "official" site is www.cons.org.
;; But we now have www.cmucl.org too.  But the "source" to all of
;; these sites is common-lisp.net.  Let's make that the base url since
;; that is, by definition, the most up-to-date site.  This is also
;; useful for checking links and such since the site is always
;; up-to-date compared to the others.
(defconst wb-base-url "https://www.common-lisp.net/project/cmucl/")
;;(defconst wb-base-url "http://www.cmucl.org/")
;;(defconst wb-base-url "http://www.cons.org/cmucl/")
;; (defconst wb-doc-url  "ftp://ftp.linux.org.uk/pub/lisp/cmucl/doc/")
(defconst wb-doc-url  "http://common-lisp.net/project/cmucl/downloads/doc/")
(defconst wb-target-dir "../../public/")
(defconst wb-base-directory default-directory)

;; these override names which are otherwise generated automatically
;; from a filename.
(defvar wb-jumpbar-titles
  '(("index" . "Home")
    ("doc" . "Documentation")))

(defvar wb-printable nil)

(defun wb-printable-name (filename)
  (if (string-match "\\`\\(.*\\).html\\'" filename)
      (concat (match-string 1 filename) "-print.html")
    filename))

(defun wb-capitalize-first (str)
  (if (string= "" str) str
    (concat (upcase (substring str 0 1))
            (substring str 1))))

;; do the equivalent of a `find . -name "*.html" -print'
(defun wb-find-files (dirname)
  (let (found)
    (loop with dir = (file-name-as-directory dirname)
          for file in (directory-files dir)
          if (and (file-directory-p file)
                  (not (string-match "^\\." file)))
          do (mapcar `(lambda (f) (push (concat ,file "/" f) found))
                     (wb-find-files file))
          ;; (setf found (append (wb-find-files file) found))
          if (or (string-match "\\.html\\'" file)
                 (string-match "\\.txt\\'" file)
                 (string-match "\\.css\\'" file)
		 (string-match "\\.inc\\'" file)
		 (string-match "\\.jpg\\'" file))
          do (push file found)
          finally return found)))

;; some protection from spam harvesters
(defun wb-munge-email (email)
  (concat "<tt>&lt;"                    ;
          (if (string-match "@" email)
              (replace-match "&#64;" t t email)
            email)
          "&gt;</tt>"))

;; when we're at PATH-COMPONENTS, what we have to prefix to get home.
(defun wb-home-as-relative-url (path-components)
  (let ((p (loop for path in path-components
	     unless (string-match "\\.html\\'" path)
	     concat "../")))
    ;; Remove the first "../" because one too many.
    (if (listp p)
	(cdr p)
      p)))

;; generate a title string for STR, from the information in
;; `wb-jumpbar-titles' if present, else defaulting to the file's
;; basename with the first letter Capitalized. If STR starts with a #\: character, 
(defun wb-description (str)
  (when (string-match "\\.html\\'" str)
    (setq str (replace-match "" t t str)))
  (let ((assoc (assoc str wb-jumpbar-titles)))
    (if assoc (cdr assoc)
        (wb-capitalize-first str))))

(defun wb-split-string-stub (string &optional separators)
  "Splits STRING into substrings where there are matches for SEPARATORS.
Each match for SEPARATORS is a splitting point.
The substrings between the splitting points are made into a list
which is returned.
If SEPARATORS is absent, it defaults to \"[ \\f\\t\\n\\r\\v]+\"."
  (let ((rexp (or separators "[ \f\t\n\r\v]+"))
        (start 0)
        (list nil))
    (while (string-match rexp string start)
      (or (eq (match-beginning 0) 0)
          (setq list
                (cons (substring string start (match-beginning 0))
                      list)))
      (setq start (match-end 0)))
    (or (eq start (length string))
        (setq list
              (cons (substring string start)
                    list)))
    (nreverse list)))

(if (fboundp 'split-string)
    (defalias 'wb-split-string #'split-string)
  (defalias 'wb-split-string #'wb-split-string-stub))

;; split "./doc/internal/comp.html" into '("doc" "internal" "comp.html")
(defun wb-path-components (filename)
  ;; split any trailing `index.html' or leading `./'
  
  ;; XXX: I (rtoy) don't know why when is needed.  What makes
  ;; index.html special?
  
  ;;(when (string-match "index\\.html\\'" filename)
  ;;  (setq filename (replace-match "" t t filename)))
  (when (string-match "^\\./" filename)
    (setq filename (replace-match "" t t filename)))
  (wb-split-string filename "/"))

;; here filename can be like `./doc/index.html' or `support.html'
(defun wb-make-heading (filename args)
  (let* ((heading (wb-description args))
         (path-components (wb-path-components filename)))
    (unless wb-printable (wb-do-jumpbar filename))
    (insert "<!-- begin heading -->\n")
    (insert "<!-- path-components: ")
    (apply 'insert path-components)
    (insert " -->\n")
    (insert "<table width=\"100%\" bgcolor=\"#99CC99\">\n")
    (insert "  <tr><td>\n")
    (insert "  <font face=\"Helvetica\" size=\"+2\">\n")
    ;; we have to special case the first element
    (cond ((null path-components)
           (insert "<strong>CMUCL</strong>"))

          ((= 1 (length path-components))
           (insert "&nbsp;<strong>"
                   (wb-description (first path-components))
                   "</strong>"))

           ;; the beforelast path component, eg "/doc/index.html" -> wb-description for "doc"
          (t
           (insert "&nbsp;<strong>")
           (insert (wb-description (first (last path-components 2))))
           (insert "</strong>")))
    (unless (zerop (length args))
      (insert ": "))
    (insert args)
    (insert "\n</font>\n")
    (insert "   </td></tr>\n</table>\n")
    (insert "<!-- end heading -->\n")))


;; A file named "target.html" will be included in the jumpbar as <a
;; href="target.html">Target</a>, where the visible name "Target" can
;; be overridden by providing an entry for "target" in the alist
;; `wb-jumpbar-titles'.
;;
;; A directory `doc/' will be included in the jumpbar as <a
;; href="/doc/">Doc</a>, where `Doc' can be overridden by
;; `wb-jumpbar-titles', on the condition that the directory contains a
;; file named `index.html'.
(defun wb-do-jumpbar (here)
  (let* ((files (directory-files "." nil "^[^\\.]"))
         (path-to-here (wb-path-components here))
         (url-to-here (wb-home-as-relative-url path-to-here)))
    (if wb-printable
        (insert "<center>\n")
      (wb-insert-file "include/header-start.inc"))
    (insert "<!-- start jumpbar -->\n")
    (loop for file in files
          ;; unless (string= file (buffer-name))
          if (string-match "\\.html\\'" file) do
          (unless wb-printable (insert "   <tr align=\"center\"><td>"))
          (insert "<a href=\"" url-to-here file "\">")
          (insert (wb-description (file-name-sans-extension file)) "</a>")
          (if wb-printable
              (insert "&nbsp;&middot;&nbsp;")
            (insert "</td></tr>\n"))
          if (and (file-directory-p file)
                  (file-exists-p (concat (file-name-as-directory file)
                                  "index.html"))) do
          (unless wb-printable (insert "   <tr align=\"center\"><td>"))
          (insert "<a href=\"" url-to-here)
          (insert (file-name-as-directory file) "index.html\">")
          (insert (wb-description file) "</a>")
          (if wb-printable
              (insert "&nbsp;&middot;&nbsp;")
            (insert "</td></tr>\n")))
    (insert "\n<!-- end jumpbar -->\n")
    (if wb-printable
        (insert "</center>\n")
      (wb-insert-file "include/header-end.inc"))))

(defun wb-frob-buffer (filename)
  (let* ((path-to-here (wb-path-components filename))
         (url-to-here (wb-home-as-relative-url path-to-here)))
    (when (string-match "^\\./" filename)
      (setq filename (replace-match "" t t filename)))

    ;; @@DTD@@
    (goto-char (point-min))
    (while (search-forward "@@DTD@@" nil t)
      (replace-match "" nil t)
      (insert-file-contents "include/dtd.inc"))

    ;; @@METAS@@
    (goto-char (point-min))
    (while (search-forward "@@METAS@@" nil t)
      (replace-match "" nil t)
      (insert-file-contents "include/metas.inc"))

    ;; @@FOOTER@@
    (goto-char (point-min))
    (while (search-forward "@@FOOTER@@" nil t)
      (replace-match "" nil t)
      (when wb-printable (wb-do-jumpbar filename))
      (insert-file-contents "include/footer.inc")
      (unless wb-printable
        (insert "</td></tr></table>\n")
        (insert "<a href = \""
                url-to-here
                (wb-printable-name filename)
                "\">Printable version of this page</a>\n")))

    ;; @@HEADING(description)
    (goto-char (point-min))
    (while (re-search-forward "@@HEADING(\\([^)]*\\))" nil t)
      ;; convolution since replace-match squishes match-string
      (let ((args (match-string 1)))
        (replace-match "" nil t)
        (wb-make-heading filename args)))

    ;; @@EMAIL(whoever@foo.bar)
    (goto-char (point-min))
    (while (re-search-forward "@@EMAIL(\\([^)]+\\))" nil t)
      (let ((arg (match-string 1)))
        (replace-match "" nil t)
        (insert (wb-munge-email arg))))

    ;; @@DATE@@
    (goto-char (point-min))
    (while (search-forward "@@DATE@@" nil t)
      (replace-match "" nil t)
      (insert (format-time-string "%Y-%m-%d")))

    ;; @@URL@@
    (goto-char (point-min))
    (while (search-forward "@@URL@@" nil t)
      (replace-match "" nil t)
      (insert wb-base-url)
      (insert filename))

    ;; @@HOME@@ -- relative path to base href
    (goto-char (point-min))
    (while (search-forward "@@HOME@@" nil t)
      (replace-match "" nil t)
      (insert url-to-here))

    ;; @@BASE@@ -- absolute path (with http://) to base href
    (goto-char (point-min))
    (while (search-forward "@@BASE@@" nil t)
      (replace-match "" nil t)
      (insert wb-base-url))

    ;; @@DOC@@
    (goto-char (point-min))
    (while (search-forward "@@DOC@@" nil t)
      (replace-match "" nil t)
      (insert wb-doc-url))

    ;; @@JUMPBAR@@
    (goto-char (point-min))
    (while (search-forward "@@JUMPBAR@@" nil t)
      (replace-match "" nil t)
      (unless wb-printable (wb-do-jumpbar filename)))))

(defun wb-insert-file (filename)
  "Like `insert-file-contents' but advance point."
  (narrow-to-region (point) (point))
  (insert-file-contents filename)
  (goto-char (point-max))
  (widen))

;; this is for when we are run on a single file, at top level
(defun wb-run ()
  (wb-frob-buffer)
  (write-file (concat wb-target-dir (buffer-name))))

;; this is for when we do the make process ourselves. The fiddling
;; with default-directory is necessary to make inclusions work
;; (without sticking hard wired absolute pathnames in the script).
(defun wb-make ()
  (interactive)
  (let ((make-backup-files nil))
    (loop for file in (wb-find-files ".")
          for target = (concat wb-target-dir file)
          for this-dir = default-directory
          do (message "Considering file %s" file)
          if (or (not (file-exists-p target))
                 (file-newer-than-file-p file target)
                 (file-exists-p "/tmp/build-el-force")
                 current-prefix-arg)
          do
          (message "%s -> %s" file target)
          (find-file file)
          (setq default-directory this-dir)
          (wb-frob-buffer file)
          ;; ensure-directories-exist
          (make-directory (file-name-directory target) t)
          (write-file target)
          ;;(set-file-modes target #o664)
          (kill-buffer nil)
          ;; now do a printable version of the file
          ;; replace ".html" by "-print.html" in the filename
          (setq target (wb-printable-name target))
          (find-file file)
          (setq default-directory this-dir)
          (let ((wb-printable t))
            (wb-frob-buffer file))
          (write-file target)
          ;;(set-file-modes target #o664)
          (kill-buffer nil))))


;;; build.el ends here
