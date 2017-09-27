class Store < ApplicationRecord
  validates :name, :password, presence: true

    before_validation :ensure_login_has_a_value

    private
    def ensure_login_has_a_value
    	if params[:admin][:name] == "admin" && params[:admin][:password] == "vijayadmin"
    	session[:admin] = "admin"
    	else
    	p "Wrong User" 
 		end
    end



	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"]

end
