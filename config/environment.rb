# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Removal of division wrapping with fieldWithErrors class
ActionView::Base.field_error_proc = Proc.new { |html_tag, instance| html_tag.html_safe }
