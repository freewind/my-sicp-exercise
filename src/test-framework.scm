(define display-all-on-line
  (lambda args
    (for-each display args)
    (newline)))

(define (list-and list)
  (if (null? list)
    #t
    (and (car list))))

(define (test-with-cases function-to-test test-cases)
  (let*
    (
      (test-statuses
        (map
          (lambda (test-case) (test-with-case function-to-test test-case))
          test-cases))
      (all-tests-passed (list-and test-statuses))
    )
    (if all-tests-passed
      (display-all-on-line "\n" "All tests for " function-to-test " passed." "\n"))))

(define (test-with-case function-to-test test-case)
  (let*
    (
      (input-args (first test-case))
      (desired-output (second test-case))
      (actual-output (apply function-to-test input-args))
    )
    (if (equal? desired-output actual-output)
      #t
      (begin
        (display-all-on-line "\n" function-to-test " failure for inputs " input-args " - expected " desired-output ", got " actual-output "\n")
        #f))))