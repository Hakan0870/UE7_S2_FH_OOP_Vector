PROGRAM StringOOPTest;

USES
    StringOOP;

VAR
    string1: StringBuilder;
    string2: TabStringBuilder;
    string3: StringJoiner;
BEGIN
    New(string1, Init);
    string1^.AppendStr('Eins');
    string1^.AppendChar(' ');
    string1^.AppendInt(2);
    string1^.AppendChar(' ');
    string1^.AppendBool(TRUE);
    WriteLn(string1^.AsString);
    WriteLn;
    WriteLn;

    New(string2, Init(8));
    string2^.AppendStr('Eins');
    string2^.AppendInt(2);
    string2^.AppendBool(TRUE);
    WriteLn(string2^.AsString);
    WriteLn;
    WriteLn;

    New(string3, Init(','));
    string3^.Add('Eins');
    string3^.Add('Zwei');
    string3^.Add('Drei');
    WriteLn(string3^.AsString);

END.