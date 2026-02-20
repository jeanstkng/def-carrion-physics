-- fabrik.lua
local M = {}

-- segments: array of vector3 positions
-- target: vector3 where tip wants to reach
-- origin: vector3 where base is anchored
-- lengths: array of segment lengths
function M.solve(segments, origin, target, lengths, iterations)
    iterations = iterations or 10
    local n = #segments
    
    -- Forward pass (tip -> root)
    local function forward_pass()
        segments[n] = vmath.vector3(target)
        for i = n - 1, 1, -1 do
            local dir = vmath.normalize(segments[i] - segments[i + 1])
            segments[i] = segments[i + 1] + dir * lengths[i]
        end
    end
    
    -- Backward pass (root -> tip)
    local function backward_pass()
        segments[1] = vmath.vector3(origin)
        for i = 2, n do
            local dir = vmath.normalize(segments[i] - segments[i - 1])
            segments[i] = segments[i - 1] + dir * lengths[i - 1]
        end
    end
    
    for _ = 1, iterations do
        forward_pass()
        backward_pass()
    end
end

return M