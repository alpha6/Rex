use strict;
use warnings;

use Test::More tests => 8;

my %have_mods = (
  'Net::SSH2'             => 1,
  'Net::OpenSSH'          => 1,
  'DBI'                   => 1,
  'IPC::Shareable'        => 1,
  'Parallel::ForkManager' => 1,
);

for my $m ( keys %have_mods ) {
  my $have_mod = 1;
  eval "use $m;";
  if ($@) {
    $have_mods{$m} = 0;
  }
}

SKIP: {
  diag "DBI module not installed. Database access won't be available."
    unless $have_mods{'DBI'};
  skip "DBI module not installed. Database access won't be available.", 3
    unless $have_mods{'DBI'};
  use_ok 'Rex::Commands::DB';
  use_ok 'Rex::Group::Lookup::DBI';
  use_ok 'Rex::Helper::DBI';
}

SKIP: {
  skip
    "Net::SSH2 module not found. You need Net::SSH2 or Net::OpenSSH module to connect to servers via SSH.",
    1
    unless $have_mods{'Net::SSH2'};
  use_ok 'Rex::Interface::Connection::SSH';
}

SKIP: {
  skip
    "Net::OpenSSH module not found. You need Net::SSH2 or Net::OpenSSH module to connect to servers via SSH.",
    1
    unless $have_mods{'Net::OpenSSH'};
  use_ok 'Rex::Interface::Connection::OpenSSH';
}

SKIP: {
  diag "You need IPC::Shareable module to use Rex::Output modules."
    unless $have_mods{'IPC::Shareable'};
  skip "You need IPC::Shareable module to use Rex::Output modules.", 2
    unless $have_mods{'IPC::Shareable'};
  use_ok 'Rex::Output::JUnit';
  use_ok 'Rex::Output';
}

SKIP: {
  diag
    "You need Parallel::ForkManager to use Parallel_ForkManager distribution method."
    unless $have_mods{'Parallel::ForkManager'};
  skip
    "You need Parallel::ForkManager to use Parallel_ForkManager distribution method.",
    1
    unless $have_mods{'Parallel::ForkManager'};
  use_ok 'Rex::TaskList::Parallel_ForkManager';
}
