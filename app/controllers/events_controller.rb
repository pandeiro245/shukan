class EventsController < ApplicationController
  def index
    redirect_to goal_path(current_user.goals.last) if current_user.yet?
    @events = Event.includes(:goal).order('id desc').limit(50)
    today = Time.zone.now.to_date
    start_date = today.beginning_of_week
    end_date = today.end_of_week
    events = current_user.goal.events.where(
      date_on: start_date..end_date
    )

    if events.count == 7 # complete
      @text_h2 = 'おめでとう！'
      @text = '１週間続けられたあなたはすごい！<br>来週もシュウカンに挑戦してみてね！'
      @text_tweet = "1週間「#{@current_user.goal.name} 」を1週間、毎日継続できました。やりきった〜！"
      @image_path = 'events/img-complete.png'
    else
      @text_h2 = 'おつかれさまでした！'
      @text = 'えらい！<br>明日もシュウカンを続けましょう！'
      @text_tweet = "1週間「#{@current_user.goal.name} 」を達成しました！"
      @image_path = 'events/img-events.png'
    end

    @current_week_events = events.map do |event|
      [event.date_on.strftime('%a'), event]
    end.to_h
  end
end

