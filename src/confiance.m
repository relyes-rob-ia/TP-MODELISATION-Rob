% P(M)
pm = 0.5;
% P(E|M)
pem = 0.8;
% P(E|-M)
penm = 0.6;
seuil = 0.99;

pme = get_confiance(pm, pem, penm);
disp("P(M|E) = ");
disp(pme);

disp("Modele valide = %s", str(pme <= seuil));

function pme = get_confiance(pm, pem, penm)
    pme = (pem * pm) / (pem * pm + penm * (1 - pm));
end



