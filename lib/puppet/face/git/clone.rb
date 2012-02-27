Puppet::Face.define(:git, '0.0.1') do
  action :clone do
    summary "Clone remote git repository"
    description <<-'EOT'
      Clone remote git repository
    EOT
    returns <<-'EOT'
      Nothing
    EOT
    examples <<-'EOT'
      Clone default repository:

      $ puppet git clone
    EOT
    
    when_invoked do |options|
      config(options)
      `git clone #{@giturl} #{@gitcache}`
      return
    end
  end
end
