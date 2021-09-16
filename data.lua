--INITIALIZE
if not ritnmods then ritnmods = {
    gedit = {
    -- definitions des constantes
    defines = require("core/defines"),
    },
} end

-- require
require ("prototypes.custom-inputs")
require ("prototypes.styles")