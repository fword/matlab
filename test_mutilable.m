%[label,data]=libsvmread('connect-4.txt');
%train_label=label(1:60000,:);
%train_data=data(1:60000,:);
%test_label=label(60001:67557,:);
%test_data=data(60001:67557,:);
%train_data=double(train_gist);
%test_data=double(test_gist);
train_label=1;
test_label=1;
for r=1:15
    if r==1
         for i=1:199
          train_label=[train_label;r];
         end;
         %%for i=1:test_label_num(r)-1
          test_label=[test_label;r];
        % end;
    else
        for i=1:200
          train_label=[train_label;r];
         end;
       %  for i=1:test_label_num(r)
         %  test_label=[test_label;r];
       %  end;
     end;
end

%model=svmtrain(train_label,train_data,'-s 0 -c 10 -t 1 -g 1 -r 1 -d 3');
%[predicted_label, accuracy, decision_values] = svmpredict(test_label, test_data, model);