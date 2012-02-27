require 'digest/md5'

Puppet::Face.define(:git, '0.0.1') do
  action :add do
    summary "Add a remote git repository"
    arguments "<giturl>"
    description <<-'EOT'
      Add a remote git repository
    EOT
    returns <<-'EOT'
      Nothing
    EOT
    examples <<-'EOT'
      Add a repository:

      $ puppet git add https://github.com/user/project.git
    EOT

    when_invoked do |giturl, options|
      config(options)
      digest = Digest::MD5.hexdigest(giturl)
      `git clone #{giturl} #{@gitcache}/#{digest}`
      return
    end
  end
end
