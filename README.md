# generator_iubenda

<h3>Set Up and Run the Application</h3>
Certified to use Ruby 3.0.0
Execute: <b>bundle install</b> to install rspec gem
Execute: <b>ruby main.rb</b>
Type the filename of a template and app will put the document on terminal (You can type example.txt to generate document from default template)
If you want, you can create <b>new templates</b> and put it on <b>template folder</b>.
  
<h3>Run the Automated Tests</h3>
Execute: <b>bin/rspec</b> to run all tests
Or
Execute: <b>bin/rspec name.rb</b> (changing 'name' to test filename) to run a specific test

<h3>Design Decisions</h3>

<h4>Parsers and Loaders<h4>
Implemented to application have separation of concerns.
  <b>loaders classes</b> guarantee the abstraction of where the objects dataset are stored (database, file, etc).
  <b>parsers classes</b> guarantee 
