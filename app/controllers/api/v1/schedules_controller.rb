class Api::V1::SchedulesController < ApplicationController

  before_action :get_schedule , only: [:yotei]

  def index
    schedules = Schedule.all
    render json: schedules
  end

  def yotei
    if @schedule
      response = {message:'発見に成功',schedules:@schedule}
    else
      response = {message:'発見に失敗'}
    end
    render json: response
  end

  # def update
  #   @schedule.name = params[:name]
  #   @schedule.text = params[:text]
  #   @schedule.data = params[:data]
  #   if @schedule.save
  #     response = {message:'スケジュールを更新しました。'}
  #   else
  #     response = {message:'スケジュールの更新に失敗しました。'}
  #   end
  #   render json: response
  # end

  def delete
    if ActiveRecord::Base.connection.select_all("delete from schedules where id = #{params[:id]};")
      response = {message:'削除に成功'}
    else
      response = {message:'削除に失敗'}
    end
    render json: response
  end

  def create
    @schedule = Schedule.new({name:params[:name],text:params[:text],date:params[:date]})
    if @schedule.save
      response = {message:'登録に成功'}
    else
      response = {message:'登録に失敗'}
    end
    render json: response
  end

  private

  def get_schedule
    sql = "select * from schedules where name = '#{params[:name]}';"
    @schedule = ActiveRecord::Base.connection.select_all(sql)
  end

end
