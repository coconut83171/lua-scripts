-- teleports to top of the map barrier
-- https://www.roblox.com/games/10469988463/BOMBLINE-Alpha

local service = setmetatable({ }, {
    __index = function(_, service)
        return cloneref(game.GetService(game, service));
    end
});

local players = service.Players;
local workspace = service.Workspace;

local player = players.LocalPlayer;

local get_character = function(player)
    return player.Character;
end

local character = get_character(player);

if (character == nil) then
    warn("No character found");

    return;
end

local map = workspace:WaitForChild("Map");

local barrier = map:WaitForChild("Map"):WaitForChild("Barrier"):WaitForChild("Barrier");

character:MoveTo((barrier.CFrame * CFrame.new(0, barrier.Size.Y, 0)).Position);
