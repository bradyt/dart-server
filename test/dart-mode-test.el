;;; dart-mode-test.el --- Tests for dart-mode

(require 'dart-server)

(ert-deftest dart-test ()
  (let ((file (make-temp-file "analysis")))
    (dart-server-add-analysis-root-for-file file)
    (let ((proc (dart-server--analysis-server-process
		 dart-server--analysis-server)))
      (accept-process-output proc)
      (accept-process-output proc)
      (accept-process-output proc 8))))

;;; dart-mode-test.el ends here
