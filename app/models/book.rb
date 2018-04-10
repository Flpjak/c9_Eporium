class Book < ActiveRecord::Base
    has_and_belongs_to_many :authors
    belongs_to :publisher
    has_many :cart_items
    has_many :carts, :through => :cart_items
    
    has_attached_file :cover_image,
      :styles => { :medium => "300x300>", :thumb => "100x100>" },
      :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :cover_image,
      :content_type => /\Aimage\/.*\Z/
      
    def self.latest
      last(10)
    end
    
    # roughly speaking sets list of model protected attributes to []
    # making all attributes accessible while mass-assignment
    attr_protected
    

end
