require_dependency 'issue'
module IssuePatcher
  def self.included(base)
    Issue.safe_attributes 'text_id', :if => lambda {|issue, user| issue.new_statuses_allowed_to(user).any? }

    base.class_eval do
      unloadable
      validates_uniqueness_of :text_id, :scope=>'project_id' ,:allow_blank=>true
    end
    base.send(:extend,ClassMethods)
  end
  module ClassMethods
    def has_story_tracker?(project)
      found=project.trackers.find_by_name("Story")
      return found.id  if found
    end
  end

end

