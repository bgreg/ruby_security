class IssuesCell < UITableViewCell

  def rmq_build
    q = rmq(self.contentView)

    # Add your subviews, init stuff here
    # @foo = q.append(UILabel, :foo).get

    # Or use the built-in table cell controls, if you don't use
    # these, they won't exist at runtime
    # q.build(self.imageView, :cell_image)
    # q.build(self.detailTextLabel, :cell_label_detail)
    @name = q.build(self.textLabel, :cell_label).get
  end

  def update(data)
    # Update data here
    puts "5 #{__method__} #{data.inspect}"
    @name.text = data["name"]
    self.detailTextLabel.text  = data["name"]
    puts "6 #{__method__} work?"
  end

end
