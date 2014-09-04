class Reward

	 CHANNELS  = { sports: 'CHAMPIONS_LEAGUE_FINAL_TICKET', 
    			       kids: 'N/A', 
    			       music: 'KARAOKE_PRO_MICROPHONE', 
    			       news: 'N/A', 
    			       movies: 'PIRATES_OF_THE_CARIBBEAN_COLLECTION'}

  def initialize channel_subscriptions
  	  @channels = []
      @channels =  channel_subscriptions.collect(&:channel) if channel_subscriptions.any?
  end

  def as_json
    return [] if @channels.empty?
  	@channels.map{|i| CHANNELS.to_a[i][1] }
  end

end