function [d,e,n] = rsa_keygeneration()
RSA_version = 2048;
p = randseed(1,1,1,1,RSA_version);
q = randseed(1,1,1,1,RSA_version);
while q==p,
    q = randseed;
end
n = int64(p)*int64(q);
phi = int64(p-1)*int64(q-1)
e = int64(2);
while gcd(phi,e)~=1,
    e = e+1;
end
[g,x,d] = gcd(phi,e);
d = mod(d,phi);
if(d<0),
    d = d+phi;
end
d = int64(d);
end
