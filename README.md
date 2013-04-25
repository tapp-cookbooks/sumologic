Description
===========

Installs and configures a [Sumo Logic collector](http://www.sumologic.com/product/overview/collect/).

Requirements
============

Sumo Logic user (email) and password.

Supports Linux, Solaris, Windows.

Attributes
==========

* `#node[:sumologic][:email]` - Sumo Logic user
* `#node[:sumologic][:password]` - Sumo Logic password
* `#node[:sumologic][:sources]` - optional: sources.json file to override default system sources

Usage
=====

Include default recipe in your run list.
