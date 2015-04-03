(*
 * Module: Test_Sendmail_List
 * Provides unit tests for the <Sendmail_List> lens.
 *
 *)

module Test_Sendmail_List =

(* Test 1 *)
let t1 = "example.org
"

test Sendmail_List.lns get t1 =
     { "key" = "example.org" }


(* Test 2 *)
let t2 = "example.org

example.com
"

test Sendmail_List.lns get t2 =
     { "key" = "example.org" }
     {}
     { "key" = "example.com" }


(* Test 3 *)
let t3 = "example.org
# A comment
example.com
"

test Sendmail_List.lns get t3 =
     { "key" = "example.org" }
     { "#comment" = "A comment" }
     { "key" = "example.com" }


(* Test 4 *)
let t4 = "# A comment
example.com
"

test Sendmail_List.lns get t4 =
     { "#comment" = "A comment" }
     { "key" = "example.com" }


(* Test 5 *)
let t5 = "example.com
# A comment
"

test Sendmail_List.lns get t5 =
     { "key" = "example.com" }
     { "#comment" = "A comment" }