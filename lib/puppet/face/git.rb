# We need to load the Face support library...  require 'puppet'
require 'puppet/face'
 
# ...and declare our Face. We have to give it a version; I chose version
# 0.1.0 because Face is still under heavy development. See http://semver.org/
# for the details of why that is an appropriate version number.
Puppet::Face.define(:git, '0.0.1') do
  summary "Pull manifests from git and apply locally"
  copyright "Shawn Siefkas", 2012
  license "Apache 2"
  #author "Shawn Siefkas <shawn@siefk.as>"

  option "--gitbranch GITBRANCH" do
    summary "git branch to apply"
    description <<-'EOT'
      The git branch to apply manifests from.
    EOT
  end
  option "--gitcache GITCACHE" do
    summary "local git repository cache"
    description <<-'EOT'
      The directory where remote git repositories are cloned to.
    EOT
  end
  option "--gitmanifest GITMANIFEST" do
    summary "root manifest in git repository"
    description <<-'EOT'
      The root manifest name in the git repository.
    EOT
  end
  option "--gitmodulepath GITMODULEPATH" do
    summary  "modulepath in git repository"
    description <<-'EOT'
      Optional modulepath relative to the git repository.
    EOT
  end

  def config(options)
    @gitbranch     = options[:gitbranch]     || 'master'
    @gitcache      = options[:gitcache]      || '/home/shawn/.puppet/git'
    @gitmanifest   = options[:gitmanifest]   || 'init.pp'
    @gitmodulepath = options[:gitmodulepath] || 'modules'
  end
end
