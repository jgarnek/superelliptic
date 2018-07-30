#program oblicza macierz operatora Cartier dla krzywej supereliptycznej postaci y^N = f(x) oraz liczby pierwszej p
def cartier_supereliptycznej(p, N, f, eigenvalue = "none", polynomial = "none"):
    '''test'''
    F.<x> = PolynomialRing(GF(p))
    f = F(f)
    r = f.degree()
    delta = GCD(N, r)
    genus = ((N-1) * (r - 1) - delta + 1)/2
    rzad = Integers(N)(p).multiplicative_order()
    holomorficzne = []
    
    if eigenvalue == "none":
        if polynomial == "none":
            #obliczamy indeksy odpowiadające formom holomorficznym
            for j in range(1, N):
                for i in range(1, r):
                    if -N * i + r*j - delta >= 0:
                        holomorficzne.append([i, j])
                
            #operator Cartier
            M = Integer((p^(rzad)-1)/N)
            macierz_cartier = matrix(GF(p), genus, genus, 0)
            g = 1
            for j in range(1, N):
                g = g * f^(M)
                for i in range(1, r):
                    if -N * i + r * j - delta >= 0:
                        indeks = holomorficzne.index([i, j])
                        lista = []
                        wielomian = 0
                        J = p^(rzad - 1) * j
                        for d in range(0, g.degree()+1):
                            if d%p == (-i)%p:
                                wspolczynnik = Integer(g[d])
                                wielomian = wielomian + wspolczynnik * x^((d+i)/p - 1)
                        while wielomian != 0 and wielomian.quo_rem(f)[1]==0:
                            wielomian = wielomian.quo_rem(f)[0]
                            J = J - N
                        for d in range(0, wielomian.degree()+1):
                            wspolczynnik = Integer(wielomian[d])
                            i1 = d + 1
                            j1 = J
                            s1 = holomorficzne.index([i1, j1])
                            macierz_cartier[s1, indeks] = wspolczynnik
        return macierz_cartier
        else:
            ...

    if j != "none" and 
    F.<x> = PolynomialRing(GF(p))
    f = F(f)
    r = f.degree()
    delta = GCD(N, r)
    genus = ((N-1) * (r - 1) - delta + 1)/2
    rzad = Integers(N)(p).multiplicative_order()
    holomorficzne = []
    
    #obliczamy indeksy odpowiadające formom holomorficznym
    for i in range(1, r):
        if -N * i + r*j - delta >= 0:
            holomorficzne.append([i, j])
                
    #operator Cartier
    M = Integer((p^(rzad)-1)/N)
    rozmiar = len(holomorficzne)
    macierz_cartier = matrix(GF(p), rozmiar, rozmiar, 0)
    g = g * f^(M*j)
    for i in range(1, r):
        if -N * i + r * j - delta >= 0:
            indeks = holomorficzne.index([i, j])
            lista = []
            wielomian = 0
            J = p^(rzad - 1) * j
            for d in range(0, g.degree()+1):
                if d%p == (-i)%p:
                    wspolczynnik = Integer(g[d])
                    wielomian = wielomian + wspolczynnik * x^((d+i)/p - 1)
            while wielomian != 0 and wielomian.quo_rem(f)[1]==0:
                wielomian = wielomian.quo_rem(f)[0]
                J = J - N
            for d in range(0, wielomian.degree()+1):
                wspolczynnik = Integer(wielomian[d])
                i1 = d + 1
                j1 = J
                s1 = holomorficzne.index([i1, j1])
                macierz_cartier[s1, indeks] = wspolczynnik
    return macierz_cartier

def cartier(p, N, f, W, j):
    F.<x> = PolynomialRing(GF(p))
    f = F(f)
    r = f.degree()
    delta = GCD(N, r)
    rzad = Integers(N)(p).multiplicative_order()
    M = Integer((p^(rzad)-1)/N)
    g = F(W*f^(M*j))
    wynik = 0
    for i in range(0, g.degree()+1):
        if (i%p) == p-1:
            potega = Integer((i-(p-1))/p)
            wynik = wynik + Integer(g[i]) * x^(potega)
    J = p^(rzad - 1) * j
    FF.<x, y> = PolynomialRing(GF(p), 2)
    return (wynik, j)
