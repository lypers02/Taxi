Label
m_1;
var
c:array[1..2,1..1000] of string;
a,b:array[1..2,1..1000] of word;
i,j,n,k:word;
m:integer;
s:string;
begin
         m_1: writeln ('Введите количество работников Вашей фирмы, не более 1000 чел.');
         readln(s);                                     // ввод количества сотрудников  
         val(s,n,m);                                   //контроль ввода числа 
      if  m<>0 then begin writeln('Oшибка, повторите ввод!'); goto m_1 end else 
        begin
      if (n=0) or (n>1000) then begin writeln('Oшибка, повторите ввод!'); goto m_1 end else //контроль интервала числа 
        begin    
         writeln ('Введите расстояние от работы до дома для каждого из ', n, ' работников, км');
         for i:=1 to n do                             // ввод расстояний до работы каждого сотрудника    
           begin
             repeat
               begin
               readln(c[1,i]);
               val (c[1,i],a[1,i],m);                 //контроль ввода числа   
               if (m<>0) then writeln('Oшибка, повторите ввод! Введите расстояние от работы до дома работника в км')
               end
             until m=0;
             if a[1,i]=0 then                         // если расстояние введено как число 0
               begin
               writeln('Oшибка, повторите ввод!Введите расстояние от работы до дома в км');
               readln(c[1,i]);
               val (c[1,i],a[1,i],m);
               end;
             b[1,i]:=a[1,i];
           end;
         writeln ('Введите стоимость 1 км для каждого такси, руб/км');
         for i:=1 to n do                              // ввод стоимости одного км для каждого такси
           begin
              repeat
               begin
               readln(c[2,i]);
               val (c[2,i],a[2,i],m);                 //контроль ввода числа   
               if (m<>0) then writeln('Oшибка, повторите ввод! Введите стоимость 1 км для каждого такси, руб/км')
               end
             until m=0;
             if a[2,i]=0 then                        // если стоимость км введена как число 0
               begin
               writeln('Oшибка, повторите ввод! Введите стоимость 1 км для каждого такси, руб/км');
               readln(c[2,i]);
               val (c[2,i],a[2,i],m);
               end;
             b[2,i]:=a[2,i];
           end;
         for i:=1 to n-1 do                          //сортировка расстояний по убыванию
         for j:=1 to n-i do
           if b[1,j]>b[1,j+1] then
           begin
             k:=b[1,j];
             b[1,j]:=b[1,j+1];
             b[1,j+1]:=k;
           end;
         for i:=1 to n-1 do                         //сортировка стоимости 1 км по возрастанию
         for j:=1 to n-i do
           if b[2,j]<b[2,j+1] then
              begin
                 k:=b[2,j];
                 b[2,j]:=b[2,j+1];
                 b[2,j+1]:=k;
              end;
         writeln ('Номера такси для каждого работника');
              for i:=1 to n do
              for j:=1 to n do
                 if a[1,i]=b[1,j] then                  // сопоставление массивов по расстоянию
                     begin
                        for k:=1 to n do
                         begin
                           if a[2,k]=b[2,j] then        // сопоставление массивов по стоимости
                           begin
                              write(k,' ');
                              a[2,k]:=0;
                              break;
                           end;
                           b[1,j]:=0;
                         end;
                  end;
              end;   
    end;   
end.
