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

  def recent(st)
    st.view.adjustsFontSizeToFitWidth = 0
    st.view.numberOfLines = 0
    st.frame = {t: 150, w: 300, h:300 }
    st.centered = :horizontal
    st.text_alignment = :center
    st.text = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    st.color = color.black
    st.font = font.medium
  end

end
