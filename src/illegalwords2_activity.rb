require 'ruboto/widget'
require 'ruboto/util/toast'
require_relative "game"

ruboto_import_widgets :EditText, :TextView, :Button, :LinearLayout

class Illegalwords2Activity
  def onCreate(bundle)
    super
    set_title 'Illegal Words'

    @game = Game.new
    @game.initialize_cards
    @game.mix
    self.content_view =
        linear_layout :orientation => :vertical do
          @word = text_view :text => '!Tarjetas!', :id => 42, :width => :match_parent,
                                 :gravity => :center, :text_size => 52.0
          @illegalWords = text_view :text => '', :id => 42, :width => :match_parent,
                                 :gravity => :center, :text_size => 39.0                       
          button :text => 'Dame Una tarjeta.', :width => :match_parent, :id => 43, :on_click_listener => proc { card_show }
        end
  rescue
    puts "Exception creating activity: #{$!}"
    puts $!.backtrace.join("\n")
  end

  private

  def card_show
     card = @game.get_card
     @word.text = "\n#{card.shift}"
     @illegalWords.text = ""
     card.each{|illegalWord| @illegalWords.append "\n#{illegalWord}"}
     toast "Tenes 2 minutos"
  end

end


