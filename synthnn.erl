-module(synthnn).

-export([
  new/1,
  build/2
]).

new(N) ->
  io:fwrite("START\n"),
  build(N, []).

build(0, S) ->
  S;

build(N, S) ->
  T = S ++ [neuron:new()],
  build(N - 1, T).
