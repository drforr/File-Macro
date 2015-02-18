#!perl -T

use Test::More tests => 10;

use_ok( 'File::Macro' ) || print "Bail out!\n";

{ my $str;
  ok(!defined $_);
  with_file( 't/01-base.t', '<', sub {
    $str = <$_>;
  } );
  ok(!defined $_);
  ok($str);
  like($str, qr/perl/);
}

{ my $str;
  $_ = 'foo';
  with_file( 't/01-base.t', '<', sub {
    $str = <$_>;
  } );
  ok($_ eq 'foo');
  ok($str);
  like($str, qr/perl/);
}

{ my $str;
  my $fh;
  with_file( 't/01-base.t', '<', \$fh, sub {
    $str = <$fh>;
  } );
  ok($str);
  like($str, qr/perl/);
}
