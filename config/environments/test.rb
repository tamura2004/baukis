Rails.application.configure do
  config.action_controller.allow_forgery_protection = false
  config.action_controller.perform_caching = false
  config.action_dispatch.show_exceptions = false
  config.action_mailer.delivery_method = :test
  config.active_support.deprecation = :stderr
  config.cache_classes = true
  config.consider_all_requests_local       = true
  config.eager_load = false
  config.serve_static_files  = true
  config.static_cache_control = 'public, max-age=3600'

  config.baukis = {
    staff: { host: "baukis.example.com", path: "" },
    admin: { host: "baukis.example.com", path: "admin" },
    customer: { host: "example.com", path: "mypage" }
  }

end
