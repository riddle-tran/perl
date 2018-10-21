#!/usr/bin/perl
#https://docstore.mik.ua/orelly/perl/prog3/ch09_04.htm
use JSON;
use Data::Dumper;

$json = '{"m":{"ddd":2,"dddy":5},"a":1,"b":2,"c":3,"d":4,"e":5}';

$text = decode_json($json);
%hashText=%$text;
@keys =keys %hashText;
foreach  (@keys){
    if($_ eq "m" ){
        @keyy =keys %{$hashText{$_}};
        foreach  (@keyy){
            print "$_ ss\n"
        }
    }
}