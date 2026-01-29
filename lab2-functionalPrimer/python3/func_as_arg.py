def listFunc(a, b):
    return [i for i in range(a, b + 1)]

def applicatorFunc(inpFunc, s, a, b):
    if s == 's':
        return sum(inpFunc(a, b))
    else:
        return sum(inpFunc(a, b)) / (b - a + 1)

print(applicatorFunc(listFunc, 's', 1, 10))
