Dir["#{File.dirname(__FILE__)}/recipes/*.rb"].sort.each do |path|
  require "sunrise/deploy/recipes/#{File.basename(path, '.rb')}"
end