#!/usr/bin/perl
# # use Storable qw(dclone);
# # # use File::Basename;
# # # use File::Find;
# # # use Digest::SHA qw(sha256_hex);
# # # $sname=basename("/root/Desktop/Perl/test/");
# # # print "$sname\n";
# # # my @files = glob("/root/Desktop/Perl/test/mmm/*");
# # # foreach (@files ) {     
# # #         print "kkkk\n"; 
# # #         if(-d $_){
# # #             $str=$tr.openDirectories($_);
# # #         }
# # #         else{
# # #             $element4=hashFile($_);
# # #             $globalHash3{$_}=$element4;
# # #             $str =$str.$element4;
# # #         }
# # #     }
# # # $hashFolder= sha256_hex("");
# # # print "$hashFolder\n";
# # # sub a{
# # #     %data = ('John Paul', 45, 'Lisa', 30, 'Kumar', 40);
# # #     return %data
# # # }
# # # %myhash=a();
# # # $tr="".$myhash{'Lisa'};
# # # # print "aaa $tr a() $myhash{'Lisa'}\n";

# # # open(my $data, "+>/root/Desktop/Perl/test/l.txt");
# # #  print $data $output;
# # # close(DATA);
# # # sub d{fDumper
# # # # print "$output\n"
# # # @string = split(' ', qx(ls -id $_[0]));
# # # print "$string[0]";
# # # }
# # # d("/root/Desktop/Perl/test")
# # my %data = ('John Paul', 45, 'Lisa', 30, 'Kumar', 40);
# # %data1 = ('John Paul', 45, 'Lisa', 30, 'Kumar', 40);
# # $a="a";
# # sub ka{
# #     $k=$_[0];
# #     %kk=%{dclone($k)};
# #     $kk{'kkk'}="dddd";
# #     @keys= keys %kk;
# #     foreach (@keys){
# #         print "$_\n";
# #     }
# # }
# # ka(\%data);
# # @keys= keys %data;
# # foreach (@keys){
# #     print "$_\n";
# # }

# # use strict;
# # use Storable qw(dclone);

# # sub test
# # {
# #     my ($value_ref) = @_;
# #     my %value = %{ dclone($value_ref) };
# #     $value{'abc'}{'xyz'} = 1;
# # }

# # my %hash;
# # $hash{'abc'}{'xyz'} = 11;
# # test (\%hash);
# # print "$hash{'abc'}{'xyz'}\n"; # prints 
# use strict;
# use warnings;
# use 5.010;
# use Data::Dumper;
 
# my %team_a = (
#     Foo => 3,
#     Bar => 7,
#     Baz => 9,
# );
 
# my %team_b = (
#     Moo => 10,
#     Boo => 20,
#     Foo => 30,
# );
 
 
# $team_b{other} = \%team_a;
 
# print Dumper \%team_b;

# @hh = split(' ', qx(ls -i /root/Desktop/Perl/test/l.txt));
# # # print "$hh[0]";
@a=split(' ',qx(ls -id /root/Desktop/Perl/test/l.txt));
print $a[0]