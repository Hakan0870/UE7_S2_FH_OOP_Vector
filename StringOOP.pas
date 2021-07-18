UNIT StringOOP;

INTERFACE

TYPE
    StringBuilder = ^StringBuilderObj;
    StringBuilderObj = OBJECT
        PUBLIC
            CONSTRUCTOR Init;
            PROCEDURE AppendStr(e: STRING);
            PROCEDURE AppendChar(e: CHAR); VIRTUAL;
            PROCEDURE AppendInt(e: INTEGER); VIRTUAL;
            PROCEDURE AppendBool(e: BOOLEAN); VIRTUAL;
            FUNCTION AsString: STRING; VIRTUAL;
        PRIVATE
            buffer: STRING;
    END;

    TabStringBuilder = ^TabStringBuilderObj;
    TabStringBuilderObj = OBJECT(StringBuilderObj)
        PUBLIC
            CONSTRUCTOR Init(tabSize: INTEGER);
            PROCEDURE AppendStr(e: STRING); VIRTUAL;
            PROCEDURE AppendInt(e: INTEGER); VIRTUAL;
            PROCEDURE AppendBool(e: BOOLEAN); VIRTUAL;
            FUNCTION AsString: STRING; VIRTUAL;
        PRIVATE
            tabString: STRING;
    END;

    StringJoiner = ^StringJoinerObj;
    StringJoinerObj = OBJECT(StringBuilderObj)
        PUBLIC
            CONSTRUCTOR Init(delimiter: CHAR); 
            PROCEDURE Add(e: STRING); VIRTUAL;
            FUNCTION AsString: STRING; VIRTUAL;
        PRIVATE
            delimiter: CHAR;
    END;




IMPLEMENTATION
(* ===== Implementation StringBuilder Class ===== *)

    CONSTRUCTOR StringBuilderObj.Init;
        BEGIN
        END;

    PROCEDURE StringBuilderObj.AppendStr(e: STRING);
        BEGIN
            self.buffer := buffer + e;
        END;
        
    PROCEDURE StringBuilderObj.AppendChar(e: CHAR);
        BEGIN
            AppendStr(e);
        END;

    PROCEDURE StringBuilderObj.AppendInt(e: INTEGER);
        VAR
            i: String;
        BEGIN
            Str(e, i);
            AppendStr(i);
        END;
    
    PROCEDURE StringBuilderObj.AppendBool(e: BOOLEAN);
        BEGIN
            IF e = TRUE THEN
                AppendStr('TRUE')
            ELSE
                AppendStr('FALSE')
        END;

    FUNCTION StringBuilderObj.AsString: STRING;
        BEGIN
            AsString := buffer;
        END;


(* ===== Implementation TabStringBuilder Class ===== *)

    CONSTRUCTOR TabStringBuilderObj.Init(tabSize: INTEGER);
        VAR
            i: INTEGER;
            temp: STRING;
        BEGIN
            temp := '';
            Inherited Init;
            FOR i := 1 TO tabSize DO BEGIN
                temp := temp + ' '; 
            END;
            self.tabString:= temp;
        END;

    PROCEDURE TabStringBuilderObj.AppendStr(e: STRING);
        BEGIN
            self.buffer := buffer + e + self.tabString;
        END;
    
    PROCEDURE TabStringBuilderObj.AppendInt(e: INTEGER);
        VAR
            i: String;
        BEGIN
            Str(e, i);
            AppendStr(i);
        END;

    PROCEDURE TabStringBuilderObj.AppendBool(e: BOOLEAN);
        BEGIN
            IF e = TRUE THEN
                AppendStr('TRUE')
            ELSE
                AppendStr('FALSE')
        END;

    FUNCTION TabStringBuilderObj.AsString: STRING;
        BEGIN
            AsString := buffer;
        END;
    


(* ===== Implementation StringJoiner Class ===== *)

    CONSTRUCTOR StringJoinerObj.Init(delimiter: CHAR);
        BEGIN
            Inherited Init;
            self.delimiter := delimiter;
        END;

    PROCEDURE StringJoinerObj.Add(e: STRING);
        BEGIN
            IF self.buffer = '' THEN
                self.buffer := buffer + e
            ELSE
                self.buffer := buffer + self.delimiter + e ;
        END;

    FUNCTION StringJoinerObj.AsString: STRING;
        BEGIN
            AsString := buffer;
        END;

END.