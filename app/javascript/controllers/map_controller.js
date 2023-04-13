import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    // Must hide API key
    this.map = new mapboxgl.Map({
      container: this.element, // container ID
      style: 'mapbox://styles/mapbox/streets-v12', // style URL
      zoom: 7, // starting zoom
    });
    // Private function
    this.#addMarkersToMap()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
    // Create a new marker, set the longitude and latitude, and add it to the map.
    new mapboxgl.Marker()
    .setLngLat([marker.lng, marker.lat])
    .addTo(this.map);
    // map is only in the connect function, so must be this.map to be instance variable
  })
}
}
