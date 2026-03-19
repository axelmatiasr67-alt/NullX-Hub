--// NullX FINAL v3.0 - AIMBOT SUAVE + INDETECTABLE 2026
--// Key: pollito con papas
--// Optimizado para Delta Executor (Android/iOS/PC)

local Players        = game:GetService("Players")
local RunService     = game:GetService("RunService")
local UserInput      = game:GetService("UserInputService")
local TweenService   = game:GetService("TweenService")

local player         = Players.LocalPlayer
local camera         = workspace.CurrentCamera

--// GUI Principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NullX_Final_v3"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

--// Colores tema moderno
local ACCENT   = Color3.fromRGB(0, 255, 136)   -- Verde lima
local BG_DARK  = Color3.fromRGB(18, 18, 18)
local BG_LIGHT = Color3.fromRGB(28, 28, 28)
local TEXT     = Color3.fromRGB(220, 220, 220)
local BORDER   = Color3.fromRGB(45, 45, 45)

--// Login Screen
local loginFrame = Instance.new("Frame")
loginFrame.Size = UDim2.new(1,0,1,0)
loginFrame.BackgroundColor3 = Color3.new(0,0,0)
loginFrame.BackgroundTransparency = 0.4
loginFrame.Parent = ScreenGui

local loginBox = Instance.new("Frame")
loginBox.Size = UDim2.new(0, 340, 0, 220)
loginBox.Position = UDim2.new(0.5, -170, 0.5, -110)
loginBox.BackgroundColor3 = BG_DARK
loginBox.BorderSizePixel = 0
loginBox.Parent = loginFrame

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 12)
uiCorner.Parent = loginBox

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = ACCENT
uiStroke.Transparency = 0.6
uiStroke.Thickness = 1.5
uiStroke.Parent = loginBox

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,50)
title.BackgroundTransparency = 1
title.Text = "NullX FINAL"
title.TextColor3 = ACCENT
title.Font = Enum.Font.GothamBold
title.TextSize = 32
title.Parent = loginBox

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(0.85,0,0,45)
keyInput.Position = UDim2.new(0.075,0,0.35,0)
keyInput.PlaceholderText = "Ingresa la key..."
keyInput.Text = ""
keyInput.BackgroundColor3 = BG_LIGHT
keyInput.TextColor3 = TEXT
keyInput.Font = Enum.Font.Gotham
keyInput.TextSize = 18
keyInput.ClearTextOnFocus = false
keyInput.Parent = loginBox

local keyCorner = Instance.new("UICorner", keyInput)
keyCorner.CornerRadius = UDim.new(0,8)

local enterBtn = Instance.new("TextButton")
enterBtn.Size = UDim2.new(0.85,0,0,50)
enterBtn.Position = UDim2.new(0.075,0,0.62,0)
enterBtn.Text = "ENTRAR"
enterBtn.BackgroundColor3 = ACCENT
enterBtn.TextColor3 = Color3.new(0,0,0)
enterBtn.Font = Enum.Font.GothamBold
enterBtn.TextSize = 20
enterBtn.Parent = loginBox

local enterCorner = Instance.new("UICorner", enterBtn)
enterCorner.CornerRadius = UDim.new(0,10)

local errorMsg = Instance.new("TextLabel")
errorMsg.Size = UDim2.new(0.85,0,0,30)
errorMsg.Position = UDim2.new(0.075,0,0.88,0)
errorMsg.BackgroundTransparency = 1
errorMsg.TextColor3 = Color3.fromRGB(255,80,80)
errorMsg.Font = Enum.Font.Gotham
errorMsg.TextSize = 16
errorMsg.Text = ""
errorMsg.Parent = loginBox

--// Hub Principal
local hub = Instance.new("Frame")
hub.Size = UDim2.new(0, 580, 0, 380)
hub.Position = UDim2.new(0.5, -290, 0.5, -190)
hub.BackgroundColor3 = BG_DARK
hub.BorderSizePixel = 0
hub.Visible = false
hub.Parent = ScreenGui

local hubCorner = Instance.new("UICorner", hub)
hubCorner.CornerRadius = UDim.new(0,14)

