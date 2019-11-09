-- set to true to get info about the reactor printed every 10 loops
local debug_info = false
-- once the reactor is this percent full, it will shut off
-- percentage must be entered in decimal format
local shutOff = 0.50
-- the minimum allowed control rod insertion
-- rod insertion must be entered as an integer
local minInsertion = 0

local loopCount = 0
local powerPercent = 0
local reactorList = {peripheral.find("BigReactors-Reactor")}
local reactor = reactorList[1]

if reactor == nil then
	error("The reactor was not detected!",0)
end
reactor.setActive(true)

print("Starting reactor control! :D")
print("Current shutoff percent is " .. tostring(shutOff))
print("Minimum control rod insertion is " .. tostring(minInsertion))

while(true) do
	-- calculate what percentage full the reactor is with respect to the shutoff limit
	powerPercent = reactor.getEnergyStored() / (10000000 * shutOff)
	-- calculate how much the reactor control rods should be inserted
	insertAmount = ((100 - minInsertion) * powerPercent) + minInsertion
	insertAmount = math.floor(insertAmount + 0.5) -- rounds to nearest int
	if insertAmount > 100 then -- avoid going out of bounds
		insertAmount = 100
	end
	edit
	reactor.setAllControlRodLevels(insertAmount) -- set control rods
	loopCount = (loopCount + 1) % 10
	
	if debug_info and loopCount == 0 then
		print("----------------------------------------")
		print("Current energy: " .. tostring(reactor.getEnergyStored()))
		print("Current percent to shutoff: " .. tostring(powerPercent))
		print("Current control rod insertion: " .. tostring(insertAmount))
	end
	
	sleep(1)
end