module IssuesCellStylesheet
  def issues_cell_height
    100
  end

  def issues_cell(st)
    st.background_color = color.random
  end

  def cell_label(st)
    st.color = color.black
  end
end
