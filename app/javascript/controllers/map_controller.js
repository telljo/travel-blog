import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl";

export default class extends Controller {
  static targets = ["map"];

  connect() {
    mapboxgl.accessToken = 'pk.eyJ1IjoidGVsbGpvIiwiYSI6ImNtMHRmY3FtcjB1YnYya29nMHQzZ2J5aGgifQ.rBZuXyl3wbJcIjGEQNtzAA';

    const mapElement = this.mapTarget;
    const points = JSON.parse(mapElement.dataset.points);
    console.log(points)
    const firstPoint = points[0];

    const map = new mapboxgl.Map({
      container: mapElement,
      style: 'mapbox://styles/mapbox/outdoors-v12',
      center: [firstPoint.longitude, firstPoint.latitude],
      zoom: 5
    });

    points.forEach(point => {
      new mapboxgl.Marker()
        .setLngLat([point.longitude, point.latitude])
        .setPopup(new mapboxgl.Popup().setHTML(point.tooltip))
        .addTo(map);
    });

    const coordinates = points.map(point => [point.longitude, point.latitude]);

    map.on('load', () => {
      map.addSource('route', {
        'type': 'geojson',
        'data': {
          'type': 'Feature',
          'properties': {},
          'geometry': {
            'type': 'LineString',
            'coordinates': coordinates
          }
        }
      });

      map.addLayer({
        'id': 'route',
        'type': 'line',
        'source': 'route',
        'layout': {
          'line-join': 'round',
          'line-cap': 'round'
        },
        'paint': {
          'line-color': '#fff',
          'line-width': 2,
          'line-dasharray': [2, 2]
        }
      });
    });
  }
}