class GameController < ApplicationController
    
    def main
    end
    
    def choose
    end
    
    def map
    end
    
    def battle
        @monster = Monster.find(1)
        @enemy = Monster.find(4)
        unless session[:battle_messages]
            session[:battle_messages] = []
            session[:battle_messages] << "#{User.find(2)} wants to battle!"
            session[:battle_messages] << "#{User.find(2)} sent out #{@enemy.name}!"
        end
        @battle_messages = session[:battle_messages]
    end
    
    def battle_end
        @monster = Monster.find(1)
        @enemy = Monster.find(4)
        @monster.current_hit_points = @monster.hit_points
        @enemy.current_hit_points = @enemy.hit_points
        @move1 = Move.find(1)
        @move1.current_stamina = @move1.max_stamina
        @move2 = Move.find(2)
        @move2.current_stamina = @move2.max_stamina
        @move3 = Move.find(3)
        @move3.current_stamina = @move3.max_stamina
        @monster.exp_gained += @enemy.exp_yield*@enemy.level
        @monster.save
        @enemy.save
        @move1.save
        @move2.save
        @move3.save
        level_check
          flash[:notice] = "NATE: Good battle! Keep working hard, and you'll be a natural in no time!" 
        redirect_to '/game/tilemap'
    end
    
    def level_check
        @monster = Monster.find(1)
        if @monster.exp_gained >= @monster.exp_yield*(@monster.level*@monster.level)
            @monster.level += 1
            @monster.attack += 1
            @monster.defence += 1
            @monster.speed += 1
            @monster.hit_points += 2
            @monster.current_hit_points = @monster.hit_points
            session[:battle_messages] << "CSSaur grew to level #{@monster.level}!"
            @monster.save
        end
    end
end
