from subprocess import run

# List all player names
cmd = "playerctl -l"
data = run(cmd, capture_output=True, shell=True)
player_list = data.stdout.decode('utf-8').strip().split('\n')
actual_player = None

for player in player_list:
    # Get status
    cmd = "playerctl status -p " + player
    data = run(cmd, capture_output=True, shell=True)
    status = data.stdout.decode('utf-8').strip()
    if 'Playing' == status:
        actual_player = player

output = ''

if actual_player:
    # Get metadata
    output += ''
    
    cmd = "playerctl metadata -p " + actual_player + " --format '{{ artist }};{{ title }};{{ duration(position) }};{{ duration(mpris:length) }}'"
    data = run(cmd, capture_output=True, shell=True)
    metadata = data.stdout.decode('utf-8').strip()
    metadataSplit = metadata.split(';')
    artist = metadataSplit[0]
    title = metadataSplit[1]
    position = metadataSplit[2]
    length = metadataSplit[3]

    if len(artist) > 0:
        newOutput = f'{artist} - {title} {position}|{length}'
    else:
        newOutput = f'{title} {position}|{length}'

    if len(newOutput) > 50:
        newOutput = f'{title} {position}|{length}'

    if len(newOutput) > 50:
        title = title[:40] + '..'
        newOutput = f'{title} {position}|{length}'

    output = f'{output} {newOutput}'
else:
    output += ' Not playing'

print(output)
