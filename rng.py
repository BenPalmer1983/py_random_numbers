from f_rng import rng
import numpy
import matplotlib.pyplot as plt



r = numpy.zeros((100000,),)
rng.r_float_diag_1d(r)

n = 100
t = rng.tally(r, n, 0.0, 1.0)
x = numpy.linspace(1/n, 1.0, n)

plt.ylim([0.0,max(t) * 1.02])
plt.plot(t)
 

#plt.show()

r = numpy.zeros((10000000,),)
rng.r_maxwell_1d(0.0,10.0,2.0, r)
t = rng.tally(r, n, 0.0, 10.0)
plt.clf()
plt.ylim([0.0,max(t) * 1.02])
plt.plot(t)
plt.show()



