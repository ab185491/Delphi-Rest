program EmployeeClient;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmMain in 'forms\frmMain.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
