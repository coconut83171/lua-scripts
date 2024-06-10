-- teleports to enemy's spawn
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
local team_colour = player.TeamColor;

if (character == nil) then
    warn("No character found");

    return;
end

local spawns = workspace:WaitForChild("GameBin"):WaitForChild("Spawns");

local attack = spawns:WaitForChild("Attack"):FindFirstChildOfClass("SpawnLocation");
local defend = spawns:WaitForChild("Defend"):FindFirstChildOfClass("SpawnLocation");

if (attack.TeamColor == team_colour) then
    character:PivotTo(defend.CFrame);
elseif (defend.TeamColor == team_colour) then
    character:PivotTo(attack.CFrame);
end
