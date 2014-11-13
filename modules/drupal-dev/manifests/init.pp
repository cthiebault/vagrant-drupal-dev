class drupal_dev {

    $packages = [
        'python-software-properties',
        'curl',
        'vim',
        'zip',
        'bzip2',
        'fontconfig',
        'make',
        'devscripts'    
    ]

    class { 'apache': }

    include php
    include php::apt
    include php::params
    include php::pear

    apache::mod { 'php5': }
    apache::mod { 'rewrite': }

    # Extensions must be installed before they are configured
    Php::Extension <| |> -> Php::Config <| |>


    include git
    git::config { 'user.name':
         value => 'Cedric Thiebault',
    }

    git::config { 'user.email':
        value => 'cedric.thiebault@gmail.com',
    }

    class { '::mysql::server':
        root_password => '1234',
    }

}