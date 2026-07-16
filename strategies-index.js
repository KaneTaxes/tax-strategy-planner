/* ============================================================================
 * STRATEGY LIBRARY REGISTRY
 * Each strategy file pushes its object onto TSIQ.strategyModules; this file
 * finalizes the library. To add a strategy: create one file in
 * js/data/strategies/, then run `node scripts/build-index.js` (regenerates the
 * script tags in index.html) and `node scripts/validate-strategies.js`.
 * Nothing else changes — the UI and renderers are fully data-driven.
 * ==========================================================================*/
window.TSIQ = window.TSIQ || {};

TSIQ.STRATEGIES = (TSIQ.strategyModules || []).slice().sort(function (a, b) {
  return a.name.localeCompare(b.name);
});

TSIQ.getStrategy = function (id) {
  for (var i = 0; i < TSIQ.STRATEGIES.length; i++) {
    if (TSIQ.STRATEGIES[i].id === id) return TSIQ.STRATEGIES[i];
  }
  return null;
};
