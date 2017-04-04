class Landmark <ActiveRecord::Base
  belongs_to :figure

  def self.find_or_create_by_name(name)
    lm = Landmark.find_by(name: name)
    if lm
      lm
    else
      Landmark.create(name: name)
    end
  end

end
