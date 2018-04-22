# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



@Graph = (xdata, ydata, colordata) ->
    myPlot = document.getElementById('graph')
    trace1 = {
    x: xdata
    y: ydata
    mode: 'markers'
    marker: {
        size: 10
        showscale : false
    }
    }
    data = [trace1]
    layout = {
    title: 'Trip Data'
    }
    Plotly.newPlot('graph', data, layout)
    
    myPlot.on 'plotly_click', (data) ->
        pts = ''
        for i in [0..data.points.length - 1]
            pts = 'x = ' +data.points[i].x + '\ny = '+ data.points[i].y.toPrecision(4) + '\n\n'
        alert('Closet point clicked:\n\n' +pts)

    return

@Mapgenerate = (divname, latdata, longdata) ->
    L.mapbox.accessToken = 'pk.eyJ1Ijoia2FpaHV1IiwiYSI6ImNqZnhzbGoxeTRxYTMyd3FvZGdicjNoeDkifQ.yxJUITl3Zaa5ML5TSrGsUA';
    map = L.mapbox.map(divname, 'mapbox.streets').setView([35.475293, 139.588570], 16)
    myIcon = L.divIcon({className: 'my-div-icon'});
    L.marker([35.475293, 139.588570]).addTo(map);
    return
