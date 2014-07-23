class IssuesController < UITableViewController

  ISSUES_CELL_ID = "IssuesCell"

    # @data = [{:name=>"CVE-2014-4937", :num=>55}, {:name=>"CVE-2014-4938", :num=>21}, {:name=>"CVE-2014-4939", :num=>17}, {:name=>"CVE-2014-4940", :num=>73}, {:name=>"CVE-2014-4941", :num=>41}, {:name=>"CVE-2014-4942", :num=>37}]
  def initWithData(data)
    self.initWithNibName(nil, bundle: nil)
    @data = data
    self
  end

  def viewDidLoad
    super

    self.title = "Issue List"
    rmq.stylesheet = IssuesControllerStylesheet

    view.tap do |table|
      table.delegate = self
      table.dataSource = self
      rmq(table).apply_style :table
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
      puts "#{ISSUES_CELL_ID}"
      rmq.create(IssuesCell, :issues_cell, reuse_identifier: ISSUES_CELL_ID).get

      # If you want to change the style of the cell, you can do something like this:
      # rmq.create(IssuesCell, :issues_cell, reuse_identifier: ISSUES_CELL_ID,
      # cell_style: UITableViewCellStyleSubtitle).get
    end
    cell.update(data_row)
    rmq(cell).off(:tap).on(:tap){ open_show_issue_controller }
    cell
  end

  def open_show_issue_controller
    puts "\t\t\t#{Thread.current}"
    controller = ShowIssueController.alloc.initWithNibName(nil, bundle: nil)
    self.navigationController.pushViewController(controller, animated: true)
  end
end
