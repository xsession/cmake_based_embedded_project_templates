cmake_minimum_required(VERSION 3.14...3.18 FATAL_ERROR)

add_library(board)
target_sources(
    board
    PUBLIC
      inc/board.h
    PRIVATE
      src/board.c)

target_compile_definitions(board PUBLIC )
target_include_directories(
  board
  PUBLIC
    inc
    )

target_link_libraries(
  board
  PRIVATE
)

include(diagnostic)
diagnostic()
