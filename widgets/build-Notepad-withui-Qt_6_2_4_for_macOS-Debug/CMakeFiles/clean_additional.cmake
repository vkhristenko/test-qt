# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/Notepad-withui_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/Notepad-withui_autogen.dir/ParseCache.txt"
  "Notepad-withui_autogen"
  )
endif()
