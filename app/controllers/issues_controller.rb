class IssuesController < UITableViewController

  ISSUES_CELL_ID = "IssuesCell"

  def initWithData(data)
    self.initWithNibName(nil, bundle: nil)
    @data = data
    self
  end

  def viewDidLoad
    super
    self.title = "Issue List"

    load_data

    rmq.stylesheet = IssuesControllerStylesheet

    view.tap do |table|
      table.delegate   = self
      table.dataSource = self
      rmq(table).apply_style :table
    end
  end

  def load_data
    puts @data['exposures'].inspect
    @data = @data['exposures']
  end

  def tableView(table_view, numberOfRowsInSection: section)
    @data.length
  end

  def tableView(table_view, heightForRowAtIndexPath: index_path)
    rmq.stylesheet.issues_cell_height
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    data_row = @data[index_path.row] # what does this do?

    cell = table_view.dequeueReusableCellWithIdentifier(ISSUES_CELL_ID) || begin
      rmq.create(IssuesCell, :issues_cell, reuse_identifier: ISSUES_CELL_ID).get

      # If you want to change the style of the cell, you can do something like this:
      # rmq.create(IssuesCell, :issues_cell, reuse_identifier: ISSUES_CELL_ID,
      # cell_style: UITableViewCellStyleSubtitle).get
    end
    cell.update(data_row)
    rmq(cell).off(:tap).on(:tap){ open_show_issue_controller(data_row) }
    cell
  end

  def open_show_issue_controller(data_row)
    puts data_row.inspect
    controller = ShowIssueController.alloc.initWithNibName(nil, bundle: nil)
    self.navigationController.pushViewController(controller, animated: true)
  end
end
