#!/usr/bin/perl
use strict;

my $fname = ""; my $fh;
if (@ARGV){
  if (@ARGV[0] ne ""){ $fname = @ARGV[0]; }
}

my @flist = glob "/var/lib/mana-toolkit/net-creds.log.*";
if (@flist){
  if ($fname ne ""){
    open($fh, '>:encoding(UTF-8)', $fname)
      or die "Could not open file '$fname' $!";
  } 
}

for(@flist){
  open(my $rh, '+<:encoding(UTF-8)', $_)
    or die "Could not open file '$_' $!"; 

  if ($fname ne "") { print $fh $_.":\n"; }
  else { print $_.":\n"; }
  while (my $row = <$rh>){
    if ($fname ne "") { print $fh $row; }
    else { print $row; }
  }
}


