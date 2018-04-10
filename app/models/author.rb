class Author < ActiveRecord::Base
    has_and_belongs_to_many :books
    
    validates :first_name, :last_name, :presence=>true
    
    attr_accessible :first_name, :last_name
    
    def name
     "#{first_name} #{last_name}"
    end
end
