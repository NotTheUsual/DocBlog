'use strict';

var previewApp = angular.module('previewApp', []);

previewApp.controller('PostCtrl', ['$scope', function($scope) {
  $scope.output = "";

  Dropzone.options.postDropzone = {
    maxFiles: 1,
    success: function(file, response) {
      $scope.output = JSON.parse(response).post.body;
      $scope.$digest();
    }
  }
  $scope.text = '### Header';
}]);

previewApp.filter('markdown',['$sce', function ($sce) {
  return function (value) {
    var converter = new Showdown.converter();
    var html = converter.makeHtml(value || '');
    return $sce.trustAsHtml(html);
  };
}]);
