json.extract! user, :firstname, :lastname, :username, :email, :session_token, :reservations

json.favorites @user.restaurants.each do |restaurant|
  json.extract! restaurant, :name, :phone_number, :photos
end
