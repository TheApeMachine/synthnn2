-module(main).

-export([
  main/0,
  loop/2
]).

main() ->
  S = synthnn:new(),
  loop(0, S).

loop(T, S) ->
  loop(T + 1, S).
