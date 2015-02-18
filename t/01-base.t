#!perl -T

use Test::More tests => 11;

use_ok( 'File::Macro' ) || print "Bail out!\n";

{ my $str;
  ok(!defined $_);
  with_file( 't/00-load.t', '<', sub {
    $str = <$_>;
  } );
  ok(!defined $_);
  ok($str);
  like($str, qr/perl/);
}

{ my $str;
  $_ = 'foo';
  with_file( 't/00-load.t', '<', sub {
    $str = <$_>;
  } );
  ok($_ eq 'foo');
  ok($str);
  like($str, qr/perl/);
}
{ my $str;
  with_file( 't/00-load.t', '<', (my $fh), sub {
#my $fh;
#  with_file( 't/00-load.t', '<', $fh, sub {
#  #with_file( 't/00-load.t', '<', my $fh, sub {
    $str = <$fh>;
  } );
  ok($str);
  like($str, qr/perl/);
}
