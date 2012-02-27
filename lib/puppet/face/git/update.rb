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
      `cd #{@gitcache} && git fetch origin && git checkout origin/#{@gitbranch}`
      return
    end
  end
end
