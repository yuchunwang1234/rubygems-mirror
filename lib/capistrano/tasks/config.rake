etc_files = %w(etc/nginx/conf.d/rubygems.org etc/nginx/conf.d/test)

namespace :config do
  task :install do
    on roles(:app) do
      etc_files.each do |fname|
        execute "ln -sf #{current_path}/#{fname} /#{fname}"
      end
    end
  end
end
