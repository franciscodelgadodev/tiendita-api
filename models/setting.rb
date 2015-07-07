class Setting < ActiveRecord::Base
  ALLOWED_TYPES = %w(string number boolean)

  validates :name, presence: true

  validates :datatype, inclusion: ALLOWED_TYPES

  def value
    case datatype
    when 'number'
      read_attribute(:value).to_f
    when 'boolean'
      !!(read_attribute(:value) =~ /^(true|t|yes|y|1)$/i)
    else
      super
    end
  end
end
