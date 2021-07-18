PROGRAM VectorOOPTest;

USES
    VectorOOP;

VAR
    vector1: Vector;
    vector2: Vector;
    vector3: Vector;
    vector4: Vector;
BEGIN
    WriteLn('Test1:');
    New(vector1, Init(5));
    vector1^.Add(5);
    vector1^.Add(7);
    vector1^.Add(8);
    vector1^.Add(9);
    vector1^.Add(10);
    vector1^.Add(87);
    WriteLn('Input:');
    vector1^.DisplayArray;
    WriteLn('Size: ', vector1^.Size);
    WriteLn('Capacity: ', vector1^.Capacity);

    vector1^.Clear;
    WriteLn('Output after Clear: ');
    vector1^.DisplayArray;
    WriteLn('Size: ', vector1^.Size);
    WriteLn('Capacity: ', vector1^.Capacity);
    vector1^.Done;
    WriteLn;

    WriteLn('Test2:');
    New(vector2, Init(5));
    vector2^.Add(5);
    vector2^.Add(7);
    vector2^.Add(8);
    vector2^.Add(9);
    vector2^.Add(10);
    WriteLn('Input:');
    vector2^.DisplayArray;
    WriteLn('Size: ', vector2^.Size);
    WriteLn('Capacity: ', vector2^.Capacity);
    vector2^.Done;
    WriteLn;

    WriteLn('Test3:');
    New(vector3, Init(7));
    vector3^.Add(5);
    vector3^.Add(7);
    vector3^.Add(8);
    vector3^.Add(9);
    WriteLn('Input:');
    vector3^.DisplayArray;
    WriteLn('Size: ', vector3^.Size);
    WriteLn('Capacity: ', vector3^.Capacity);
    vector3^.Done;   
    WriteLn;

    WriteLn('Test4:');
    New(vector4, Init(1));
    vector4^.Add(5);
    vector4^.Add(7);
    vector4^.Add(8);
    vector4^.Add(9);
    vector4^.Add(5);
    vector4^.Add(7);
    vector4^.Add(8);
    vector4^.Add(9);
    WriteLn('Input:');
    vector4^.DisplayArray;
    WriteLn('Size: ', vector4^.Size);
    WriteLn('Capacity: ', vector4^.Capacity);
    vector4^.Done;   
    WriteLn;

END.