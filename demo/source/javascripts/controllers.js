angular.module('controllers', [])
  .controller('TestCases', function($scope, $http) {
    $scope.parseRules = function(string, targetEl, caseOptions) {
      var rules = string.split(/,?\s/);
      var id = _.uniqueId('E-');

      targetEl.attr('id', id);

      _.each(rules, function(rule) {
        var parts = rule.split(':');

        var keys  = _.initial(parts);
        var key   = keys[0];
        var group = keys[1] || null;
        var mod   = _.last(parts);

        var option = caseOptions[key] = caseOptions[key] || {};
        var instruction = { modifier: mod, id: id };

        if(group) {
          option.group = option.group || {};
          option = option.group[group] = option.group[group] || [];
          option.label = key + ' ' + (+group + 1);
        } else {
          option.label = key;
        }

        option.instructions = option.instructions || [];
        option.instructions.push(instruction);
      });

      return caseOptions;
    };
  });
