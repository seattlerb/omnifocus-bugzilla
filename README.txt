= omnifocus_bugzilla

* http://rubyforge.org/projects/seattlerb

== DESCRIPTION:

Plugin for omnifocus gem to provide bugzilla BTS synchronization.

The first time this runs it creates a yaml file in your home directory
for the bugzilla url, username, and queries.

The queries config is optional.  If it is not included bugzilla-omnifocus will
pull all active bugs assigned to the specified user.

To use a custom query or multiple queries you must include a queries parameter
in your config.

The queries config is an array of strings.  Each string is the query string
portion of the bugzilla search results url.  Its easiest to create your search
in bugzilla and then paste the portion of the url after the question mark into
the config file.

Example:
:bugzilla_url: http://bugs/buglist.cgi
:username: aja
:queries: ["bug_status=NEW", "bug_status=CLOSED"]

== FEATURES/PROBLEMS:

* Provides bugzilla BTS synchronization.

== REQUIREMENTS:

* omnifocus

== INSTALL:

* sudo gem install omnifocus-bugzilla

== LICENSE:

(The MIT License)

Copyright (c) 2009 Aja Hammerly

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
