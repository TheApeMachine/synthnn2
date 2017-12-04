-module(neuron).

-export([
  new/1,
  process/2
]).

% Generate a new structure of values for a neuron.
new(T) ->
  [
    rand:uniform(),
    rand:uniform(),
    rand:uniform()
  ].

% Run the sine wave function for this neuron and return its value.
process(N, T) ->
  lists:nth(1, N) * math:sin(
    2 * math:pi() * lists:nth(2, N) * T
  ) + lists:nth(3, N).
