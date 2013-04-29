#! /usr/bin/env perl

use strict;
use warnings;

use Plack::Request;
use Plack::Response;

my $app = sub {
    my $env = shift;
    my $req = Plack::Request->new($env);

    my $path_info = $req->path_info;
    my $query     = $req->param('query');

    # new Plack::Response
    my $res       = $req->new_response(200);
    $res->finalize;

};

__END__
