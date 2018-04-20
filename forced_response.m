wn = 82.0383
g = 0.05
wd = wn*sqrt(1-g^2)
syms t T
G = 52500 * sin(6.98*t)
H = exp(-g*wn*(t-T))
K = sin(wd*(t-T))
L = G*H*K

I = int(L,T,0,t)
pretty(I)