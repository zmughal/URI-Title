use warnings;
use strict;
use Test::More;
use lib 'lib';
use URI::Title qw(title);

require IO::Socket;
my $s = IO::Socket::INET->new(
  PeerAddr => "www.yahoo.com:80",
  Timeout  => 10,
);

if ($s) {
  close($s);
  plan tests => 2;
} else {
  plan skip_all => "no net connection available";
  exit;
}

#is(
#  title('http://jerakeen.org/test/uri-title.html'),
#  "URI::Title test",
#  "got title for jerakeen.org");

ok(
  title('http://theregister.co.uk/content/6/34549.html') =~ /lack of technology may harm your prospects/,
  "got register title");

ok(
  title('http://twitter.com/al3x/status/1039647490') eq 'twitter by al3x - Arianna Huffington: not a good saleswoman for blogging.',
  "got Twitter status");
