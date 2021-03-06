return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.7.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 50,
  height = 20,
  tilewidth = 18,
  tileheight = 18,
  nextlayerid = 5,
  nextobjectid = 33,
  properties = {},
  tilesets = {
    {
      name = "1",
      firstgid = 1,
      tilewidth = 18,
      tileheight = 18,
      spacing = 0,
      margin = 0,
      columns = 20,
      image = "tiles_packed.png",
      imagewidth = 360,
      imageheight = 162,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 18,
        height = 18
      },
      properties = {},
      wangsets = {},
      tilecount = 180,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 50,
      height = 20,
      id = 1,
      name = "Tile Layer 1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 154, 157, 157, 157, 157, 156, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 154, 155, 155, 156, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 19, 19, 19, 19, 19, 19, 19, 20, 0, 0, 0, 0, 0, 154, 156, 154, 156, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 39, 39, 39, 39, 39, 39, 39, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 154, 155, 156, 0, 0, 0, 0, 0, 0, 38, 39, 39, 39, 39, 39, 39, 39, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 78, 79, 80, 39, 39, 39, 39, 39, 39, 39, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 113, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 39, 39, 39, 39, 39, 78, 79, 79, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 23, 23,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 39, 39, 39, 39, 39, 39, 39, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 5, 5, 5,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 58, 59, 59, 59, 98, 59, 59, 59, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 23, 23, 0, 5, 5, 5, 5,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 126, 128, 0, 0, 0, 23, 123, 5, 5, 0, 5, 5, 5, 5,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 23, 23, 23, 23, 23, 0, 123, 5, 5, 5, 0, 5, 5, 5, 5,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 5, 5, 5, 5, 5, 5, 0, 5, 5, 5, 5, 0, 5, 5, 5, 5,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 138, 125, 0, 0, 0, 129, 0, 89, 0, 0, 0, 0, 0, 23, 5, 5, 5, 5, 5, 5, 5, 0, 5, 5, 5, 5, 0, 5, 5, 5, 5,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 0, 0, 0, 23, 23, 123, 123, 123, 123, 123, 123, 123, 123, 0, 123, 123, 123, 123, 0, 123, 123, 123, 123,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43, 43, 43, 0, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 0, 0, 0, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 0, 123, 123, 123, 123, 0, 123, 123, 123, 123,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43, 123, 123, 123, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 0, 123, 123, 123, 123, 0, 123, 123, 123, 123,
        0, 0, 0, 0, 0, 0, 0, 0, 43, 43, 43, 123, 123, 123, 123, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 34, 123, 123, 123, 123, 34, 123, 123, 123, 123,
        0, 0, 0, 0, 0, 0, 0, 43, 123, 123, 123, 123, 123, 123, 123, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 74, 123, 123, 123, 5, 74, 123, 123, 123, 123,
        0, 0, 0, 0, 0, 0, 43, 123, 123, 123, 123, 123, 123, 123, 123, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 74, 123, 123, 123, 5, 74, 123, 123, 123, 123,
        42, 43, 43, 43, 43, 43, 123, 123, 123, 123, 123, 123, 123, 123, 123, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 74, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 74, 123, 123, 123, 5, 74, 123, 123, 123, 123
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "Solids",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 290.667,
          y = 237.333,
          width = 194.667,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1,
          y = 342.5,
          width = 107,
          height = 16.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 108.5,
          y = 325,
          width = 162,
          height = 35,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 126,
          y = 307.5,
          width = 144,
          height = 17,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144,
          y = 287,
          width = 126,
          height = 20,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 198,
          y = 270,
          width = 71.5,
          height = 16.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 215.5,
          y = 252,
          width = 53.5,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 540,
          y = 234.5,
          width = 179.5,
          height = 124.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 576,
          y = 216.5,
          width = 143.5,
          height = 17,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 594,
          y = 198.5,
          width = 125.5,
          height = 17.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 612.5,
          y = 181.5,
          width = 106.5,
          height = 17,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 737.5,
          y = 163,
          width = 72,
          height = 196,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = 756,
          y = 144,
          width = 53,
          height = 18.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "",
          type = "",
          shape = "rectangle",
          x = 828,
          y = 126,
          width = 72,
          height = 233,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 846.5,
          y = 108.5,
          width = 53.5,
          height = 17.5,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "Enemies",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 32,
          name = "",
          type = "",
          shape = "rectangle",
          x = 684,
          y = 162.125,
          width = 17.875,
          height = 19,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
