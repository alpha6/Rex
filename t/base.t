use strict;
use warnings;

use Test::More;
use Test::UseAllModules under => qw(lib);

all_uses_ok except => qw(
  Rex::Commands::DB
  Rex::Commands::Rsync
  Rex::Group::Lookup::DBI
  Rex::Group::Lookup::INI
  Rex::Group::Lookup::XML
  Rex::Helper::DBI
  Rex::Helper::INI
  Rex::Interface::Connection::SSH
  Rex::Interface::Connection::OpenSSH
  Rex::Output::JUnit
  Rex::Output
  Rex::TaskList::Parallel_ForkManager
  Rex::Cloud::Amazon
);
