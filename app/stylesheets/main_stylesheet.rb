class MainStylesheet < ApplicationStylesheet

  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def issue_message_button(st)
    st.frame = {t: 80, w: 200, h: 30}
    st.centered = :horizontal
    st.text = '15 High Priority ..'
    st.color = color.red
    st.font = font.medium
  end

  def alerts(st)
    st.frame = {t: 150, w: 300, h:300 }
    st.centered = :horizontal
    # st.color = color.black
  end

end
