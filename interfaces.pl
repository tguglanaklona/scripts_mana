#!/usr/bin/perl
use strict;

my $originalfile = '/usr/share/mana-toolkit/run-mana/start-nat-full.sh.bak';#readonly
my $filename = '/usr/share/mana-toolkit/run-mana/start-nat-full.sh';
my $settingsoriginalfile = '/etc/mana-toolkit/hostapd-karma.conf.bak';#readonly
my $settingsfilename = '/etc/mana-toolkit/hostapd-karma.conf';

my $upstream = 'wlan0';#eth0     # == @ARGV[0]
my $phy = 'wlan1';               # == @ARGV[1]
my $bssid = '00:11:22:33:44:00'; # == @ARGV[2]
my $ssid = 'Internet';           # == @ARGV[3]


my $nstr_upstream_const = 2;
my $nstr_phy_const = 3;
my $nstr_interface_const = 0;
my $nstr_bssid_const = 1;
my $nstr_ssid_const = 3;

if (@ARGV){
  if (@ARGV[0] ne ""){ $upstream = @ARGV[0]; }
  if (@ARGV[1] ne ""){ $phy = @ARGV[1]; }
  if (@ARGV[2] ne ""){ $bssid = @ARGV[2]; }
  if (@ARGV[3] ne ""){ $ssid = @ARGV[3]; }

  open(my $fh, '>:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";
  open(my $rh, '+<:encoding(UTF-8)', $originalfile)
    or die "Could not open file '$originalfile' $!";

  open(my $sfh, '>:encoding(UTF-8)', $settingsfilename)
    or die "Could not open file '$settingsfilename' $!";
  open(my $srh, '+<:encoding(UTF-8)', $settingsoriginalfile)
    or die "Could not open file '$settingsoriginalfile' $!";
  
  my $k = 0; my $row = 0;
  print "changed values:\n";
  while ($row = <$rh>) {
    if ($k==$nstr_upstream_const){
      print 'upstream='.$upstream."\n"; #verbose
      { print $fh 'upstream='.$upstream."\n"; }
    }
    elsif ($k==$nstr_phy_const){
      print 'phy='.$phy."\n"; #verbose
      { print $fh 'phy='.$phy."\n"; }
    }
    else{
      { print $fh $row; }
    }
    $k = $k+1;
  }
  $k = 0; $row = 0;
  while ($row = <$srh>) {
    if ($k==$nstr_interface_const){
      print 'interface='.$phy."\n"; #verbose
      { print $sfh 'interface='.$phy."\n"; }
    }
    elsif ($k==$nstr_bssid_const){
      print 'bssid='.$bssid."\n"; #verbose
      { print $sfh 'bssid='.$bssid."\n"; }
    }
    elsif ($k==$nstr_ssid_const){
      print 'ssid='.$ssid."\n"; #verbose
      { print $sfh 'ssid='.$ssid."\n"; }
    }
    else{
      { print $sfh $row; }
    }
    $k = $k+1;
  }
}
else{ #read current
  open(my $fh, '+<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";
  open(my $sfh, '+<:encoding(UTF-8)', $settingsfilename)
    or die "Could not open file '$settingsfilename' $!";

  my $k = 0; my $row = 0; 
  print "current values:\n";
  while ($row = <$fh>) {
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
  $k = 0; $row = 0;
  while ($row = <$sfh>){
    if ($k==$nstr_interface_const){
      print $row;
    }
    elsif ($k==$nstr_bssid_const){
      print $row;
    }
    elsif ($k==$nstr_ssid_const){
      print $row;
      #last;
    }
    else{
    }
    $k = $k+1;
  }
}
