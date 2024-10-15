// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "@fortawesome/fontawesome-free/js/all"

import "trix"
import "@rails/actiontext"

document.addEventListener("trix-file-accept", (e) => {
  e.preventDefault()
})