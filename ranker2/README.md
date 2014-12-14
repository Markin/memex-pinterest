ranker2
=======

## Capabilities

* command-line utility to rank the pages
* reads the data from mongodb
* creates Lucene index of text extracted from html
* runs Lucene searches for a given set of key phrases, and provides ranking for each key phrase

## How to run

#### To run the web service on the command line

mvn clean install exec:java

#### To POST a request

<i>With curl</i>

curl --data "html=my%20suspicious%20text&keyPhrase=pay%20per%20click" http://localhost:8080

<i>With html</i>

http://localhost:8080/?html=my%20suspicious%20text%20click&keyPhrase=pay%20per%20click

<i>where<i>

html is the input we are ranking, and

keyPhrase is the search key phrase. Multiple key phrases can be given, separated by comma

#### response in the above examples is

0.01

for

http://localhost:8080/?html=my%20suspicious%20text%20click&keyPhrase=pay%20per%20click,my%20suspicious%20text%20click

the response is

0.16

#### To run stand-alone ranking application

* see sample script in scripts/ directory