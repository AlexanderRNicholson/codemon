class MovesController < ApplicationController
    
    
    def clip
        @move = Move.find(2)
        @monster = Monster.find(1)
        @enemy = Monster.find(4)
        if(@move.current_stamina < 1)
            session[:battle_messages] << "Your Codémon doesn't have enough stamina to use Clip!"
            redirect_to :back
            return
        end
        else 
            if(@monster.user_id == current_user.id)
            @enemy.current_hit_points -= 2
            session[:battle_messages] << "#{@monster.name} used Clip!"
            @move.current_stamina -= 1
            @enemy.save
            @move.save
            glob
        end
        redirect_to '/game/battle/2'
    end
    
    def glob
        @move = Move.find(3)
        @monster = Monster.find(1)
        @enemy = Monster.find(4)
        if(@move.current_stamina < 1)
            session[:battle_messages] << "The enemy #{@enemy.name} doesn't have enough stamina to use #{@move.name}!"
            return
        end
        if(@monster.user_id == current_user.id)
            @monster.current_hit_points -= rand(1..3)
            @move.current_stamina -= 1
            session[:battle_messages] << "The enemy #{@enemy.name} used Glob!"
            @monster.save
            @move.save
        end
    end
    
    def block
        @move = Move.find(1)
        @monster = Monster.find(1)
        @enemy = Monster.find(4)
        if(@move.current_stamina < 1)
            session[:battle_messages] << "Your Codémon doesn't have enough stamina to use #{@move.name}!"
            redirect_to :back
            return
        end
            if(@monster.user_id == current_user.id)
                session[:battle_messages] << "#{@monster.name} used Block!"
                if @monster.current_hit_points < @monster.hit_points
                    @monster.current_hit_points += 1
                    session[:battle_messages] << "#{@monster.name} regained 1HP!"
                end
                @move.current_stamina -= 1
                @monster.save
                @move.save
                glob
            end
            redirect_to '/game/battle/2'
    end
end