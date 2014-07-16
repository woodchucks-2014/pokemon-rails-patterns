class Pokemon < ActiveRecord::Base
  self.inheritance_column = nil #Defending against STI

  TYPES =  %w(
    bug dark dragon electric fairy fighting fire flying
    ghost grass ground ice normal poison psychic rock
    shadow steel unknown water
  )

  #validates :catchable

  scope :free, -> { where(caught: false) }
  scope :captured, -> { where(caught: true) }
  scope :ordered_by_type, -> { order(:type, :id) }

  def self.by_type(type = nil)
    if type == nil
      self
    else
      where(type: type)
    end
  end

  def catch
    caught_count = Pokemon.captured.by_type(type).count

    if caught_count < 2 && !caught
      self.caught = true
      save
    end
  end
end
