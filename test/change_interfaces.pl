#!/usr/bin/perl
use strict;

my $originalfile = 'start-nat-full.sh.bak';#readonly
my $filename = 'start-nat-full.sh.temp';

my $upstream = 'wlan0';#eth0 # == @ARGV[0]
my $phy = 'wlan1';           # == @ARGV[1]

if (@ARGV){
  if (@ARGV[0] ne ""){ $upstream = @ARGV[0]; }
  if (@ARGV[1] ne ""){ $phy = @ARGV[1]; }
}

open(my $rh, '+<:encoding(UTF-8)', $originalfile)
  or die "Could not open file '$originalfile' $!";
open(my $fh, '>:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";

my $k = 0;
while (my $row = <$rh>) {
  if ($k==2){
    print 'upstream='.$upstream."\n"; #verbose
    print $fh 'upstream='.$upstream."\n";
  }
  elsif ($k==3){
    print 'phy='.$phy."\n"; #verbose
    print $fh 'phy='.$phy."\n";
  }
  else{
    print $fh $row;
  }
  $k = $k+1;
}
