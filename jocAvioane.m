function jocAvioane()

    fereastra = figure('Name', 'Joc Avioane', 'NumberTitle', 'off');
    avioane=3;
    avioane2=3;
    capBot=3;
    capJucator=3;
    matrice2 = zeros(10);
    matrice1 = zeros(10);
    [~, butoaneJucator1] = initializareHarta(0.1, 0.55, @butonApasat);
    numerotareJucator1(fereastra, 0.05, 0.55);

    [~, butoaneJucator2] = initializareHarta(0.1, 0.05, @butonApasatJucator2);
    numerotareJucator2(fereastra, 0.05, 0.05);


    optiuni = {'↑', '→', '↓', '←'};
    dropdown = uicontrol('Style', 'popupmenu', 'Units', 'normalized', ...
        'Position', [0.7, 0.8, 0.2, 0.1], 'String', optiuni, ...
        'Callback', @selecteazaValoare);

    % Funcția care va fi apelată la selectarea unei valori din meniu
    function selecteazaValoare(~, ~)
        valoareSelectata = get(dropdown, 'Value');
        disp(['Valoarea selectată este: ' num2str(valoareSelectata)]);
        % Aici poți face ce dorești cu valoarea selectată
        % De exemplu, poți folosi valoarea pentru a seta un anumit comportament în jocul tău.
    end


    function [harta, butoane] = initializareHarta(startX, startY, functieButoane)
        harta = cell(10, 10);
        butoane = cell(10, 10);
        latimeButoane = 0.045;
        for linie = 1:10
            for coloana = 1:10
                butoane{linie, coloana} = uicontrol('Style', 'pushbutton', 'Units', 'normalized', ...
                    'Position', [startX + (coloana - 1) * latimeButoane, startY + (linie - 1) * latimeButoane, latimeButoane, latimeButoane], ...
                    'String', '', 'Parent', fereastra, 'Callback', {@(src, event) functieButoane(src, event, linie, coloana)});
                harta{linie, coloana} = 0;
            end
        end
    end

    function numerotareJucator1(fereastra, startX, startY)
        alfabet = 'JIHGFEDCBA';
        latimeButoane = 0.045;
        for i = 1:10
            uicontrol('Style', 'text', 'Units', 'normalized', 'Position', [startX - 0.045, startY + (i - 1) * latimeButoane, 0.03, latimeButoane], ...
                'String', alfabet(i), 'Parent', fereastra);
        end
        for i = 1:10
            uicontrol('Style', 'text', 'Units', 'normalized', 'Position', [startX + (i ) * latimeButoane, startY - 0.045, latimeButoane, 0.03], ...
                'String', num2str(i), 'Parent', fereastra);
        end
    end
    
    function numerotareJucator2(fereastra, startX, startY)
        alfabet = 'JIHGFEDCBA';
        latimeButoane = 0.045;
        for i = 1:10
            uicontrol('Style', 'text', 'Units', 'normalized', 'Position', [startX - 0.045, startY + (i - 1) * latimeButoane, 0.03, latimeButoane], ...
                'String', alfabet(i), 'Parent', fereastra);
        end
        for i = 1:10
            uicontrol('Style', 'text', 'Units', 'normalized', 'Position', [startX + (i) * latimeButoane, startY - 0.045, latimeButoane, 0.03], ...
                'String', num2str(i), 'Parent', fereastra);
        end
    end
    
    function butonApasat(~, ~, linie, coloana)
        if matrice1(linie,coloana)==-1
            disp('Locatia este deja lovita');
            return;
        end
        if avioane<1
            imagine = imread('C:\Users\40799\Desktop\avioane\lovitura.png');
            set(butoaneJucator1{linie, coloana}, 'CData', imagine);

            if matrice1(linie,coloana)==2
                matrice1(linie,coloana)=-1;
                disp('Cap');
                capBot=capBot-1;
                if  capBot<1
                    close(fereastra);
                    msgbox('Felicitări! Jucătorul a câștigat!', 'Joc încheiat');
                end
            elseif matrice1(linie,coloana)==1
                disp('Corp');
                matrice1(linie,coloana)=-1;
            else
                disp('Nu ai nimerit');
                matrice1(linie,coloana)=-1;
            end
            
                valoare1 = randi([1, 10]); 
                valoare2 = randi([1, 10]); 
                while matrice2(valoare1,valoare2)==-1
                    valoare1 = randi([1, 10]); 
                    valoare2 = randi([1, 10]); 
                end
            set(butoaneJucator2{valoare1, valoare2}, 'CData', imagine);
            if matrice2(valoare1,valoare2)==2
                capJucator=capJucator-1;
                disp('ai fost lovit in cap');
                disp(capJucator);
                if capJucator<1
                    close(fereastra);
                    msgbox('Botul a castigat (((((', 'Joc încheiat');
                end
            end
            matrice2(valoare1,valoare2)=-1;
        else
            disp('Inca nu ai pus cele 3 avioane');

        end

        
    end
