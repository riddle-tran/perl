#! /usr/bin/perl
use Digest::SHA qw(sha256_hex);
use Switch;
use  JSON;
use File::Basename;
use Data::Dumper;
#khai bao variables
my %dataRead;
my %dataCheck;
my $data;
my $path="/root/Desktop/test";
#format file 
#read file monitoring.txt in directories
sub readFile{
    local $/=undef;;
    open(DATA, "</root/Documents/data.json");
    my $file = <DATA>;
    close(DATA);
    chomp $file;
    my $data = decode_json($file);  
    %dataRead=%$data;
}

#write file to monitoring.txt
sub writeFile{
    %myhash=getInformation($path);
    open(my $DATA, ">/root/Documents/data.json");
    print $DATA encode_json(\%myhash);
    close(DATA);
}
#sub get id
sub getID{
    @ids = split(' ', qx(ls -id $_[0]));
    return $ids[0];
}
#get Information
sub getInformation{
    my %hashInfo;
    my $str="";
    my $basename;
    my @files = glob($_[0]."/*");
    $hashInfo{'name'}=basename($_[0]); 
    foreach (@files ) {    
        if(-d $_){
            my $idChild=getID($_);
            %myhash=getInformation($_);
            $str=$str.$myhash{'hash'}.$myhash{'name'};
            @keys =keys %myhash;
            foreach $key(@keys){
               $hashInfo{$idChild}{$key}=$myhash {$key};
            }
        } else{
            my $idChild=getID($_);
            $element=hashFile($_);
            $basename=basename($_);
            $str =$str.$element.$basename;
            $hashInfo{$idChild}={'name'=>$basename, 'hash'=>$element, 'type'=>'file'};

        }
    }
    $hashInfo{'hash'}=sha256_hex($str);
    $hashInfo{'type'}='directory';
    return %hashInfo;
}

