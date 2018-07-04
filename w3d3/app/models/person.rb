
#table name :people

# id :integer
# name :string
#create_at : datatime
#updated_at :datetime
# house_id :integer

class Person < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :house, {
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'House'
  }

end
