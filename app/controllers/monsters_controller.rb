class MonstersController < ApplicationController
    
    def catch
        @monster = Monster.find(params[:id])
        @monster.user_id = current_user.id
        @monster.save
        flash[:notice] = "CHOI: Your Codémon journey is beginning! Work hard and you will become a self-sufficient Codémon developer!" 
        redirect_to "/game/tilemap"
    end
end
