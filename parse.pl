=pod
    This is XML parser version 1.0 for Macquarie Interview Demo
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

    #to know what users are typing on command line. 
    # in Perl all command line arguments comes in ARG array

    # print Dumper(@ARGV); # willl give you command line argument in Variable and key formate
    # print $ARGV[0]; # will show first argument  

    #Best option to read argument is GetOpt::Std.

    my %opts;
    getopts('af:c', \%opts); # Please remember its getopts(with s). Dont miss it. \ is taking referrence to the Hash table.
                          # Important thing is : as it will help to treat variable as actual argument. or else just parameter.

    #print Dumper(%opts);

    # my $file = $opts{'f'};

    # print "File:$file\n";

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
