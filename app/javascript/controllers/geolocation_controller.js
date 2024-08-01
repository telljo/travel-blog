import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"];

  handleClick() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        this.handleSuccess.bind(this),
        this.handleError.bind(this)
      )
    } else {
      console.error("Geolocation is not supported by this browser.")
    }
  }

  handleSuccess(position) {
    const { latitude, longitude } = position.coords;
    this.sendLocationToRails(latitude, longitude);
  }

  handleError(error) {
    console.error(`Geolocation error: ${error.message}`);
  }

  sendLocationToRails(latitude, longitude) {
    const csrfToken = document.querySelector("meta[name=csrf-token]").content;

    fetch('/find_location', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
      },
      body: JSON.stringify({ latitude, longitude }),
    }).then(response => {
      if (response.ok) {
        return response.json();
      } else {
        throw new Error('HTTP error ' + response.status);
      }
    }).then(resp => {
      console.log(resp.data)
      this.inputTarget.value = resp.data.formatted_address;
    }).catch(error => {
      console.error('There was a problem with the fetch operation:', error);
    });
  }

  change(event) {
    console.log(event.target.value);
  }
}
