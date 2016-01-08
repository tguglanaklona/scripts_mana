#!/usr/bin/perl
use strict;

my @flist0 = glob "/var/lib/mana-toolkit/net-creds.log.*";
my @flist1 = glob "/var/lib/mana-toolkit/sslsplit-connect.log.*";
my @flist2 = glob "/var/lib/mana-toolkit/sslsplit/*"; 
my @flist3 = glob "/var/lib/mana-toolkit/sslstrip.log.*";

my $fname0 = "net-creds.log.txt"; my $fh0;
my $fname1 = "sslsplit-connect.log.txt"; my $fh1;
my $fname2 = "sslsplit.fold.txt"; my $fh2;
my $fname3 = "sslstrip.log.txt"; my $fh3;

#repeat for @flist0
if (@flist0){
  open($fh0, '>', $fname0)
    or die "Could not open file '$fname0' $!";
} 
for(@flist0){
  open(my $rh, '+<:', $_)
    or die "Could not open file '$_' $!"; 

  { print $fh0 $_.":\n"; }
  while (my $row = <$rh>){
    { print $fh0 $row; }
  }
}

#repeat for @flist1
if (@flist1){
  open($fh1, '>', $fname1)
    or die "Could not open file '$fname1' $!";
} 
for(@flist1){
  open(my $rh, '+<:', $_)
    or die "Could not open file '$_' $!"; 

  { print $fh1 $_.":\n"; }
  while (my $row = <$rh>){
    { print $fh1 $row; }
  }
}

#repeat for @flist2
if (@flist2){
  open($fh2, '>', $fname2)
    or die "Could not open file '$fname2' $!";
} 
for(@flist2){
  open(my $rh, '+<:', $_)
    or die "Could not open file '$_' $!"; 

  { print $fh2 $_.":\n"; }
  while (my $row = <$rh>){
    { print $fh2 $row; }
  }
}

#repeat for @flist3
if (@flist3){
  open($fh3, '>', $fname3)
    or die "Could not open file '$fname3' $!";
} 
for(@flist3){
  open(my $rh, '+<:', $_)
    or die "Could not open file '$_' $!"; 

  { print $fh3 $_.":\n"; }
  while (my $row = <$rh>){
    { print $fh3 $row; }
  }
}

