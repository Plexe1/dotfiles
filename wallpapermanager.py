import os
import random
PATH = os.path.expanduser('~')+"/Wallpapers"
if not os.path.isdir(PATH):
    exit()
files = os.listdir(PATH)
if len(files) > 0:
    _ = os.system(f'swww img -t any \"{PATH}/{random.choice(files)}\"')
