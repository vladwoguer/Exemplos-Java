unit Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
  Data.DB, Vcl.Grids, Vcl.DBGrids, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TFormClientes = class(TForm)
    ActionListClientes: TActionList;
    ActionSair: TAction;
    MainMenuClientes: TMainMenu;
    Sair: TMenuItem;
    PopupMenuClientes: TPopupMenu;
    Sair1: TMenuItem;
    ZQueryClientes: TZQuery;
    DataSourceClientes: TDataSource;
    DBGridClientes: TDBGrid;
    procedure ActionSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormClientes: TFormClientes;

implementation

{$R *.dfm}

uses DataModule;

procedure TFormClientes.ActionSairExecute(Sender: TObject);
begin
  FormClientes.Close;
end;

procedure TFormClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
    FormClientes := Nil;
end;

end.