<h1>Page View Statistics</h1>

This script reads from an input file, and outputs to console the page view statistics by views and unique views.

In order for it to work properly the file must be in the correct format, and also each of its lines.


<h1>About Classes</h1>

<h4>Base::Parser</h4>
Parse a line by splitting per blank space.

<h4>Base::Reader</h4>
Performs an IO foreach on the file so it won't load the entire file into memory, and yield each line it reads.

<h4>Counter</h4>
Performs the counting of the aggregated hash from file, calculates page view and unique page views count.

<h4>Presenter</h4>
Presentation logic to output the calculated views and unique views.

<h4>Builder</h4>
Responsible for building the aggregated hash in a way that it won't be allocating equal ip addresses into memory, and all same ip page views will be grouped in an array, to facilitate later calculations.

<h4>Display</h4>
Responsible for calling all configured presenters.

<h4>Statistic</h4>
Sets configuration parameters, retrieves aggregated hash from Builder and output to console by calling Display.

<h1>How To</h1>

Run

`ruby parser.rb (valid_filepath)`

or

`chmod +x parser.rb`

`./parser.rb (valid_filepath)`

There is a default file `webserver.log` that can be used, and also `webserver-big.log` which can be used for performance tests.

<h1>Test</h1>

Run all tests

`bin/rspec spec`