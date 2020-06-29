python -c "from dbmigrator.cli import main; from postgres_migration.main import migrations_directory; main(['--migrations-directory={}'.format(migrations_directory), '--db-connection-string=user=postgres password=postgres host=localhost
', 'init', '--version=0'])"
