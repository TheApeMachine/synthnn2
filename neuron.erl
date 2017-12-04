-module(neuron).

-export([
  new/0,
  process/2
]).

% Generate a new structure of values for a neuron.
% By position in the list the values are defined as follows:
%
% A: Amplitude
% F: Frequency
% P: Phase
% V: Value (current)
% B: Bipol (as boolean)
new() ->
  [
    rand:uniform(),
    rand:uniform(),
    rand:uniform(),
    rand:uniform(),
    bipol:brandom()
  ].

% Run the sine wave function for this neuron and return its value.
% Returns as a complete neuron structure.
process(N, T) ->
  [
    lists:nth(1, N),
    lists:nth(2, N),
    lists:nth(3, N),
    lists:nth(1, N) * math:sin(
      2 * math:pi() * lists:nth(2, N) * T
    ) + lists:nth(3, N),
    lists:nth(5, N)
  ].
