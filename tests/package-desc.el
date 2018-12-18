(require 'package)

(defvar tests-target-files nil)

(ert-deftest test-package-desc ()
  (dolist (el tests-target-files)
    ;; (message "Loading info: %s"
    ;;          el)
    (with-temp-buffer
      (insert-file-contents el)
      ;; (message "%S"
      (package-buffer-info)
      ;; )
      )))
