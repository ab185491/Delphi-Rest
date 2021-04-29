unit modMain;

interface

uses System.SysUtils, System.Classes, Web.HTTPApp;

type
  TWebModule1 = class(TWebModule)
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1WebActionItem1Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1TestConnectionAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1addAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1AddJsonAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

uses
  System.JSON;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TWebModule1.WebModule1addAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
  var
  a, b, res : string;
  ra, rb : Real;
begin
         a := Request.QueryFields.Values['a'];
         b := Request.QueryFields.Values['b'];
         try
         ra := StrToFloat(a);
         rb := StrToFloat(b);
         res := FloatToStr(ra+rb);
         except on E: Exception do
         res := a+b;
         end;
         
         Response.Content := res;
end;

procedure TWebModule1.WebModule1AddJsonAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  var
  RequestObject, obj : TJSONObject;
  num1, num2, result : string;
  param1, param2 : Real;
begin
//      Request.
      RequestObject := TJSONObject.ParseJSONValue(Request.Content) as TJSONObject;
      num1 := (RequestObject.GetValue('param1').Value);
      num2 := (RequestObject.GetValue('param2').Value);
      try
          param1 := StrToFloat(num1);
          param2 :=   StrToFloat(num2);
          result := FloatToStr(param1 + param2);
      except on E: Exception do
        result :=   num1 + num2;
      end;
      obj := TJSONObject.Create;
      obj.AddPair('param1', (num1));
      obj.AddPair('param2', (num2));
      obj.AddPair('result', (result));
      Response.ContentType := 'application/json';
      Response.Content := obj.ToString;
end;

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content :=
    '<html>' +
    '<head><title>Web Server Application</title></head>' +
    '<body>Web Server Application By Ashish Bhusal</body>' +
    '</html>';
end;

procedure TWebModule1.WebModule1TestConnectionAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
Response.StatusCode := 200;
Response.ContentType := 'application/json';
Response.Content := '{"msg" : "Connection Established"}';
end;

procedure TWebModule1.WebModule1WebActionItem1Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
        Response.Content :=
        'Hi This is Ashish home page' +
        'bla bla';
end;

end.
