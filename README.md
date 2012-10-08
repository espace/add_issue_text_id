# Add "story id" to Issues

Add_issue_text_id is a redmine plugin developed for a specific need in our company eSpace  http://www.espace.com.eg/.
For a new issue with "Stroy" tracker, it adds a new attribute called "Story ID" to the issue model. That attribute is used to track the original story id for the issue (e.g. A4).

## Installation

Compatible with redmine 2.1 and Rails 3.

### Setup on debian/ubuntu

  ```
    cd redmine-2.1.0
    cd plugins/
    git clone git://github.com/espace/add_issue_text_id.git              
    rake redmine:plugins:migrate
  ```

##Credits
Add_issue_text_id is a redmine plugin by eSpace  http://www.espace.com.eg/.
