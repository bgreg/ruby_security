class MainController < UIViewController

  def viewDidLoad
    super

    # Sets a top of 0 to be below the navigation control
    self.edgesForExtendedLayout = UIRectEdgeNone
    rmq.stylesheet = MainStylesheet
    init_nav
    rmq(self.view).apply_style(:root_view)
    rmq.append(UIButton, :issue_message_button).on(:tap){ load_issue_list }
    rmq.append(UILabel, :recent)
  end

  def init_nav
    self.title = 'Ruby Security'

    self.navigationItem.tap do |nav|
      nav.leftBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(
          UIBarButtonSystemItemAction,
          target: self, action: :nav_left_button
      )
      nav.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(
        UIBarButtonSystemItemRefresh,
        target: self, action: :nav_right_button
      )
    end
  end

  def nav_left_button
    puts 'Left button'
  end

  def load_issue_list
    controller = IssuesController.alloc.initWithNibName(nil, bundle: nil)
    self.navigationController.pushViewController(controller, animated: true)
  end

  def nav_right_button
    puts 'Right button'
  end
end
