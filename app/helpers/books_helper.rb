# frozen_string_literal: true

require 'html/pipeline'
module BooksHelper
  def translate_attribute(attribute)
    Book.human_attribute_name(attribute)
  end

  def callman(text)
    #filter = HTML::Pipeline::MarkdownFilter.new(text)
    filter = HTML::Pipeline::AutolinkFilter.new(text)
    filter.call.html_safe
  end
end