#open file in Directoriess
sub hashFile{
    open(DATA, "<$_[0]") or die "Couldn't open file file.txt, $!";
    my  @lines = <DATA>;
    close(DATA);
    return sha256_hex(@lines);
}
#-------------
sub getData{
    $val=$_[0];
    @array=@$val;
    %data=%dataRead;
    my $x=pop(@array);
    while(@array){
        $x=pop(@array);
        my $m=$data{$x};
        %data=%$m;
    }
    return %data;
    
}
#get id of folder
sub getIDFolder{
    my $idCheck=getID($path);
    my @ids;
    my $id;
    my $argv=$ARGV[0];
    do{
        $id=getID($argv);
        $argv= dirname($argv);
        if($id==$idCheck){
            push(@ids, $id);
            return @ids;
        }else{
            push(@ids, $id);
        }
    }while($argv ne "/root");
    return undef;
}
#print file or fordel delete
sub deleteForder{
    my $val1=$_[0];
    my %hashRead=%$val1;
    my @keysRead= keys %hashRead;
    if($hashRead{'type'} eq 'file'){
        print "file $hashRead{'name'} da bi xoa\n";
    }else{
        print "thu muc $hashRead{'name'} da bi xoa\n";
    }
    foreach $keyRead(@keysRead){
        if($keyRead ne 'name' && $keyRead ne 'hash' && $keyRead ne 'type'){
            my $bienTam=$hashRead{$keyRead};
            my %hashTam=%$bienTam;
            deleteForder(\%hashTam);
        }
    }
}
#check tinh toan ven  files
sub checkFile{
    my $val1=$_[0];
    my $val2=$_[1];
    my%hashRead=%$val1;
    my %hashCheck=%$val2;  
    my @keysRead= keys %hashRead;
    my $flag=0;
    foreach $keyRead(@keysRead){
        if($keyRead eq 'name' ){
            if($flag ==0){
                if($hashRead{'name'} eq $hashCheck{'name'}){
                    if($hashRead{'hash'} eq $hashCheck{'hash'}){
                        if($hashRead{'type'} eq 'file'){
                            print "file $hashRead{'name'} khong bi thay doi\n";
                        }else{
                            print "thu muc $hashRead{'name'} khong bi thay doi\n";
                        }
                    }else{
                        if($hashRead{'type'} eq 'file'){
                            print "noi dung file $hashRead{'name'} da bi thay doi \n";
                        }else{
                            print "noi dung thu muc $hashRead{'name'} da bi thay doi \n";
                        }
                    }
                }else{
                    if($hashRead{'hash'} eq $hashCheck{'hash'}){
                        if($hashRead{'type'} eq 'file'){
                            print "ten file $hashRead{'name'} da doi ten thanh $hashCheck{'name'}\n"
                        }else{
                            print "ten thu muc $hashRead{'name'} da doi ten thanh $hashCheck{'name'}\n"
                        }
                    }else{
                        if($hashRead{'type'} eq 'file'){
                            print "ca noi dung va ten file $hashRead{'name'} da bi thay doi voi ten moi $hashCheck{'name'} \n";
                        }else{
                            print "ca noi dung va ten thu muc $hashRead{'name'} da bi thay doi voi ten moi $hashCheck{'name'} \n";
                        }
                    }
                }
                delete $hashCheck{'type'};
                delete $hashCheck{'name'};
                delete $hashCheck{'hash'};
                $flag =1;
            }
        }elsif($keyRead eq 'type'){
        }elsif($keyRead eq 'hash'){
            if($flag ==0){
                if($hashRead{'hash'} eq $hashCheck{'hash'}){
                    if($hashRead{'name'} eq $hashCheck{'name'}){
                        if($hashRead{'type'} eq 'file'){
                            print "file $hashRead{'name'} khong bi thay doi\n";
                        }else{
                            print "thu muc $hashRead{'name'} khong bi thay doi\n";
                        }
                    }else{
                        if($hashRead{'type'} eq 'file'){
                            print "ten file $hashRead{'name'} da doi ten thanh $hashCheck{'name'}\n"
                        }else{
                            print "ten thu muc $hashRead{'name'} da doi ten thanh $hashCheck{'name'}\n"
                        }
                    }
                }else{
                    if($hashRead{'name'} eq $hashCheck{'name'}){
                        if($hashRead{'type'} eq 'file'){
                            print "noi dung file $hashRead{'name'} da bi thay doi \n";
                        }else{
                            print "noi dung thu muc $hashRead{'name'} da bi thay doi \n";
                        }
                    }else{
                        if($hashRead{'type'} eq 'file'){
                            print "ca noi dung va ten file $hashRead{'name'} da bi thay doi voi ten moi $hashCheck{'name'} \n";
                        }else{
                            print "ca noi dung va ten thu muc $hashRead{'name'} da bi thay doi voi ten moi $hashCheck{'name'} \n";
                        }
                    }
                }
                delete $hashCheck{'type'};
                delete $hashCheck{'name'};
                delete $hashCheck{'hash'};
                $flag =1;
            }
        }else{
            if(exists($hashCheck{$keyRead})){
                $val1=$hashRead{$keyRead};
                $val2=$hashCheck{$keyRead};
                my %hashChild1=%$val1;
                my %hashChild2=%$val2;
                my %myhash=checkFile(\%hashChild1,\%hashChild2);
                @keys =keys %myhash;
                delete $hashCheck{$keyRead};
                foreach $key(@keys){
                    $hashCheck{$keyRead}{$key}=$myhash {$key};
                }
            }else{
                my $val1=$hashRead{$keyRead};
                my %hashTam=%$val1;
                deleteForder(\%hashTam);
                delete $hashCheck{$keyRead};
            }
        }
    }
    return %hashCheck

}
sub checkForderCreate{
    my $val1=$_[0];
    my %hashCheck=%$val1;
    my @keysCheck= keys %hashCheck;
    foreach $keyCheck(@keysCheck){
        if($keyCheck eq 'name' || $keyCheck eq 'hash' || $keyCheck eq 'type'){
            if($keyCheck eq 'name' ){
                if($hashRead{'name'} eq $hashCheck{'name'}){
                    print "file $hashCheck{'name'} moi them vao\n";
                }else{
                    print "thu muc $hashCheck{'name'} moi them vao\n";
                }
                delete $hashCheck{'name'};
                delete $hashCheck{'type'};
                delete $hashCheck{'hash'};
            }
        }else{
            $val1=$hashCheck{$keyCheck};
            my %hashChild1=%$val1;
            checkForderCreate(\%hashChild1);
        }
    }
}
#menu option
sub menu{
    print " ban muon update file khong\n";
    $yes=<STDIN>;
    chomp $yes;
    if(lc($yes) eq "y"){
        writeFile();
    }
}

#call function
sub main{
    if($#ARGV){
        print "hay truyen vao duong dan thu muc\n"
    }else{
        readFile();
        %dataCheck=getInformation($ARGV[0]);
        @ids=getIDFolder();
        if(@ids){
            my %hashRead= getData(\@ids);
            my %myhash = checkFile(\%hashRead,\%dataCheck);
            checkForderCreate(\%myhash);
        }else{
            print "chua co co so du lieu o muc nay.\n";
        }
        menu();
    }
}
main();