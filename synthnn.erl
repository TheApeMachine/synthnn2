-module(synthnn).

-export([
  new/0,
  read/2
]).

new() ->
  io:fwrite("START\n"),
  read("This is great!", 1).

read([], _) ->
  io:fwrite("\n");

read([H|T], _) ->
  io:fwrite("~s-~p-", [[H], [neuron:process(H)]]),
  read(T, 1).
