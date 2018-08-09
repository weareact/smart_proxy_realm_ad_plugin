require 'smart_proxy_realm_ad/version'

module Proxy::AdRealm
  class Plugin < Proxy::Provider
    default_settings :computername_prefix => '', :computername_use_fqdn => false, :password_options => {:include_uppercase => true, :include_lowercase => true, :include_numbers => true, :include_symbols => false}

    load_classes ::Proxy::AdRealm::ConfigurationLoader
    load_dependency_injection_wirings ::Proxy::AdRealm::ConfigurationLoader

    validate_presence :realm, :keytab_path, :principal, :domain_controller
    validate_readable :keytab_path

    plugin :realm_ad, ::Proxy::AdRealm::VERSION
  end
end
