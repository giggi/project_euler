(* ========================================================================
  If we list all the natural numbers below 10 that are multiples of 3 or 5,
  we get 3, 5, 6 and 9. The sum of these multiples is 23.
 
  Find the sum of all the multiples of 3 or 5 below 1000.
 ========================================================================*)

let select i =
  if i mod 3 = 0 || i mod 5 = 0 then i else 0

let _ =
  let rec loop  sum i n =
    if n <= i then print_int sum else
      loop (sum + select i) (i + 1) n in
  let problem1 n = 
    loop 0 0 n
  in problem1 1000
      
