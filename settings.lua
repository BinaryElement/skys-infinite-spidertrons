settings = {
    { 
        name = "max-spidertron-tier",
        type = "int-setting",
        order = "aa",
        default_value = 5,
        minimum_value = 1,
        maximum_value = 50,
        setting_type = "startup"
    },
    { 
        name = "spidertron-tier-health-factor",
        type = "double-setting",
        order = "ba",
        default_value = 1.25,
        minimum_value = 0.1,
        maximum_value = 10,
        setting_type = "startup"
    },
    { 
        name = "spidertron-tier-health-addition",
        type = "int-setting",
        order = "bb",
        default_value = 0,
        minimum_value = 0,
        maximum_value = 100000,
        setting_type = "startup"
    },
    { 
        name = "spidertron-tier-inventory-addition",
        type = "int-setting",
        order = "ca",
        default_value = 20,
        minimum_value = 0,
        maximum_value = 1000,
        setting_type = "startup"
    },
    { 
        name = "spidertron-tier-grid-width-addition",
        type = "int-setting",
        order = "da",
        default_value = 1,
        minimum_value = 0,
        maximum_value = 100,
        setting_type = "startup"
    },
    { 
        name = "spidertron-tier-grid-height-addition",
        type = "int-setting",
        order = "db",
        default_value = 2,
        minimum_value = 0,
        maximum_value = 100,
        setting_type = "startup"
    },
    { 
        name = "spidertron-tier-weapon-range-addition",
        type = "int-setting",
        order = "ea",
        default_value = 2,
        minimum_value = 0,
        maximum_value = 100,
        setting_type = "startup",
        hidden = true
    },
    { 
        name = "spidertron-tier-weapon-firing-speed-factor",
        type = "double-setting",
        order = "eb",
        default_value = 0.9,
        minimum_value = 0.1,
        maximum_value = 10,
        setting_type = "startup",
        hidden = true
    },
    { 
        name = "spidertron-tier-one-scale",
        type = "double-setting",
        order = "fa",
        default_value = 1,
        minimum_value = 0.1,
        maximum_value = 10,
        setting_type = "startup",
        hidden = true
    },
    { 
        name = "spidertron-tier-scale-factor",
        type = "double-setting",
        order = "fb",
        default_value = 1,
        minimum_value = 0.1,
        maximum_value = 10,
        setting_type = "startup"
    },
    { 
        name = "spidertron-tier-scale-addition",
        type = "double-setting",
        order = "fc",
        default_value = 0.1,
        minimum_value = 0,
        maximum_value = 10,
        setting_type = "startup"
    },
    { 
        name = "spidertron-tier-crafting-fusion-cost",
        type = "int-setting",
        order = "ga",
        default_value = 5,
        minimum_value = 2,
        maximum_value = 100,
        setting_type = "startup"
    },
    { 
        name = "spidertron-tier-mk2-research-cost",
        type = "int-setting",
        order = "ha",
        default_value = 10000,
        minimum_value = 100,
        maximum_value = 1000000,
        setting_type = "startup"
    },
    { 
        name = "spidertron-tier-research-cost-factor",
        type = "double-setting",
        order = "hb",
        default_value = 5,
        minimum_value = 1,
        maximum_value = 100,
        setting_type = "startup"
    },
    { 
        name = "spidertron-tier-research-cost-addition",
        type = "int-setting",
        order = "hc",
        default_value = 0,
        minimum_value = 0,
        maximum_value = 1000000,
        setting_type = "startup"
    },
    { 
        name = "spidertron-tier-resistance-factor",
        type = "double-setting",
        order = "ia",
        default_value = 0.1,
        minimum_value = 0,
        maximum_value = 1,
        setting_type = "startup"
    },
    { 
        name = "spidertron-tier-use-factorial-formula",
        type = "bool-setting",
        order = "ja",
        default_value = false,
        setting_type = "startup"
    },
    { 
        name = "spidertron-tier-use-factorial-formula-for-size",
        type = "bool-setting",
        order = "jb",
        default_value = false,
        setting_type = "startup"
    },
    { 
        name = "spidertron-unhide-resistances",
        type = "bool-setting",
        order = "ka",
        default_value = false,
        setting_type = "startup"
    },
}
data:extend(settings)