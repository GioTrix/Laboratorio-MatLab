% punto (a)
A = rand(100, 200);
% imshow(A);
imwrite(A, 'immagine_A.png');

%punto (b)
B = comprimi_matrice(A,20);
imshow(B);
imwrite(B, 'immagine_B.png');

%punto (c)
C = comprimi_matrice(A,5);
imshow(C);
imwrite(C, 'immagine_C.png');
