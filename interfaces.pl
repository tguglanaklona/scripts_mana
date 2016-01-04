#!/usr/bin/perl
use strict;

my $originalfile = 'start-nat-full.sh.bak';#readonly
my $filename = 'start-nat-full.sh';

my $upstream = 'wlan0';#eth0 # == @ARGV[0]
my $phy = 'wlan1';           # == @ARGV[1]


my $nstr_upstream_const = 2;
my $nstr_phy_const = 3;

if (@ARGV){
  if (@ARGV[0] ne ""){ $upstream = @ARGV[0]; }
  if (@ARGV[1] ne ""){ $phy = @ARGV[1]; }

  open(my $fh, '>:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";
  open(my $rh, '+<:encoding(UTF-8)', $originalfile)
    or die "Could not open file '$originalfile' $!";
  
  my $k = 0; print "changed values:\n";
  while (my $row = <$rh>) {
    if ($k==$nstr_upstream_const){
      print 'upstream='.$upstream."\n"; #verbose
      if (@ARGV){ print $fh 'upstream='.$upstream."\n"; }
    }
    elsif ($k==$nstr_phy_const){
      print 'phy='.$phy."\n"; #verbose
      if (@ARGV){ print $fh 'phy='.$phy."\n"; }
    }
    else{
      if (@ARGV){ print $fh $row; }
    }
    $k = $k+1;
  }
}
else{ #read current
  open(my $fh, '+<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";
  
  my $k = 0; print "current values:\n";
  while (my $row = <$fh>) {
    if ($k==$nstr_upstream_const){
      print $row;
    }
    elsif ($k==$nstr_phy_const){
      print $row;
    }
    else{
    }
    $k = $k+1;
  }
}
