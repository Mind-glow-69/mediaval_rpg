module Dev
  class MockupsController < ApplicationController
    before_action :ensure_development!

    MOCKUP_DIR = Rails.root.join('app', 'assets', 'input_maquette')

    def index
      @files = Dir.children(MOCKUP_DIR).sort
    end

    def show
      name = params[:name].to_s
      files = Dir.children(MOCKUP_DIR)
      unless files.include?(name)
        render plain: 'Not found', status: :not_found and return
      end

      path = MOCKUP_DIR.join(name)
      content = File.read(path)
      render html: content.html_safe, layout: false, content_type: 'text/html'
    end

    private

    def ensure_development!
      render plain: 'Not available in this environment', status: :forbidden unless Rails.env.development?
    end
  end
end
