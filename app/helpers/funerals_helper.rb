module FuneralsHelper

	def nice(funeral)
		[funeral.name, funeral.start_time.strftime("%H:%M")].join(" @")
	end

	def daytime(time)
		time.strftime("%A, %B #{time.day.ordinalize} @%H:%M")
	end

	def weather_icon(weather, date)
		if day = weather.detect{|w| w.day == date}
			icon = day.data["weather"][0]["icon"] rescue nil
			return "http://openweathermap.org/img/w/#{icon}.png" if icon
		end
	end
end
