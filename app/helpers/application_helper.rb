module ApplicationHelper
  def full_title page_title = ""
    base_title = t("static_pages.about.base_title")
    page_title ? (page_title + " | " + base_title) : base_title
  end
end
