#!/bin/bash

# Submission to the Warp technical assessment challenge

# Goal: Find the longest completed space mission in this file
# The longest space mission is going to be the one with longest duration (days) and has "Completed" status
awk -F '|'  '
  BEGIN {
    max_dur = 0
    longest_mission_id = ""
  }
  $4 ~ /Completed/ {  # This is a filter to check if the mission is completed
    curr_dur = $7 + 0 # Simulate type casting to number
    if (curr_dur > max_dur){ 
      max_dur = curr_dur 
      longest_mission_id = $8
    }
  }
  END {
    if (longest_mission_id != "") {
      print "Longest Completed Mission ID: ", longest_mission_id
      print "Duration (days): ", max_dur
    } else {
      print "No completed missions found/ duration info missing"
    }
  }' "$1"
