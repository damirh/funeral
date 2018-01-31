class Weather < ApplicationRecord

	serialize :data

	def self.ping_weather_api
		return if Weather.find_by_day(Date.today)

		options = {
			units: "metric",
			APPID: "c83b7761430de0c44985771b81874665", # move into ENV
		}
		json = OpenWeather::Forecast.city("Ljubljana, SI", options)

		json["list"].each do |el|
			day = DateTime.strptime(el["dt"].to_s,'%s')
			Weather.where(day: day).first_or_create({data: el})
		end
	end

	def self.ranged(range = 30)
		Weather.where("day >= ?", (Date.today - range.days)).limit(100)
	end

	def temp
		data["main"]["temp"] rescue nil
	end

	def description
		data["weather"][0]["description"] rescue nil
	end

end
