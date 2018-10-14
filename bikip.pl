
#!/usr/bin/perl

#nhieu tham so trong ham
my @array = ('a','b','c');
my $str = "Hello";
my %hash = (
    'a' => ['100','nuts'],
    'b' => ['200','bolts'],
    'c' => ['300','screws'],
);
#getMsg(\@array, \%hash, $scalar);
getMsg();
sub getMsg {
    for my $elem (@ARGV) {
        print "$elem";
    }
}
getMsg(\@array, \%hash, $scalar);

sub getMsg {
    my ($aref, $href, $foo) = @_;
    for my $elem (@$aref) {
        ...
    }
}

#ref in ra kieu du lieu

#tham chieu toi ham
# Function definition
sub PrintHash {
   my (%hash) = @_;
   
   foreach $item (%hash) {
      print "Item : $item\n";
   }
}
%hash = ('name' => 'Tom', 'age' => 19);

# Create a reference to above function.
$cref = \&PrintHash;

# Function call using reference.
&$cref(%hash);