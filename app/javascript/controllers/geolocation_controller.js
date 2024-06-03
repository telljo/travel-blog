// app/javascript/controllers/geolocation_controller.js
import { Controller } from "@hotwired/stimulus"

const options = {
  enableHighAccuracy: true,
  maximumAge: 0
};

// Connects to data-controller="geolocation"
export default class extends Controller {
  static values = { url: String }

  search() {
    navigator.geolocation.getCurrentPosition(this.success.bind(this), this.error, options);
  }

  success(pos) {
    const crd = pos.coords;
    // redirect with coordinates in params
    console.log('Your current position is:');
    console.log(`Latitude : ${crd.latitude}`);
    console.log(`Longitude: ${crd.longitude}`);
    // location.assign(`/locations/?place=${crd.latitude},${crd.longitude}`)
  }

  error(err) {
    console.warn(`ERROR(${err.code}): ${err.message}`);
  }
}
