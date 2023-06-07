%esercizio 9
function B = comprimi_matrice(A, n)
    % crea una matrice vuota B della stessa dimensione di A
    B = zeros(size(A));
    
    % itera sulle righe e le colonne di A
    for i = 1:size(A, 1)
        for j = 1:size(A, 2)
            % trova il numero più grande della griglia che risulta <= Aij
            max_num = floor(A(i, j) * n) / n;
            
            % imposta l'elemento Bij come max_num
            B(i, j) = max_num;
        end
    end
end