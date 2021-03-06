local enemy = ...

-- Minillosaur egg: a small papillosaur that comes from an egg.
-- This enemy is usually be generated by a bigger one.

local in_egg = nil

-- The enemy appears: create its movement.
function enemy:on_created()

  self:set_life(2)
  self:set_damage(2)
  self:create_sprite("enemies/minillosaur_egg_thrown")
  self:set_size(24, 32)
  self:set_origin(12, 20)
  self:set_invincible()
  self:set_attack_consequence("sword", "custom")
  self:set_obstacle_behavior("flying")

  local sprite = self:get_sprite()
  sprite:set_animation("egg")
  in_egg = true
end

-- The enemy was stopped for some reason and should restart.
function enemy:on_restarted()

  if in_egg then
    local sprite = self:get_sprite()
    sprite:set_animation("egg")
    local angle = self:get_angle(self:get_map():get_entity("hero"))
    local m = sol.movement.create("straight")
    m:set_speed(120)
    m:set_angle(angle)
    m:set_max_distance(180)
    m:set_smooth(false)
    self:start_movement(m)
  else
    self:go_hero()
  end
end

-- An obstacle is reached: in the egg state, break the egg.
function enemy:on_obstacle_reached(movement)

  local sprite = self:get_sprite()
  if sprite:get_animation() == "egg" then
    self:break_egg()
  end
end

-- The movement is finished: in the egg state, break the egg.
function enemy:on_movement_finished(movement)
  -- Same thing as when an obstacle is reached.
  self:on_obstacle_reached(movement)
end

-- The enemy receives an attack whose consequence is "custom".
function enemy:on_custom_attack_received(attack, sprite)

  if attack == "sword" and sprite:get_animation() == "egg" then
    -- The egg is hit by the sword.
    self:break_egg()
    sol.audio.play_sound("monster_hurt")
  end
end

-- Starts breaking the egg.
function enemy:break_egg()

  local sprite = self:get_sprite()
  self:stop_movement()
  sprite:set_animation("egg_breaking")
end

--  The animation of a sprite is finished.
function enemy:on_sprite_animation_finished(sprite, animation)

  -- If the egg was breaking, make the minillosaur go.
  if animation == "egg_breaking" then
    sprite:set_animation("walking")
    self:set_size(16, 16)
    self:set_origin(8, 12)
    self:go_hero()
  end
end

function enemy:go_hero()

  self:snap_to_grid()
  local m = sol.movement.create("path_finding")
  m:set_speed(40)
  self:start_movement(m)
  self:set_default_attack_consequences()
  in_egg = false
end

