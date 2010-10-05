# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_crud_practice_session',
  :secret      => '4f7ccf5884a3c4b33339671f91b1ea649b4512550674ebeb9d77327cc9593ce9166c56f28b4fde1081e645c67d09abaafa6bf48e2142e90ba69e47bea2db70a6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
