-module(synthnn).

-export([
  synthnn/0
]).

synthnn() ->
  Test = bipol:set(30, 70),
  io:format("~p\n", [bipol:get(0, Test)]),
  io:fwrite("test\n").
