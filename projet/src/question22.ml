open Zach;;
open Zachgraph;;
open Girvan;;


girvan_newman karate 2;;
Zach.dot_output karate "graphs/karate.dot";;