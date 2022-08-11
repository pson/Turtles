function refill(slot) 
    turtle.select(slot)
    if turtle.getItemCount() < 32 then -- Change 32 if you want to change max
        for i=4,16 do
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