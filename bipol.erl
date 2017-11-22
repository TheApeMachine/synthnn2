-module(bipol).

-export([
  set/2,
  get/2
]).

set(A, B) ->
  Ret = [A, B],
  Ret.

get(I, L) ->
  lists:nth(I + 1, L).
