-module(bipol).

-export([
  set/2,
  get/2,
  val/1,
  normalize/1,
  random/1,
  brandom/0
]).

% Set the values of a new bipol.
set(A, B) ->
  if A + B > 100 ->
    throw(bipol_overflow);
  true ->
    Ret = [A, B],
    Ret
  end.

% Get the value at the index of the bipol.
get(I, L) ->
  lists:nth(I + 1, L).

% Get the boolean value of a bipol. If the bipol is in a balanced state, a random boolean value
% will be returned.
val(L) ->
  A = get(0, L),
  B = get(1, L),

  case A =:= B of
    true  -> lists:nth(rand:uniform(2), [true, false]);
    false -> A > B
  end.

% Normalizes a bipol to add up to 100.
normalize(L) ->
  A = get(0, L),
  B = get(1, L),

  case A + B >= 100 of
    true  -> throw(bipol_already_normalized);
    false ->
      C = (100 - (A + B)) / 2,
      Y = [A + C, B + C],
      Y
  end.

% Gets a value from the nipol at a random index.
random(L) ->
  get(rand:uniform(2) - 1, L).

% Returns a random boolean value.
brandom() ->
  lists:nth(rand:uniform(2), [true, false]).
