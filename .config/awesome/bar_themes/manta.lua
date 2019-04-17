local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
--local xresources = require("beautiful.xresources")
--local xrdb = xresources.get_current_theme()

local helpers = require("helpers")
local keys = require("keys")

-- {{{ Widgets
--local desktop_mode_widget = require("noodle.desktop_mode_widget")
local minimal_tasklist = require("noodle.minimal_tasklist")
local text_taglist = require("noodle.text_taglist")
-- Create text weather widget
local text_weather = require("noodle.text_weather")
local weather_widget_icon = text_weather:get_all_children()[1]
weather_widget_icon.font = "Typicons 11"
local weather_widget_text = text_weather:get_all_children()[2]
weather_widget_text.font = "sans 9"

-- Volume widget prefix
volumebar_prefix = wibox.widget.textbox(" ")
volumebar_prefix.markup = helpers.colorize_text(volumebar_prefix.text, beautiful.prefix_fg)

-- Keyboard map indicator and switcher
keyboardlayout_prefix = wibox.widget.textbox(" ")
keyboardlayout_prefix.markup = helpers.colorize_text(keyboardlayout_prefix.text, beautiful.prefix_fg)
mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget that shows date
date_prefix = wibox.widget.textbox("")
date_prefix.markup = helpers.colorize_text(date_prefix.text, beautiful.xcolor2)
mytextdate = wibox.widget.textclock("  %a %d %B")
date_prefix.font = "Typicons 11"
mytextdate.font = "sans 9"
-- Create a textclock widget
clock_prefix = wibox.widget.textbox("")
clock_prefix.markup = helpers.colorize_text(clock_prefix.text, beautiful.xcolor2)
mytextclock = wibox.widget.textclock("%H:%M")
clock_prefix.font = "Typicons 10"
mytextclock.font = "sans 9"
   
-- Create item separator
textseparator = wibox.widget.textbox()
textseparator.text = beautiful.separator_text
textseparator.markup = helpers.colorize_text(textseparator.text, beautiful.separator_fg)

-- Create padding
pad = wibox.widget.textbox(" ")

local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    -- awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ }, 3, function(t)
                        if client.focus then
                          client.focus:move_to_tag(t)
                        end
                    end),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, 
                        function (c)
                            if c == client.focus then
                                c.minimized = true
                            else
                                -- Without this, the following
                                -- :isvisible() makes no sense
                                c.minimized = false
                                if not c:isvisible() and c.first_tag then
                                    c.first_tag:view_only()
                                end
                                -- This will also un-minimize
                                -- the client, if needed
                                client.focus = c
                                c:raise()
                            end
                        end),
                     -- Middle mouse button closes the window
                     awful.button({ }, 2, function (c) c:kill() end),
                     awful.button({ }, 3, function (c) c.minimized = true end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(-1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(1)
                    end)
)
-- }}}
awful.screen.connect_for_each_screen(function(s)
	-- Create a system tray widget
    s.systray = wibox.widget.systray()

    -- Create a wibox that will only show the tray
    -- Hidden by default. Can be toggled with a keybind.
    s.traybox = wibox({visible = false, ontop = true, shape = helpers.rrect(beautiful.border_radius), type = "dock"})
    s.traybox.width = 100
    s.traybox.height = 35 --beautiful.wibar_height - beautiful.screen_margin * 4
    s.traybox.x = s.geometry.width - beautiful.screen_margin * 6 - s.traybox.width
    s.traybox.y = s.geometry.height - beautiful.screen_margin *100
    -- s.traybox.y = s.geometry.height - s.traybox.height - s.traybox.height / 2
    s.traybox.bg = beautiful.bg_systray
    s.traybox:setup {
      pad,
      s.systray,
      pad,
      layout = wibox.layout.align.horizontal
    }
    s.traybox:buttons(gears.table.join(
                        -- Middle click - Hide traybox
                        awful.button({ }, 2, function ()
                            s.traybox.visible = false
                        end)
    ))
    -- Hide traybox when mouse leaves
    s.traybox:connect_signal("mouse::leave", function ()
            s.traybox.visible = false
    end)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt({prompt = " Run: ", fg = beautiful.prompt_fg})
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
               awful.button({ }, 1, function () awful.layout.inc( 1) end),
               awful.button({ }, 3, function () awful.layout.inc(-1) end),
               awful.button({ }, 4, function () awful.layout.inc( 1) end),
               awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)
    s.mytaglist.font = beautiful.font

    -- Create a tasklist widget
    -- Show all clients
    -- s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_buttons)
    -- Show only focused client
    --s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.focused, tasklist_buttons)
    -- Show only minimized clients
    --s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.minimizedcurrenttags, tasklist_buttons)
    -- TODO doesn't work
    -- s.mytasklist.layout = wibox.layout.flex.horizontal

    -- Outer gaps
    --awful.screen.padding(awful.screen.focused(),{left = 28, right = 28, top = 28, bottom = 28})

    -- Wibar detached - Method: Transparent useless bar
    -- Requires compositor
    if beautiful.wibar_detached then
        s.useless_wibar = awful.wibar({ position = beautiful.wibar_position, screen = s, height = beautiful.screen_margin * 2, opacity = 0 })
        --TODO
        --s.useless_wibar:buttons(keys.desktopbuttons)
    end
    -- Create the wibox
    s.mywibox = awful.wibar({ position = beautiful.wibar_position, screen = s, width = beautiful.wibar_width, height = beautiful.wibar_height, shape = helpers.rrect(beautiful.wibar_border_radius)})
    -- Wibar items
    -- Add or remove widgets here
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
			pad,
			text_weather,
            --s.mylayoutbox,
            --mylauncher,
            --s.mytaglist,
            --textseparator,
            --minimal_tasklist
        },
        { -- Middle widgets
            layout = wibox.layout.fixed.horizontal,
			--s.mytaglist,
			pad,
			pad,
			pad,
			text_taglist,
            --s.mypromptbox,
            --textseparator,
            --s.mytasklist,
            --minimal_tasklist
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --mpdarc_widget,
            --textseparator,
            --volumebar_prefix,
            --volumebar_widget,
            --textseparator,
            --keyboardlayout_prefix,
            --mykeyboardlayout,
            --textseparator,
            --s.systray,
            --minimal_tasklist,
            --textseparator,
            date_prefix,
            mytextdate,
			--textseparator,
            pad,
			clock_prefix,
			pad,
			mytextclock,
            --textseparator,
            --desktop_mode_widget,
            pad,
            pad
        },
    }
    
    -- Second (alternate panel)
    if beautiful.wibar_alt_enabled then
        if beautiful.wibar_alt_detached then
            s.useless_wibar_alt = awful.wibar({ position = beautiful.wibar_alt_position, screen = s, height = beautiful.screen_margin * 2, opacity = 0 })
            s.useless_wibar_alt:buttons(gears.table.join(
                --TODO
                --keys.desktopbuttons
            ))
        end
        s.mywibox_alt = awful.wibox({ position = beautiful.wibar_alt_position, screen = s, width = beautiful.wibar_alt_width, height = beautiful.wibar_alt_height, shape = helpers.rrect(beautiful.wibar_alt_border_radius)})
        -- Only set them if they exist, else they overwrite the position variable
        if beautiful.wibar_alt_x then
            s.mywibox_alt.x = beautiful.wibar_alt_x
        end
        if beautiful.wibar_alt_y then
            s.mywibox_alt.y = beautiful.wibar_alt_y
        end
        -- Second wibar items
        -- Add or remove widgets here
        s.mywibox_alt:setup {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                --pad,
                --s.mylayoutbox,
                --mylauncher,
            },
            { -- Middle widgets
                layout = wibox.layout.fixed.horizontal,
                --s.mypromptbox,
                --s.mytasklist,
                --textseparator,
            },
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                --mpdarc_widget,
                --textseparator,
                --volumebar_prefix,
                --volumebar_widget,
                --textseparator,
                --keyboardlayout_prefix,
                --mykeyboardlayout,
                --textseparator,
                -- s.systray,
                minimal_tasklist,
                textseparator,
                date_prefix,
                mytextdate,
                textseparator,
                clock_prefix,
                mytextclock,
                textseparator,
                desktop_mode_widget,
                pad
            },
        }
    end

    -- Only set them if they exist, else they overwrite the position variable
    if beautiful.wibar_x then
        s.mywibox.x = beautiful.wibar_x
    end
    if beautiful.wibar_y then
        s.mywibox.y = beautiful.wibar_y
    end

