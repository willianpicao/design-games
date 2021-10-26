Map = Class{}

function Map:init(world)
    self.world = world
    self.solids = {}
    self.agua= {}
    self.gameMap = sti('maps/1.lua')
    self:cretateSolids()

end

function Map:update(dt)
    self.gameMap:update(dt)
end

function Map:draw()
    self.gameMap:drawLayer(self.gameMap.layers['Camada de Tiles 1'])

end

function Map:cretateSolids()
    local solid
    for _, obj in ipairs(self.gameMap.layers['Solids'].objects) do
        solid = self.world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height, {collision_class = 'Solids'})
        solid:setType('static')
        table.insert(self.solids, solid)
    end
    for _, obj in ipairs(self.gameMap.layers['agua'].objects) do
        solid = self.world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height, {collision_class = 'Enemy'})
        solid:setType('static')
        table.insert(self.agua, solid)
    end
    
end