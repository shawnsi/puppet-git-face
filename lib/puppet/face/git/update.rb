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
      `cd #{@gitcache} && git checkout #{@gitbranch} && git pull origin #{@gitbranch}`
      return
    end
  end
end
