etc_files = %w(etc/nginx/conf.d/rubygems.conf etc/nginx/conf.d/test)

namespace :config do
  task :install do
    on roles(:app) do
      etc_files.each do |fname|
        sudo :ln, "-sf #{current_path}/#{fname} /#{fname}"
      end
    end
  end
end
