import re
import glob, os
string = 'https://m.media-amazon.com/images/G/01/wprs/images/navbar/imdbpro_logo_nb._CB484021162_.png'
# check if 'Python' is at the beginning
match = re.search('([\w_-]+[.](jpg|png))$', string)
if match:
  print("pattern found inside the string")
  print(match.group(1))
else:
  print("pattern not found")  
# Output: pattern found inside the string