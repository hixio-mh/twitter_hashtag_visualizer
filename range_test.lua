function get_range(start_val, end_val, px_width, preferred_width)
  local diff = end_val - start_val
  local width = px_width
  local target_width = preferred_width
  local max = 10
  
  local min_error = 10000
  local choice_range = nil
  local break_loop = false
  for j=0,max do
    for i=2,0,-1 do
      local range = (10^j) / (2^i)
      local ticks = math.floor(diff / range)
      
      if ticks == 0 then
        break_loop = true
        break
      end
      ticks = diff / range
      
      local tick_width = width / ticks
      local e = math.abs(target_width - tick_width)
      
      if e < min_error then
        min_error = e
        choice_range = range
      end
      
      --print(range, ticks, tick_width, e)
      
    end
    
    if break_loop then
      break
    end
  end
  
  local range = choice_range
  local ticks = math.floor(diff / range)
  local tick_width = width / (diff / range)
  
  --print(range, ticks, tick_width)
  local tick_values = {}
  local start = (math.floor(start_val / range) + 1) * range
  for i=1,ticks do
    tick_values[i] = start + (i-1) * range
  end
  
  return choice_range, tick_width, tick_values
  
end

width = 1280
diff = 102938
target_width = 100

local range, twidth, values = get_range(12400, 448000, width, target_width)

print(range, twidth)
for i=1,#values do
  print(values[i])
end
















