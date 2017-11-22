-module(synthnn).

-export([
  synthnn/0
]).

synthnn() ->
  Test = bipol:set(30, 71),
  io:format("~p\n", [bipol:get(1, Test)]),
  io:fwrite("test\n").
