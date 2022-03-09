=pod
    This is XML parser version 1.0 for w Demo
    Developer - Mandar Ingale.
=cut

use strict; # for coding standard.
use warnings; # to send programming error
use Data::Dumper;
use Getopt::Std; #Module and its not cammel case.

$|=1; # Reduce buffer.



sub main {

=pod
perl parse.pl -a -f text.xml -c
a => 1
c => 1
f => test.xml
=cut

    #Best option to read argument is GetOpt::Std.
    # print Dumper(@ARGV);
  
    my %opts;
    #Accept three flags, -a, -f, -c, if any other flag is passed then its error.
    #only f can take argument hence : after f.
    getopts('af:c', \%opts); # Please remember its getopts(with s). Dont miss it. \ is taking referrence to the Hash table.
                          

    print Dumper(%opts);
    my $file = $opts{'f'};
    print "File name is : $file \n";

=pod
PS C:\Users\maxma\Dev\mac\29_GettingCommandLine> perl .\parse.pl -a -f text.xml -c -d
Unknown option: d
$VAR1 = 'a';
$VAR2 = 1;
$VAR3 = 'c';
$VAR4 = 1;
$VAR5 = 'f';
$VAR6 = 'text.xml';
File name is : text.xml
=cut


    exit 0 ;
    if(!checkusage(\%opts)){ # Check usage is going to check if user has entered correct options or elese it will return correct value.
        usage();
    }





}


sub checkusage { # you can not define return type - scalars , rays and hashes. There is no true or false. its O(False) or 1(True).
    # print Dumper(@_); # these are arguments which Dumper is displaying us from checkusage subroutine. 
    
    #my ($greeting, $number) = @_; # this is best method.
    # print "$greeting number $number";

    my $opts_ref = shift; # $opts_ref is not hash but is referrence to hash - Pointer

    # print $opts{"f"} . "\n"; # you are referring direct hash
    print $opts_ref->{"f"}; # you are refferring pointer.

    return 1;
}

sub usage{ # lets do multi line string.
    print "Incorrect options";
    my $help = <<USAGE; # you can use print statements also. But its multi line string - but looks ugly.

usage: perl main.pl <options>
    -f <file name>  specify file name to parse.
    -a              turn off error checking.
example usage:
    perl main.pl -f test.xml -a

USAGE

    die $help

}

main();
