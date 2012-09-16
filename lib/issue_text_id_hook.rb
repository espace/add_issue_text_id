class IssueTestIdHook < Redmine::Hook::ViewListener
  render_on :view_issues_show_details_bottom, :partial => 'display_text_id'
  render_on :view_issues_form_details_bottom, :partial => 'story_text_id_field'
end
