function [outputlayer,loss]=eval_loss(outputlayer,y_true,flag)
dim=size(y_true,2);
loss=dim*feval(@(x)mean(x(:)),outputlayer.loss_f(single(y_true),outputlayer.output));
if flag
    outputlayer.loss=[outputlayer.loss,loss];
    if isequal(outputlayer.type,'lstm')&& ~outputlayer.return_sequence
        outputlayer.e(:,:,end)=outputlayer.loss_df(y_true,outputlayer.output);
    else
        outputlayer.e=outputlayer.loss_df(single(y_true),outputlayer.output);
    end
end
end
