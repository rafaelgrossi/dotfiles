local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local naughty = require("naughty")
local helpers = require("helpers")


-- Configuration
-- Get your key and find your city id at https://openweathermap.org/
-- You will need to make an account!
local key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
local city_id = "yyyyyy"
local units = "metric"
local symbol = "°C"
-- Don't update too often, because your requests might get blocked for 24 hours
local update_interval = 30         -- in seconds

-- Text icons
local sun_icon = ""
local moon_icon = ""
local dcloud_icon = ""
local ncloud_icon = ""
local cloud_icon = ""
local rain_icon = ""
local storm_icon = ""
local snow_icon = ""
local mist_icon = ""
local whatever_icon = ""

local weather_text = wibox.widget{
    text = "Reading Battery...",
    -- align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local weather_icon = wibox.widget.textbox()
local weather_icon = wibox.widget{
    text = sun_icon,
    -- align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local weather = wibox.widget{
  weather_icon,
  weather_text,
  spacing = dpi(8),
  layout = wibox.layout.fixed.horizontal
}

local function update_widget(icon_code, weather_details)
    weather_icon.markup = helpers.colorize_text(sun_icon, beautiful.xcolor4)
  -- Set text --
  -- Replace -0 with 0 degrees
  weather_details = string.gsub(weather_details, '%-0', '0')
  -- Capitalize first letter of the description
  weather_details = weather_details:sub(1,1):upper()..weather_details:sub(2)
  weather_text.markup = helpers.colorize_text(weather_details, beautiful.xcolor4)
end

local weather_details_script = [[
  bash -c '
  --acpi && date "+%H:%M"  
  batnow=$(cat /sys/class/power_supply/BAT0/charge_now) \
  batfull=$(cat /sys/class/power_supply/BAT0/charge_full) \
  batt=$(($batnow * 100 / $batfull))
  echo -e "$batt%" && date "+%a | %H:%M"
']]

awful.widget.watch(weather_details_script, update_interval, function(widget, stdout)
                     local icon_code = string.sub(stdout, 1, 3)
                     local weather_details = string.sub(stdout, 1)
					 --weather_details = string.gsub(weather_details, '0: Full,', '')
					 --weather_details = string.gsub(weather_details, "Battery ", "")
					 --weather_details = string.gsub(weather_details, "0: Discharging,", "")
					 --weather_details = string.gsub(weather_details, "[0-9]: ", "")
                     update_widget(icon_code, weather_details)
end)

return weather
