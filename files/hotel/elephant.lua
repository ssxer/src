-- src/bin/hotels/elephant (Hotel Elephant)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local locked = false

local currval

game:GetService("Players").PlayerAdded:Connect(function(plr)
    if locked == true then
        game:GetService("ReplicatedStorage").GuiHandler:FireServer(false, plr)
    end
end)

Rayfield:Notify({
   Title = "Cheers!",
   Content = "Welcome to Elephant X! I hope you're selfish needs have been fulfilled.",
   Duration = 5,
   Image = 4483362458,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay!",
         Callback = function()
         print("I can't..")
      end
   },
},
})

local Window = Rayfield:CreateWindow({
   Name = "Elephant X",
   LoadingTitle = "Elephant X",
   LoadingSubtitle = "Made by SSxeR",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Elephant X"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Elephant X",
      Subtitle = "Key System",
      Note = "brubruburburbur",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/2KGax2cr"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Exploiting", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Good Options")
local Me = Tab:CreateButton({
   Name = "Give Money!",
   Callback = function()
   game:GetService("ReplicatedStorage").MoneyRequest:FireServer(false, currval, "Cash")
   end,
})
local All = Tab:CreateButton({
   Name = "Give Everyone Money!",
   Callback = function()
   for _,v in pairs(game:GetService("Players"):GetPlayers()) do
       game:GetService("ReplicatedStorage").MoneyRequest:FireServer(false, currval, "Cash", v)
    end
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Amount o' Money!",
   Range = {0, 1000},
   Increment = 10,
   Suffix = "Amount o' money",
   CurrentValue = 500,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   currval = Value
   end,
})

local Section = Tab:CreateSection("Abusive Options")

local FuckUp = Tab:CreateButton({
   Name = "Fuck the elevator!",
   Callback = function()
   while true do
       task.wait(0.1)
       game:GetService("ReplicatedStorage").ElevatorHandler:FireServer("1")
    end
   end,
})

local fuckval

local All = Tab:CreateButton({
   Name = "Fuck everyone's money!",
   Callback = function()
   for _,v in pairs(game:GetService("Players"):GetPlayers()) do
       game:GetService("ReplicatedStorage").MoneyRequest:FireServer(false, fuckval, "Cash", v)
    end
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Amount o' Money! to fuck!",
   Range = {-1000, -1},
   Increment = 10,
   Suffix = "Amount o' money to fuck!",
   CurrentValue = 500,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   fuckval = Value
   end,
})

local Section = Tab:CreateSection("Very Abusive Options")

local All = Tab:CreateButton({
   Name = "Fuck the WHOLE GAME!",
   Callback = function()
   for _,v in pairs(workspace:GetDescendants()) do
       if v:IsA("BasePart") then
           game:GetService("ReplicatedStorage").GuiHandler:FireServer(false, v)
       end
    end
   end,
})

local Section = Tab:CreateSection("Kick Options")

local plre

local All = Tab:CreateButton({
   Name = "Kick Player",
   Callback = function()
   for _,v in pairs(game:GetService("Players"):GetPlayers()) do
       if v.Name == plre then
           game:GetService("ReplicatedStorage").GuiHandler:FireServer(false, v)
       end
    end
   end,
})

local Input = Tab:CreateInput({
   Name = "Player to Kick",
   PlaceholderText = "Player",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
    plre = Text
   end,
})

local All = Tab:CreateButton({
   Name = "Kick All Players",
   Callback = function()
   for _,v in pairs(game:GetService("Players"):GetPlayers()) do
       game:GetService("ReplicatedStorage").GuiHandler:FireServer(false, v)
    end
   end,
})

local Section = Tab:CreateSection("Lock Options")

local All = Tab:CreateButton({
   Name = "Lock Server",
   Callback = function()
   locked = true
   end,
})

local All = Tab:CreateButton({
   Name = "Unlock Server",
   Callback = function()
   locked = false
   end,
})

local Section = Tab:CreateSection("GUI Stuff")

local All = Tab:CreateButton({
   Name = "Delete all GUIs",
   Callback = function()
   for _,v in pairs(game:GetService("Players"):GetDescendants()) do
       if v:IsA("ScreenGui") then
            game:GetService("ReplicatedStorage").GuiHandler:FireServer(false, v)
       end
    end
    for _,v in pairs(game:GetService("ScreenGui"):GetDescendants()) do
       if v:IsA("ScreenGui") then
            game:GetService("ReplicatedStorage").GuiHandler:FireServer(false, v)
       end
    end
   end,
})
