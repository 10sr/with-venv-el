(require 'with-venv)

(defvar test-dir
  (expand-file-name (concat default-directory
                            "tests/")))

(ert-deftest test-with-venv-dir ()
  "Check if 'with-venv-dir` works."
  (let ((venv-dir (concat test-dir
                          "venv") )
        (expected-bin (concat test-dir
                              "venv/bin"))
        (expected-python (concat test-dir
                          "venv/bin/python")))
    (with-venv-dir venv-dir
      (should (member expected-bin exec-path))
      (should (string= (getenv "VIRTUAL_ENV")
                       (concat venv-dir "/")))
      (should (member expected-bin
                      (split-string (getenv "PATH")
                                    ":")))
      (should (not (getenv "PYTHONHOME")))

      (should (string= (executable-find "python")
                       expected-python)))
    (should (not (string= (or (executable-find "python") "")
                          expected-python)))))

(ert-deftest test-with-venv ()
  "Check if 'with-venv` works."
  (let ((expected (concat test-dir
                          "venv/bin/python"))
        (with-venv-find-venv-dir-functions '(with-venv-find-venv-dir-venv)))
    (with-temp-buffer
      (cd test-dir)
      (with-venv
        (should (string= (executable-find "python")
                         expected)))
      (should (not (string= (or (executable-find "python") "")
                            expected))))))


(ert-deftest test-with-venv-info-mode ()
  "Test that `with-venv-info-mode' can be enabled successfully."
  (with-venv-info-mode 1))
