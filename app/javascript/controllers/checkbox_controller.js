import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("first checkbox controller connected")
  }

  submit() {
    this.element.requestSubmit()
  }
}
