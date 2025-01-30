#!/usr/bin/env bash
# Exit on first error
set -o errexit  

# Install all necessary gems d
bundle install

# Run database migrations or schema load
if [[ "$RAILS_ENV" == "production" ]]; then
    rails db:prepare  # This runs `db:migrate` or `db:schema:load` as needed
fi

# Precompile assets for production
rails assets:precompile

# Clear cache of any temporary files that may cause issues
rails tmp:clear