%//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
%//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
%//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    function liber = avioaneBotVizibile(linie, coloana, poz)
    imagine_cap = imread('C:\Users\40799\Desktop\avioane\cap.png');
    imagine_aripa_stanga = imread('C:\Users\40799\Desktop\avioane\aripa_stanga.png');
    imagine_aripa_dreapta = imread('C:\Users\40799\Desktop\avioane\aripa_dreapta.png');
    imagine_picior_drept = imread('C:\Users\40799\Desktop\avioane\picior_drept.png');
    imagine_picior_stang = imread('C:\Users\40799\Desktop\avioane\picior_stang.png');
    imagine_fund = imread('C:\Users\40799\Desktop\avioane\fund.png');
    imagine_corp = imread('C:\Users\40799\Desktop\avioane\corp.png');
    imagine_piept = imread('C:\Users\40799\Desktop\avioane\piept.png');
    if linie==1 || linie==10 || coloana==1 || coloana==10
        liber=1;
        return;
    end
    if poz==1 && linie==9
       liber=1;
       return;
   end
   if poz==2 && coloana==9
       liber=1;
       return;
   end
   if poz==3 && linie==2
       liber=1;
       return;
   end
   if poz==4 && coloana==2
       liber=1;
       return;
   end

    if avioane2>=1
       if poz==1
            if matrice1(linie+2, coloana)~=0 || matrice1(linie+1, coloana)~=0 ||matrice1(linie, coloana)~=0 ||matrice1(linie-1, coloana)~=0 ||matrice1(linie-1, coloana-1)~=0 ||matrice1(linie+1, coloana-1)~=0 ||matrice1(linie+1, coloana+1)~=0 ||matrice1(linie-1, coloana+1)~=0 ||linie==9
                liber=1;
                return;
            end
            set(butoaneJucator1{linie+2, coloana}, 'CData', imagine_cap);
            matrice1(linie+2, coloana)=2;
            set(butoaneJucator1{linie+1, coloana}, 'CData', imagine_piept);
            matrice1(linie+1, coloana)=1;
            set(butoaneJucator1{linie, coloana}, 'CData', imagine_corp);
            matrice1(linie, coloana)=1;
            set(butoaneJucator1{linie-1, coloana}, 'CData', imagine_fund);
            matrice1(linie-1, coloana)=1;
            set(butoaneJucator1{linie-1, coloana-1}, 'CData', imagine_picior_stang);
            matrice1(linie-1, coloana-1)=1;
            set(butoaneJucator1{linie+1, coloana-1}, 'CData', imagine_aripa_stanga);
            matrice1(linie+1, coloana-1)=1;
            set(butoaneJucator1{linie+1, coloana+1}, 'CData', imagine_aripa_dreapta);
            matrice1(linie+1, coloana+1)=1;
            set(butoaneJucator1{linie-1, coloana+1}, 'CData', imagine_picior_drept);
            matrice1(linie-1, coloana+1)=1;
       elseif poz==3
            if matrice1(linie-2, coloana)~=0 || matrice1(linie-1, coloana)~=0 ||matrice1(linie, coloana)~=0 ||matrice1(linie+1, coloana)~=0 ||matrice1(linie+1, coloana+1)~=0 ||matrice1(linie-1, coloana+1)~=0 ||matrice1(linie-1, coloana-1)~=0 ||matrice1(linie+1, coloana-1)~=0 ||linie==2
                liber=1;
                return;
            end
            set(butoaneJucator1{linie-2, coloana}, 'CData',imrotate(imagine_cap, 180)) ;
            matrice1(linie-2, coloana)=2;
            set(butoaneJucator1{linie-1, coloana}, 'CData', imrotate(imagine_piept, 180));
            matrice1(linie-1, coloana)=1;
            set(butoaneJucator1{linie, coloana}, 'CData', imrotate(imagine_corp, 180));
            matrice1(linie, coloana)=1;
            set(butoaneJucator1{linie+1, coloana}, 'CData', imrotate(imagine_fund, 180));
            matrice1(linie+1, coloana)=1;
            set(butoaneJucator1{linie+1, coloana+1}, 'CData', imrotate(imagine_picior_stang, 180));
            matrice1(linie+1, coloana+1)=1;
            set(butoaneJucator1{linie-1, coloana+1}, 'CData', imrotate(imagine_aripa_stanga, 180));
            matrice1(linie-1, coloana+1)=1;
            set(butoaneJucator1{linie-1, coloana-1}, 'CData', imrotate(imagine_aripa_dreapta, 180));
            matrice1(linie-1, coloana-1)=1;
            set(butoaneJucator1{linie+1, coloana-1}, 'CData', imrotate(imagine_picior_drept, 180));
            matrice1(linie+1, coloana-1)=1;
       elseif poz==2
            if matrice1(linie, coloana+2)~=0 || matrice1(linie, coloana+1)~=0 ||matrice1(linie, coloana)~=0 ||matrice1(linie, coloana-1)~=0 ||matrice1(linie+1, coloana-1)~=0 ||matrice1(linie-1, coloana+1)~=0 ||matrice1(linie-1, coloana+1)~=0 ||matrice1(linie-1, coloana-1)~=0 ||coloana==9
                liber=1;
                return;
            end
            set(butoaneJucator1{linie, coloana+2}, 'CData', imrotate(imagine_cap, -90));
            matrice1(linie, coloana+2)=2;
            set(butoaneJucator1{linie, coloana+1}, 'CData', imrotate(imagine_piept, -90));
            matrice1(linie, coloana+1)=1;
            set(butoaneJucator1{linie, coloana}, 'CData', imrotate(imagine_corp, -90));
            matrice1(linie, coloana)=1;
            set(butoaneJucator1{linie, coloana-1}, 'CData', imrotate(imagine_fund, -90));
            matrice1(linie, coloana-1)=1;
            set(butoaneJucator1{linie+1, coloana-1}, 'CData', imrotate(imagine_picior_stang, -90));
            matrice1(linie+1, coloana-1)=1;
            set(butoaneJucator1{linie+1, coloana+1}, 'CData', imrotate(imagine_aripa_stanga, -90));
            matrice1(linie+1, coloana+1)=1;
            set(butoaneJucator1{linie-1, coloana+1}, 'CData', imrotate(imagine_aripa_dreapta, -90));
            matrice1(linie-1, coloana+1)=1;
            set(butoaneJucator1{linie-1, coloana-1}, 'CData', imrotate(imagine_picior_drept, -90));
            matrice1(linie-1, coloana-1)=1;
       elseif poz==4
            if matrice1(linie, coloana-2)~=0 || matrice1(linie, coloana-1)~=0 ||matrice1(linie, coloana)~=0 ||matrice1(linie, coloana+1)~=0 ||matrice1(linie-1, coloana+1)~=0 ||matrice1(linie+1, coloana-1)~=0 ||matrice1(linie+1, coloana-1)~=0 ||matrice1(linie+1, coloana+1)~=0 
                liber=1;
                return;
            end
            set(butoaneJucator1{linie, coloana-2}, 'CData', imrotate(imagine_cap, 90));
            matrice1(linie, coloana-2)=2;
            set(butoaneJucator1{linie, coloana-1}, 'CData', imrotate(imagine_piept, 90));
            matrice1(linie, coloana-1)=1;
            set(butoaneJucator1{linie, coloana}, 'CData', imrotate(imagine_corp, 90));
            matrice1(linie, coloana)=1;
            set(butoaneJucator1{linie, coloana+1}, 'CData', imrotate(imagine_fund, 90));
            matrice1(linie, coloana+1)=1;
            set(butoaneJucator1{linie-1, coloana+1}, 'CData', imrotate(imagine_picior_stang, 90));
            matrice1(linie-1, coloana+1)=1;
            set(butoaneJucator1{linie-1, coloana-1}, 'CData', imrotate(imagine_aripa_stanga, 90));
            matrice1(linie-1, coloana-1)=1;
            set(butoaneJucator1{linie+1, coloana-1}, 'CData', imrotate(imagine_aripa_dreapta, 90));
            matrice1(linie+1, coloana-1)=1;
            set(butoaneJucator1{linie+1, coloana+1}, 'CData', imrotate(imagine_picior_drept, 90));
            matrice1(linie+1, coloana+1)=1;
       end
    
    end
    avioane2=avioane2-1;
    liber = 0;

    end
