local config = fatality.config
local menu = fatality.menu
local input = fatality.input
local key = 0x20 --space [https://docs.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes]
local amountf = menu:get_reference("Rage", "Anti-aim", "General", "Fake Amount")

local fake_amount_item = config:add_item( "Fake Amount (In Air)", 0.0 )
local fake_amount_slider = menu:add_slider( "Fake Amount (In Air)", "Rage", "Anti-aim", "fakelag", fake_amount_item, -100, 100, 1 )

local function SetFakeAmount(fakeAmount) 

amountf:set_int(input:is_key_down(key) and fakeAmount or '20')

end

function on_paint( )

    local Famount = fake_amount_item:get_int()

    SetFakeAmount(Famount)

end

local callbacks = fatality.callbacks
callbacks:add( "paint", on_paint )

-- thanks to invalidcode for helping me in cleaning up the code.
