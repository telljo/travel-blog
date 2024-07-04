import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {

  static targets = ["menu", "buttonText", "checkbox", "icon"]

  toggle() {
    if (this.menuTarget.classList.contains('dropdown__menu--toggled')) {
      this.menuTarget.classList.remove('dropdown__menu--toggled');
    } else {
      this.menuTarget.classList.add('dropdown__menu--toggled');
    }

    if (this.iconTarget.classList.contains('icon--toggled')) {
      this.iconTarget.classList.remove('icon--toggled');
    } else {
      this.iconTarget.classList.add('icon--toggled');
    }
  }

  hide(event) {
    if (!this.element.contains(event.target) && this.menuTarget.classList.contains('dropdown__menu--toggled')) {
      this.menuTarget.classList.remove('dropdown__menu--toggled');
      if (this.checkboxTarget) {
        this.checkboxTarget.checked = false;
      }
    }

    if(!this.element.contains(event.target) && this.iconTarget.classList.contains('icon--toggled')) {
      this.iconTarget.classList.remove('icon--toggled');
    }
  }
}