--     s.mytaskwibox = awful.wibar({ position = beautiful.wibar_position, screen = s, width = beautiful.wibar_width, height = beautiful.wibar_height, shape = helpers.rrect(beautiful.wibar_border_radius)})
--     s.mytaskwibox.x = s.mywibox.x
--     s.mytaskwibox.y = s.mywibox.y
--     s.mytaskwibox.visible = false
--     s.mytaskwibox:setup {
--       layout = wibox.layout.align.horizontal,
--       { -- Left widgets
--         layout = wibox.layout.fixed.horizontal,
--         s.mytasklist
--       },
--       { -- Middle widgets
--         layout = wibox.layout.fixed.horizontal,
--       },
--       { -- Right widgets
--         layout = wibox.layout.fixed.horizontal,
--         textseparator,
--         mytextclock,
--         textseparator,
--         desktop_mode_widget,
--         pad
--       },
--     }

--     awesome.connect_signal("dummy", function (c)
--                              if s.mywibox.visible then
--                                s.mytaskwibox.visible = true
--                                s.mytaskwibox.ontop = true
--                                s.mywibox.visible = false
--                              else
--                                s.mywibox.visible = true
--                                s.mywibox.ontop = true
--                                s.mytaskwibox.visible = false
--                              end
--     end)
end)

