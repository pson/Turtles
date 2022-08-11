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