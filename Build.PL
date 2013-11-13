
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Perl binding for Redis database",
  "dist_author" => [
    "Pedro Melo <melo\@cpan.org>",
    "Damien Krotkine <dams\@cpan.org>"
  ],
  "dist_name" => "Redis",
  "dist_version" => "1.963",
  "license" => "artistic_2",
  "module_name" => "Redis",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Try::Tiny" => 0,
    "perl" => "5.008"
  },
  "script_files" => [],
  "test_requires" => {
    "Digest::SHA" => 0,
    "File::Spec" => 0,
    "IO::Handle" => 0,
    "IO::String" => 0,
    "IPC::Cmd" => 0,
    "IPC::Open3" => 0,
    "Test::Deep" => 0,
    "Test::Fatal" => 0,
    "Test::More" => "0.98",
    "Test::SharedFork" => 0
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
