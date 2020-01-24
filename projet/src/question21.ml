open Zach;;
open Samplegraph;;
open Girvan;;


girvan_newman g1 2;;
Zach.dot_output g1 "graphs/g1.dot";;