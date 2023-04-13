import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    new flatpickr(this.element, {
      enableTime: false,
      minDate: "today",
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
      // More options available in documentation
    });
  }
}
