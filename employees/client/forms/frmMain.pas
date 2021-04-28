unit frmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, System.JSON, REST.Types;

type
  TForm2 = class(TForm)
    rstclnt1: TRESTClient;
    rstrqst1: TRESTRequest;
    rstrspns1: TRESTResponse;
    edt1: TEdit;
    edt2: TEdit;
    lbla: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lblRresult: TLabel;
    btn1: TButton;
    btnTest: TButton;
    lblConnectionResult: TLabel;
    edt3: TEdit;
    edt4: TEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    Label3: TLabel;
    lbl3: TLabel;
    btnAddJson: TButton;
    txt1: TText;
    procedure btn1Click(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure btnAddJsonClick(Sender: TObject);
  private
    { Private declarations }
    jsonObj, connectionResult : TJSONObject;
    result : string;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.btn1Click(Sender: TObject);
begin
     rstrqst1.Resource := 'Add';
     rstrqst1.Method := TRESTRequestMethod.rmGet;
     rstrqst1.Response := rstrspns1;

     rstrqst1.Params.Clear;

     with rstrqst1.Params.AddItem do
     begin
       name := 'a';
       value := edt1.Text;
     end;
     with rstrqst1.Params.AddItem do
     begin
       name := 'b';
       value := edt2.Text;
     end;

     rstrqst1.Execute;
     result := rstrspns1.Content;
     lblRresult.Text := result;
end;

procedure TForm2.btnAddJsonClick(Sender: TObject);
begin

      rstrqst1.Resource := 'AddJson';
      rstrqst1.Method := TRESTRequestMethod.rmPOST;
     rstrqst1.Response := rstrspns1;
     rstrqst1.Body.ClearBody;

     with rstrqst1.Body.JSONWriter do
     begin
       WriteStartObject;
       WritePropertyName('param1');
       WriteValue(edt3.Text);
       WritePropertyName('param2');
       WriteValue(edt4.Text);
     end;
     rstrqst1.Execute;

     jsonObj := TJSONObject.ParseJSONValue(rstrspns1.Content) as TJSONObject;
     lbl3.Text := jsonObj.GetValue('result').ToString;
     txt1.Text := jsonObj.ToString;
     
end;

procedure TForm2.btnTestClick(Sender: TObject);
begin
     rstrqst1.Resource := 'TestConnection';
     rstrqst1.Response := rstrspns1;

     rstrqst1.Params.Clear;
     rstrqst1.Execute;
     connectionResult := TJSONObject.ParseJSONValue(rstrspns1.Content) as TJSONObject;
     lblConnectionResult.Text := connectionResult.GetValue('msg').ToString;
end;

end.
