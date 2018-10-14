#! /usr/bin/perl
use Digest::SHA qw(sha256_hex);

#khai bao variables
my %globalHash1;
my %globalHash2;

#read file monitoring.txt in directories
sub readFile{
    open(DATA, "<monitoring.txt");
    my @file = <DATA>;
    close(DATA);
    foreach my $lines(@file){
        chomp $lines;
        my ( $element1,  $element2)= split(':',$lines);
        $globalHash1{$element1}=$element2;
        $globalHash2{$element2}=$element1;
    }
    open(DATA, ">monitoring.txt");
    print DATA undef;
    close(DATA);
}

#write file to monitoring.txt
sub writeFile{
    $str=$_[0].":".$_[1]."\n";
    open(DATA, ">>monitoring.txt");
    print DATA $str;
    close(DATA);
}
#open file in Directories
sub hashFile{
    open(DATA, "<$_[0]") or die "Couldn't open file file.txt, $!";
    my  @lines = <DATA>;
    close(DATA);
    return sha256_hex(@lines);
}

#check tinh toan ven  files
sub checkFile{
    my $values1=$_[0];
    my $values2=$_[1];
    my %localHash3=%$values1;
    my %localHash4=%$values1;
    my @keys3= keys %localHash3;
    foreach $key3(@keys3){
        if(exists($globalHash1{$key3})){
            if($globalHash1{$key3}==$localHash3{$key3}){
                delete $globalHash1{$key3};
                print "file $key3 khong bi thay doi\n";
            }else{
                delete $globalHash1{$key3};
                print "noi dung file $key3 da bi thay doi \n";
            };
        }else{
                if(exists($globalHash2{$localHash3{$key3}})){
                    delete $globalHash1{$globalHash2{$localHash3{$key3}}};
                    print "ten file $globalHash2{$localHash3{$key3}} da thay dou thanh $key3\n"
                }else{
                    print "file $key3 moi duoc tao ra\n"
                }
        };
    }
}
#open Directories
sub openDirectories {
    my %localHash3;
    my %localHash4;
    my @files = glob($_[0]."/*");
    foreach (@files ) {      
        if(-d $_){
            openDirectories($_);
        }
        else{
            $element4=hashFile($_);
            $localHash3{$_}=$element4;
            $localHash4{$element4}=$_;
            writeFile($_,$element4)
        }
    }
    checkFile(\%localHash3,\%localHash4);
}

#check again file was delete
sub checkFileDelete{
    my @keys= keys %globalHash1;
    foreach $key(@keys){
    print "file $key da bi xoa\n"
    }
}

#call function
sub main{
    if($#ARGV){
        print "hay truyen vao duong dan thu muc\n"
    }else{
        readFile();
        openDirectories($ARGV[0]);
        checkFileDelete();
    }
}
main();