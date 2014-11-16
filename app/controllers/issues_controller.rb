class IssuesController < UITableViewController

  ISSUES_CELL_ID = "IssuesCell"

  def initWithData(data)
    self.initWithNibName(nil, bundle: nil)
    @data = data
    self
  end

  def tuple_data
    recents = @data['recents']
    others  = @data['others']
    [recents, others]
  end

  def viewDidLoad
    super
    self.title     = "Issue List"
    rmq.stylesheet = IssuesControllerStylesheet

    view.tap do |table|
      table.delegate   = self
      table.dataSource = self
      rmq(table).apply_style(:table)
    end
  end

  def tableView(table_view, numberOfRowsInSection: section)
    tuple_data[section].length
  end

  def tableView(table_view, heightForRowAtIndexPath: index_path)
    rmq.stylesheet.issues_cell_height
  end

  def tableView(table_view, titleForHeaderInSection: section)
    @data.keys.reverse[section]
      .gsub(/recents/,"Published in the last 30 days").to_s
      .gsub(/others/,"Published since #{Date.today.beginning_of_year}").to_s
  end

  def numberOfSectionsInTableView(tableView)
    2
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    data_row = tuple_data[index_path.section][index_path.row]
    cell = table_view.dequeueReusableCellWithIdentifier(ISSUES_CELL_ID) || begin
      # rmq.create(IssuesCell, :issues_cell, reuse_identifier: ISSUES_CELL_ID).get
      # cell_style: UITableViewCellStyleSubtitle).get
      # If you want to change the style of the cell, you can do something like this:
      rmq.create(IssuesCell, :issues_cell, reuse_identifier: ISSUES_CELL_ID,
      cell_style: UITableViewCellStyleSubtitle).get
    end
    cell.update(data_row)
    rmq(cell).off(:tap).on(:tap){ open_show_issue_controller(data_row) }
    cell
  end

  def open_show_issue_controller(id)
    Cve.new.load_one(id['id']) do |cve|
      controller = ShowIssueController.alloc.initWithId(cve)
      self.navigationController.pushViewController(controller, animated: true)
    end
  end
end
