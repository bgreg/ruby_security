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
    # @data["recents"].count + @data['others'].count
    puts "1 #{__method__} data:#{@data.inspect} section:#{section}"
    tuple_data[section].length
  end

  def tableView(table_view, heightForRowAtIndexPath: index_path)
    rmq.stylesheet.issues_cell_height
  end

  def tableView(table_view, titleForHeaderInSection: section)
    @data.keys[section].to_s
  end

  def numberOfSectionsInTableView(tableView)
    2
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    # puts "2 #{__method__} #{@data.inspect}"
    puts "2 #{__method__} |#{index_path.section}| |#{index_path.row}|"
    data_row = tuple_data[index_path.section][index_path.row]
    puts "3 #{__method__} |#{data_row.inspect}|"

    cell = table_view.dequeueReusableCellWithIdentifier(ISSUES_CELL_ID) || begin
      # puts "4 #{__method__} |#{index_path.row}| |#{index_path.description}|"

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
