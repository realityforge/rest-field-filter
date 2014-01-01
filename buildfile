require 'buildr/git_auto_version'

desc 'Rest Field Filter'
define 'rest-field-filter' do
  project.group = 'org.realityforge.rest.field_filter'

  compile.options.source = '1.6'
  compile.options.target = '1.6'
  compile.options.lint = 'all'

  pom.add_apache2_license
  pom.add_github_project('realityforge/rest-field-filter')
  pom.add_developer('realityforge', 'Peter Donald')
  pom.provided_dependencies.concat [:javax_annotation]

  compile.with :javax_annotation

  test.using :testng

  package :jar
  package :sources
  package :javadoc
end
