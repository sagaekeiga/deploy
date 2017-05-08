module ApplicationHelper
  def qiita_markdown(markdown)
    processor = Qiita::Markdown::Processor.new(hostname: "deploy-sagae.c9users.io")
    processor.call(markdown)[:output].to_s.html_safe
  end
end
