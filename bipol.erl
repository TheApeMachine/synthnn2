-module(bipol).

-export([
  set/2,
  get/2
]).

set(A, B) ->
  if A + B > 100 ->
    throw(bipol_overflow);
  true ->
    Ret = [A, B],
    Ret
  end.

get(I, L) ->
  lists:nth(I + 1, L).
