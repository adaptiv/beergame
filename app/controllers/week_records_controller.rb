class WeekRecordsController < ApplicationController
  def update
    week_record = WeekRecord.find(params[:id])
    week_record.update_attributes(params.require(:week_record).permit(:order_to_supplier))
    game = week_record.player.game
    game.next_week
    redirect_to game
  end
end