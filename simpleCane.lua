-- MIT License

-- Copyright (c) 2021 Dan Pettersson

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

-- Slot 1-4 One each of the sugarcane/bamboo/something else that behave
-- the same way
-- Slot 15 the chest/drawer that will take the harvest
-- The turtle will rotate four times while, planting the slots 1-4.
-- After that it will raise one space, put the chest above itself,
-- and start harvesting (rotating and digging)

-- If you want it to restart any time re the instance do, name
-- the program "startup".

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
    if turtle.getItemCount(1) > 0 then
        setup()
    end
    while turtle.getItemCount(1) == 0 do
        turtle.select(1)
        for i=1,4,1 do
            if turtle.detect() then
                turtle.dig()
                turtle.dropUp()
            end
            turtle.turnRight()
        end
        sleep(15)
    end
end -- main

main()
