class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end
  
  def new
    @schedule = Schedule.new
  end
  
  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :startday, :endday, :allday, :updateday, :memo))
    if @schedule.save
      flash[:notice] = "予定を登録しました"
      redirect_to :schedules
    else
       flash[:notice_new] = "予定を登録できませんでした。入力項目を確認してください。"
       render "new"
    end
  end
  
  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :startday, :endday, :allday, :updateday, :memo))
      flash[:notice] = "予定を編集しました"
      redirect_to :schedules
    else
      flash[:notice_edit] = "予定を編集できませんでした。入力項目を確認してください。"
      render "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "予定を削除しました"
    redirect_to :schedules
  end
  
end
