#!/usr/bin/perl
use strict;

my $fname = ""; my $fh;
if (@ARGV){
  if (@ARGV[0] ne ""){ $fname = @ARGV[0]; }
}

my @flist0 = glob "/var/lib/mana-toolkit/net-creds.log.*";
my @flist1 = glob "/var/lib/mana-toolkit/sslsplit-connect.log.*";
my @flist2 = 0; #glob "/var/lib/mana-toolkit/sslstrip.log.*";
if ((@flist0)||(@flist1)||(@flist2)){
  if ($fname ne ""){
    open($fh, '>', $fname)
      or die "Could not open file '$fname' $!";
  } 
}

#repeat for @flist0
for(@flist0){
  open(my $rh, '+<:', $_)
    or die "Could not open file '$_' $!"; 

  if ($fname ne "") { print $fh $_.":\n"; }
  else { print $_.":\n"; }
  while (my $row = <$rh>){
    if ($fname ne "") { print $fh $row; }
    else { print $row; }
  }
}

#repeat for @flist1
for(@flist1){
  open(my $rh, '+<:', $_)
    or die "Could not open file '$_' $!"; 

  if ($fname ne "") { print $fh $_.":\n"; }
  else { print $_.":\n"; }
  while (my $row = <$rh>){
    if ($fname ne "") { print $fh $row; }
    else { print $row; }
  }
}

#repeat for @flist2
for(@flist2){
  open(my $rh, '+<:', $_)
    or die "Could not open file '$_' $!"; 

  if ($fname ne "") { print $fh $_.":\n"; }
  else { print $_.":\n"; }
  while (my $row = <$rh>){
    if ($fname ne "") { print $fh $row; }
    else { print $row; }
  }
}

