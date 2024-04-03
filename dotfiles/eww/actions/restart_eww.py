import subprocess

# Define the command to be run, add output redirection to /tmp/kitty_output.txt
command = "eww close-all && eww open topbar0 && eww open topbar1 && eww open topbar2 && eww open steam"

# Use subprocess.Popen to execute the command in a new terminal
subprocess.Popen(command, shell=True)