class IssuesController < UITableViewController

  ISSUES_CELL_ID = "IssuesCell"

  def viewDidLoad
    super
    self.title = "Issue List"

    load_data

    rmq.stylesheet = IssuesControllerStylesheet

    view.tap do |table|
      table.delegate = self
      table.dataSource = self
      rmq(table).apply_style :table
    end
  end

  def load_data
    @data = 0.upto(rand(100)).map do |i| # Test data
      {
        name: %w(Lorem ipsum dolor sit amet consectetur adipisicing elit sed).sample,
        num: rand(100),
      }
    end
  end

  def tableView(table_view, numberOfRowsInSection: section)
    @data.length
  end

  def tableView(table_view, heightForRowAtIndexPath: index_path)
    rmq.stylesheet.issues_cell_height
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    data_row = @data[index_path.row]

    cell = table_view.dequeueReusableCellWithIdentifier(ISSUES_CELL_ID) || begin
      rmq.create(IssuesCell, :issues_cell, reuse_identifier: ISSUES_CELL_ID).get

      # If you want to change the style of the cell, you can do something like this:
      #rmq.create(IssuesCell, :issues_cell, reuse_identifier: ISSUES_CELL_ID,
      #cell_style: UITableViewCellStyleSubtitle).get
    end
    rmq(cell).on(:tap){ open_show_issue_controller }
    cell.update(data_row)
    cell
  end

  def open_show_issue_controller
    controller = ShowIssueController.alloc.initWithNibName(nil, bundle: nil)
    self.navigationController.pushViewController(controller, animated: true)
  end

  # Remove if you are only supporting portrait
  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskAll
  end

  # Remove if you are only supporting portrait
  def willAnimateRotationToInterfaceOrientation(orientation, duration: duration)
    rmq.all.reapply_styles
  end
end
