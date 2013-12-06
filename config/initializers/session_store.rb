# Be sure to restart your server when you modify this file.

BlogSegu::Application.config.session_store :cookie_store, key: '_BlogSegu_session'

BlogSegu::Application.config.session_store :cookie_store, 
                                             :key => "_BlogSegu_session",
                                             :expire_after => 7.minutes