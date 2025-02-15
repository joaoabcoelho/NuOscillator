SET(NUOSCILLATOR_LIB_LIST "-libOscProbCalcer -libOscillator")

SET(NUOSCILLATOR_FEATURES_LIST)

if(UseGPU EQUAL 1)
  LIST(APPEND NUOSCILLATOR_FEATURES_LIST "GPU")
endif()

if(UseCUDAProb3 EQUAL 1)
  LIST(APPEND NUOSCILLATOR_FEATURES_LIST "CUDAProb3")
endif()

if(UseCUDAProb3Linear EQUAL 1)
  LIST(APPEND NUOSCILLATOR_FEATURES_LIST "CUDAProb3Linear")
endif()

if(UseProb3ppLinear EQUAL 1)
  LIST(APPEND NUOSCILLATOR_FEATURES_LIST "Prob3ppLinear")
endif()

if(UseProbGPULinear EQUAL 1)
  LIST(APPEND NUOSCILLATOR_FEATURES_LIST "ProbGPULinear")
endif()

if(UseNuFASTLinear EQUAL 1)
  LIST(APPEND NUOSCILLATOR_FEATURES_LIST "NuFASTLinear")
endif()

if(UseOscProb EQUAL 1)
  LIST(APPEND NUOSCILLATOR_FEATURES_LIST "OscProb")
endif()

SET(ROOT_INCLUDE_DIRS_SEP ${ROOT_INCLUDE_DIRS})
string(REPLACE ";" " -I" ROOT_INCLUDE_DIRS_SEP "-I${ROOT_INCLUDE_DIRS_SEP}")
SET(ROOT_DEFINITIONS_SEP ${ROOT_DEFINITIONS})
string(REPLACE ";" " " ROOT_DEFINITIONS_SEP "${ROOT_DEFINITIONS_SEP}")
SET(ROOT_LIBRARIES_SEP ${ROOT_LIBRARIES})
string(REPLACE ";" " -l" ROOT_LIBRARIES_SEP "-l${ROOT_LIBRARIES_SEP}")

# Set the creation date
string(TIMESTAMP CREATION_DATE "%d-%m-%Y")

string(REPLACE ";" " " NUOSCILLATOR_FEATURES "${NUOSCILLATOR_FEATURES_LIST}")
configure_file(${CMAKE_CURRENT_LIST_DIR}/../Templates/nuoscillator-config.in
  "${PROJECT_BINARY_DIR}/nuoscillator-config" @ONLY)
install(PROGRAMS
  "${PROJECT_BINARY_DIR}/nuoscillator-config" DESTINATION
  bin)
