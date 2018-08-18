class HomeController < ApplicationController
    def index
        @formats = Format.all 
    end

    def create_users 
        @user = User.new(user_params.except(:role))
        if user_params[:role] == 'Maestro'
            @user.role = 2
        else
            @user.role = 1
        end
        respond_to do |format|
            if @user.save
                format.html{redirect_to root_path }
            else 
                format.html{render :users_index }
            end
        end
    end

    def users_index
        @user = User.new
    end
    
    def formats_index
        @format = Format.new
    end


    def create_formats
        @format = Format.new
        @format.name = "Aleatorio1"
        @format.document.attach(format_params[:document])
    
        if @format.save
          puts "Si se guardó el archivo"
          redirect_to root_path
        else
          puts "No se pudo guardar el archivo"
          redirect_to formats_new_path
        end
    end

    private
        def user_params
            params.require(:user).permit(:email, :name, :last_name, :password, :password_confirmation, :role)
        end


        def format_params
            params.require(:format).permit(:document)
        end
end


