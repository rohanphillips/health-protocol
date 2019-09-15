# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database. Models were created with the appropriate relationships established to utilize ActiveRecord.  I may not have needed to use a join table to accomplish the requirements for this project, however I decided I like the challenges, we have a join table
- [x] Include more than one model class (e.g. User, Post, Category).  This project has the following models.  User, Record, Protocol and RecordProtocol
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts).  User has_many ProtocolsRecords, Record has_many ProtocolRecords
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User).  ProtocolRecord belongs_to user, protocol and record
- [x] Include user accounts with unique login attribute (username or email).  No error messages have been implemented currently, however if a user enters a username that's been used already they will be redirected back to a blank sign up page
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying.  Appropriate routes were set up to handle all C.R.U.D requirements
- [x] Ensure that users can't modify content created by other users.  This was implemented for a users records
- [x] Include user input validations.  Again, no error messages, however if a user entered information that was blank they are redirected back to the appropriate page and the form repopulated with the data they'd already entered.
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code.  Completed

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
It's possible I may have to review my git commit strategy.  I have been trying to get some functionality working first, doing a post, then the littler commits come as I'm refining.  I'll take advice on this.