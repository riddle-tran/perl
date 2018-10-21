#!/usr/bin/perl

sub json{
    $a1=$_[0];
    %a=%$a1;
    $a{'ddddddd'}={
        'aaaaaaaaaaa'  => 'right',
        'smallest' => 'left'
    };
    $a{'lll'}="ssssssssssssss";
     $a{'m'}=[ 'hamnet', 'shakespeare', 'robyn'];
    @keys =keys %a;
    foreach $key(@keys){
        print $a{$key}.":".ref($a{$key})."\n";
    }
}
sub main{
    my %hash = (
         'arms' => {
                  'biggest'  => {
                        'aaaaaaaaaaa'  => 'right',
                        'smallest' => 'left'
                  },
                  'smallest' => 'yours',

                 },
         'feet' => {
                  'biggest'  => 'right',
                  'smallest' => 'left'
                 },
         'legs' => {
                  'biggest'  => 'theirs',
                  'smallest' => 'them',
                  'muscular' => 'yes'
                 },
         'uuu'=>'kkk'
     );
      json($hash{'arms'}{'biggest'})
}
main()