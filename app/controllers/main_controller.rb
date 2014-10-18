class MainController < UIViewController

  def viewDidLoad
    super

    # Sets a top of 0 to be below the navigation control
    self.edgesForExtendedLayout = UIRectEdgeNone
    rmq.stylesheet = MainStylesheet
    init_nav
    rmq(self.view).apply_style(:root_view)
    rmq.append(UIButton, :issue_message_button).on(:tap){ load_issue_list }
  end

  def init_nav
    self.title = 'Ruby Security'
    update_recent_cve_count
  end

  def update_recent_cve_count
    Cve.new.get_recent_count do |cve|
      rmq(:issue_message_button).data("Recent issues #{cve['count']}")
    end
  end

  def load_issue_list
    Cve.new.load_short_list do |cve|
      controller = IssuesController.alloc.initWithData(cve)
      self.navigationController.pushViewController(controller, animated: true)
    end
  end
end
