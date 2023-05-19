<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

  let chart = {
    init: ()=> {
      chart.getData1();
      chart.getData2();
      chart.getData3();

    },
    getData1: () => {
      $.ajax({
        url:'chart01',
        success: (data) => {
          chart.display1(data);
        }
      });
    },
    display1: (data) => {
      Highcharts.chart('container1', {
        chart: {
          type: 'column'
        },
        title: {
          text: '월별, 성별별 총 판매금액 추이 차트'
        },
        subtitle: {
          text: 'Source: Mosinsa.com'
        },
        xAxis: {
          categories: [
            'Jan',
            'Feb',
            'Mar',
            'Apr',
            'May',
            'Jun',
            'Jul',
            'Aug',
            'Sep',
            'Oct',
            'Nov',
            'Dec'
          ],
          crosshair: true
        },
        yAxis: {
          min: 0,
          title: {
            text: 'KRW'
          }
        },
        tooltip: {
          headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
          pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                  '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
          footerFormat: '</table>',
          shared: true,
          useHTML: true
        },
        plotOptions: {
          column: {
            pointPadding: 0.2,
            borderWidth: 0
          }
        },
        series: data
      });

    },
    getData2: () => {
      $.ajax({
        url:'chart02',
        success: (data) => {
          chart.display2(data);
        }
      });
    },
    display2: (data) => {

// Data retrieved from https://netmarketshare.com
      Highcharts.chart('container2', {
        chart: {
          plotBackgroundColor: null,
          plotBorderWidth: null,
          plotShadow: false,
          type: 'pie'
        },
        title: {
          text: '판매 카테고리별 판매금액 비율추이',
          align: 'left'
        },
        tooltip: {
          pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        accessibility: {
          point: {
            valueSuffix: '%'
          }
        },
        plotOptions: {
          pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
              enabled: true,
              format: '<b>{point.name}</b>: {point.percentage:.1f} %'
            }
          }
        },
        series: [{
          name: '비율',
          colorByPoint: true,
          data: data
        }]
      });
    },

    getData3: () => {
      $.ajax({
        url:'chart03',
        success: (data) => {
          chart.display3(data);
        }
      });
    },
    display3: (data) => {
      Highcharts.chart('container3', {
        chart: {
          type: 'bar'
        },
        title: {
          text: '2022년 연령대별 매출액 비율',
          align: 'left'
        },
        subtitle: {
          text: 'Source: <a ' +
                  'href="https://mosinsa.com"' +
                  'target="_blank">Mosinsa.org</a>',
          align: 'left'
        },
        xAxis: {
          categories: ['10', '20', '30', '40', '50'],
          title: {
            text: null
          },
          gridLineWidth: 1,
          lineWidth: 0
        },
        yAxis: {
          min: 0,
          labels: {
            overflow: 'justify'
          },
          gridLineWidth: 0
        },
        tooltip: {
          valueSuffix: ' 원'
        },
        plotOptions: {
          bar: {
            borderRadius: '50%',
            dataLabels: {
              enabled: true
            },
            groupPadding: 0.1
          }
        },
        legend: {
          layout: 'vertical',
          align: 'right',
          verticalAlign: 'top',
          x: -40,
          y: 80,
          floating: true,
          borderWidth: 1,
          backgroundColor:
                  Highcharts.defaultOptions.legend.backgroundColor || '#FFFFFF',
          shadow: true
        },
        credits: {
          enabled: false
        },
        series: [{
          name: '연령별 매출액 비율',
          data: data
        }]
      });
    }


  };

  $( ()=> {
    chart.init();
  });



</script>


<div class="container-fluid px-4">
  <h1 class="mt-4">주요 차트 분석</h1>
  <ol class="breadcrumb mb-4">
    <li class="breadcrumb-item"><a href="/">Main</a></li>
    <li class="breadcrumb-item active">Charts</li>
  </ol>

  <div class="card mb-4">
    <div class="card-header">
      <i class="fas fa-chart-area me-1"></i>
      Monthly Total Sales Chart by gender
    </div>
    <div class="card-body">
      <div id="container1"></div>
    </div>
    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
  </div>

  <div class="row">
    <div class="col-lg-6">
      <div class="card mb-4">
        <div class="card-header">
          <i class="fas fa-chart-bar me-1"></i>
          Pie Chart Example
        </div>
        <div class="card-body">
          <div id="container2"></div>
        </div>
        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
      </div>
    </div>
    <div class="col-lg-6">
      <div class="card mb-4">
        <div class="card-header">
          <i class="fas fa-chart-pie me-1"></i>
          Bar Chart Example
        </div>
        <div class="card-body">
          <div id="container3"></div>
        </div>
        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
      </div>
    </div>
  </div>
</div>