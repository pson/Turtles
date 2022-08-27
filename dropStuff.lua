-- MIT License

-- Copyright (c) 2022 Dan Pettersson

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
-- =================================================================================
-- A very simple program that drops a certain number of items from slot 1 and
-- waits a number of seconds before trying to fill up slot 1, and dropping
-- them again.

function refill(slot) 
    turtle.select(slot)
    if turtle.getItemCount() < 32 then -- Change 32 if you want to change max
        for i=slot+1,16 do
            if turtle.compareTo(i) then
                turtle.select(i)
                turtle.transferTo(slot)
                if turtle.getItemCount(slot) > 7 then
                    return true
                end
                turtle.select(slot)
            end
        end 
        return false
    else
        return true
    end
end -- function refill

function main ()
    local n = min(32, arg[1]) -- Number of items to drop (max 32)
    local s = arg[2] -- Seconds to sleep between drop

    if turtle.detectDown() then
        turtle.up()
    end
    while refill(1) do
        turtle.select(1)
        turtle.dropDown(n)
        sleep(s)
    end
end -- function main
main()