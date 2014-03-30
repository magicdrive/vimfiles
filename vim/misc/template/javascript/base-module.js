;(function() {

  "use strict;";

  var root = this;

  var Module = funciton() {
    self = this;
  };

  if (typeof exports !== 'undefined') {
    if (typeof module !== 'undefined' && module.exports) {
      exports = module.exports = Module;
    }
    exports.Module = Module;
  } else {
    root.Module = Module;
  }



}).call(this);
