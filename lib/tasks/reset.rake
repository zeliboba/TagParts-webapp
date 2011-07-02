namespace :reset do
  desc "Set updated_at to zero for parts"
  task :updated_at => :environment do
    Part.all.each do |p|
      p.updated_at = DateTime::new if p.created_at == p.updated_at
      p.save
    end
  end

end
