#!/usr/bin/perl -w
use strict;

my @tmp;
my %hash;
open( my $fd , "<" , "./data");
while(<$fd>)
{
  @tmp = split;
  if ( $hash{$tmp[0]} )
  {
    push $hash{$tmp[0]} , $tmp[1] , $tmp[2]  ;
  } else {
    $hash{$tmp[0]} =  [ $tmp[1] , $tmp[2] ]  ;
  }
}
#use YAML::XS;print YAML::XS::Dump \%hash;

for my $key ( keys %hash )
{
  print "define group: $key " . "\n";
  my %tmp = @{ $hash{$key} };
  while( (my $k , my $v) = each %tmp ) {
  print $k . " " . $v . "\n";
  }
}