local hubStroke = Instance.new("UIStroke", hub)
hubStroke.Color = ACCENT
hubStroke.Transparency = 0.7
hubStroke.Thickness = 1.8

-- Top Bar
local topBar = Instance.new("Frame", hub)
topBar.Size = UDim2.new(1,0,0,45)
topBar.BackgroundColor3 = Color3.fromRGB(12,12,12)
topBar.BorderSizePixel = 0

local topCorner = Instance.new("UICorner", topBar)
topCorner.CornerRadius = UDim.new(0,14)

local titleHub = Instance.new("TextLabel", topBar)
titleHub.Size = UDim2.new(0.5,0,1,0)
titleHub.Position = UDim2.new(0.02,0,0,0)
titleHub.BackgroundTransparency = 1
titleHub.Text = "NullX FINAL • Aimbot"
titleHub.TextColor3 = ACCENT
titleHub.Font = Enum.Font.GothamBold
titleHub.TextSize = 22
titleHub.TextXAlignment = Enum.TextXAlignment.Left

local minimize = Instance.new("TextButton", topBar)
minimize.Size = UDim2.new(0,50,1,0)
minimize.Position = UDim2.new(1,-55,0,0)
minimize.BackgroundTransparency = 1
minimize.Text = "−"
minimize.TextColor3 = ACCENT
minimize.Font = Enum.Font.GothamBold
minimize.TextSize = 28

-- Bubble (minimizado)
local bubble = Instance.new("TextButton", ScreenGui)
bubble.Size = UDim2.new(0,70,0,70)
bubble.Position = UDim2.new(1,-90,1,-90)
bubble.BackgroundColor3 = ACCENT
bubble.Text = "NX"
bubble.TextColor3 = Color3.new(0,0,0)
bubble.Font = Enum.Font.GothamBlack
bubble.TextSize = 28
bubble.Visible = false

local bubbleCorner = Instance.new("UICorner", bubble)
bubbleCorner.CornerRadius = UDim.new(1,0)

local bubbleStroke = Instance.new("UIStroke", bubble)
bubbleStroke.Color = Color3.new(1,1,1)
bubbleStroke.Transparency = 0.4
bubbleStroke.Thickness = 2.5

--// Contenido Aim
local content = Instance.new("Frame", hub)
content.Size = UDim2.new(1,0,1,-45)
content.Position = UDim2.new(0,0,0,45)
content.BackgroundTransparency = 1

local aimEnabled   = false
local fovRadius    = 140
local smoothValue  = 0.085     -- Muy bajo = natural
local prediction   = 0.11
local targetPart   = "Head"

local fovCircle = Drawing.new("Circle")
fovCircle.Thickness   = 2.2
fovCircle.NumSides    = 120
fovCircle.Radius      = fovRadius
fovCircle.Color       = ACCENT
fovCircle.Transparency = 0.75
fovCircle.Filled      = false
fovCircle.Visible     = false

--// Funciones de botones con toggle visual
local function createToggleButton(text, yPos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.92,0,0,48)
    btn.Position = UDim2.new(0.04,0,0,yPos)
    btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
    btn.TextColor3 = TEXT
    btn.Text = text
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 18
    btn.BorderSizePixel = 0
    btn.Parent = content

    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0,10)

    local function updateVisual()
        if aimEnabled then
            btn.BackgroundColor3 = ACCENT
            btn.TextColor3 = Color3.new(0,0,0)
        else
            btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
            btn.TextColor3 = TEXT
        end
    end

    btn.MouseButton1Click:Connect(function()
        callback()
        updateVisual()
    end)

    return btn, updateVisual
end

local aimToggle, updateAimVisual = createToggleButton("🎯  Aim Assist  →  OFF", 20, function()
    aimEnabled = not aimEnabled
end)

local fovToggle, _ = createToggleButton("⭕  Mostrar FOV Circle", 90, function()
    fovCircle.Visible = not fovCircle.Visible
end)

