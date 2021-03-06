local map = ...
-- Dungeon 4 final room

function map:on_opening_transition_finished(destination)

  local solarus_child_sprite = solarus_child:get_sprite()
  solarus_child:set_position(160, 165)
  solarus_child_sprite:set_animation("stopped")
  solarus_child_sprite:set_ignore_suspend(true)
end

function solarus_child:on_interaction()

  if map:get_game():is_dungeon_finished(4) then
    -- dialog already done
    sol.audio.play_sound("warp")
    hero:teleport(66, "from_dungeon_4")
  else
    -- start the final sequence
    map:move_camera(160, 120, 100, function()
      map:set_dialog_variable("dungeon_4.solarus_child", map:get_game():get_player_name())
      map:start_dialog("dungeon_4.solarus_child", function()
        hero:start_victory()
      end)
    end, 0)
  end
end

function hero:on_victory_finished()

  sol.timer.start(2000, function()
    hero:unfreeze()
    hero:set_direction(1)
    sol.timer.start(1000, function()
      solarus_child:get_sprite():fade_out()
      sol.audio.stop_music()
      sol.audio.play_sound("warp")
      sol.timer.start(3000, function()
	agahnim:set_position(160, 141)
	sol.audio.play_music("agahnim")
	sol.timer.start(1000, function()
	  map:start_dialog("dungeon_4.agahnim", function()
	    sol.timer.start(2000, function()
	      map:get_game():set_dungeon_finished(4)
	      map:get_game():set_boolean(905, true) -- enable the dark world
	      map:get_game():set_boolean(155, true) -- break the rupee house
	      hero:teleport(66, "from_dungeon_4")
	    end)
	  end)
	end)
      end)
    end)
  end)
end

