function refill(slot)
    local i
 
    turtle.select(slot)
    if turtle.getItemCount() < 8 then
        for i=4,16,1 do
            print("Comparing (" + i + ") to (" + slot + "): " + turtle.compareTo(i))
            if turtle.compareTo(i) then
                turtle.select(i)
                turtle.transferTo(slot)
                if turtle.getItemCount(slot) > 7 then
                    return true
                end
                turtle.select(slot)
            end
            return false
        end
    end
    return true
end
 
function main()
    refill(2)
end
main()