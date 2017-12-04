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
  case A + B > 100 of
    true  -> throw(bipol_overflow);
    false ->
      [A, B]
  end.

% Get the value at the index of the bipol.
get(I, L) ->
  lists:nth(I + 1, L).

% Get the boolean value of a bipol. If the bipol is in a balanced state,
% a random boolean value will be returned.
val(L) ->
  A = get(0, L),
  B = get(1, L),

  case A =:= B of
    true  -> brandom();
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
      [A + C, B + C]
  end.

% Gets a value from the bipol at a random index.
random(L) ->
  get(rand:uniform(2) - 1, L).

% Returns a random boolean value.
brandom() ->
  lists:nth(rand:uniform(2), [true, false]).
