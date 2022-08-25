-- Slot 1-4 One each of the sugarcane/cactii/something else that behave
-- the same way
-- Slot 15 the chest/drawer that will take the harvest
-- The turtle will rotate four times while, planting the slots 1-4.
-- After that it will raise one space, put the chest above itself,
-- and start harvesting (rotating and digging)

function setup()
    local i 
    if turtle.getFuelLevel() == 0 then
        print "Turtle needs at least 1 fuel"
        return
    end
    for i=1,4,1  do
        if turtle.getItemCount(i) > 0 then
            if turtle.detect() then
                turtle.dig()
            end
            turtle.select(i)
            turtle.place()
        end
        turtle.turnRight() 
    end
    if turtle.detectUp() then
        turtle.digUp()
    end
    turtle.up()
    turtle.select(16)
    turtle.placeUp()
end -- setup

function main()
    local i
    setup()
    while turtle.getItemCount(1) do
        turtle.select(1)
        for i=1,4,1 do
            if turtle.detect() then
                turtle.dig()
                turtle.dropUp()
            end
        end
        sleep(15)
    end
end -- main

main()
