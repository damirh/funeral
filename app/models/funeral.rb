class Funeral < ApplicationRecord
	belongs_to :user

	DURATION = 2.hours

	def self.free_slot?(event)
		Funeral.where(start_time: event.slot).any? \
			? false : true
	end

	def slot
		(start_time - DURATION)..(start_time + DURATION)
	end
	
end
