#!/usr/bin/perl -w
use strict;

my @cmd = `ifconfig`;
my ( $eth , %hash );
map{
    chomp;
    if ( /^(\w+):/ ) { 
      	$eth = $1 ; 
    }
    else{
        $hash{$eth} = $1 if /^\s+inet\s((\d+\.){3}\d+)/ ;
    }
} @cmd;
use YAML::XS;print YAML::XS::Dump \%hash;
