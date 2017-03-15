class FrmsController < ApplicationController
  def index
    @frms = Frm.all
    @topics = Topic.all
  end

  def show
    @frms = Frm.all
    @forum = Frm.find(params[:id])
  end
end
