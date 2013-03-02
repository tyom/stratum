angular.module('filters', [])
  .filter('isEmpty', function() {
    return function(value) {
      if(!value) { return; }

      if(value.length) {
        return !value.length;
      } else {
        return !Object.keys(value).length;
      }
    };
  });
