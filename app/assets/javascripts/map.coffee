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
    mapboxgl.accessToken = 'pk.eyJ1Ijoia2FpaHV1IiwiYSI6ImNqZnhzbGoxeTRxYTMyd3FvZGdicjNoeDkifQ.yxJUITl3Zaa5ML5TSrGsUA';
    
    geojson = {
        type: 'FeatureCollection',
        features: [{
        type: 'Feature',
        geometry: {
        type: 'Point',
        coordinates: [[139.587365, 35.474575]]
        },
        properties: {
        title: 'Mapbox',
        description: 'Washington, D.C.'
        }
        },
        {
        type: 'Feature',
        geometry: {
        type: 'Point',
        coordinates: [[139.587574, 35.475051]]
        },
        properties: {
        title: 'Mapbox',
        description: 'San Francisco, California'
        }
        }]
    }

    map = new mapboxgl.Map({
    container: divname
    style: 'mapbox://styles/kaihuu/cjgav54yi2xwc2st2ns0uzwdz'
    center: [139.587365, 35.474575]
    zoom: 17
    })

    geojson.features.forEach((marker) ->
        el = document.createElement(divname)
        el.className = 'marker'
        for i in [0..marker.geometry.coordinates.length - 1]
            new mapboxgl.Marker(el).setLngLat(marker.geometry.coordinates[i]).addTo(map)
        return
    )
    


    
    return
