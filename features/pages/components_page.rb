class ComponentsPage < Capybara::PomPom::Page

  class OverviewComponent < Capybara::PomPom::Component
    css :title, '.overview-title'
    css :description, '.overview-description'
  end

  component :overview_component, '.overview'

end
