class MainController < UIViewController

  def viewDidLoad
    super

    # Sets a top of 0 to be below the navigation control
    self.edgesForExtendedLayout = UIRectEdgeNone
    rmq.stylesheet = MainStylesheet
    init_nav
    rmq(self.view).apply_style(:root_view)
    rmq.append(UIButton, :issue_message_button).on(:tap){ load_issue_list }
    rmq.append(UILabel,  :alert_label)
    rmq.append(UISwitch, :alert)
  end

  def init_nav
    self.title = 'Ruby Security'
    self.navigationItem.tap do |nav|
      nav.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(
        UIBarButtonSystemItemPlay,
        target: self,
        action: :nav_right_button
      )
    end
  end

  def load_issue_list
    Cve.load_short_list do |cve|
      controller = IssuesController.alloc.initWithData(cve)
      self.navigationController.pushViewController(controller, animated: true)
    end
  end
end
