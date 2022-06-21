# == Schema Information
#
# Table name: tickets
#
#  id               :integer          not null, primary key
#  assigned_to_type :string           not null
#  assigned_to_id   :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Ticket < ApplicationRecord
  belongs_to :assigned_to, polymorphic: true

  def assigned_to_sgid=(value)
    self.assigned_to = GlobalID::Locator.locate_signed(value, for: :polymorphic_select)
  end
end
