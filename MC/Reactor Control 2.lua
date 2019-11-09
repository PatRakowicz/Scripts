local reactorList = {peripheral.find("BigReactors-Reactor")}
local reactor = reactorList[1]

if reactor == nil then
    error("The reacotr is not Connected!!",0)
end
reactor.setActive(true)

print("Starting...")
end

while(true) do
    reactor.setAllControlRodLevels(50)
    
    sleep(1)
end

last Millenium