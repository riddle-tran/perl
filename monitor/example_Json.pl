#!/usr/bin/perl
use JSON;

my $json;
{
  local $/=undef; #Enable 'slurp' mode
  open(DATA, "<data.json");
    $json = <DATA>;
    close(DATA);
}
my $data = decode_json($json);
# Output to screen one of the values read
$a= $data->{'boss'}->{'Hobbies'}->[0];
print "$a";
# Modify the value, and write the output file as json
# print "Boss' hobbies: " .
#       $data->{'boss'}->{'Hobbies'}->[0] . "n";

$data->{'boss'}->{'Hobbies'}->[0] = "Swimming";
open my $fh, ">", "data_out.json";
print $fh encode_json($data);
close $fh;