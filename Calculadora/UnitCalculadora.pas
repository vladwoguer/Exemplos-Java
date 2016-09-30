unit UnitCalculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmCalculadora = class(TForm)
    edResultado: TEdit;
    bt7: TButton;
    bt8: TButton;
    bt9: TButton;
    btSoma: TButton;
    bt4: TButton;
    bt5: TButton;
    bt6: TButton;
    btSubtrair: TButton;
    bt1: TButton;
    bt2: TButton;
    bt3: TButton;
    btMultiplicar: TButton;
    btLimpar: TButton;
    bt0: TButton;
    btIgual: TButton;
    btDividir: TButton;


    procedure clickOperador(Sender: TObject);
    procedure NumeroClick(Sender: TObject);
    procedure btIgualClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
      FOperacao : char;
      FTotal: Double;
      FOperando1: Double;
      FOperando2: Double;
      FUltimoFoiIgual: boolean;
      FUltimoFoiSinal : boolean;
      FLimpou : boolean;
      function Calcular(Operando1 : Double; Operando2 : Double; Operacao : char ): Double;
      procedure Limpar;
      procedure BloquearSinais;
      procedure DesbloquearSinais;
      procedure clicouNumero(numero : String);
      procedure clicouOperador(operador : String);


  public
    { Public declarations }
  end;

var
  frmCalculadora: TfrmCalculadora;

implementation

{$R *.dfm}
procedure TfrmCalculadora.clickOperador(Sender: TObject);
begin
       clicouOperador(TButton(Sender).Caption);
end;

procedure TfrmCalculadora.clicouOperador(operador : String);
var
    temp : string;
begin
    if not FUltimoFoiSinal then
        begin
            FOperando2 := StrToFloat(edResultado.Text);
            edResultado.Text := FloatToStr(Calcular(FOperando1, FOperando2, FOperacao ));
            FOperando1 := StrToFloat(edResultado.Text);
        end ;

    FOperacao :=  operador[1];
    FUltimoFoiSinal := true;
end;

procedure TfrmCalculadora.FormCreate(Sender: TObject);
begin
    Limpar;
end;

procedure TfrmCalculadora.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if(Key >=48) and ( Key<=57) then
          clicouNumero(char(Key));

      if Key = ord('*') then
          clicouOperador('x');
      if Key = ord('+') then
          clicouOperador('+');
      if Key = ord('-') then
          clicouOperador('-');
      if Key = ord('/') then
          clicouOperador('/');

end;

procedure TfrmCalculadora.NumeroClick(Sender: TObject);
begin
          clicouNumero(TButton(Sender).Caption);
end;

procedure TfrmCalculadora.clicouNumero(numero : String);
begin
  if FUltimoFoiIgual or FUltimoFoiSinal then
      begin
        edResultado.Text := numero;
        if FUltimoFoiIgual then
        begin
          FUltimoFoiIgual := false;
        end;
        if FUltimoFoiSinal then
        begin
            FUltimoFoiSinal := false;
        end;
      end
    else
        begin
            if edResultado.Text = '0' then
                edResultado.Text := numero
            else
                edResultado.Text := edResultado.Text + numero;
        end;
end;



procedure TfrmCalculadora.btIgualClick(Sender: TObject);
begin
    if not FUltimoFoiIgual then
    begin
        FOperando2 := StrToFloat(edResultado.Text);
        edResultado.Text := FloatToStr(Calcular(FOperando1, FOperando2, FOperacao ));
    end;
    FUltimoFoiIgual := true;
    FUltimoFoiSinal := true;
    FOperando1 := StrToFloat(edResultado.Text);
end;

procedure TfrmCalculadora.btLimparClick(Sender: TObject);
begin
    Limpar;
end;

function TfrmCalculadora.Calcular(Operando1 : Double; Operando2 : Double; Operacao : char ): Double;
begin
    case Operacao of
      '+':begin
              Calcular := Operando1 + Operando2;
          end;
      '-':begin
              Calcular := Operando1 - Operando2;
          end;
      'x':begin
              Calcular := Operando1 * Operando2;
          end;
      'X':begin
              Calcular := Operando1 * Operando2;
          end;
      '/':begin
              Calcular := Operando1 / Operando2;
          end;
    end;
end;
procedure TfrmCalculadora.Limpar;
begin
    FOperando1 := 0;
    FOperando2 := 0;
    FOperacao := '+';
    edResultado.Text := '0';
    FUltimoFoiSinal := false;
    FUltimoFoiIgual := false;
    FLimpou := true;
end;

 procedure TfrmCalculadora.BloquearSinais;
 begin
     btSoma.Enabled := false;
     btSubtrair.Enabled := false;
     btMultiplicar.Enabled := false;
     btDividir.Enabled := false;

 end;

 procedure TfrmCalculadora.DesbloquearSinais;
 begin
     btSoma.Enabled := true;
     btSubtrair.Enabled := true;
     btMultiplicar.Enabled := true;
     btDividir.Enabled := true;

 end;

end.
