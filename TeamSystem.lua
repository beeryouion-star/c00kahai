-- TeamSystem.lua
-- เขียนโดย c00kaha

local Players = game:GetService("Players")
local Teams = game:GetService("Teams")

local function createTeamIfNotExist(teamName, color)
    local team = Teams:FindFirstChild(teamName)
    if not team then
        team = Instance.new("Team")
        team.Name = teamName
        team.TeamColor = color or BrickColor.Random()
        team.AutoAssignable = false
        team.Parent = Teams
    end
    return team
end

Players.PlayerAdded:Connect(function(player)
    local allTeams = Teams:GetChildren()
    local chosenTeam

    if #allTeams == 0 then
        chosenTeam = createTeamIfNotExist("Default")
    else
        chosenTeam = allTeams[math.random(1, #allTeams)]
    end

    player.Team = chosenTeam
    print(player.Name .. " เข้าทีม " .. chosenTeam.Name)
end)
