/************************ module to test dynamic array data type  ***************************/
module test_arrays ();

int dyn_arr1 [];
int dyn_arr2 [];

initial begin
    dyn_arr2 = new[6];
    dyn_arr1 = new [6];
    dyn_arr2 = '{9,1,8,3,4,4};
    dyn_arr1 = '{0,1,2,3,4,5};

    $display("dynamic array is :%p",dyn_arr1,dyn_arr1.size());
    dyn_arr1.delete();
    $display("dynamic array is :%p",dyn_arr1,dyn_arr1.size());
    /*********************************/
    dyn_arr2.reverse();
    $display("dynamic array after reverse: %p",dyn_arr2);
    dyn_arr2.sort();
    $display("dynamic array after sort: %p",dyn_arr2);
    dyn_arr2.rsort();
    $display("dynamic array after reverse sort: %p",dyn_arr2);
    dyn_arr2.shuffle();
    $display("dynamic array after shuffle: %p",dyn_arr2);
end
    
endmodule