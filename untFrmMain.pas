unit untFrmMain;

{
 Scripts:

 CREATE DATABASE  IF NOT EXISTS 'local'
USE 'local';

DROP TABLE IF EXISTS 'people';

CREATE TABLE 'people' (
  'ID' int(11) NOT NULL,
  'NAME' varchar(70) DEFAULT NULL,
  PRIMARY KEY ('ID')
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

}


interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXMySQL, Vcl.StdCtrls,
  Vcl.Grids, Data.DB, Vcl.DBGrids;

type
  TfrmMain = class(TForm)
    btnTestConnectionApp: TButton;
    btnSearchData: TButton;
    btnInsertNewData: TButton;
    gbData: TGroupBox;
    DBGrid1: TDBGrid;
    procedure btnInsertNewDataClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTestConnectionAppClick(Sender: TObject);
    procedure btnSearchDataClick(Sender: TObject);

  private

    function insertNewData: Boolean;

    function testConnection: Boolean;

    function searchData: Boolean;

  end;

var
  frmMain: TfrmMain;

implementation

uses
  untDMMain;

{$R *.dfm}

procedure TfrmMain.FormShow(Sender: TObject);
begin
  DMMain.connectionApp.Connected := False;
  Self.Height := 145;
  Self.Width  := 434;
end;

procedure TfrmMain.btnSearchDataClick(Sender: TObject);
begin
  if searchData then
  begin
    Self.Height := 608;
    Self.Width  := 434;
  end
  else
  begin
    MessageBox(Application.Handle, 'No data on table PEOPLES.', 'Atention', MB_OK + MB_ICONEXCLAMATION);
    Self.Height := 145;
    Self.Width  := 434;
  end;
end;

procedure TfrmMain.btnTestConnectionAppClick(Sender: TObject);
begin
  testConnection;
end;

procedure TfrmMain.btnInsertNewDataClick(Sender: TObject);
begin
  if insertNewData then
    MessageBox(Application.Handle, 'Data inserted with sucess', 'Information', MB_OK + MB_ICONINFORMATION);
end;

function TfrmMain.insertNewData: Boolean;
var
  bDataInserted: Boolean;
  iLastId,
  i: Integer;
begin
  DMMain.qrySearch.Close;
  DMMain.qrySearch.SQL.Clear;
  DMMain.qrySearch.SQL.Add('SELECT MAX(ID) ID FROM PEOPLE');
  DMMain.qrySearch.Open;

  iLastId := DMMain.qrySearch.FieldByName('ID').AsInteger;

  if not DMMain.qrySearch.IsEmpty then
  begin
    DMMain.connectionApp.StartTransaction;

    if not DMMain.qryData.Active then
      DMMain.qryData.Open;

    for i := iLastId + 1 to iLastId + 10 do
    begin
      DMMain.qryData.Append;
      DMMain.qryData.FieldByName('ID').AsInteger  := i;
      DMMain.qryData.FieldByName('NAME').AsString := 'Name ' + IntToStr(i);
      DMMain.qryData.Post;
      bDataInserted := True;
    end;

    DMMain.connectionApp.Commit;
  end;

  Result := bDataInserted;
end;

function TfrmMain.searchData: Boolean;
var
  bDataFound: Boolean;
  i: Integer;
  sPeoples: string;
begin
  if not DMMain.connectionApp.Connected then
    DMMain.connectionApp.Connected := True;

  DMMain.qryData.Close;
  DMMain.qryData.Open;

  if not DMMain.qryData.IsEmpty then
  begin
    sPeoples := '';
    bDataFound := True;
    DMMain.qryData.First;

    while not DMMain.qryData.Eof do
    begin
      if sPeoples = '' then
        sPeoples := 'ID: ' + IntToStr(DMMain.qryData.FieldByName('ID').AsInteger) + ' - ' +
                    'Name: ' + DMMain.qryData.FieldByName('NAME').AsString
      else
        sPeoples := sPeoples + sLineBreak +
                    'ID: ' + IntToStr(DMMain.qryData.FieldByName('ID').AsInteger) + ' - ' +
                    'Name: ' + DMMain.qryData.FieldByName('NAME').AsString;

      DMMain.qryData.Next;
    end;
    //MessageBox(Application.Handle, PWideChar('Data:' + sLineBreak + sPeoples), 'Information', MB_OK + MB_ICONINFORMATION);
  end
  else
    bDataFound := False;

  Result := bDataFound;
end;

function TfrmMain.testConnection: Boolean;
begin
  try
    DMMain.connectionApp.Connected := True;

    if DMMain.connectionApp.Connected then
      MessageBox(Application.Handle, 'Successfully made the connection with database.', 'Information', MB_OK + MB_ICONINFORMATION)
    else
      MessageBox(Application.Handle, 'Failed to connect with database.', 'Information', MB_OK + MB_ICONINFORMATION);

  except
    on E:Exception do
      MessageBox(Application.Handle, PWideChar('Error: ' + E.Message), 'Error', MB_OK + MB_ICONERROR);
  end;
end;

end.

