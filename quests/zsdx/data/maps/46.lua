properties{
  x = 0,
  y = 0,
  width = 320,
  height = 240,
  world = "inside_world",
  tileset = "7",
  music = "southern_shrine",
}

tile{
  layer = 1,
  x = 40,
  y = 200,
  width = 240,
  height = 24,
  pattern = 52,
}

tile{
  layer = 1,
  x = 152,
  y = 216,
  width = 16,
  height = 32,
  pattern = 320,
}

tile{
  layer = 1,
  x = 40,
  y = 40,
  width = 240,
  height = 160,
  pattern = 320,
}

tile{
  layer = 1,
  x = 280,
  y = 16,
  width = 24,
  height = 24,
  pattern = 46,
}

tile{
  layer = 1,
  x = 16,
  y = 16,
  width = 24,
  height = 24,
  pattern = 45,
}

tile{
  layer = 1,
  x = 40,
  y = 16,
  width = 240,
  height = 24,
  pattern = 49,
}

tile{
  layer = 1,
  x = 16,
  y = 200,
  width = 24,
  height = 24,
  pattern = 47,
}

tile{
  layer = 1,
  x = 280,
  y = 200,
  width = 24,
  height = 24,
  pattern = 48,
}

tile{
  layer = 1,
  x = 280,
  y = 40,
  width = 24,
  height = 160,
  pattern = 50,
}

tile{
  layer = 1,
  x = 16,
  y = 40,
  width = 24,
  height = 160,
  pattern = 51,
}

tile{
  layer = 1,
  x = 40,
  y = 40,
  width = 8,
  height = 8,
  pattern = 14,
}

tile{
  layer = 1,
  x = 272,
  y = 40,
  width = 8,
  height = 8,
  pattern = 15,
}

tile{
  layer = 1,
  x = 272,
  y = 192,
  width = 8,
  height = 8,
  pattern = 17,
}

tile{
  layer = 1,
  x = 40,
  y = 192,
  width = 8,
  height = 8,
  pattern = 16,
}

tile{
  layer = 1,
  x = 48,
  y = 192,
  width = 224,
  height = 8,
  pattern = 236,
}

tile{
  layer = 1,
  x = 48,
  y = 40,
  width = 224,
  height = 8,
  pattern = 179,
}

tile{
  layer = 1,
  x = 40,
  y = 48,
  width = 8,
  height = 144,
  pattern = 237,
}

tile{
  layer = 1,
  x = 272,
  y = 48,
  width = 8,
  height = 144,
  pattern = 238,
}

tile{
  layer = 1,
  x = 144,
  y = 200,
  width = 8,
  height = 16,
  pattern = 74,
}

tile{
  layer = 1,
  x = 168,
  y = 200,
  width = 8,
  height = 16,
  pattern = 75,
}

tile{
  layer = 1,
  x = 152,
  y = 200,
  width = 16,
  height = 16,
  pattern = 77,
}

tile{
  layer = 1,
  x = 144,
  y = 224,
  width = 8,
  height = 16,
  pattern = 71,
}

tile{
  layer = 1,
  x = 168,
  y = 224,
  width = 8,
  height = 16,
  pattern = 71,
}

tile{
  layer = 1,
  x = 152,
  y = 240,
  width = 16,
  height = 8,
  pattern = 70,
}

destination{
  layer = 1,
  x = 160,
  y = 213,
  name = "destination_point",
  direction = 1,
}

teletransporter{
  layer = 1,
  x = 152,
  y = 224,
  width = 16,
  height = 16,
  name = "teletransporter",
  transition = 1,
  destination_map = "8",
  destination = "from_west_mountain_cave_1f_w",
}

teletransporter{
  layer = 1,
  x = 32,
  y = 0,
  width = 16,
  height = 16,
  name = "teletransporter_16",
  transition = 1,
  destination_map = "46",
  destination = "destination_point",
}

block{
  layer = 1,
  x = 224,
  y = 165,
  name = "block",
  direction = -1,
  sprite = "entities/statue",
  pushable = true,
  pullable = true,
  maximum_moves = 2,
}

enemy{
  layer = 1,
  x = 248,
  y = 165,
  name = "enemy",
  direction = 0,
  breed = "pike_auto",
  rank = 0,
  treasure_name = "_random",
  treasure_variant = 1,
}

tile{
  layer = 2,
  x = 112,
  y = 216,
  width = 96,
  height = 8,
  pattern = 357,
}

tile{
  layer = 2,
  x = 144,
  y = 216,
  width = 32,
  height = 8,
  pattern = 188,
}

tile{
  layer = 2,
  x = 0,
  y = 0,
  width = 320,
  height = 16,
  pattern = 170,
}

tile{
  layer = 2,
  x = 304,
  y = 16,
  width = 16,
  height = 208,
  pattern = 170,
}

tile{
  layer = 2,
  x = 0,
  y = 16,
  width = 16,
  height = 208,
  pattern = 170,
}

tile{
  layer = 2,
  x = 0,
  y = 224,
  width = 320,
  height = 16,
  pattern = 170,
}