%//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
%//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
%//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function liber = avioaneBot(linie, coloana, poz)
    if linie==1 || linie==10 || coloana==1 || coloana==10
        liber=1;
        return;
    end
    if poz==1 && linie==9
       liber=1;
       return;
   end
   if poz==2 && coloana==9
       liber=1;
       return;
   end
   if poz==3 && linie==2
       liber=1;
       return;
   end
   if poz==4 && coloana==2
       liber=1;
       return;
   end

    if avioane2>=1
       if poz==1
            if matrice1(linie+2, coloana)~=0 || matrice1(linie+1, coloana)~=0 ||matrice1(linie, coloana)~=0 ||matrice1(linie-1, coloana)~=0 ||matrice1(linie-1, coloana-1)~=0 ||matrice1(linie+1, coloana-1)~=0 ||matrice1(linie+1, coloana+1)~=0 ||matrice1(linie-1, coloana+1)~=0 ||linie==9
                liber=1;
                return;
            end
            matrice1(linie+2, coloana)=2;
            matrice1(linie+1, coloana)=1;
            matrice1(linie, coloana)=1;
            matrice1(linie-1, coloana)=1;
            matrice1(linie-1, coloana-1)=1;
            matrice1(linie+1, coloana-1)=1;
            matrice1(linie+1, coloana+1)=1;
            matrice1(linie-1, coloana+1)=1;
       elseif poz==3
            if matrice1(linie-2, coloana)~=0 || matrice1(linie-1, coloana)~=0 ||matrice1(linie, coloana)~=0 ||matrice1(linie+1, coloana)~=0 ||matrice1(linie+1, coloana+1)~=0 ||matrice1(linie-1, coloana+1)~=0 ||matrice1(linie-1, coloana-1)~=0 ||matrice1(linie+1, coloana-1)~=0 ||linie==2
                liber=1;
                return;
            end
            matrice1(linie-2, coloana)=2;
            matrice1(linie-1, coloana)=1;
            matrice1(linie, coloana)=1;
            matrice1(linie+1, coloana)=1;
            matrice1(linie+1, coloana+1)=1;
            matrice1(linie-1, coloana+1)=1;
            matrice1(linie-1, coloana-1)=1;
            matrice1(linie+1, coloana-1)=1;
       elseif poz==2
            if matrice1(linie, coloana+2)~=0 || matrice1(linie, coloana+1)~=0 ||matrice1(linie, coloana)~=0 ||matrice1(linie, coloana-1)~=0 ||matrice1(linie+1, coloana-1)~=0 ||matrice1(linie-1, coloana+1)~=0 ||matrice1(linie-1, coloana+1)~=0 ||matrice1(linie-1, coloana-1)~=0 ||coloana==9
                liber=1;
                return;
            end
            matrice1(linie, coloana+2)=2;
            matrice1(linie, coloana+1)=1;
            matrice1(linie, coloana)=1;
            matrice1(linie, coloana-1)=1;
            matrice1(linie+1, coloana-1)=1;
            matrice1(linie+1, coloana+1)=1;
            matrice1(linie-1, coloana+1)=1;
            matrice1(linie-1, coloana-1)=1;
       elseif poz==4
            if matrice1(linie, coloana-2)~=0 || matrice1(linie, coloana-1)~=0 ||matrice1(linie, coloana)~=0 ||matrice1(linie, coloana+1)~=0 ||matrice1(linie-1, coloana+1)~=0 ||matrice1(linie+1, coloana-1)~=0 ||matrice1(linie+1, coloana-1)~=0 ||matrice1(linie+1, coloana+1)~=0 
                liber=1;
                return;
            end
            matrice1(linie, coloana-2)=2;
            matrice1(linie, coloana-1)=1;
            matrice1(linie, coloana)=1;
            matrice1(linie, coloana+1)=1;
            matrice1(linie-1, coloana+1)=1;
            matrice1(linie-1, coloana-1)=1;
            matrice1(linie+1, coloana-1)=1;
            matrice1(linie+1, coloana+1)=1;
       end
    
    end
    avioane2=avioane2-1;
    liber = 0;

    end


   function butonApasatJucator2(~, ~, linie, coloana)
       if avioane2<1 && avioane<1
           return;
       end
    imagine_cap = imread('C:\Users\40799\Desktop\avioane\cap.png');
    imagine_aripa_stanga = imread('C:\Users\40799\Desktop\avioane\aripa_stanga.png');
    imagine_aripa_dreapta = imread('C:\Users\40799\Desktop\avioane\aripa_dreapta.png');
    imagine_picior_drept = imread('C:\Users\40799\Desktop\avioane\picior_drept.png');
    imagine_picior_stang = imread('C:\Users\40799\Desktop\avioane\picior_stang.png');
    imagine_fund = imread('C:\Users\40799\Desktop\avioane\fund.png');
    imagine_corp = imread('C:\Users\40799\Desktop\avioane\corp.png');
    imagine_piept = imread('C:\Users\40799\Desktop\avioane\piept.png');
    if linie==1 || linie==10 || coloana==1 || coloana==10
        disp('Pozitie invalida');
        return;
    end
    ok=0;
   valoareSelectata = get(dropdown, 'Value');
   if valoareSelectata==1 && linie==9
       disp('Pozitie invalida');
       return;
   end
   if valoareSelectata==2 && coloana==9
       disp('Pozitie invalida');
       return;
   end
   if valoareSelectata==3 && linie==2
       disp('Pozitie invalida');
       return;
   end
   if valoareSelectata==4 && coloana==2
       disp('Pozitie invalida');
       return;
   end
    if avioane>=1
       if valoareSelectata==1
            if matrice2(linie+2, coloana)~=0 || matrice2(linie+1, coloana)~=0 ||matrice2(linie, coloana)~=0 ||matrice2(linie-1, coloana)~=0 ||matrice2(linie-1, coloana-1)~=0 ||matrice2(linie+1, coloana-1)~=0 ||matrice2(linie+1, coloana+1)~=0 ||matrice2(linie-1, coloana+1)~=0  
                ok=1;
            end
            if ok==1 
                disp('Avion intersectat')
                return;
            end
            set(butoaneJucator2{linie+2, coloana}, 'CData', imagine_cap);
            matrice2(linie+2, coloana)=2;
            set(butoaneJucator2{linie+1, coloana}, 'CData', imagine_piept);
            matrice2(linie+1, coloana)=1;
            set(butoaneJucator2{linie, coloana}, 'CData', imagine_corp);
            matrice2(linie, coloana)=1;
            set(butoaneJucator2{linie-1, coloana}, 'CData', imagine_fund);
            matrice2(linie-1, coloana)=1;
            set(butoaneJucator2{linie-1, coloana-1}, 'CData', imagine_picior_stang);
            matrice2(linie-1, coloana-1)=1;
            set(butoaneJucator2{linie+1, coloana-1}, 'CData', imagine_aripa_stanga);
            matrice2(linie+1, coloana-1)=1;
            set(butoaneJucator2{linie+1, coloana+1}, 'CData', imagine_aripa_dreapta);
            matrice2(linie+1, coloana+1)=1;
            set(butoaneJucator2{linie-1, coloana+1}, 'CData', imagine_picior_drept);
            matrice2(linie-1, coloana+1)=1;
       elseif valoareSelectata==3
            if matrice2(linie-2, coloana)~=0 || matrice2(linie-1, coloana)~=0 ||matrice2(linie, coloana)~=0 ||matrice2(linie+1, coloana)~=0 ||matrice2(linie+1, coloana+1)~=0 ||matrice2(linie-1, coloana+1)~=0 ||matrice2(linie-1, coloana-1)~=0 ||matrice2(linie+1, coloana-1)~=0 
                ok=1;
            end
            if ok==1
                disp('Avion intersectat')
                return;
            end
            
            set(butoaneJucator2{linie-2, coloana}, 'CData',imrotate(imagine_cap, 180)) ;
            matrice2(linie-2, coloana)=2;
            set(butoaneJucator2{linie-1, coloana}, 'CData', imrotate(imagine_piept, 180));
            matrice2(linie-1, coloana)=1;
            set(butoaneJucator2{linie, coloana}, 'CData', imrotate(imagine_corp, 180));
            matrice2(linie, coloana)=1;
            set(butoaneJucator2{linie+1, coloana}, 'CData', imrotate(imagine_fund, 180));
            matrice2(linie+1, coloana)=1;
            set(butoaneJucator2{linie+1, coloana+1}, 'CData', imrotate(imagine_picior_stang, 180));
            matrice2(linie+1, coloana+1)=1;
            set(butoaneJucator2{linie-1, coloana+1}, 'CData', imrotate(imagine_aripa_stanga, 180));
            matrice2(linie-1, coloana+1)=1;
            set(butoaneJucator2{linie-1, coloana-1}, 'CData', imrotate(imagine_aripa_dreapta, 180));
            matrice2(linie-1, coloana-1)=1;
            set(butoaneJucator2{linie+1, coloana-1}, 'CData', imrotate(imagine_picior_drept, 180));
            matrice2(linie+1, coloana-1)=1;
       elseif valoareSelectata==2
            if matrice2(linie, coloana+2)~=0 || matrice2(linie, coloana+1)~=0 ||matrice2(linie, coloana)~=0 ||matrice2(linie, coloana-1)~=0 ||matrice2(linie+1, coloana-1)~=0 ||matrice2(linie-1, coloana+1)~=0 ||matrice2(linie-1, coloana+1)~=0 ||matrice2(linie-1, coloana-1)~=0 
                ok=1;
            end
            if ok==1
                disp('Avion intersectat')
                return;
            end
            set(butoaneJucator2{linie, coloana+2}, 'CData', imrotate(imagine_cap, -90));
            matrice2(linie, coloana+2)=2;
            set(butoaneJucator2{linie, coloana+1}, 'CData', imrotate(imagine_piept, -90));
            matrice2(linie, coloana+1)=1;
            set(butoaneJucator2{linie, coloana}, 'CData', imrotate(imagine_corp, -90));
            matrice2(linie, coloana)=1;
            set(butoaneJucator2{linie, coloana-1}, 'CData', imrotate(imagine_fund, -90));
            matrice2(linie, coloana-1)=1;
            set(butoaneJucator2{linie+1, coloana-1}, 'CData', imrotate(imagine_picior_stang, -90));
            matrice2(linie+1, coloana-1)=1;
            set(butoaneJucator2{linie+1, coloana+1}, 'CData', imrotate(imagine_aripa_stanga, -90));
            matrice2(linie+1, coloana+1)=1;
            set(butoaneJucator2{linie-1, coloana+1}, 'CData', imrotate(imagine_aripa_dreapta, -90));
            matrice2(linie-1, coloana+1)=1;
            set(butoaneJucator2{linie-1, coloana-1}, 'CData', imrotate(imagine_picior_drept, -90));
            matrice2(linie-1, coloana-1)=1;
       elseif valoareSelectata==4
            if matrice2(linie, coloana-2)~=0 || matrice2(linie, coloana-1)~=0 ||matrice2(linie, coloana)~=0 ||matrice2(linie, coloana+1)~=0 ||matrice2(linie-1, coloana+1)~=0 ||matrice2(linie+1, coloana-1)~=0 ||matrice2(linie+1, coloana-1)~=0 ||matrice2(linie+1, coloana+1)~=0 
                ok=1;
            end
            if ok==1
                disp('Avion intersectat')
                return;
            end
            set(butoaneJucator2{linie, coloana-2}, 'CData', imrotate(imagine_cap, 90));
            matrice2(linie, coloana-2)=2;
            set(butoaneJucator2{linie, coloana-1}, 'CData', imrotate(imagine_piept, 90));
            matrice2(linie, coloana-1)=1;
            set(butoaneJucator2{linie, coloana}, 'CData', imrotate(imagine_corp, 90));
            matrice2(linie, coloana)=1;
            set(butoaneJucator2{linie, coloana+1}, 'CData', imrotate(imagine_fund, 90));
            matrice2(linie, coloana+1)=1;
            set(butoaneJucator2{linie-1, coloana+1}, 'CData', imrotate(imagine_picior_stang, 90));
            matrice2(linie-1, coloana+1)=1;
            set(butoaneJucator2{linie-1, coloana-1}, 'CData', imrotate(imagine_aripa_stanga, 90));
            matrice2(linie-1, coloana-1)=1;
            set(butoaneJucator2{linie+1, coloana-1}, 'CData', imrotate(imagine_aripa_dreapta, 90));
            matrice2(linie+1, coloana-1)=1;
            set(butoaneJucator2{linie+1, coloana+1}, 'CData', imrotate(imagine_picior_drept, 90));
            matrice2(linie+1, coloana+1)=1;
       end
    else
        disp('Poti pune doar 3 avioane !!!!!!');
        return;
    end
    
    avioane=avioane-1;
    valoare1 = randi([1, 10]); 
    valoare2 = randi([1, 10]); 
    valoare3 = randi([1, 4]); 
    while avioaneBot(valoare1,valoare2,valoare3)==1
        valoare1 = randi([1, 10]); 
        valoare2 = randi([1, 10]); 
        valoare3 = randi([1, 4]);
    end
    
   end
    figure(fereastra);
    
end
