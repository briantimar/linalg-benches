import subprocess
import numpy as np

if __name__ == "__main__":
    nsamp = 1000
    minsize = 100
    maxsize = int(1e6)
    numsize = 30
    sizes = [int(n) for n in np.exp(np.linspace(np.log(minsize), np.log(maxsize), numsize))]
    
    fout = "results/naive1_results.txt"
    for sz in sizes:
        subprocess.run(["./builds/naive1", str(sz), str(nsamp), fout])