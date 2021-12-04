local EntityList = csgo.interface_handler:get_entity_list()
local Cvar = csgo.interface_handler:get_cvar()
local Engine = csgo.interface_handler:get_engine_client()

fatality.callbacks:add(
    "paint",
    function()
        if not Engine:is_in_game() then
            return
        end -- checking if in game so we can grab local player

        local me = EntityList:get_localplayer()
        local cl_clock_correction_force_server_tick = Cvar:find_var("cl_clock_correction_force_server_tick")
        cl_clock_correction_force_server_tick:set_int(me:is_alive() and 999 or -9)
    end
)
