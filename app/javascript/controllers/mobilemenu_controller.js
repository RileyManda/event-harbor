import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mobilemenu"
export default class extends Controller {
  static targets = ["menu", "button", "items"];

  connect() {
    this.hideMenu();
  }

  toggleMenu() {
    this.menuTarget.classList.toggle("hidden");
  }

  hideMenu() {
    this.menuTarget.classList.add("hidden");
  }
  closeMenu() {
    this.menuTarget.classList.add("hidden");
  }
}
