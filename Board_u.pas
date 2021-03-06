unit Board_u;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pngimage, jpeg, PlayerUnit_u, Dice_u;

type
  TFormBoard = class(TForm)
    BtnExitBoard: TButton;
    pnlRight: TPanel;
    pnlLeft: TPanel;
    pnlBoard: TPanel;
    imgBoard: TImage;

    // Game track spaces
    imgBoardSpace_1: TImage;
    imgBoardSpace_2: TImage;
    imgBoardSpace_3: TImage;
    imgBoardSpace_4: TImage;
    imgBoardSpace_5: TImage;
    imgBoardSpace_6: TImage;
    imgBoardSpace_7: TImage;
    imgBoardSpace_8: TImage;
    imgBoardSpace_9: TImage;
    imgBoardSpace_10: TImage;
    imgBoardSpace_11: TImage;
    imgBoardSpace_12: TImage;
    imgBoardSpace_13: TImage;
    imgBoardSpace_14: TImage;
    imgBoardSpace_15: TImage;
    imgBoardSpace_16: TImage;
    imgBoardSpace_17: TImage;
    imgBoardSpace_18: TImage;
    imgBoardSpace_19: TImage;
    imgBoardSpace_20: TImage;
    imgBoardSpace_21: TImage;
    imgBoardSpace_22: TImage;
    imgBoardSpace_23: TImage;
    imgBoardSpace_24: TImage;
    imgBoardSpace_25: TImage;
    imgBoardSpace_26: TImage;
    imgBoardSpace_27: TImage;
    imgBoardSpace_28: TImage;
    imgBoardSpace_29: TImage;
    imgBoardSpace_30: TImage;
    imgBoardSpace_31: TImage;
    imgBoardSpace_32: TImage;
    imgBoardSpace_33: TImage;
    imgBoardSpace_34: TImage;
    imgBoardSpace_35: TImage;
    imgBoardSpace_36: TImage;
    imgBoardSpace_37: TImage;
    imgBoardSpace_39: TImage;
    imgBoardSpace_40: TImage;
    imgBoardSpace_41: TImage;
    imgBoardSpace_42: TImage;
    imgBoardSpace_43: TImage;
    imgBoardSpace_44: TImage;
    imgBoardSpace_45: TImage;
    imgBoardSpace_46: TImage;
    imgBoardSpace_47: TImage;
    imgBoardSpace_48: TImage;
    imgBoardSpace_49: TImage;
    imgBoardSpace_50: TImage;
    imgBoardSpace_51: TImage;
    imgBoardSpace_52: TImage;
    imgBoardSpace_53: TImage;

    // Home track spaces
    imgBoardSpace_GreenHome1: TImage;
    imgBoardSpace_GreenHome2: TImage;
    imgBoardSpace_GreenHome3: TImage;
    imgBoardSpace_GreenHome4: TImage;
    imgBoardSpace_GreenHome5: TImage;

    imgBoardSpace_YellowHome1: TImage;
    imgBoardSpace_YellowHome2: TImage;
    imgBoardSpace_YellowHome3: TImage;
    imgBoardSpace_YellowHome4: TImage;
    imgBoardSpace_YellowHome5: TImage;

    imgBoardSpace_RedHome1: TImage;
    imgBoardSpace_RedHome2: TImage;
    imgBoardSpace_RedHome3: TImage;
    imgBoardSpace_RedHome4: TImage;
    imgBoardSpace_RedHome5: TImage;

    imgBoardSpace_BlueHome1: TImage;
    imgBoardSpace_BlueHome2: TImage;
    imgBoardSpace_BlueHome3: TImage;
    imgBoardSpace_BlueHome4: TImage;
    imgBoardSpace_BlueHome5: TImage;

    // Yard spaces
    imgBoardSpace_GreenTopLeft: TImage;
    imgBoardSpace_GreenTopRight: TImage;
    imgBoardSpace_GreenBottomLeft: TImage;
    imgBoardSpace_GreenBottomRight: TImage;

    imgBoardSpace_YellowTopLeft: TImage;
    imgBoardSpace_YellowTopRight: TImage;
    imgBoardSpace_YellowBottomLeft: TImage;
    imgBoardSpace_YellowBottomRight: TImage;

    imgBoardSpace_RedTopLeft: TImage;
    imgBoardSpace_RedTopRight: TImage;
    imgBoardSpace_RedBottomLeft: TImage;
    imgBoardSpace_RedBottomRight: TImage;

    imgBoardSpace_BlueTopLeft: TImage;
    imgBoardSpace_BlueBottomLeft: TImage;
    imgBoardSpace_BlueTopRight: TImage;
    imgBoardSpace_BlueBottomRight: TImage;

    pnlPlayer1: TPanel;
    pnlPlayer2: TPanel;
    pnlPlayer1RollDice: TPanel;
    pnlPlayer2RollDice: TPanel;
    imgDice: TImage;
    lblDiceResult: TLabel;
    pnlPlayer4: TPanel;
    pnlPlayer4RollDice: TPanel;
    pnlPlayer1Heading: TPanel;
    pnlPlayer2Heading: TPanel;
    pnlPlayer4Heading: TPanel;
    BtnRules: TButton;
    lblPlayer1AmountOfTokensHome: TLabel;
    pnlPlayer3: TPanel;
    pnlPlayer3RollDice: TPanel;
    pnlPlayer3Heading: TPanel;
    lblPlayer2AmountOfTokensHome: TLabel;
    lblPlayer4AmountOfTokensHome: TLabel;
    lblPlayer3AmountOfTokensHome: TLabel;
    procedure BtnExitBoardClick(Sender: TObject);
    procedure ActiveDiceButtonClick(Sender: TObject);
    procedure AssignSelectedToken(Sender: TObject);
    procedure ChooseHowToMoveToken;

    procedure EnableBoardSpaces(bool: boolean);
    procedure EnableRedSpaces(bool: boolean);
    procedure EnableBlueSpaces(bool: boolean);
    procedure EnableYellowSpaces(bool: boolean);
    procedure EnableGreenSpaces(bool: boolean);
    procedure BtnRulesClick(Sender: TObject);

    procedure HideTokenMoveHint(Sender: TObject);
    procedure ShowTokenMoveHint(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FormBoard: TFormBoard;

  Winner: TPlayer;

  DidSomethingWithToken: boolean;

  lastRoll: integer;
  CurrentPlayerIndex: integer;
  indexOfImageSpace: integer;

  ListOfBoardSpaces: TImageArray;
  ListOfRedYardSpaces, ListOfRedHomeSpaces: TImageArray;
  ListOfYellowYardSpaces, ListOfYellowHomeSpaces: TImageArray;
  ListOfBlueYardSpaces, ListOfBlueHomeSpaces: TImageArray;
  ListOfGreenYardSpaces, ListOfGreenHomeSpaces: TImageArray;

  CurrentSelectedImageSpace: TImage;
  CurrentSelectedToken: TToken;

  Player1Red, Player2Yellow, Player3Blue, Player4Green: PlayerUnit_u.TPlayer;
  // TPlayer is definied in the unit PlayerUnit_u

  ListOfActivePlayers: array of TPlayer;

implementation

uses MainMenu_u, AskToExitBoard_u, Rules_u;
{$R *.dfm}

procedure TFormBoard.BtnExitBoardClick(Sender: TObject);
begin
  FormAskToExitBoard.Show;
end;

procedure TFormBoard.BtnRulesClick(Sender: TObject);
begin
  FormRules.Show;
end;

procedure TFormBoard.EnableBoardSpaces(bool: boolean);
var
  i: integer;
begin
  for i := 0 to high(ListOfBoardSpaces) do
  begin
    ListOfBoardSpaces[i].Enabled := bool;
  end;
end;

procedure TFormBoard.EnableRedSpaces(bool: boolean);
var
  i: integer;
begin
  for i := 0 to high(ListOfRedYardSpaces) do
  begin
    ListOfRedYardSpaces[i].Enabled := bool;
  end;

  for i := 0 to high(ListOfRedHomeSpaces) do
  begin
    ListOfRedHomeSpaces[i].Enabled := bool;
  end;

  for i := 0 to high(ListOfBoardSpaces) do
  begin
    ListOfBoardSpaces[i].Enabled := bool;
  end;
end;

procedure TFormBoard.EnableYellowSpaces(bool: boolean);
var
  i: integer;
begin
  for i := 0 to high(ListOfYellowYardSpaces) do
  begin
    ListOfYellowYardSpaces[i].Enabled := bool;
  end;

  for i := 0 to high(ListOfYellowHomeSpaces) do
  begin
    ListOfYellowHomeSpaces[i].Enabled := bool;
  end;

  for i := 0 to high(ListOfBoardSpaces) do
  begin
    ListOfBoardSpaces[i].Enabled := bool;
  end;
end;

procedure TFormBoard.EnableBlueSpaces(bool: boolean);
var
  i: integer;
begin
  for i := 0 to high(ListOfBlueYardSpaces) do
  begin
    ListOfBlueYardSpaces[i].Enabled := bool;
  end;

  for i := 0 to high(ListOfBlueHomeSpaces) do
  begin
    ListOfBlueHomeSpaces[i].Enabled := bool;
  end;

  for i := 0 to high(ListOfBoardSpaces) do
  begin
    ListOfBoardSpaces[i].Enabled := bool;
  end;
end;

procedure TFormBoard.EnableGreenSpaces(bool: boolean);
var
  i: byte;
begin
  for i := 0 to high(ListOfGreenYardSpaces) do
  begin
    ListOfGreenYardSpaces[i].Enabled := bool;
  end;

  for i := 0 to high(ListOfGreenHomeSpaces) do
  begin
    ListOfGreenHomeSpaces[i].Enabled := bool;
  end;

  for i := 0 to high(ListOfBoardSpaces) do
  begin
    ListOfBoardSpaces[i].Enabled := bool;
  end;
end;

procedure TFormBoard.FormShow(Sender: TObject);
var
  i, j: byte;
begin
  left := (Screen.Width div 2) - (FormBoard.Width div 2);
  top := (Screen.WorkAreaHeight div 2) - (FormBoard.Height div 2);

  if ListOfActivePlayerTypes[1] <> 'None' then
  begin
    Player1Red := TPlayer.Create(1);
    SetLength(ListOfActivePlayers, length(ListOfActivePlayers) + 1);
    ListOfActivePlayers[ high(ListOfActivePlayers)] := Player1Red;
  end;

  if ListOfActivePlayerTypes[2] <> 'None' then
  begin
    Player2Yellow := TPlayer.Create(2);
    SetLength(ListOfActivePlayers, length(ListOfActivePlayers) + 1);
    ListOfActivePlayers[ high(ListOfActivePlayers)] := Player2Yellow;
  end;

  if ListOfActivePlayerTypes[3] <> 'None' then
  begin
    Player3Blue := TPlayer.Create(3);
    SetLength(ListOfActivePlayers, length(ListOfActivePlayers) + 1);
    ListOfActivePlayers[ high(ListOfActivePlayers)] := Player3Blue;
  end;

  if ListOfActivePlayerTypes[4] <> 'None' then
  begin
    Player4Green := TPlayer.Create(4);
    SetLength(ListOfActivePlayers, length(ListOfActivePlayers) + 1);
    ListOfActivePlayers[ high(ListOfActivePlayers)] := Player4Green;
  end;

  for i := 0 to high(ListOfActivePlayers) do
  begin
    for j := 0 to 3 do
    begin
      ListOfActivePlayers[i].ListOfYardSpaces[j].Picture.LoadFromFile
        (ListOfActivePlayers[i].tokenPath);
      ListOfActivePlayers[i].ListOfTokens[j].Position := ListOfActivePlayers[i]
        .ListOfYardSpaces[j];
    end;
  end;

  ListOfBoardSpaces := TImageArray.Create(imgBoardSpace_1, imgBoardSpace_2,
    imgBoardSpace_3, imgBoardSpace_4, imgBoardSpace_5, imgBoardSpace_6,
    imgBoardSpace_7, imgBoardSpace_8, imgBoardSpace_9, imgBoardSpace_10,
    imgBoardSpace_11, imgBoardSpace_12, imgBoardSpace_13, imgBoardSpace_14,
    imgBoardSpace_15, imgBoardSpace_16, imgBoardSpace_17, imgBoardSpace_18,
    imgBoardSpace_19, imgBoardSpace_20, imgBoardSpace_21, imgBoardSpace_22,
    imgBoardSpace_23, imgBoardSpace_24, imgBoardSpace_25, imgBoardSpace_26,
    imgBoardSpace_27, imgBoardSpace_28, imgBoardSpace_29, imgBoardSpace_30,
    imgBoardSpace_31, imgBoardSpace_32, imgBoardSpace_33, imgBoardSpace_34,
    imgBoardSpace_35, imgBoardSpace_36, imgBoardSpace_37, imgBoardSpace_39,
    imgBoardSpace_40, imgBoardSpace_41, imgBoardSpace_42, imgBoardSpace_43,
    imgBoardSpace_44, imgBoardSpace_45, imgBoardSpace_46, imgBoardSpace_47,
    imgBoardSpace_48, imgBoardSpace_49, imgBoardSpace_50, imgBoardSpace_51,
    imgBoardSpace_52, imgBoardSpace_53);

  ListOfRedYardSpaces := TImageArray.Create(imgBoardSpace_RedTopLeft,
    imgBoardSpace_RedTopRight, imgBoardSpace_RedBottomLeft,
    imgBoardSpace_RedBottomRight);
  ListOfRedHomeSpaces := TImageArray.Create(imgBoardSpace_RedHome1,
    imgBoardSpace_RedHome2, imgBoardSpace_RedHome3, imgBoardSpace_RedHome4,
    imgBoardSpace_RedHome5);

  ListOfYellowYardSpaces := TImageArray.Create(imgBoardSpace_YellowTopLeft,
    imgBoardSpace_YellowTopRight, imgBoardSpace_YellowBottomLeft,
    imgBoardSpace_YellowBottomRight);
  ListOfYellowHomeSpaces := TImageArray.Create(imgBoardSpace_YellowHome1,
    imgBoardSpace_YellowHome2, imgBoardSpace_YellowHome3,
    imgBoardSpace_YellowHome4, imgBoardSpace_YellowHome5);

  ListOfBlueYardSpaces := TImageArray.Create(imgBoardSpace_BlueTopLeft,
    imgBoardSpace_BlueTopRight, imgBoardSpace_BlueBottomLeft,
    imgBoardSpace_BlueBottomRight);
  ListOfBlueHomeSpaces := TImageArray.Create(imgBoardSpace_BlueHome1,
    imgBoardSpace_BlueHome2, imgBoardSpace_BlueHome3, imgBoardSpace_BlueHome4,
    imgBoardSpace_BlueHome5);

  ListOfGreenYardSpaces := TImageArray.Create(imgBoardSpace_GreenTopLeft,
    imgBoardSpace_GreenTopRight, imgBoardSpace_GreenBottomLeft,
    imgBoardSpace_GreenBottomRight);
  ListOfGreenHomeSpaces := TImageArray.Create(imgBoardSpace_GreenHome1,
    imgBoardSpace_GreenHome2, imgBoardSpace_GreenHome3,
    imgBoardSpace_GreenHome4, imgBoardSpace_GreenHome5);

  EnableBoardSpaces(False);
  EnableRedSpaces(False);
  EnableBlueSpaces(False);
  EnableYellowSpaces(False);
  EnableGreenSpaces(False);

  for i := 0 to high(ListOfActivePlayers) do
  begin
    if ListOfActivePlayers[i].playerType <> 'Computer' then
    begin
      CurrentPlayerIndex := i;
      break;
    end;
  end;
  ListOfActivePlayers[CurrentPlayerIndex].StartDiceRoll();
end;

procedure TFormBoard.ActiveDiceButtonClick(Sender: TObject);
begin
  ShuffleDice;
  lastRoll := ResultOfDiceRoll();
  lblDiceResult.Caption := IntToStr(lastRoll);
  ListOfActivePlayers[CurrentPlayerIndex].FinishDiceRoll();
end;

procedure TFormBoard.AssignSelectedToken(Sender: TObject);
// Refered to from the on click event
var
  i, j: byte;
  MoveToken: boolean;
begin
  MoveToken := True;
  CurrentSelectedImageSpace := Sender as TImage;
  for i := 0 to 3 do
  begin
    if ListOfActivePlayers[CurrentPlayerIndex].ListOfTokens[i].Position =
      CurrentSelectedImageSpace then
    begin
      CurrentSelectedToken := ListOfActivePlayers[CurrentPlayerIndex]
        .ListOfTokens[i];
      CurrentSelectedImageSpace := CurrentSelectedToken.Position;

      for j := 0 to 3 do
      begin
        if (CurrentSelectedImageSpace = ListOfActivePlayers[CurrentPlayerIndex]
            .ListOfYardSpaces[i]) and (lastRoll <> 6) then
        begin
          MoveToken := False;
        end;
      end;

      if MoveToken = True then
      begin
        ChooseHowToMoveToken;
      end;
    end;
  end;

end;

procedure TFormBoard.ChooseHowToMoveToken();
var
  i: integer;
  canMove: boolean;

begin
  DidSomethingWithToken := False;

  if (lastRoll = 6) and (CurrentSelectedToken.isInYard = True) then
  // Move a token from the yard to the board
  begin
    if ((ListOfActivePlayers[CurrentPlayerIndex].playerType = 'Computer') and
        (ListOfActivePlayers[CurrentPlayerIndex].StartSpace.Picture.Graphic =
          Nil)) or (ListOfActivePlayers[CurrentPlayerIndex]
        .playerType <> 'Computer') then
    begin
      CurrentSelectedToken.MoveOutOfYard;
    end;
  end

  else if CurrentSelectedToken.isInBoard = True then
  begin
    for i := 0 to high(ListOfBoardSpaces) do
    begin
      if ListOfBoardSpaces[i] = CurrentSelectedImageSpace then
      begin
        indexOfImageSpace := i;
        break;
      end;
    end;

    if ((ListOfActivePlayers[CurrentPlayerIndex].playerNumber in [1, 2, 3]) and
        ((indexOfImageSpace <= ListOfActivePlayers[CurrentPlayerIndex]
            .IndexOfEnterHomeSpace) and ((indexOfImageSpace + lastRoll)
            > ListOfActivePlayers[CurrentPlayerIndex].IndexOfEnterHomeSpace)))
      or ((ListOfActivePlayers[CurrentPlayerIndex].playerNumber = 4) and
        (((indexOfImageSpace <= 52) and ((indexOfImageSpace + lastRoll) > 52))
          or ((indexOfImageSpace <= 1) and ((indexOfImageSpace + lastRoll) > 1))
        )) then // Just trust me, it works
    begin
      if CurrentSelectedToken.timesPassedHome >= 1 then
      begin
        // Move a token on to home
        CurrentSelectedToken.MoveOnToHome;
      end
      else
      begin
        CurrentSelectedToken.timesPassedHome :=
          CurrentSelectedToken.timesPassedHome + 1;
        CurrentSelectedToken.MoveForward;
        // Move a token on the board
      end;
    end
    else
    begin
      CurrentSelectedToken.MoveForward;
      // Move a token on the board
    end;
  end
  else if (CurrentSelectedToken.isInHome = True) and
    (CurrentSelectedToken.isFinished = False) then
  begin
    CurrentSelectedToken.MoveForwardOnHome;
  end;

  if ListOfActivePlayers[CurrentPlayerIndex].playerType <> 'Computer' then
    ListOfActivePlayers[CurrentPlayerIndex].StartNextTurn;

end;


// The following procedures are very similar and show or hide hints ('Click to move token')
// when the user's mouse pointer hovers over a token of a active player
procedure TFormBoard.ShowTokenMoveHint(Sender: TObject);
var
  imageBox: TImage;
  i, j, k: integer;

begin
  if ListOfActivePlayers[CurrentPlayerIndex].playerType = 'Person' then
  begin
    imageBox := Sender as TImage;

    if imageBox.Picture.Graphic <> Nil then
    begin
      for i := 0 to high(ListOfBoardSpaces) do
      begin
        if (ListOfBoardSpaces[i] = imageBox) then
        begin
          for j := 0 to high(ListOfActivePlayers) do
          begin
            for k := 0 to 3 do
            begin
              if (imageBox = ListOfActivePlayers[j].ListOfTokens[k].Position)
                and (ListOfActivePlayers[j] = ListOfActivePlayers
                  [CurrentPlayerIndex]) then
              begin
                ShowHint := True;
                Hint := 'Click to move';
                exit;
              end;
            end;
          end;
        end;
      end;
    end;

    for i := 0 to high(ListOfActivePlayers) do
    begin
      for j := 0 to 3 do
      begin
        if imageBox = ListOfActivePlayers[i].ListOfYardSpaces[j] then
        begin
          for k := 0 to 3 do
          begin
            if imageBox = ListOfActivePlayers[i].ListOfTokens[k].Position then
            begin
              ShowHint := True;
              Hint := 'Click to move';
              exit;
            end;
          end;
        end;
      end;
    end;

    for i := 0 to high(ListOfActivePlayers) do
    begin
      for j := 0 to 4 do
      begin
        if imageBox = ListOfActivePlayers[i].ListOfHomeSpaces[j] then
        begin
          for k := 0 to 3 do
          begin
            if imageBox = ListOfActivePlayers[i].ListOfTokens[k].Position then
            begin
              ShowHint := True;
              Hint := 'Click to move';
              exit;
            end;
          end;
        end;
      end;
    end;
  end;

end;

procedure TFormBoard.HideTokenMoveHint(Sender: TObject);
var
  imageBox: TImage;
  i, j, k: integer;

begin
  if ListOfActivePlayers[CurrentPlayerIndex].playerType = 'Person' then
  begin
    imageBox := Sender as TImage;

    if imageBox.Picture.Graphic <> Nil then
    begin
      for i := 0 to high(ListOfBoardSpaces) do
      begin
        if (ListOfBoardSpaces[i] = imageBox) then
        begin
          for j := 0 to high(ListOfActivePlayers) do
          begin
            for k := 0 to 3 do
            begin
              if imageBox = ListOfActivePlayers[j].ListOfTokens[k].Position then
              begin
                ShowHint := False;
                exit;
              end;
            end;
          end;
        end;
      end;
    end;

    for i := 0 to high(ListOfActivePlayers) do
    begin
      for j := 0 to 3 do
      begin
        if imageBox = ListOfActivePlayers[i].ListOfYardSpaces[j] then
        begin
          for k := 0 to 3 do
          begin
            if imageBox = ListOfActivePlayers[i].ListOfTokens[k].Position then
            begin
              ShowHint := False;
              exit;
            end;
          end;
        end;
      end;
    end;

    for i := 0 to high(ListOfActivePlayers) do
    begin
      for j := 0 to 4 do
      begin
        if imageBox = ListOfActivePlayers[i].ListOfHomeSpaces[j] then
        begin
          for k := 0 to 3 do
          begin
            if imageBox = ListOfActivePlayers[i].ListOfTokens[k].Position then
            begin
              ShowHint := False;
              exit;
            end;
          end;
        end;
      end;
    end;
  end;

end;

end.
