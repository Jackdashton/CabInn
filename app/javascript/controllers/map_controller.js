import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static values = { apiKey: String }
  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    // Must hide API key
    const map = new mapboxgl.Map({
      container: this.element, // container ID
      style: 'mapbox://styles/mapbox/streets-v12', // style URL
      zoom: 9, // starting zoom
    });
  }
}
