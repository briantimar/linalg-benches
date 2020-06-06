import numpy as np
import matplotlib.pyplot as plt

results = np.loadtxt("results/naive1_results.txt")
sizes = results[:, 0]
nsamp = results[:, 1]
times = results[:, 2]

fig, ax = plt.subplots(dpi=100)
ax.plot(sizes, 1e6 * times, '-o')
ax.set_xlabel("Vector size")
ax.set_ylabel("addv time (us)")
ax.set_title("Vector addv times")
plt.savefig("results/naive1_full_times.png")

fig, ax = plt.subplots(dpi=100)
ax.semilogx(sizes, 1e6 * times / sizes, '-o')
ax.set_xlabel("Vector size")
ax.set_ylabel("addv time per element (us)")
ax.set_title("Vector addv times per element")
plt.savefig("results/naive1_per_element_times.png")
