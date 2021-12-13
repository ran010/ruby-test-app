# Ruby on Rails Challenge

## Description

In our day-to-day basis we have to build projects considering many visibility layers. This layers relies on either user access policy to some web pages and/or custom content presentation based on user role within the system.

Take a notice on these roles for this project that should have a sidebar for navigating and a dashboard whose resources visibility will depend on user role:

1. An admin user can have access to all web pages should he has link for them. But this user should also have its own list of items to access displayed in a sidebar alike or a dashboard of some sort.

2. In the other hand, there are employee users with different restrictions such that:
  - all employees can have access to the **same** dashboard page and sidebar;
  - but they see the content different based on the type of function he has in the company: manager and agent. This will be expanded further.

## Resources

These are the basic resources we are looking for for this project

* Purchase (required attributes*):
  * buyer_name
  * buyer_email
  * created_at
  * updated_at
  * status (Suggested values: requested, processing, cancelled, closed)
  * updated_by (represents who is the last user that updated the record)
  * notes

* Employee (required attributes*):
  * name
  * role

> * These fields are required only if your data modeling is created to follow above structure, but you can opt for creating any sort of data modeling since it represents the idea behind the structure above. i.e. you could create a participant model that would have a name attribute and would associate with a purchase model (a standard has-many association between purchases and participants). This modeling would replace the buyer_name field on Purchase with a foreign_key field (such as participant_id).

## Features

Keed in mind that what we want with this challenge is to understand if the way you code follows some good patterns such as SOLID, Clean Code and your knowledge of the Rails framework. We are also looking for some basic knowledge on front-end technologies, which includes the standard, HTML, CSS and of course javascript. We usually use ERB for template rendering our html code and coffeescript for javascript compiling.

Some features you are asked to implement:

* Implement **authentication**. We usually rely on devise gem for this.
* Implement **authorization**. We use Pundit in most case.
* Implement **different view presentations**. It's expected from you to handle situations where an employee (functioning as an agent) may be presented with a different content than another employee (functioning as manager). Remember that the code should be easy for change.
* Implement background jobs infrastructure and implement a way to handle something through it like changing a purchase from processing to done. We use sidekiq alongside redis for this.

These are the suggested endpoints for the project

* '/admin/purchases'
 * Restricted to admin **only**.
 * It should have standard REST actions;
 * You should list all existing purchases with buyer's name, buyer's email, timestamp and status. This page should include a multi field search and sorting functionality. (It would be a plus to have some sort of bulking operation). It should also contain action buttons (such as view, edit, destroy)
 * You should also provide the a detailed view (show action as it's knowm) so that admin will be able to change notes field and change status.
 * It should have creation and updating forms so that admin can create or update purchase values.
 * The status field should follow this template "#{status} - Last updated by #{uploaded_by}" on the listing view and on the detailed view. These values will default to the requested status and to the name of the agent who created the purchase.

* '/purchases'
 * Restricted to employees and administrators
 * **Manager** employee will be able to see list of purchases having only the name of the buyer's name, timestamp and status. This list should be multi field searchable, orderable and have action buttons (such as view, edit, destroy)
 * **Manager** employee will be able to see detailed of the selected purchase
 * **Manager** employee should only be allowed to change the purchase status and change notes field.
 * **Manager** employee will be able to see status according to this template "#{status} - #{updated_at}", where `updated_at` should be presented as this: "dd/mm/yyyy - hh:mm"
 * **Manager** employee cannot delete the purchase
 * **Agent** employee will only be able to see the list of purchases and add notes on anyone of them
 * **Agent** employee will see the status according to this template: "#{status}" (i.e. only the status value)


## Test

Everything should be tested. We expect you to have a good coverage (at least 90%) but most of all we want quality on your tests. We expect at least feature tests and unit tests. We value code design at the test level as well. So keep it clean. You are free to use any resource you want, but please choose at least Rspec. ;)

## Other interesting features to consider:

1. Let's say client expects admin to have a dashboard page showing the amount of existing purchases. But he also wants admin to have this number to increase in real time on each new transaction if admin is at that page. How would implement that?

2. We want to see how you handle changes. So, after you have finished the basic setup of the project. We want you to create a git branch and apply the following change on it: Allow agent employee to also add notes to a purchase as manager admin is allowed to. This means that a purchase will now be able to hold more than one note. You should create this considering that existing note on purchase should not be deleted.


## Evaluations

* We evaluate your technical seniority totally based in the way you code, therefore, be aware that you should do your best by following good practices

* If you want to be adventurous by implementing something nice, let's say using Turbo frame / streams that would be awesome. Just keep in mind that you should know what you do because we want you to explain in details what you did or planned to do.

* Besides implementing proper solutions for given problems we would also love to see if you can also improve on performance by handling (1) caching, (2) database loading issues such as n+1 queries, (3) security issues, etc.

* Be aware of the way you commit your code. We are not expecting a perfect commits flow, but it's nice to see that you are following a pattern of some sort. We do not want to see forced push on main/master branch.

* We don't expect a beautiful frontend but it's nice to know you can use a framework such as bootstrap and do some changes based on it.

* We may require you to present your solution. Be prepared.

* Your day-to-day basis in the company would require code review and some pair programming (when needed) this means that you should be able to humbly receive suggestions on your code if needed and counter point something if we are mistaken.

At last, we want to know! We have a really flexible environment and we want to know how you'll fit in our culture. We value opinions

## Test delivery

- [Fork](https://docs.github.com/en/github/getting-started-with-github/quickstart/fork-a-repo) this project and submit a pull request to the master branch of this repository.

- If you want to keep your project private, that's ok. Just send a invitation to this users `hugohernani`, `heitoleto` so that I'll be counted as a collaborator and will be able to see a private pull request to evaluate your test.
