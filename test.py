import subprocess
import numpy as np
import argparse
import os

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("testcode")
    args=parser.parse_args()
    
    nsamp = 1000
    minsize = 100
    maxsize = int(1e6)
    numsize = 30
    sizes = [int(n) for n in np.exp(np.linspace(np.log(minsize), np.log(maxsize), numsize))]
    
    progname = os.path.join("builds", args.testcode)
    if not os.path.isfile(progname):
        print(f"Missing test program: {progname}")
    
    fout = os.path.join("results", f"{args.testcode}.txt")
    
    for sz in sizes:
        subprocess.run([progname, str(sz), str(nsamp), fout])