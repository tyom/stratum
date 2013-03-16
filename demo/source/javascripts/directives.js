angular.module('directives', [])

  .directive('testCase', function($compile, $http, $templateCache) {
    return {
      restrict: 'A',
      scope: true,
      // Menu controller
      controller: function($scope, $element, $attrs) {
        $scope.toggle = function(option, group) {
          if(!option.instructions) { return; }

          var instructions = option.instructions;
          var others = [];

          if(group) {
            _.each(group, function(groupOption) {
              var different = _.difference(groupOption.instructions, instructions);
              if(different.length) {
                others.push(different);
              }

              if(!option.active) {
                groupOption.active = false;
              }
            });
            // Unset other modifiers in the group
            _.each(others, function(instructions) {
              _.each(instructions, function(instruction) {
                $('#' + instruction.id).removeClass(instruction.modifier);
              });
            });
          }
          // Process option instructions
          angular.forEach(instructions, function(instruction) {
            $('#' + instruction.id).toggleClass(instruction.modifier);
          });

          option.active = !option.active;
        };
      },
      // Add options menu to `<header>`
      compile: function($element) {
        var menu = $http.get('partials/options-menu.html', { cache: $templateCache }).success(function(html) {
          return html;
        });
        var header = $element.find('header');

        if(header.length === 0) {
          throw 'Test cases must have <header> element to attach menu.';
        }

        return function($scope, $element) {
          menu.then(function(res) {
            $element.find('header').append($compile(res.data)($scope));
          });
        };
      }
    };
  })

  .directive('reactTo', function() {
    return {
      restrict: 'A',
      controller: function($scope, $element, $attrs) {
        $scope.options = $scope.options || {};
        if(!$scope.$parent.parseRules) {
          throw '`test-case` attribute must be specified on container when `react-to` directives are used';
        }
        var elOptions = $scope.$parent.parseRules($attrs.reactTo, $element, $scope.options);
        _.extend($scope.options, elOptions);
      }
    };
  })

  .directive('debugResponsive', function() {
    return {
      restrict: 'E',
      replace: true,
      templateUrl: 'partials/debug-responsive.html',
      link: function($scope, $element) {
        var setDimensions = function() {
          $scope.viewportWidth = window.innerWidth;
          $scope.viewportHeight = window.innerHeight;
          $scope.viewportX = window.innerWidth;
          $scope.viewportY = window.innerHeight;
          $scope.windowWidth = window.outerWidth;
          $scope.windowHeight = window.outerHeight;
          $scope.deviceWidth = window.screen.width;
          $scope.deviceHeight = window.screen.height;
          $scope.orientation = window.orientation;
        };

        $(window).on('resize', function() {
          $scope.$apply(setDimensions);
        });

        setDimensions();
      }
    };
  });
