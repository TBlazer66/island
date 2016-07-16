use strict; 
use Config;
use Config qw(myconfig);

=head1 SYNOPSIS

The castaways have to figure out where their compilers are, in order to be able to compile, link, and execute a solution. You could use coconuts, but I'm gonna use C.

=cut

print myconfig();
print "^^^^^that is myconfig-------\n";
my $datestring = localtime();
print "Local date and time $datestring\n";


