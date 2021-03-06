Redmine::Plugin.register :redmine_hoptoad_server do
  name 'Redmine Hoptoad Server plugin'
  author 'Jan Schulz-Hofen, Planio GmbH'
  description 'Turns Redmine into an Airbrake / Hoptoad compatible server, i.e. an API provider which can be used with the Airbrake gem / hoptoad_notifier plugin. See http://github.com/yeah/redmine_hoptoad_server'
  version '0.0.2'
end

begin
  require 'nokogiri'
rescue LoadError
  Rails.logger.error "Nokogiri gem not found, parsing hoptoad API v2 requests will be sub-optimal"
end

Rails.configuration.to_prepare do
  require_dependency 'redmine_hoptoad_server/patches/issue_patch'
  require_dependency 'redmine_hoptoad_server/patches/issue_observer_patch'
end

