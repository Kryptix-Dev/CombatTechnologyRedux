data:extend{
  { name = "research-quick-start",
    type = "bool-setting",
    setting_type = "startup",
    default_value = false,
    order = 'a',   
    },

  { name = "disable-lab",
    type = "bool-setting",
    setting_type = "startup",
    default_value = false,
    order = 'b',
    },

  { name = "damage-scale",
    type = "int-setting",
    setting_type = "startup",
    default_value = 100,
    minimum_value = 1,
    maximum_value = 1000,
    order = 'c',
    },
  
  { name = "demolisher-damage-scale",
    type = "int-setting",
    setting_type = "startup",
    default_value = 100,
    minimum_value = 1,
    maximum_value = 1000,
    order = 'd',
    }
}
