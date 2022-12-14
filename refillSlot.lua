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
 
function main()
    refill(2)
end
main()