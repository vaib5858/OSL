use strict;
use warnings;
use autodie;

#my $inp = <STDIN>;
#print "$inp \n";
use File::Find;
my %dirs = ();
my %fils = ();
 my $filename = "E:/reporta.txt";
    open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
find(\&dir_names, "V:/");
sub dir_names {
 if(-d $File::Find::dir,'/'){
	#print $fh "$File::Find::dir\n";
	if( exists($dirs{"$File::Find::dir"} ) ){
	
	}
	else{
	$dirs{"$File::Find::dir"} = 1;
	}
  }
}

my @names = keys %dirs;
for my $q (@names){
	#print $fh ("$q \n");
 }

foreach my $b (@names){
	 my $dir = $b;

    opendir(DIR, $dir) or die $!;

    while (my $file = readdir(DIR)) {

        next unless (-f "$dir/$file");

	#print "$file\n";
	
	if( exists($fils{"$file"} ) ){
	$fils{"$file"}.=",\n$b - $file";
	}
	else{
	$fils{"$file"} = "$b - $file";
	}

    }

    closedir(DIR);
 }
while( my( $key, $value ) = each %fils ){
    #print "$key: $value\n\n";
}

 my @dups = values %fils;
   my $c = "\n";
#print Dumper(\%name);
#print "$name{'hello.txt'}\n";
       
    print $fh "Duplicate files in V:/\n";
    
foreach my $w (@dups){
   if (index($w, $c) != -1) {
    print $fh "$w \n";
    print $fh "\n\n\n\n"
}
}

#foreach my $k (@dups){
#   #print "$key \n\n";
#   if (index($k, $inp) != -1) {
#    print "$k \n";
#
#}
close $fh;