# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



@Graph = (xdata, ydata, colordata) ->
    myplot = $('#myDiv')
    trace1 = {
  	x: xdata
  	y: ydata
  	mode: 'markers'
  	marker: {
    	size: 10
    	showscale : true
  	}
	}
	data = [trace1]
	layout = {
  	title: 'Trip Data'
  	width: 800
  	height: 800
	}
	Plotly.newPlot('myDiv', data, layout)

$('#myDiv').on 'plotly_click', (data) ->
    pts = ''
    for i in [0..data.points.length]
        pts = 'x = ' +data.points[i].x + '\ny = '+ data.points[i].y.toPrecision(4) + '\n\n'
    alert('Closet point clicked:\n\n' +pts)

