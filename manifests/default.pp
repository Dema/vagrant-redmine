node default {
	class { 'postgresql::server': }

	->
	postgresql::server::db { 'redminedb':
		user     => 'redminedbu',
		password => postgresql_password('redminedbu', 'hgksdkghjsdhu345tr'),
	}
	->
	class { 'redmine':
		app_root             => '/srv/redmine',
		redmine_source       => 'https://github.com/redmine/redmine.git',
		redmine_revision     => 'origin/3.1-stable',
		redmine_user         => 'deployment',
		db_adapter           => 'pgsql',
		db_name              => 'redminedb',
		db_user              => 'redminedbu',
		db_password          => 'hgksdkghjsdhu345tr',
		db_host              => 'localhost',
		db_port              => '5432',
		rvm_ruby             => '1.9.3@redmine',
	}
}
