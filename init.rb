# Include hook code here
require 'redmine'
#require 'dispatcher'
require_dependency 'issue_text_id_hook'

if Rails::VERSION::MAJOR >= 3
  ActionDispatch::Callbacks.to_prepare do
    require_dependency 'issue'
    require 'issue_patcher'
    Issue.send(:include, IssuePatcher)
    require_dependency 'query'
    require 'query_patcher'
    Query.send(:include,QueryPatcher)
  end
else
  Dispatcher.to_prepare do
    require_dependency 'issue'
    require 'issue_patcher'
    Issue.send(:include, IssuePatcher)
    require_dependency 'query'
    require 'query_patcher'
    Query.send(:include,QueryPatcher)
  end
end

Redmine::Plugin.register :add_issue_text_id do
  name 'Add Issue Friendly Text ID'
  author 'Basayel Said'
  description 'As a team member with add issue permission, when writing a story, can add attribute of original story ID (example A4)'
  version '1.0.0'
end

