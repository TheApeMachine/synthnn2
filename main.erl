-module(main).

-export([
  main/0,
  loop/2
]).

main() ->
  S = synthnn:new(2),
  io:fwrite("~w\n", [S]).
  % loop(0, S).

loop(T, S) ->
  loop(T + 1, S).
