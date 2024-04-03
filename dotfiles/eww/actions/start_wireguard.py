import subprocess

# Define the command to be run, add output redirection to /tmp/kitty_output.txt
command = 'kitty fish -c "wg-quick up wgEC; fish -c \'echo Press any key to continue...; read x\'"'

# Use subprocess.Popen to execute the command in a new terminal
subprocess.Popen(command, shell=True)