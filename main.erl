-module(main).

-export([
  main/0,
  loop/2,
  process/3
]).

main() ->
  S = synthnn:new(2),
  io:fwrite("~w\n", [S]),
  loop(0, S).

% Main loop to run the network in real-time, and generate a time (T) tick for
% the neuron sine waves.
loop(T, S) ->
  X = process(S, T, []),
  io:fwrite("~w\n", [X]).
  % loop(T + 1, S).

process([], Tx, L) ->
  L;

process([H|T], Tx, L) ->
  X = L ++ [neuron:process(H, Tx)],
  process(T, Tx, X).
