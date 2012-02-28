require 'digest/md5'
require 'git'

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
      path = "#{@gitcache}/#{digest.to_s}"
      metadata_path = "#{path}/.puppet-git"
      g = Git.clone(giturl, path)

      # Create the .puppet-git directory to store info for this face
      FileUtils::mkdir(metadata_path)
    
      def add_metadata(key, value)
        f = File.new("#{key}", 'w+')
        f.puts value
        f.close
      end

      add_metadata("#{metadata_path}/url", giturl)
      add_metadata("#{metadata_path}/modulepath", @gitmodulepath)
      add_metadata("#{metadata_path}/manifest", @gitmanifest)
      return
    end
  end
end
