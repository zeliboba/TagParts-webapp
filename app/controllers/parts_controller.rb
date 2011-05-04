class PartsController < ApplicationController
  # GET /parts
  # GET /parts.xml
  def index
    @parts = Part.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @parts }
    end
  end

  # GET /parts/1
  # GET /parts/1.xml
  def show
    @part = Part.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @part }
    end
  end

  # GET /parts/new
  # GET /parts/new.xml
  def new
    @part = Part.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @part }
    end
  end

  # GET /parts/1/edit
  def edit
    @part = Part.find(params[:id])
  end

  # POST /parts
  # POST /parts.xml
  def create
    @part = Part.new(params[:part])

    respond_to do |format|
      if @part.save
        format.html { redirect_to(@part, :notice => 'Part was successfully created.') }
        format.xml  { render :xml => @part, :status => :created, :location => @part }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @part.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /parts/1
  # PUT /parts/1.xml
  def update
    @part = Part.find(params[:id])

    respond_to do |format|
      if @part.update_attributes(params[:part])
        format.html { redirect_to(@part, :notice => 'Part was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @part.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parts/1
  # DELETE /parts/1.xml
  def destroy
    @part = Part.find(params[:id])
    @part.destroy

    respond_to do |format|
      format.html { redirect_to(parts_url) }
      format.xml  { head :ok }
    end
  end

  def upload
    if params[:upload]
      if params[:upload][:file]
        # Start garbage collection to prevent memory leaks with large files
        GC.start

        count = 0
        filename = params[:upload][:file].original_filename
        # very simple parse by split
        content = params[:upload][:file].read.split('<hr>')
        source = Source.new
        source.info = content[0] + content[-1]
        if source.save
            flash[:notice] = "New source is created"
        end
        # again simple split, hopefully the word is always on the 9th place
        word = content[0].split('"')[9]
        result = Tag.where('word = ?', word)
        if result.empty?
          tag = Tag.new
          tag.word = word
          if tag.save
            flash[:notice] += ", new tag '#{word}' is created"
          end
        else
          # first is just for a case, model validates uniqueness
          tag = result.first
        end
        (content[1..-2]).each do |p|
          part = Part.new
          part.content = p
          part.source = source
          part.tags[0] = tag
          if part.save
            count += 1
          end
        end
        flash[:notice] += ", #{count} parts were successfully uploaded from file '#{filename}'"
      end
    end
  end

end
