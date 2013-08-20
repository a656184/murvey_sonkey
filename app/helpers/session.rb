helpers do
 #CODE REVIEW: Refactor your Ruby - this is a one liner : 
 # def current_user
 # 	@current_user || User.find([session[:user_id]]) if session[:user_id]
 # end

  def current_user
    if session[:user_id]
      return User.find(session[:user_id])
    else
      return nil
    end
  end
end


