import json

def main():
    val = input().strip();
    val=json.loads(val);

    outstr=str(val['app']) + ': ' + str(val['title']);

    if len(outstr) > 100:
        print(val[0:100] + '...')
    else:
        print(val)
