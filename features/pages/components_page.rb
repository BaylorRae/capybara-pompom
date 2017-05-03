class ComponentsPage < Capybara::PomPom::Page

  class OverviewComponent < Capybara::PomPom::Component
    css :title, '.overview-title'
    css :description, '.overview-description'
  end

  class OnlineStatusComponent < Capybara::PomPom::Component
    css :name, '.name'
    css :status, '.status'
  end

  component :overview_component, '.overview'
  components :statuses, '.online-status-user', wrapper: OnlineStatusComponent

end
