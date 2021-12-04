--references shits
local m3 = fatality.menu
local render = fatality.render
local callbacks = fatality.callbacks
local input = fatality.input
local v1 = 0x45 --E
-- https://docs.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
-- You'll have to bind other key to +use instead of E (for me I use F)


local function epeek()
    if input:is_key_down(v1) then --activated
        m3:get_reference("Rage", "Anti-aim", "General", "Pitch"):set_int(0)
        m3:get_reference("Rage", "Anti-aim", "General", "Yaw"):set_int(0)
        m3:get_reference("Rage", "Anti-aim", "General", "Fake Amount"):set_int(100) 
        m3:get_reference("Rage", "Anti-aim", "General", "Freestand Fake"):set_int(1)
        m3:get_reference("Rage", "Anti-aim", "General", "At fov target"):set_int(0)
    end

    if not input:is_key_down(v1) then --here we set back to original
        m3:get_reference("Rage", "Anti-aim", "General", "Pitch"):set_int(1)
       m3:get_reference("Rage", "Anti-aim", "General", "Yaw"):set_int(1)
        m3:get_reference("Rage", "Anti-aim", "General", "Fake Amount"):set_int(20) 
       m3:get_reference("Rage", "Anti-aim", "General", "Freestand Fake"):set_int(2)
       m3:get_reference("Rage", "Anti-aim", "General", "At fov target"):set_int(1)

   end
    
        
end


--checking if we are in-game
local function draw()
    if not csgo.interface_handler:get_engine_client():is_in_game() then
        return;
    end
 
    epeek()
end

--paint callback for the functions to work
callbacks:add("paint", draw)