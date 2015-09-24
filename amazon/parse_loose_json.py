import json, gzip, sys

for l in sys.stdin:
  print json.dumps(eval(l))
