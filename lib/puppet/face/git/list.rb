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
      Dir.foreach(@gitcache) { |d|
        unless ['..', '.'].index(d)
          metadata_path = "#{@gitcache}/#{d}/.puppet-git"
         
          def get_metadata(key)
            File.open("#{key}", 'r') {|f| return f.readline}
          end
          
          puts get_metadata("#{metadata_path}/url")

          puts "\tmd5sum: " << d
          puts "\tmanifest: " << get_metadata("#{metadata_path}/manifest")
          puts "\tmodulepath: " << get_metadata("#{metadata_path}/modulepath")
        end
      }
    end
  end
end
