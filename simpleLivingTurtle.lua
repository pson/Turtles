function refill(slot) 
    turtle.select(slot)
    if turtle.getItemCount() < 8 then
        for i=4,16 do
            print("Comparing (", i, ") to (", slot, "): ", turtle.compareTo(i))
            if turtle.compareTo(i) then
                turtle.select(i)
                turtle.transferTo(slot)
                if turtle.getItemCount(slot) > 7 then
                    return true
                end -- if 9
                turtle.select(slot)
            end -- if 6
        end -- for 4
        print("for loop")
        return false
    else -- if 3
        return true
    end -- if 3
end -- function 1

function reFuelFill()
    -- Refuel
    while turtle.getFuelLevel() < 20 do
        turtle.select(1)
        if turtle.getItemCount(1) == 0 then
            return false
        end
        turtle.refuel(1)
    end
    return refill(2) and refill(3)
end

function odd(offset)
    turtle.select(2+offset)
    if not turtle.compareDown() then
        turtle.digDown()
        turtle.placeDown()
    end  
    turtle.forward()
end

function even(offset)
    local i
    if offset == 1 then i = 2 else i = 3 end
    turtle.select(i)
    if not turtle.compareDown() then
        turtle.digDown()
        turtle.placeDown()
    end  
    turtle.forward()
end

function half_lap(offset)
    -- Logs or stone is in slots 2 or 3,
    -- offset should be 0 or 1.
    odd(offset)
    even(offset)
    turtle.turnRight()
    turtle.forward()
    even(offset)
    turtle.back()
    turtle.back()
    turtle.turnLeft()
    odd(offset)
    even(offset)
    odd(offset)
    turtle.turnRight()
    even(offset)
    odd(offset)
    turtle.turnRight()
end

function main()
    turtle.select(1)
    if turtle.getItemCount() == 0 then
        print("usage: SimpleLiving")
        print("Slot 1: Fuel")
        print("Slot 2 (Odd) : Logs or smooth stone")
        print("Slot 3 (Even): Logs or smooth stone")
        print("Setup")
        print(".O.E.O.E.O.E.")
        print(".E.P.E.O.P.O.")
        print(".O.E.O.E.O.E.")
        print("Place the turtle on top of the upper left 'O',")
        print("place items in the indicated slots and run")
        print("You can fill up the rest of the turtle with")
        print("the same items as in slot 2 and 3, and they")
        print("will be refilled")
    else
        while reFuelFill() do
            half_lap(0)
            half_lap(1)
            sleep(90)
        end
    end
end
main()