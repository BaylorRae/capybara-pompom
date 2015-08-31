class LinksPage < Capybara::PomPom::Page

  link :view_form, "View Form"

  def visit_forms_page
    view_form.click
  end

end
