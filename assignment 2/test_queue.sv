module test_queue ();
    int q [$];
    int j;

    initial begin
       j = 1;
       q = '{0,2,5};
       q.insert(1,j);
       $display("queue values are: %p",q);
       q.delete(1);
       $display("queue values after deletion are: %p",q);
       q.push_front(7);
       q.push_back(9);
       $display("queue values after pushing values are: %p",q);
       j=q.pop_back();
       $display("queue and j after poping an element from back of queue: %p , %d",q,j);
       j=q.pop_front();
       $display("queue and j after poping an element from front of queue: %p , %d",q,j);


    end
    

endmodule