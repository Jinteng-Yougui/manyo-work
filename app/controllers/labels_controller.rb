class LabelsController < ApplicationController
  def index
    @labels = Label.all
  end
  
  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to labels_path, notice: "ラベルを登録しました"
    else
      render :new
    end

    def edit
      @label = Label.find(params[:id])
    end

    def destroy
      @label.destroy
      flash[:notice] = "削除しました。"
      redirect_to labels_path
    end
  end

  private

  def label_params
    params.require(:label).permit(:label_name)
  end
end
