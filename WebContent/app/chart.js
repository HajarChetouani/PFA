angular.module('AngularChart', []).directive('chart', function () {
    return {
        restrict:'E',
        template:'<div></div>',
        transclude:true,
        replace:true,
        scope: '=',
        link:function (scope, element, attrs) {
            console.log(attrs,scope[attrs.formatter])
            var opt = {
                chart:{
                    renderTo:element[0],
                    type:'line',
                    marginRight:130,
                    marginBottom:40
                },
                title:{
                    text:attrs.title,
                    x:-20 
                },
                subtitle:{
                    text:attrs.subtitle,
                    x:-20
                },
                xAxis:{
                    tickInterval:1,
                    title:{
                        text:attrs.xname
                    }
                },
                plotOptions:{
                    lineWidth:0.5
                },
                yAxis:{
                    title:{
                        text:attrs.yname
                    },
                    tickInterval:(attrs.yinterval)?new Number(attrs.yinterval):null,
                    max:attrs.ymax,
                    min: attrs.ymin

                },
                tooltip:{
                    formatter:scope[attrs.formatter]||function () {
                        return '<b>' + this.y + '</b>'
                    }
                },
                legend:{
                    layout:'vertical',
                    align:'right',
                    verticalAlign:'top',
                    x:-10,
                    y:100,
                    borderWidth:0
                },
                series:[
                    {
                        name:'velocity',
                        data:[2,8, 5.7, 11.3, 17.0]
                    }
                ]
            }


            scope.$watch(function (scope) {
                return JSON.stringify({
                    xAxis:{
                        categories:scope[attrs.xdata]
                        },
                    series:scope[attrs.ydata]
                });
            }, function (news) {
             

                news = JSON.parse(news)
                if (!news.series)return;
                angular.extend(opt,news)
                console.log('opt.xAxis.title.text',opt)
                



                var chart = new Highcharts.Chart(opt);
            });
        }
    }

})