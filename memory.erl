-module(memory).

-export([
  new/1,
  search/3
]).

new(X) ->
  [
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
  ].

search([], I, M) ->
  M;

search([H|T], I, N) ->
  search(T, I, N).
