#lang racket

(require net/http-client net/url file/zip)
(require (planet neil/json-parsing:2:0))
(require (planet neil/csv:2:0))

(define mbta-feed-info-url
  (string->url "http://www.mbta.com/uploadedfiles/feed_info.txt"))

(define mbta-schedules-url 
  (string->url "http://www.mbta.com/uploadedfiles/MBTA_GTFS.zip"))

;;; http://stackoverflow.com/questions/16698465/issue-an-http-get-from-repl-in-racketom/questions/16698465/issue-an-http-get-from-repl-in-racket
(define (urlopen url)
  (call/input-url
   (string->url url)
   (curry get-pure-port #:redirections 5)
   port->string))

