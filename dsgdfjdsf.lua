local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Создаем RemoteEvent для общения между сервером и клиентом
local remoteEvent = Instance.new("RemoteEvent")
remoteEvent.Name = "MoveSquare"
remoteEvent.Parent = ReplicatedStorage

-- Функция для создания квадратов
local function createSquares()
    for i = 1, 250 do
        local square = Instance.new("Part")
        square.Size = Vector3.new(2, 1, 2) -- Размер квадрата
        square.Position = Vector3.new(math.random(-25, 25), 1, math.random(-25, 25)) -- Случайная позиция на спавне
        square.Anchored = false -- Делаем квадрат неподвижным
        square.BrickColor = BrickColor.Random() -- Случайный цвет
        square.Parent = workspace
    end
end

-- Создаем квадраты при запуске
createSquares()

-- Обработка перемещения квадрата
remoteEvent.OnServerEvent:Connect(function(player, squareName, newPosition)
    local square = workspace:FindFirstChild(squareName)
    if square then
        square.Position = newPosition
    end
end)


