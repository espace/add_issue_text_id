require_dependency 'query'
module QueryPatcher
  def self.included(base)
    base.class_eval do
      unloadable
      @@available_columns=Query.available_columns
      @@available_columns << QueryColumn.new(:text_id, :sortable => "#{Issue.table_name}.text_id", :default_order => 'desc')
    end
  end
end