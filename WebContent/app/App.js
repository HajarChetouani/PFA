
var myApp = angular.module('myApp',['AngularChart','ngRoute']);
myApp.controller('Ctrl1', function($scope, $http) {

        $scope.items = [];
        $scope.itemsE = [];
        $scope.velocities = [];
        $scope.velocitiesE = [];
        $scope.anomalies = [];
        $scope.anomaliesE = [];

        $scope.addRow= function() {
           
            $scope.items.push({ 'ndp':$scope.ndp, 'np': $scope.np, 'nj':$scope.nj, 'an':$scope.an});
            $scope.velocities.push($scope.ndp/($scope.np*$scope.nj));
            $scope.anomalies.push(($scope.nj * $scope.np)/$scope.an);
            

        }
        $scope.addRowE= function() {
            
            
            $scope.itemsE.push({ 'ndpe':$scope.ndpe, 'npe': $scope.npe, 'nje':$scope.nje, 'ane':$scope.ane});
            
            $scope.velocitiesE.push($scope.ndpe/($scope.npe*$scope.nje));
            
            $scope.anomaliesE.push(($scope.nje * $scope.npe)/$scope.ane);

        }
        
    $scope.ndp=null;
    $scope.np=null;
    $scope.nj=null;
    $scope.an=null;
    $scope.ndpe=null;
    $scope.npe=null;
    $scope.nje=null;
    $scope.ane=null;
   
 $scope.$watchGroup(['ndp','np','nj','an','velocity','ndpe','npe','nje','ane'], function(){

  var vel = $scope.velocities;
  var velE = $scope.velocitiesE;
  var ano = $scope.anomalies;
  var anoE = $scope.anomaliesE;
  console.log($scope.velocities);
        var data = {"xData": ["1", "2", "3", "4","5","6","7"],
                    "yData":[{
        
                         "name": "RealVelocity",
                         "data": vel  },
                         {
                         "name": "EstimatedVelocity",
                        "data": velE}
                         ]}

        var data1 = {
        		"xData": ["1", "2", "3", "4","5","6","7"],
        		"yData":[{
            
		            "name": "Completed Sprint",
		            "data": ano },
		            
		            {
		           
		            "name": "Estimated Sprint",
		            "data": anoE  }
		       ]}
        
        $scope.lineChartYData=data.yData
        $scope.lineChartXData=data.xData
        $scope.lineChartYData1=data1.yData
        $scope.lineChartXData1=data1.xData
         });

});

/*
myApp.config(function ( $routeProvider, $locationProvider ){
            $routeProvider
            .when('/',{
                template: '<chart title="Line chart For Velocity" xData="lineChartXData" yData="lineChartYData" xName="Date" yName="Estimation %" subtitle="This is a chart for Velocity"></chart>',
                controller: "Ctrl1"                })

        });*/