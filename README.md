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
Implemented to application have separation of concerns (Single Responsibility Principle of SOLID).
  <b>loaders classes</b> guarantee the abstraction of where the objects dataset are stored (database, file, etc).
  <b>parsers classes</b> guarantee scalability. New datasets can be add without modify any class, just add new classes (Open/Closed Principle of SOLID).
The loaders never instanced om construction of objects, they are pass as a dependency to the caller. The caller has control over the dependency and can easily change the source when needed (Dependency Inversion Principle of SOLID).
  
<h4>class JsonFileParser<h4>
This class works as an interface. We have two classes with the same method and same number of arguments (zero) and same return data type, a pattern that be followed in case of a new json file parser. It's helps substitute any subclass easily without breaking things and without the need to make a lot of changes (Liskov Substitution Principle of SOLID).
  
<h4>Search of Tags<h4>
All tags are found using regex scan. It's to be more fast and guarantee all of tags will be found.
  
<h3>Time Spent, Future Updates and Final Considerations</h3>
It's really hard to say how many time the application took, because it was developmented on weekend with alot of intervals (go to restaurant, mall, church and take care my sons). But I estimate between 5 and 6 hours.
  
If I have more time, I would create a web application with CRUD to Sections, Clauses and Templates. A document class and create the document to download as a PDF.
  
As a final consideration I want to say that I had never tried to use rspec with pure ruby (without rails). I had to study to understand how the setup would be, but I discovered that it is actually quite simple. :)
  
