class Tag < ActiveRecord::Base
  has_many :entries
  has_many :recipes, through: :entries
  validates(:title, {:presence => true, :length => {:maximum => 40}})
  before_save(:upcase_title)

  private

  def upcase_title
    array = self.title.split
    array.each do |t|
      t.capitalize!
    end
    self.title = array.join(' ')
  end
end
