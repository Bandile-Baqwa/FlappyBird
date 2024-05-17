--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    local goldMedal = love.graphics.newImage('Gold.png')
    local silverMedal = love.graphics.newImage('Silver.png')
    local bronzeMedal = love.graphics.newImage('bronze.png')

    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
    if self.score >= 5 then
        local goldImageWidth = goldMedal:getWidth()
        local goldImageHeight = goldMedal:getHeight()
        local goldX = (VIRTUAL_WIDTH / 2 ) - (goldImageWidth / 2)
        local goldY = (VIRTUAL_HEIGHT / 1.25 ) - (goldImageHeight / 1.25)
        love.graphics.draw(goldMedal, goldX, goldY)

    elseif self.score >= 3 then
        local silverImageWidth = silverMedal:getWidth()
        local silverImageHeight = silverMedal:getHeight()
        local silverX = (VIRTUAL_WIDTH / 2 ) - (silverImageWidth / 2)
        local silverY = (VIRTUAL_HEIGHT / 1.25 ) - (silverImageHeight / 1.25)
        love.graphics.draw(silverMedal, silverX, silverY)

    elseif self.score >= 1 then 
        local bronzeImageWidth = bronzeMedal:getWidth()
        local bronzeImageHeight = bronzeMedal:getHeight()
        local bronzeX = (VIRTUAL_WIDTH / 2 ) - (bronzeImageWidth / 2)
        local bronzeY = (VIRTUAL_HEIGHT / 1.25 ) - (bronzeImageHeight / 1.25)
        love.graphics.draw(bronzeMedal ,bronzeX , bronzeY)

    end
    love.graphics.printf('Press Enter to Play Again!', 0, 130, VIRTUAL_WIDTH, 'center')
end