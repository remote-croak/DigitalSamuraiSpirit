
function love.load()

   -- initialize all decks, selectable characters, gameboard, game pieces.

end

function love.update(dt)
    -- update on menu changes or selections, performed actions
    -- exit game

    -- love.event.quit

end

function love.draw()
    -- draw loaded images every update
    love.window.setFullscreen(true) -- where is the best place to put (load or draw)

    love.graphics.setBackgroundColor(0.68, 0.85, 0.90)

end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end

function love.mousepressed(x, y, button)
end
