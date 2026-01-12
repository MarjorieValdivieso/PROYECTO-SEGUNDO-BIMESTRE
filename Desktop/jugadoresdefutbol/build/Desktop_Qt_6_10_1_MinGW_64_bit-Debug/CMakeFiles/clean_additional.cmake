# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\RegistroJugadores_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\RegistroJugadores_autogen.dir\\ParseCache.txt"
  "RegistroJugadores_autogen"
  )
endif()
