#!/usr/bin/perl
use DBI;

#connect mysql
my $driver ="mysql";
my $host = "localhost";
my $port ="3306";
my $use="root";
my $password="toor";
my $database ="perlSQL";
my $dsn = "DBI:$driver:database=$database;host=$host;port:$port";
my $dbh =DBI->connect($dsn, $use,$password) or die $DBI::errstr;

#create table statement
my $createTable="create table file (
    nameFile text NOT NULL,
    hash text NOT NULL
)"

