require_dependency 'issue'
require 'application_helper'

module IssuePatcher
  module Patches
    module ApplicationHelperPatch
      def self.included(base) # :nodoc:
        # sending instance methods to module
        base.send(:include, InstanceMethods)

        base.class_eval do
          unloadable

          # aliasing methods if needed
          alias_method_chain :validates_text_id, :checkers
        end
      end

      # Instance methods are here
      module InstanceMethods
        def validates_text_id_with_checkers
            validates_uniqueness_of :text_id, :scope=>'project_id' ,:allow_blank=>true
        end
      end
    end
  end
end

# now we should include this module in ApplicationHelper module
unless ApplicationHelper.included_modules.include? IssuePatcher::Patches::ApplicationHelperPatch
    ApplicationHelper.send(:include, IssuePatcher::Patches::ApplicationHelperPatch)
end

