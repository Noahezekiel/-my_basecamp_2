pin "application", preload: true

# Stimulus
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# Turbo
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true

# Bootstrap (use CDN-hosted version)
pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
