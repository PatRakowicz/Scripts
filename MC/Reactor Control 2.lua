-- Minecraft 1.12.2
-- CC: Tweaked 1.84.0
-- Extreme Reactors 1.12.2-0.4.5.67
 
-- get connected reactor
local reactor = peripheral.find("BigReactors-Reactor")
local powerlevel = 0
print("Reactor control initiated")
while true do
    -- get current power level on a scale from 0 to 100
    powerlevel = (reactor.getEnergyStored() / reactor.getEnergyCapacity()) * 100
    -- set the rod level
    reactor.setAllControlRodLevels(powerlevel)
    -- if the power level is above 99 and the reactor is active, deactivate the reactor
    if powerlevel > 99 and reactor.getActive() then
        reactor.setActive(false)
    end
    -- if the power level less the 80 and the reactor is not active, activate it
    if powerlevel < 80 and reactor.getActive() == false then
        reactor.setActive(true)
    end
    -- sleep for a very short amount of time before checking and setting things again
    os.sleep(0.1)
end
