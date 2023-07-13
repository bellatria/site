#!/bin/env python

import sys
import re

def main():
    if len(sys.argv) < 4:
        raise ValueError("You must provide name of var, value of var, and file to operate on")
    var_name = sys.argv[1]
    var_val = sys.argv[2]
    filename = sys.argv[3]

    with open(filename, 'r') as p:
        fcontents = r.read()

    esc_var = re.escape(var_name)
    
    var_pat = r'<!--\s*BEGIN\s+' + esc_var + r'\s*-->.*?<!--\s*END\s+' + esc_var + r'\s*-->'
    total_repl = '<!-- BEGIN ' + var_name + ' -->\n' + var_val + '\n<!-- END ' + var_name + ' -->'

    regex = re.compile(var_pat, re.MULTILINE, re.DOTALL)
    replaced = regex.sub(total_repl, fcontents)
    print(replaced)

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        pass
