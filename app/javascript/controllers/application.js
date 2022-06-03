import { Application } from "@hotwired/stimulus"
import * as bootstrap from "bootstrap"
import Rails from "@rails/ujs"
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
Rails.start()