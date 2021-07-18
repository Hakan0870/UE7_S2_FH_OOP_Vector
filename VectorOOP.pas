UNIT VectorOOP;

INTERFACE

    TYPE
        IntArrayTyp = ARRAY [1..1] OF INTEGER;

    TYPE
        Vector = ^VectorObj;
        VectorObj = OBJECT
            PUBLIC
                CONSTRUCTOR Init(size: INTEGER);
                PROCEDURE Add(val: INTEGER);
                PROCEDURE InsertElementAt(pos: INTEGER; val: INTEGER; VAR ok: BOOLEAN);
                PROCEDURE GetElementAt(pos: INTEGER; VAR val: INTEGER; VAR ok: BOOLEAN);
                FUNCTION Size: INTEGER;
                FUNCTION Capacity: INTEGER;
                PROCEDURE Clear;
                PROCEDURE DisplayArray;
                DESTRUCTOR Done;
            PRIVATE
                IntArray: ^IntArrayTyp;
                IntArraySize: INTEGER;
                vectorCapa: INTEGER;
                vectorSize: INTEGER;     
        END;


IMPLEMENTATION


    CONSTRUCTOR VectorObj.Init(size: INTEGER);
        VAR
            i: INTEGER;
        BEGIN
            IntArraySize := size;
            GetMem(IntArray, size * sizeOf(IntArrayTyp));
            IF IntArray <> NIL THEN BEGIN
                GetMem(IntArray, IntArraySize * sizeOf(IntArrayTyp));
                vectorSize := 0;
                vectorCapa := self.IntArraySize;
                FOR i := 1 TO vectorCapa DO
                    {$R-} 
                    IntArray^[i] := 0; 
                    {$R+}
            END;
        END;


    PROCEDURE VectorObj.Add(val: INTEGER);
        VAR
            i: INTEGER;
            temp: ^IntArrayTyp;
        BEGIN
            IF vectorSize < vectorCapa THEN BEGIN
                INC(vectorSize);
                {$R-} 
                IntArray^[vectorSize] := val; 
                {$R+}
            END ELSE BEGIN
                vectorCapa := vectorCapa * 2;
                GetMem(temp, vectorSize * sizeOf(IntArrayTyp));
                FOR i := 1 TO vectorSize DO
                    {$R-} 
                    temp^[i] := IntArray^[i]; 
                    {$R+}
                FOR i := (vectorSize + 1) TO vectorCapa DO 
                    {$R-} 
                    temp^[i] := 0; 
                    {$R+}
                FreeMem(IntArray, vectorCapa * sizeOf(IntArrayTyp));
                IntArray := temp;
                IF vectorSize < vectorCapa THEN BEGIN
                    INC(vectorSize);
                    {$R-} 
                    IntArray^[vectorSize] := val; 
                    {$R+}
                END;
            END;
        END;



    PROCEDURE VectorObj.InsertElementAt(pos: INTEGER; val: INTEGER; VAR ok: BOOLEAN);
        VAR
            i: INTEGER;
        BEGIN
            IF pos > vectorSize THEN
                VectorObj.Add(val)
            ELSE IF pos > vectorCapa THEN
                ok := FALSE
            ELSE BEGIN
                FOR i := vectorSize DOWNTO pos DO 
                    {$R-}
                    IntArray^[i+1] := IntArray^[i];
                    {$R+}
                {$R-} 
                IntArray^[pos] := val; 
                {$R-}
                INC(vectorSize);
            END;
        END;
            

    PROCEDURE VectorObj.GetElementAt(pos: INTEGER; VAR val: INTEGER; VAR ok: BOOLEAN);
        BEGIN
            IF (pos <= vectorSize) AND (pos > 0) THEN BEGIN
                {$R-}
                val := IntArray^[pos];
                {$R+}
                ok := TRUE;
            END ELSE
                ok := FALSE;
        END;


    FUNCTION VectorObj.Size: INTEGER;
        BEGIN
            IF IntArray <> NIL THEN
                Size := vectorSize
            ELSE
                Size := 0;
        END;


    FUNCTION VectorObj.Capacity: INTEGER;
        BEGIN
            IF IntArray <> NIL THEN
                Capacity := vectorCapa
            ELSE
                Capacity := 0;
        END;

    PROCEDURE VectorObj.DisplayArray;
        VAR
            i: INTEGER;
        BEGIN
            FOR i := 1 TO vectorSize DO BEGIN
            {$R-}
                Write(IntArray^[i], ', ');
            {$R+}
            END;
            WriteLn;
        END;

    DESTRUCTOR VectorObj.Done;
        BEGIN
            FreeMem(IntArray, vectorCapa * sizeOf(IntArrayTyp));
            IntArray := NIL;
        END;

    PROCEDURE VectorObj.Clear;
        VAR
            i: INTEGER;
        BEGIN
            FreeMem(IntArray, size * sizeOf(IntArrayTyp));
            IF IntArray <> NIL THEN BEGIN
                GetMem(IntArray, IntArraySize * sizeOf(IntArrayTyp));
                vectorSize := 0;
                vectorCapa := self.IntArraySize;
                FOR i := 1 TO vectorCapa DO
                    {$R-} 
                    IntArray^[i] := 0; 
                    {$R+}
            END;
        END;



BEGIN
END.