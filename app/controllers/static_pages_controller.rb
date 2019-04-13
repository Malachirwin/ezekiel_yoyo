class StaticPagesController < ApplicationController
  def home
  end

  def about_me
  end

  def yoyo_maintenance
  end

  def tricks
  end

  def trick_list
    @pdf_filename = File.join(Rails.root, "tmp/MWRLadder.pdf")
    send_file(@pdf_filename, :filename => "MWRLadder.pdf", :disposition => 'inline', :type => "application/html")
  end

  def resources
  end
end
