-module(main).

-export([
  main/0,
  loop/2,
  process/3,
  readlines/1,
  get_all_lines/1
]).

% Build a new network, passing in the amount of available senses, and start
% the main loop.
main() ->
  S = synthnn:new(2),
  L = readlines("/home/theapemachine/data/stories/1.txt"),
  process(L, S, []).

% Main loop to run the network in real-time, and generate a time (T) tick for
% the neuron sine waves.
loop(100, S) ->
  Z = re:replace(io:get_line(">"), "\n|\r", "", [global, {return, list}]);

loop(T, S) ->
  X = process(S, T, []),
  % io:fwrite("~w\n", [X]),
  loop(T + 1, X).

process([], Tx, L) ->
  L;

process([H|T], Tx, L) ->
  X = L ++ [neuron:process(H, Tx)],
  process(T, Tx, X).

readlines(FileName) ->
  {ok, Device} = file:open(FileName, [read]),
  try get_all_lines(Device)
    after file:close(Device)
  end.

get_all_lines(Device) ->
  case io:get_line(Device, "") of
    eof  -> [];
    Line -> Line ++ get_all_lines(Device)
  end.
