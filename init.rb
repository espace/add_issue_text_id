# Include hook code here
require 'redmine'
#require 'dispatcher'
require_dependency 'issue_text_id_hook'

Rails.configuration.to_prepare do
  require_dependency 'issue'
  require 'issue_patcher'
  Issue.send(:include, IssuePatcher)
  require_dependency 'query'
  require 'query_patcher'
  Query.send(:include,QueryPatcher)
end

Redmine::Plugin.register :add_issue_text_id do
  name 'Add Issue Friendly Text ID'
  author 'Basayel Said'
  description 'As a TL, when writing a story, can add attribute of original story ID (example A4)'
  version '0.0.1' 
end
