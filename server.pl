use Socket;
 use strict;
use LWP::Simple;

my $port = shift || 8080  ;
my $proto = getprotobyname('tcp');
my $server = "localhost";
my $browser = LWP::UserAgent->new;

defined($port) or die "Usage $0 portno\n";

my $url = 'http://www.faizahIbrahim.com';
my $file = 'public.html';

my $response = getstore($url,$file);
	die "Can't get $response --";
	
system("Start file ://$response");
                   
socket (SOCKET,PF_INET,SOCK_STREAM,$proto)
	or die "Can't open socket $!\n";

setsockopt(SOCKET,SOL_SOCKET,SO_REUSEADDR,1)
	or die "Can't set socket option to SO_REUSEADDR $!\n";

bind(SOCKET,pack_sockaddr_in($port,inet_aton($server)))
	or die "Can't bind to port $port!\n";

listen(SOCKET,5)
	or die "listen: $!\n";
print "Server started on port $port\n";

my $client_addr;
while($client_addr = accept(NEW_SOCKET,SOCKET))
{
	my $name = gethostbyaddr($client_addr, AF_INET);
	print $contents ;
	close NEW_SOCKET;
}
 
