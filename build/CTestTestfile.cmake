# CMake generated Testfile for 
# Source directory: /home/as/CMAKE_Tutorial
# Build directory: /home/as/CMAKE_Tutorial/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(TutorialRun "tutorial" "25")
add_test(TutorialUsage "tutorial")
set_tests_properties(TutorialUsage PROPERTIES  PASS_REGULAR_EXPRESSION "Usage:.*number")
add_test(tutorialComp25 "tutorial" "25")
set_tests_properties(tutorialComp25 PROPERTIES  PASS_REGULAR_EXPRESSION "25 is 5")
add_test(TutorialComp9 "tutorial" "9")
set_tests_properties(TutorialComp9 PROPERTIES  PASS_REGULAR_EXPRESSION "9 is 3")
add_test(TutorialComp0 "tutorial" "0")
set_tests_properties(TutorialComp0 PROPERTIES  PASS_REGULAR_EXPRESSION "0 is 0")
add_test(TutorialComp-25 "tutorial" "-25")
set_tests_properties(TutorialComp-25 PROPERTIES  PASS_REGULAR_EXPRESSION "-25 is 0")
subdirs("src")
subdirs("src_bin")
