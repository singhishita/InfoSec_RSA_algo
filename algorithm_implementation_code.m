clear;
clc;
fileid = fopen('input.txt','r');
plain = fgetl(fileid);
fclose(fileid);

disp('-----------------------Original Message----------------------');
disp(plain);

disp('-----------------------Key Generation----------------------');
[d,e,n] = rsa_keygeneration();
fprintf('Generated keys:\n e=%d,\n d=%d,\n n=%d\n',e,d,n);

disp('------------------------Encryption-------------------------');
c = rsa_crypt(plain,e,n);
fprintf('Cipher Text in Hex: ');
for i=c,
    fprintf('%x ',i);
end
disp(' ');

disp('-------------------------Decryption------------------------');
plain = rsa_crypt(c,d,n);
fprintf(' Plain Text: %s\n',plain);
