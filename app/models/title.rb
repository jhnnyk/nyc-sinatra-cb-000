class Title < ActiveRecord::Base
  has_many :figure_titles
  has_many :figures, :through => :figure_titles

  def self.find_or_create_by_name(name)
    title = Title.find_by(name: name)
    if title
      title
    else
      Title.create(name: name)
    end
  end
end
