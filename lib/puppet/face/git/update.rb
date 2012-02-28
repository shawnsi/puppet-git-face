require 'git'

Puppet::Face.define(:git, '0.0.1') do
  action :update do
    summary "Update local git cache"
    description <<-'EOT'
      Update local git cache
    EOT
    returns <<-'EOT'
      Nothing
    EOT
    examples <<-'EOT'
      Update default repository:

      $ puppet git update
    EOT
    
    when_invoked do |options|
      config(options)
      Dir.foreach(@gitcache) { |d|
        unless ['..', '.'].index(d)
          g = Git.open("#{@gitcache}/#{d}")
          g.fetch()
          g.checkout("origin/#{@gitbranch}")
        end
      }
      return
    end
  end
end
