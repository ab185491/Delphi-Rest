unit ComboBox1;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls;

type
  TComboBox1 = class(TComboBox)
//  TComboBoxObject := TCombo
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls;

procedure Register;
begin
  RegisterComponents('Samples', [TComboBox1]);

end;

end.
