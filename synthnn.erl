-module(synthnn).

-export([
  synthnn/0
]).

synthnn() ->
  Test1 = bipol:set(50, 10),
  Test2 = bipol:normalize(Test1),
  Test3 = bipol:random(Test2),
  Test4 = bipol:brandom(),

  io:format("~p\n", [Test4]),
  io:fwrite("test\n").
