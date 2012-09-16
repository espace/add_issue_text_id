require_dependency 'issue'
module IssuePatcher
  def self.included(base)
    base.class_eval do
      unloadable
      validates_uniqueness_of :text_id, :scope=>'project_id' ,:allow_blank=>true
    end
  end
end