--// Sliders (usando TextBox por simplicidad y compatibilidad Delta)
local function createSetting(labelText, yPos, default, minv, maxv, callback)
    local lbl = Instance.new("TextLabel", content)
    lbl.Size = UDim2.new(0.92,0,0,28)
    lbl.Position = UDim2.new(0.04,0,0,yPos)
    lbl.BackgroundTransparency = 1
    lbl.Text = labelText
    lbl.TextColor3 = TEXT
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 16
    lbl.TextXAlignment = Enum.TextXAlignment.Left

    local box = Instance.new("TextBox", content)
    box.Size = UDim2.new(0.92,0,0,38)
    box.Position = UDim2.new(0.04,0,0,yPos+30)
    box.BackgroundColor3 = Color3.fromRGB(32,32,32)
    box.TextColor3 = ACCENT
    box.Font = Enum.Font.Gotham
    box.TextSize = 17
    box.Text = tostring(default)
    box.Parent = content

    local c = Instance.new("UICorner", box)
    c.CornerRadius = UDim.new(0,8)

    box.FocusLost:Connect(function()
        local num = tonumber(box.Text)
        if num then
            num = math.clamp(num, minv, maxv)
            box.Text = tostring(num)
            callback(num)
        else
            box.Text = tostring(default)
        end
    end)
end

createSetting("FOV Radius (80–220)", 160, fovRadius, 80, 220, function(v) fovRadius = v end)
createSetting("Smoothness (0.05–0.14)", 230, smoothValue, 0.05, 0.14, function(v) smoothValue = v end)
createSetting("Prediction (0.00–0.25)", 300, prediction, 0, 0.25, function(v) prediction = v end)

--// Lógica Aim más natural posible
local function getBestTarget()
    local closest, minDist = nil, math.huge
    local center = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)

    for _, p in ipairs(Players:GetPlayers()) do
        if p == player or not p.Character then continue end
        local hum = p.Character:FindFirstChildOfClass("Humanoid")
        if not hum or hum.Health <= 0 then continue end
        if p.Team == player.Team then continue end

        local part = p.Character:FindFirstChild(targetPart)
        if not part then continue end

        local screen, visible = camera:WorldToViewportPoint(part.Position)
        if not visible then continue end

        local dist = (Vector2.new(screen.X, screen.Y) - center).Magnitude
        if dist < minDist and dist < fovRadius then
            minDist = dist
            closest = part
        end
    end

    return closest
end

RunService.RenderStepped:Connect(function(delta)
    fovCircle.Position = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)
    fovCircle.Radius   = fovRadius

    if not aimEnabled then return end

    local target = getBestTarget()
    if not target then return end

    local aimPos = target.Position
    if prediction > 0 and target.Velocity then
        aimPos += target.Velocity * prediction
    end

    local goal = CFrame.new(camera.CFrame.Position, aimPos)
    
    -- Suavizado + micro jitter humano
    local lerpAlpha = math.min(smoothValue + delta*2, 1)
    local randomJit = Vector3.new(
        math.random(-1,1)*0.006,
        math.random(-1,1)*0.006,
        0
    )

    camera.CFrame = camera.CFrame:Lerp(goal + CFrame.new(randomJit), lerpAlpha)
end)

--// Sistema Drag
local dragging, dragInput, dragStart, startPos
local function updateInput(input)
    local delta = input.Position - dragStart
    hub.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = hub.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

topBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInput.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateInput(input)
    end
end)

-- Bubble drag (opcional pero bonito)
bubble.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = bubble.Position
    end
end)

-- Minimize / Restore
minimize.MouseButton1Click:Connect(function()
    hub.Visible = false
    bubble.Visible = true
end)

local lastClickTime = 0
bubble.MouseButton1Click:Connect(function()
    local now = tick()
    if now - lastClickTime < 0.4 then return end
    lastClickTime = now

    hub.Visible = true
    bubble.Visible = false
end)

--// Login logic
enterBtn.MouseButton1Click:Connect(function()
    if string.lower(keyInput.Text) == "pollito con papas" then
        loginFrame.Visible = false
        hub.Visible = true
        print("NullX FINAL → Activado correctamente")
    else
        errorMsg.Text = "Key incorrecta • Intenta de nuevo"
        task.wait(2.5)
        errorMsg.Text = ""
    end
end)

print("NullX FINAL v3 cargado • Usa la key: pollito con papas")
