var
a,b:array[1..2,1..1000] of word;
i,j,n,k:word;
begin
         writeln ('Введите количество работников');
         read(n);// число сотрудников
         writeln ('Введите расстояние от работы до дома для каждого работника');
         for i:=1 to n do
           begin
             read(a[1,i]);// ввод расстояний до работы каждого сотрудника
             b[1,i]:=a[1,i];
           end;
         writeln ('Введите стоимость 1 км для каждого такси');
         for i:=1 to n do
           begin
             read(a[2,i]);// ввод стоимости одного км для каждого такси
             b[2,i]:=a[2,i];
           end;
         for i:=1 to n-1 do //сортировка расстояний по убыванию
         for j:=1 to n-i do
           if b[1,j]>b[1,j+1] then
           begin
             k:=b[1,j];
             b[1,j]:=b[1,j+1];
             b[1,j+1]:=k;
           end;
         for i:=1 to n-1 do  //сортировка стоимости км по возрастанию
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
                 if a[1,i]=b[1,j] then
                     begin
                        for k:=1 to n do
                         begin
                           if a[2,k]=b[2,j] then
                           begin
                              write(k,' ');
                              a[2,k]:=0;
                              break;
                           end;
                           b[1,j]:=0;
                         end;
                     end;
end.