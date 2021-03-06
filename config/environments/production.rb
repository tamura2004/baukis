Rails.application.configure do

  config.action_controller.perform_caching = true
  config.active_record.dump_schema_after_migration = false
  config.active_support.deprecation = :notify
  config.assets.compile = false
  config.assets.digest = true
  config.assets.js_compressor = :uglifier
  config.assets.version = '1.0'
  config.cache_classes = true
  config.consider_all_requests_local       = false
  config.eager_load = true
  config.i18n.fallbacks = true
  config.log_formatter = ::Logger::Formatter.new
  config.log_level = :info
  config.serve_static_assets = true

  config.baukis = {
    staff: { host: "baukis.example.com", path: "" },
    admin: { host: "baukis.example.com", path: "admin" },
    customer: { host: "example.com", path: "mypage" }
  }

end
