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
        coordinates: [-77.032, 38.913]
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
        coordinates: [-122.414, 37.776]
        },
        properties: {
        title: 'Mapbox',
        description: 'San Francisco, California'
        }
        }]
    }

    map = new mapboxgl.Map({
    container: divname
    style: 'mapbox://styles/mapbox/streets-v9'
    center: [-96, 37.8]
    zoom: 3
    })

    geojson.features.forEach((marker) ->
        el = document.createElement(divname)
        el.className = 'marker'
        new mapboxgl.Marker(el).setLngLat(marker.geometry.coordinates).addTo(map)
        return
    )
    


    
    return
