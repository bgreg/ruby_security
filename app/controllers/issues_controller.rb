class IssuesController < UITableViewController

  ISSUES_CELL_ID = "IssuesCell"

  def initWithData(data)
    self.initWithNibName(nil, bundle: nil)
    @data = build_data data['exposures']
    self
  end

  def viewDidLoad
    super
    self.title = "Issue List"
    rmq.stylesheet = IssuesControllerStylesheet

    view.tap do |table|
      table.delegate   = self
      table.dataSource = self
      rmq(table).apply_style(:table)
    end
  end

  def build_data(exposure_data)
    
    # recents = exposure_data.select{|ed| ed.release_date > 30.days.ago}
    recents = exposure_data.first(5)
    others = exposure_data - recents

    # [ recents, others ]
    {
      Recent: recents,
      Others: others
    }
  end

  def tableView(table_view, numberOfRowsInSection: section)
    data[section].length
  end

  def tableView(table_view, heightForRowAtIndexPath: index_path)
    rmq.stylesheet.issues_cell_height
  end

  def tableView(table_view, titleForHeaderInSection: section)
    @data.keys[section].to_s
  end
  
  def data
    @data.values
  end

  # Build a table vu
  # def tableView(numberOfSectionsInTableView:index_path)
  # end
  #
  #
  #
  #
  def numberOfSectionsInTableView(tableView)
    2
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    puts "1 #{__method__} #{index_path.row} #{index_path.description}"

    data_row = data[index_path.section][index_path.row] # andy what does this do?
    cell = table_view.dequeueReusableCellWithIdentifier(ISSUES_CELL_ID) || begin
      puts "2 #{__method__} #{index_path.row} #{index_path.description}"
      # rmq.create(IssuesCell, :issues_cell, reuse_identifier: ISSUES_CELL_ID).get

      # cell_style: UITableViewCellStyleSubtitle).get
      # If you want to change the style of the cell, you can do something like this:
      rmq.create(IssuesCell, :issues_cell, reuse_identifier: ISSUES_CELL_ID,
      cell_style: UITableViewCellStyleSubtitle).get
    end
    puts "3 #{__method__} #{cell.class} #{cell.class.ancestors}"
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
