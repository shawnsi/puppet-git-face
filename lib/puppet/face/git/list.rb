Puppet::Face.define(:git, '0.0.1') do
  action :list do
    summary "List configured git repositories"
    description <<-'EOT'
      List each locally cached git repository
    EOT
    returns <<-'EOT'
      A list of configured git repositories
    EOT
    examples <<-'EOT'
      List all git repositories:

      $ puppet git list
    EOT

    when_invoked do |options|
      config(options)
      `for repo in #{@gitcache}/*; do echo -n \`basename $repo\`:; cat $repo/.giturl; done`
    end
  end
end
