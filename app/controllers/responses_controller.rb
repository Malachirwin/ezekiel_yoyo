class ResponsesController < ApplicationController
  skip_before_action :verify_authenticity_token
  include HttpAuthConcern
  http_basic_authenticate_with name: 'ezekiel', password: 'qwerty'
  before_action :set_response, only: [:show, :edit, :update, :destroy, :add_image_home]

  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.all
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
  end

  # GET /responses/new
  def new
    @comments = Comment.all
    @response = Response.new
  end

  # GET /responses/1/edit
  def edit
  end

  def add_image_home
    file_contents = ''
    picture = params[:video]['1']
    size = picture.size
    filename = picture.original_filename
    if filename.include?('.mov')
      part1, part2 = filename.split('.')
      filename = part1 + ".mp4"
    end
    # File.touch(Rails.root.join('app', 'asset', 'images', filename)
    File.open(Rails.root.join('public', 'videos', filename), 'wb') do |file|
      file.write(picture.read)
    end
    contents = <<~HEREDOC
      p = "#{params[:description][:text]}"
      video controls='controls'
        source src='videos/#{filename}' type='video/mp4'
    HEREDOC
    if params[:where][:chioce].include? 'Top'
      File.open(Rails.root.join('app', 'views', 'static_pages', "#{params[:where][:chioce].split(' ').first.downcase}.html.slim"), 'a+') do |file|
        file_contents = file.read
        part1, part2 = file_contents.split('.top-of-videos')
        file_contents = <<~HEREDOC
          #{part1}
          .top-of-videos
          p = "#{params[:description][:text]}"
          video controls='controls'
            source src='videos/#{filename}' type='video/mp4'
          #{part2}
        HEREDOC
        # file << contents
      end
      File.open(Rails.root.join('app', 'views', 'static_pages', "#{params[:where][:chioce].split(' ').first.downcase}.html.slim"), 'w') do |file|
        file.write(file_contents)
      end
    else
      File.open(Rails.root.join('app', 'views', 'static_pages', "#{params[:where][:chioce].split(' ')[0].downcase}.html.slim"), 'a') do |file|
        file << contents
      end
    end
  end

  # POST /responses
  # POST /responses.json
  def create
    @response = Response.new(response_params)

    respond_to do |format|
      if @response.save
        format.html { redirect_to @response, notice: 'Response was successfully created.' }
        format.json { render :show, status: :created, location: @response }
      else
        format.html { render :new }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responses/1
  # PATCH/PUT /responses/1.json
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { render :edit }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to responses_url, notice: 'Response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      if params[:response]
        @response = Response.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      if params[:response]
        params.require(:response).permit(:content, :comment_id)
      else
        params.permit(:video, :description)
      end
    end
end
