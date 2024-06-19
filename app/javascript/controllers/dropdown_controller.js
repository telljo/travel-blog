import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {

  static targets = ["menu", "buttonText", "checkbox"]

  toggle() {
    if (this.menuTarget.classList.contains('toggled')) {
      this.menuTarget.classList.remove('toggled');
    } else {
      this.menuTarget.classList.add('toggled');
    }
  }

  hide(event) {
    // Check if the click is outside the element and if the dropdown is toggled
    if (!this.element.contains(event.target) && this.menuTarget.classList.contains('toggled')) {
      this.menuTarget.classList.remove('toggled');

      if (this.checkboxTarget) {
        this.checkboxTarget.checked = false;
      }
    }
  }
}