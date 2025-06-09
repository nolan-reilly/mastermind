# Notes
# -------------------------------------
# Player
# - name
# - code
#
# Computer
# - code (randomized)
#
# Game
# - Game loop
#   - 12 turns
#   - prompt user for a 4 digit alpha-numeric code (0-9, a-z)
#   - Display colored response, yellow for in the code incorrect position, green for
#     correct guess and position (Use gem library for this)
#   - Let computer attempt a guess at players code (Just let it be randomized for now)
#
# - Asking for player name and their code
#
#
#
# General Format
# - 12 Turns
# - Four Digit Codes
# - Have to tell the player with colors how good their guess was could use
#   a library to solve this issue
#   - White means that one guess is correct but in the wrong hole
#   - Red means that the guess is correct and in the right hole
#

# Based off of this format I'd assume to create a four digit section like below:
#
#     _ _ _ _
#
# Player would be asked to enter a four digit code 0-9, and this code would be passed
# into some algorithm that would check if each index matches the color criteria below
# marking it with a color. We shouldn't store the index's as values remember that as
# we can just return a representation of the code with the colors. We can just make
# the computer for not just randomly guess codes which would be funny as theres a
# 1/10000 chance that it'll win each turn, we can probably up this with some algorithm.
