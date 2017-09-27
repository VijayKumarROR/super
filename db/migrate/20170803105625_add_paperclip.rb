class AddPaperclip < ActiveRecord::Migration[5.1]
  def change
  	    add_attachment :stores, :image
  end
end
