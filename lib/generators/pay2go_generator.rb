class Pay2goGenerator < Rails::Generators::Base
  desc "This generator creates the needed files for pay2go"
  source_root File.expand_path(__FILE__)

  def copy_initializer_file
    copy_file "../templates/pay2go.rb", "config/initializers/pay2go.rb"
    copy_file "../templates/pay2go.yml", "config/pay2go.yml"
  end
end
