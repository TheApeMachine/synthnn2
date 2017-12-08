-module(main).

-export([
  main/0,
  loop/2,
  process/3
]).

% Build a new network, passing in the amount of available senses, and start
% the main loop.
main() ->
  S = synthnn:new(2),

  inets:start(),
  {ok, {{Version, 200, ReasonPhrase}, Headers, Body}} = httpc:request("http://www.erlang.org"),

  B = re:replace(Body, "<\s*script\s*>|<\s*\/\s*script\s*>", "", [global, {return, list}]),
  A = re:replace(B, "<\/?[^>]*>|\n|\t", "", [global, {return, list}]),

  io:fwrite("~p", [string:strip(A)]),
  loop(0, S).

% Main loop to run the network in real-time, and generate a time (T) tick for
% the neuron sine waves.
loop(100, S) ->
  S;

loop(T, S) ->
  X = process(S, T, []),
  % io:fwrite("~w\n", [X]),
  loop(T + 1, X).

process([], Tx, L) ->
  L;

process([H|T], Tx, L) ->
  X = L ++ [neuron:process(H, Tx)],
  process(T, Tx, X).
