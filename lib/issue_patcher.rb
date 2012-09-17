require_dependency 'issue'
require 'application_helper'

module IssuePatcher
  def self.included(base)
    base.class_eval do
      unloadable
      validates_uniqueness_of :text_id, :scope=>'project_id' ,:allow_blank=>true
    end
  end
end


# now we should include this module in ApplicationHelper module
unless ApplicationHelper.included_modules.include? IssuePatcher
    ApplicationHelper.send(:include, IssuePatcher )
end

