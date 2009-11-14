Feature: Destroying groups that have a council
  In order to remove an inactive, a hijacked or an old group
  As a member of that group
  I want to destroy that group and I want to not be able to easily destroy groups used by other people.

Background:
  Given a group: "rainbow" exist with name: "Rainbow"
  And that group has a council
  And a user: "blue" exists with name: "Blue"
  And that user is a member of that group
  And I am logged in as that user
  And I am on the group's landing page

Scenario: I am not part of the council so I can't destroy the group
  Then I should not see a "Destroy Group"
  And I should not see "Propose to destroy this group"

Scenario: I am the only member of the council so I can destroy the group
  Given I am the only member of that group's council
  And a user: "red" is a member of that group
  When I follow "Destroy Group"
  And I press "Destroy"
  Then I should be on my dashboard page
  And I should see "Group Destroyed"
  And that group should not exists
  And I should receive an email with subject: "Group Rainbow has been deleted by Blue!"
  And I should receive an email body containing a destroyed groups directory link


Scenario: I am the member of the council, but council has several members so I can propose to delete the group

Scenario: I propose to delete the group as one of many members of the council. The group gets deleted in 1 month.

Scenario: Council members can veto proposals to delete the group

Scenario: non-council members can not veto proposals to delete the group

Scenario: I am the only member of the council so I can delete the group even when a proposal exists to delete it.