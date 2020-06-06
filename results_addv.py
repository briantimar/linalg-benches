import numpy as np
import matplotlib.pyplot as plt

prognames = ["naive1", "addv_sse1"]
sizes = {}
times = {}

for prog in prognames:
    results = np.loadtxt(f"results/{prog}.txt")
    sizes[prog] = results[:, 0]
    # nsamp = results[:, 1]
    times[prog] = results[:, 2]

fig, ax = plt.subplots(dpi=100)
for prog in prognames:
    ax.plot(sizes[prog], 1e6 * times[prog], '-o', label=prog)
ax.set_xlabel("Vector size")
ax.set_ylabel("addv time (us)")
ax.set_title("Vector addv times")
plt.legend()
plt.savefig("results/full_times.png")

fig, ax = plt.subplots(dpi=100)
print("Time per floating-point element:")
for prog in prognames:
    ax.semilogx(sizes[prog], 1e6 * times[prog] / sizes[prog], '-o', label=prog)
    meantime = np.mean(times[prog]/sizes[prog])
    print(f"{prog}: {meantime*1e9:.3e} ns")
ax.set_xlabel("Vector size")
ax.set_ylabel("addv time per element (us)")
ax.set_title("Vector addv times per element")
plt.legend()
plt.savefig("results/per_element_times.png")
