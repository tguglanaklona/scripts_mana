#!/usr/bin/perl
use strict;

my $originalfile = $ARGV[0];

open(my $fh, '+<:encoding(UTF-8)', $originalfile)
  or die "Could not open file '$originalfile' $!";
 
while (my $row = <$fh>) {
  chomp $row;

  print "'$row', ";
}
