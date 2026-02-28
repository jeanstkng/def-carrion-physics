-- fabrik.lua
local M = {}

-- segments: array of vector3 positions
-- target: vector3 where tip wants to reach
-- origin: vector3 where base is anchored
-- lengths: array of segment lengths
function M.solve(segments, origin, target, lengths, iterations)
    iterations = iterations or 10
    local n = #segments

    -- Store previous segments to interpolate for smoother movement
    local prev_segments = {}
    for i = 1, n do
        prev_segments[i] = vmath.vector3(segments[i])
    end

    -- Forward pass (tip -> root)
    local function forward_pass()
        segments[n] = vmath.vector3(target)
        for i = n - 1, 1, -1 do
            local diff = segments[i] - segments[i + 1]
            if vmath.length(diff) < 0.001 then
                diff = vmath.vector3(0, 1, 0) -- fallback direction
            end
            local dir = vmath.normalize(diff)
            segments[i] = segments[i + 1] + dir * lengths[i]
        end
    end
    -- Backward pass (root -> tip)
    local function backward_pass()
        segments[1] = vmath.vector3(origin)
        for i = 2, n do
            local diff = segments[i] - segments[i - 1]
            if vmath.length(diff) < 0.001 then
                diff = vmath.vector3(0, 1, 0)
            end
            local dir = vmath.normalize(diff)
            segments[i] = segments[i - 1] + dir * lengths[i - 1]
        end
    end

    for _ = 1, iterations do
        forward_pass()
        backward_pass()
    end

    -- Interpolate between previous and new segments for smoother movement when origin changes
    local interpolation = 0.8 -- 0.0 = full previous, 1.0 = full new (adjust for desired smoothness)
    for i = 1, n do
        segments[i] = vmath.lerp(interpolation, prev_segments[i], segments[i])
    end
end

return M
