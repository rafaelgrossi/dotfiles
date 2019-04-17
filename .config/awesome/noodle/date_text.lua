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
local sun_icon = ""
local pad = "  "
local weather_text = wibox.widget{
    text = "Loading Time...",
    -- align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local pad_text = wibox.widget.textbox()
local weather_icon = wibox.widget.textbox()
local weather_icon = wibox.widget{
    text = whatever_icon,
    -- align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local weather = wibox.widget{
  pad_text,
  layout = wibox.layout.fixed.horizontal,
  spacing = dpi(8),
  weather_text,
  weather_icon,
  pad_text,
}

local function update_widget(icon_code, weather_details)
  pad_text.markup = pad
  weather_icon.markup = helpers.colorize_text(sun_icon, beautiful.xcolor2)
  weather_details = string.gsub(weather_details, '%-0', '0')
  weather_details = weather_details:sub(1,1):upper()..weather_details:sub(2)
  weather_text.markup = helpers.colorize_text(weather_details, beautiful.xcolor2)
end

local weather_details_script = [[
  bash -c '
  LC_ALL=ja_JP.utf8 date "+%d %A %B | %H:%M"
']]

awful.widget.watch(weather_details_script, update_interval, function(widget, stdout)
                     local weather_details = string.sub(stdout, 1)
                     local icon_code = string.sub(stdout, 1, 3)
                     update_widget(icon_code, weather_details)
end)

return weather
