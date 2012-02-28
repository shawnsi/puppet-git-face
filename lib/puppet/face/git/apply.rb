Puppet::Face.define(:git, '0.0.1') do
  action :apply do
    summary "Apply manifests from a local git repository"
    description <<-'EOT'
      Apply manifests from a local git repository
    EOT
    returns <<-'EOT'
      Output of the puppet apply command.
    EOT
    examples <<-'EOT'
      Apply default repository:

      $ puppet git apply
    EOT

    when_invoked do |options|
      config(options)
      update

      Dir.foreach(@gitcache) { |d|
        unless ['..', '.'].index(d)
          def get_metadata(key)
            File.open("#{key}", 'r') {|f| return f.readline.strip}
          end
          
          metadata_path = "#{@gitcache}/#{d}/.puppet-git"
          gitmanifest = get_metadata("#{metadata_path}/manifest")

          @apply = Puppet::Application::Apply.new
          @apply.command_line.args.clear
          @apply.command_line.args << "#{@gitcache}/#{d}/#{gitmanifest}"
          begin
            @apply.main
          rescue SystemExit
          end
        end
      }
    end
  end
end
