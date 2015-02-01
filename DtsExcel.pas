unit DtsExcel;

interface

  function xlAlignVert(p_cel1,p_cel2:string;p_align:Integer):integer;
	function xlAlignHoriz(p_cel1,p_cel2:string;p_align:Integer):integer;
	function xlPageBreak(p_cel1,p_cel2:string):Integer;
	function xlUnderlineDbl(p_cel1,p_cel2:string):Integer;
	function xlUnderline(p_cel1,p_cel2:string):Integer;
	function xlItalic(p_cel1,p_cel2:string):integer;
	function xlSetPos(p_col:string;p_lin:integer):Integer;
	function xlFormatPercent(p_cel1,p_cel2:string):Integer;
	function xlSetComment(c_cel1,c_cel2,c_coment:string):integer;
	function xlLeftHoriz(p_cel1,p_cel2:string):Integer;
	function xlRigthHoriz(p_cel1,p_cel2:string):Integer;
	function xlCenterHoriz(p_cel1,p_cel2:string):integer;
	function xlCenterVert(p_cel1,p_cel2:string):integer;
	function xlShowImage(c_path,c_name,c_cel:string;width,heigth:Real):Integer;
	function xlFontSize(c_cel1,c_cel2:string;n_value:Integer):Integer;
	function xlFontName(p_cel1,p_cel2,c_name:string):Integer;
	function xlLineHeigth(p_cel1,p_cel2:string;p_heigth:Real):Integer;
	function xlBorder(c_cel1,c_cel2:string;p_size:Integer):Integer;
	function xlFormulaAT(c_cel,c_forml:string):Integer;
	function xlFormula(c_forml:string):Integer;
	function xlSumCellsAT(c_cel,c_cell_i,c_cell_f:string):Integer;
	function xlSumCells(c_cell_i,c_cell_f:string):Integer;
	function xlColLevel(levelRow,levelCol:Integer):integer;
	function xlUnGroupRow(p_cel1,p_cel2:string):Integer;
	function xlGroupRow(p_cel1,p_cel2:string):Integer;
	function xlUnGroupCol(p_cel1,p_cel2:string):Integer;
	function xlGroupCol(p_cel1,p_cel2:string):Integer;
	function xlHideRow(p_cel1,p_cel2:string;p_valor:Boolean):Integer;
	function xlHideCol(p_cel1,p_cel2:string;p_valor:Boolean):integer;
	function xlName(p_valor:string):integer;
	function xlWidth(p_col:string; p_width:real):integer;
	function xlZoom(p_valor:integer):integer;
	function xlFreeze(p_cel:string):integer;
	function xlRelease(p_fit,p_grid,p_readOnly:boolean):integer;
	function xlFilter(p_range1,p_range2:string):integer;
	function xlFit(p_col1,p_col2:string):integer;
	function xlWrapText(p_cel1,p_cel2:string):integer;
	function xlMerge(p_cel1,p_cel2:string):integer;
	function xlSkip(p_lin:integer):integer;
	function xlReal(p_cel:string):integer;
	function xlPutNAT(p_valor:real;p_cel:string):integer;
	function xlPutN(p_valor:real):integer;
	function xlPutIAT(p_valor:integer; p_cel:string):integer;
	function xlPutI(p_valor:integer):integer;
	function xlPutDAT(p_valor:TDateTime; p_cel:string):integer;
	function xlPutD(p_valor:TDateTime):integer;
	function xlPutGAT(p_valor,p_cel:string):integer;
	function xlPutG(p_valor:string):integer;
	function xlPutCBAT(p_valor, p_cel1, p_cel2:string):integer;
	function xlPutCAT(p_valor, p_cel1, p_cel2:string):integer;
	function xlPutCB(p_valor:string):integer;
	function xlPutC(p_valor:string):integer;
	function AnteriorCol(coluna:string):string;
	function proximaCol(coluna:string):string;
	function xlGridCustom(p_cel1,p_cel2:string;esquerda,direita,cima,baixo:integer):integer;
	function xlGrid(p_cel1,p_cel2:string):integer;
  function xlGridTR(p_cel1,p_cel2:string):integer;
	function xlColorC(p_cel1,p_cel2,p_fgcolor,p_bgcolor:string):string;
	function xlColor(p_cel1,p_cel2:string;p_fgcolor,p_bgcolor:integer):string;
	function xlFont(fonte:string;tamanho:integer;p_cel1,p_cel2:string):Integer;
	function xlColumn(p_col:string):string;
	function xlBold(p_cel1, p_cel2:string):integer;
	function xlPrintArea_Paper(p_paper:integer):integer;
	function xlPrintArea_Orient(p_orient:integer):integer;
	function xlPrintArea_Zoom(p_zoom:integer):integer;
	function xlPrintArea(p_cel:string):integer;
	function xlCabec(linhaInicial, linhaFinal : integer):integer;
	function xlFree():integer;
	function xlCreate(nomeAba:string):integer;
  function xlSave(c_path:string):Integer;
  function xlFormatCurrence(p_cel1,p_cel2:string):Integer;
  function xlTracejado(p_cel1,p_cel2:string):Integer;
  function xlMoveQuebraPagina():Integer;
  function xlSetFundoCelula(p_cel1,p_cel2:string; colorIndex:Integer):Integer;

  var c_col:string;
  var n_lin:Integer;
  var c_lin:string;

implementation

uses Windows, SysUtils, Variants, Classes, ExcelXP;

  var
    {c_col:string;
    n_lin:Integer;
    c_lin:string;}

    LCID: Integer;
	  excelAppl: TExcelApplication;

    ExcelWorkbook1: TExcelWorkbook;
	  ExcelWorksheet1: TExcelWorksheet;

    CORES_EXC:array[1..36] of string = ('None',
                                        'Black',
                                        'White',
                                        'Red',
                                        'Blue',
                                        'LightYellow',
                                        'Yellow',
                                        'LightPink',
                                        'Turkey',
                                        'DarkRed',
                                        'Green',
                                        'DarkBlue',
                                        'DarkYellow',
                                        'Violet',
                                        'BlueOil',
                                        'Gray',
                                        'DarkGray',
                                        'Blue1',
                                        'DarkPlum',
                                        'Yellow1',
                                        'LightTurkey',
                                        'DarkViolet',
                                        'Guava',
                                        'Blue2',
                                        '25',
                                        'DarkBlue2',
                                        'Pink',
                                        'Yellow2',
                                        'Turkey2',
                                        'Red',
                                        '31',
                                        '32',
                                        '33',
                                        '34',
                                        '35',
                                        'GreenIntense');



	function xlCreate(nomeAba:string):integer;
  begin
    excelAppl := TExcelApplication.Create(nil);

    ExcelWorkbook1 := TExcelWorkbook.Create(nil);
    ExcelWorksheet1 := TExcelWorksheet.Create(nil);

    LCID := GetUserDefaultLCID;

		excelAppl.DisplayAlerts[LCID] := False;

    excelAppl.Visible[LCID] := False;

		excelAppl.Workbooks.Add(EmptyParam, LCID);
		ExcelWorkbook1.ConnectTo(excelAppl.Workbooks[1] as _Workbook);
		ExcelWorksheet1.ConnectTo(ExcelWorkbook1.Worksheets[1] as _Worksheet);

		ExcelWorksheet1.Activate(LCID);
		excelAppl.ScreenUpdating[LCID] := true;

		ExcelWorksheet1.Name := nomeAba;        //nome da planilha (que aparece na aba)

    c_col := 'A';
    n_lin := 1;
    c_lin := '1';

    Result := 0;
  end;

  function xlFree():integer;
  begin
    ExcelWorksheet1.Free;
	  ExcelWorkbook1.Free;
	  excelAppl.Free;

    Result := 0;
  end;

  function xlCabec(linhaInicial, linhaFinal : integer):integer;
  begin
    ExcelWorksheet1.PageSetup.PrintTitleRows    := '$' + IntToStr(linhaInicial) + ':$' + IntToStr(linhaFinal);
    ExcelWorksheet1.PageSetup.PrintTitleColumns := '';

    Result := 0;
  end;

  function xlPrintArea(p_cel:string):integer;
  begin
    ExcelWorksheet1.PageSetup.PrintArea    := p_cel;
    ExcelWorksheet1.PageSetup.LeftHeader   := '';
    ExcelWorksheet1.PageSetup.CenterHeader := '';
    ExcelWorksheet1.PageSetup.RightHeader  := '';
    ExcelWorksheet1.PageSetup.LeftFooter   := '';
    ExcelWorksheet1.PageSetup.CenterFooter := '';
    ExcelWorksheet1.PageSetup.RightFooter  := '';

    ExcelWorksheet1.PageSetup.LeftMargin   := ExcelWorksheet1.Application.InchesToPoints(0,787401575);
    ExcelWorksheet1.PageSetup.RightMargin  := ExcelWorksheet1.Application.InchesToPoints(0,787401575);
    ExcelWorksheet1.PageSetup.TopMargin    := ExcelWorksheet1.Application.InchesToPoints(0,984251969);
    ExcelWorksheet1.PageSetup.BottomMargin := ExcelWorksheet1.Application.InchesToPoints(0,984251969);
    ExcelWorksheet1.PageSetup.HeaderMargin := ExcelWorksheet1.Application.InchesToPoints(0,492125985);
    ExcelWorksheet1.PageSetup.FooterMargin := ExcelWorksheet1.Application.InchesToPoints(0,492125985);

    ExcelWorksheet1.PageSetup.PrintHeadings  := False;
    ExcelWorksheet1.PageSetup.PrintGridlines := False;

    ExcelWorksheet1.PageSetup.PrintComments    := 0;         //xlPrintNoComments
    ExcelWorksheet1.PageSetup.PrintQuality[1]  := 600;

    ExcelWorksheet1.PageSetup.CenterHorizontally := False;
    ExcelWorksheet1.PageSetup.CenterVertically   := False;

    ExcelWorksheet1.PageSetup.Orientation := 2;               //xlLandscape
    ExcelWorksheet1.PageSetup.Draft       := False;

    ExcelWorksheet1.PageSetup.PaperSize       := 1;           //xlPaperLetter
    ExcelWorksheet1.PageSetup.FirstPageNumber := -4105;      //xlAutomatic

    ExcelWorksheet1.PageSetup.Order           := 1;         //xlDownThenOver
    ExcelWorksheet1.PageSetup.BlackAndWhite   := False;
    ExcelWorksheet1.PageSetup.Zoom            := 32;
    ExcelWorksheet1.PageSetup.PrintErrors     := 0;

    Result := 0;
  end;

  function xlPrintArea_Zoom(p_zoom:integer):integer;
  begin
    ExcelWorksheet1.PageSetup.Zoom := p_zoom;

    Result := 0;
  end;

  function xlPrintArea_Orient(p_orient:integer):integer;
  begin
    ExcelWorksheet1.PageSetup.Orientation := p_orient;   //1 = xlPortrait  2 = xlLandscape
    Result := 0;
  end;

  function xlPrintArea_Paper(p_paper:integer):integer;
  begin
    ExcelWorksheet1.PageSetup.PaperSize := p_paper;   //1-xlPaperLetter 2-A4

    Result := 0;
  end;

  function xlBold(p_cel1, p_cel2:string):integer;
  begin
    if (p_cel1 = '*') then
      ExcelWorksheet1.Cells.Font.Bold := True
    else
      ExcelWorksheet1.Range[p_cel1, p_cel2].Font.Bold := True;

    Result := 0;
  end;

  function xlColumn(p_col:string):string;
  begin
    if p_col <> '' then
      c_col := p_col;

    Result := c_col;
  end;

  function xlFont(fonte:string;tamanho:integer;p_cel1,p_cel2:string):Integer;
  begin
    if p_cel1 = '*' then
      begin
        ExcelWorksheet1.Cells.Font.Name := fonte;
        ExcelWorksheet1.Cells.Font.Size := tamanho;

        ExcelWorksheet1.Cells.Font.Strikethrough := False;
        ExcelWorksheet1.Cells.Font.Superscript   := False;
        ExcelWorksheet1.Cells.Font.Subscript     := False;
        ExcelWorksheet1.Cells.Font.OutlineFont   := False;
        ExcelWorksheet1.Cells.Font.Shadow        := False;
      end
    else
      begin
        ExcelWorksheet1.Range[p_cel1, p_cel2].Font.Name := fonte;
        ExcelWorksheet1.Range[p_cel1, p_cel2].Font.Size := tamanho;

        ExcelWorksheet1.Range[p_cel1, p_cel2].Font.Strikethrough := False;
        ExcelWorksheet1.Range[p_cel1, p_cel2].Font.Superscript   := False;
        ExcelWorksheet1.Range[p_cel1, p_cel2].Font.Subscript     := False;
        ExcelWorksheet1.Range[p_cel1, p_cel2].Font.OutlineFont   := False;
        ExcelWorksheet1.Range[p_cel1, p_cel2].Font.Shadow        := False;
      end;

    Result := 0;
  end;

  function xlColor(p_cel1,p_cel2:string;p_fgcolor,p_bgcolor:integer):string;
  begin
    if p_cel1 = '*' then
      begin
        if p_bgcolor <> null then
          ExcelWorksheet1.Cells.Interior.ColorIndex := p_bgcolor;

        if p_fgcolor <> null then
          ExcelWorksheet1.Cells.Font.ColorIndex := p_fgcolor;
      end
    else
    begin
      if p_bgcolor <> null then
          ExcelWorksheet1.Range[p_cel1, p_cel2].Interior.ColorIndex := p_bgcolor;

        if p_fgcolor <> null then
          ExcelWorksheet1.Range[p_cel1, p_cel2].Font.ColorIndex := p_fgcolor;
    end;


      Result := '';
  end;

  function xlColorC(p_cel1,p_cel2,p_fgcolor,p_bgcolor:string):string;
  var n_fgcolor,n_bgcolor,nI:integer;
  begin
    for nI := 1 to 36 do
    begin
      if p_fgcolor = CORES_EXC[nI] then
        n_fgcolor := (nI);

      if p_bgcolor = CORES_EXC[nI] then
        n_bgcolor := (nI);
    end;

    Result := xlColor(p_cel1,p_cel2,n_fgcolor,n_bgcolor);
  end;

  function xlGrid(p_cel1,p_cel2:string):integer;
  begin
    if p_cel1 = '*' then
      begin
        ExcelWorksheet1.Cells.Borders[1].LineStyle := 1;
        ExcelWorksheet1.Cells.Borders[2].LineStyle := 1;
        ExcelWorksheet1.Cells.Borders[3].LineStyle := 1;
        ExcelWorksheet1.Cells.Borders[4].LineStyle := 1;
      end
    else
      begin
        ExcelWorksheet1.Range[p_cel1,p_cel2].Borders[1].LineStyle := 1;
        ExcelWorksheet1.Range[p_cel1,p_cel2].Borders[2].LineStyle := 1;
        ExcelWorksheet1.Range[p_cel1,p_cel2].Borders[3].LineStyle := 1;
        ExcelWorksheet1.Range[p_cel1,p_cel2].Borders[4].LineStyle := 1;
      end;

    Result := 0;
  end;

  function xlGridTR(p_cel1,p_cel2:string):integer;
  begin
    if p_cel1 = '*' then
      begin
        ExcelWorksheet1.Cells.Borders[1].LineStyle := 2;
        ExcelWorksheet1.Cells.Borders[2].LineStyle := 2;
        ExcelWorksheet1.Cells.Borders[3].LineStyle := 2;
        ExcelWorksheet1.Cells.Borders[4].LineStyle := 2;
      end
    else
      begin
        ExcelWorksheet1.Range[p_cel1,p_cel2].Borders[1].LineStyle := 2;
        ExcelWorksheet1.Range[p_cel1,p_cel2].Borders[2].LineStyle := 2;
        ExcelWorksheet1.Range[p_cel1,p_cel2].Borders[3].LineStyle := 2;
        ExcelWorksheet1.Range[p_cel1,p_cel2].Borders[4].LineStyle := 2;
      end;

    Result := 0;
  end;

  function xlGridCustom(p_cel1,p_cel2:string;esquerda,direita,cima,baixo:integer):integer;
  begin
    if p_cel1 = '*' then
      begin
        ExcelWorksheet1.Cells.Borders[1].LineStyle := esquerda;
        ExcelWorksheet1.Cells.Borders[2].LineStyle := direita;
        ExcelWorksheet1.Cells.Borders[3].LineStyle := cima;
        ExcelWorksheet1.Cells.Borders[4].LineStyle := baixo;
      end
    else
      begin
        ExcelWorksheet1.Range[p_cel1,p_cel2].Borders[1].LineStyle := esquerda;
        ExcelWorksheet1.Range[p_cel1,p_cel2].Borders[2].LineStyle := direita;
        ExcelWorksheet1.Range[p_cel1,p_cel2].Borders[3].LineStyle := cima;
        ExcelWorksheet1.Range[p_cel1,p_cel2].Borders[4].LineStyle := baixo;
      end;

    Result := 0;
  end;

 function proximaCol(coluna:string):string;
  var colChar:Char;
  begin
    if coluna  = 'Z' then
       coluna := 'AA'
    else
    if (Length(coluna)  = 2) AND (Copy(coluna, Length(coluna), 1) = 'Z') then
      begin
        colChar := (COPY(coluna, 1, 1))[1];
        coluna  := CHR((ORD(colChar) + 1) ) + 'A';
      end
    else
    if Length(coluna) = 1 then
      begin
        colChar := coluna[1];
        coluna  := CHR((ORD(colChar) + 1));
      end
    else
      begin
        colChar := (COPY(coluna, Length(coluna), 1))[1];
        coluna  := (COPY(coluna, 1, 1) + CHR((ORD(colChar) + 1)));
      end;

    Result := coluna;
  end;

  function AnteriorCol(coluna:string):string;
  var colChar:Char;
  begin
    if coluna = 'A' then
      coluna := 'A'
    else
    if coluna = 'AA' then
      coluna := 'Z'
    else
    if (Length(coluna) = 2) AND (Copy(coluna, Length(coluna), 1) = 'A') then
      begin
        colChar := (COPY(coluna, 1, 1))[1];
        coluna  := CHR((ORD(colChar) - 1)) + 'Z';
      end
    else
    if Length(coluna) = 1 then
      begin
        colChar := coluna[1];
        coluna  := CHR((ORD(colChar) - 1));
      end
    else
      begin
        colChar := (COPY(coluna, Length(coluna), 1))[1];
        coluna := (COPY(coluna, 1, 1) + CHR((ORD(colChar)) - 1));
      end;

    Result := coluna;
  end;

  function xlPutC(p_valor:string):integer;
  begin
    //Selection.NumberFormat = "@"
    ExcelWorksheet1.Range[c_col + IntToStr(n_lin), c_col + IntToStr(n_lin)].NumberFormat := '@';
    ExcelWorksheet1.Range[c_col + IntToStr(n_lin), c_col + IntToStr(n_lin)].Value2 := p_valor;

    c_col := proximaCol(c_col);

    Result := n_lin;
  end;

  function xlPutCB(p_valor:string):integer;
  begin
    //Selection.NumberFormat = "@"
    ExcelWorksheet1.Range[c_col + IntToStr(n_lin), c_col + IntToStr(n_lin)].NumberFormat := '@';
    ExcelWorksheet1.Range[c_col + IntToStr(n_lin), c_col + IntToStr(n_lin)].Value2 := p_valor;

    ExcelWorksheet1.Range[c_col + IntToStr(n_lin), c_col + IntToStr(n_lin)].Font.Bold := True;

    c_col := proximaCol(c_col);

    Result := n_lin;
  end;

  function xlPutCAT(p_valor, p_cel1, p_cel2:string):integer;
  begin
    //Selection.NumberFormat = "@"
    ExcelWorksheet1.Range[p_cel1, p_cel2].NumberFormat := '@';
    ExcelWorksheet1.Range[p_cel1, p_cel2].Value2       := p_valor;

    Result := n_lin;
  end;

  function xlPutCBAT(p_valor, p_cel1, p_cel2:string):integer;
  begin
    //Selection.NumberFormat = "@"
    ExcelWorksheet1.Range[p_cel1, p_cel2].NumberFormat := '@';
    ExcelWorksheet1.Range[p_cel1, p_cel2].Value2       := p_valor;

    ExcelWorksheet1.Range[p_cel1, p_cel2].Font.Bold := True;

    Result := n_lin;
  end;

  function xlPutG(p_valor:string):integer;
  begin
    ExcelWorksheet1.Range[c_col + IntToStr(n_lin), c_col + IntToStr(n_lin)].NumberFormat := 'Geral';
    ExcelWorksheet1.Range[c_col + IntToStr(n_lin), c_col + IntToStr(n_lin)].Value2 := p_valor;

    c_col := proximaCol(c_col);

    Result := n_lin;
  end;

  function xlPutGAT(p_valor,p_cel:string):integer;
  begin
    ExcelWorksheet1.Range[p_cel,p_cel].NumberFormat := 'Geral';
    ExcelWorksheet1.Range[p_cel,p_cel].Value2 := p_valor;

    Result := n_lin;
  end;

  function xlPutD(p_valor:TDateTime):integer;
  begin
    ExcelWorksheet1.Range[c_col + IntToStr(n_lin), c_col + IntToStr(n_lin)].Value2 := p_valor;

    c_col := proximaCol(c_col);

    Result := n_lin;
  end;

  function xlPutDAT(p_valor:TDateTime; p_cel:string):integer;
  begin
    ExcelWorksheet1.Range[p_cel, p_cel].Value2 := p_valor;

    Result := n_lin;
  end;

  function xlPutI(p_valor:integer):integer;
  begin
    ExcelWorksheet1.Range[c_col + IntToStr(n_lin), c_col + IntToStr(n_lin)].Value2 := p_valor;

    c_col := proximaCol(c_col);

    Result := n_lin;
  end;

  function xlPutIAT(p_valor:integer; p_cel:string):integer;
  begin
    ExcelWorksheet1.Range[p_cel,p_cel].Value2 := p_valor;

    Result := n_lin;
  end;

  function xlPutN(p_valor:real):integer;
  begin
    ExcelWorksheet1.Range[c_col + IntToStr(n_lin), c_col + IntToStr(n_lin)].Value2 := p_valor;
    ExcelWorksheet1.Range[c_col + IntToStr(n_lin), c_col + IntToStr(n_lin)].Style  := 'Comma';

    c_col := proximaCol(c_col);

    Result := n_lin;
  end;

  function xlPutNAT(p_valor:real;p_cel:string):integer;
  begin
    //Selection.NumberFormat = "@"

    ExcelWorksheet1.Range[p_cel,p_cel].Style  := 'Comma';
    ExcelWorksheet1.Range[p_cel,p_cel].Value2 := p_valor;

    Result := n_lin;
  end;

  function xlReal(p_cel:string):integer;
  begin
    if p_cel = '*' then
      ExcelWorksheet1.Cells.Style := 'Comma'
    else
      ExcelWorksheet1.Range[p_cel,p_cel].Style := 'Comma';

    Result := 0;
  end;

  function xlSkip(p_lin:integer):integer;
  begin
    n_lin := n_lin + p_lin;
    c_lin := IntToStr(n_lin);
    c_col := 'A';

    Result := n_lin;
  end;

  function xlMerge(p_cel1,p_cel2:string):integer;
  begin
    ExcelWorksheet1.Range[p_cel1,p_cel2].HorizontalAlignment := -4108;  //xlCenter
    ExcelWorksheet1.Range[p_cel1,p_cel2].VerticalAlignment   := -4107; //xlBottom
    ExcelWorksheet1.Range[p_cel1,p_cel2].WrapText            := False;
    ExcelWorksheet1.Range[p_cel1,p_cel2].Orientation         := 0;
    ExcelWorksheet1.Range[p_cel1,p_cel2].AddIndent           := False;
    ExcelWorksheet1.Range[p_cel1,p_cel2].IndentLevel         := 0;
    ExcelWorksheet1.Range[p_cel1,p_cel2].ShrinkToFit         := False;
    ExcelWorksheet1.Range[p_cel1,p_cel2].ReadingOrder        := -5002;
    ExcelWorksheet1.Range[p_cel1,p_cel2].MergeCells          := True;

    Result := n_lin;
  end;

  function xlWrapText(p_cel1,p_cel2:string):integer;
  begin
    ExcelWorksheet1.Range[p_cel1,p_cel2].WrapText := True;

    Result := n_lin;
  end;

  function xlFit(p_col1,p_col2:string):integer;
  begin
    ExcelWorksheet1.Range[p_col1,p_col2].Columns.EntireColumn.AutoFit;

    Result := 0;
  end;

  function xlFilter(p_range1,p_range2:string):integer;
  begin
    ExcelWorksheet1.Range[p_range1,p_range2].AutoFilter(null,null,null,null,null);

    Result := 0;
  end;

  function xlFreeze(p_cel:string):integer;
  begin
    ExcelWorksheet1.Range[p_cel,p_cel].Select;
    excelAppl.ActiveWindow.FreezePanes := True;

    Result := 0;
  end;

  function xlZoom(p_valor:integer):integer;
  begin
    excelAppl.ActiveWindow.Zoom := p_valor;

    Result := 0;
  end;

  function xlWidth(p_col:string; p_width:real):integer;
  begin
    ExcelWorksheet1.Range[p_col, p_col].ColumnWidth := p_width;

    Result := 0;
  end;

  function xlRelease(p_fit,p_grid,p_readOnly:boolean):integer;
  begin
    if p_fit then
      ExcelWorksheet1.Cells.EntireColumn.AutoFit;

    excelAppl.ActiveWindow.DisplayGridlines := p_grid;

    if p_readOnly then
      ExcelWorksheet1.Protect;

    ExcelWorksheet1.Range['A1','A1'].Select;

    excelAppl.Visible[LCID] := True;
    excelAppl.DisplayAlerts[LCID] := False;

    Result := 0;
  end;

  function xlName(p_valor:string):integer;
  begin
    ExcelWorksheet1.Name := p_valor;

    Result := 0;
  end;

  function xlHideCol(p_cel1,p_cel2:string;p_valor:Boolean):integer;
  begin
    ExcelWorksheet1.Range[p_cel1,p_cel2].EntireColumn.Hidden := p_valor;

    Result := 0;
  end;

  function xlHideRow(p_cel1,p_cel2:string;p_valor:Boolean):Integer;
  begin
    ExcelWorksheet1.Range[p_cel1,p_cel2].EntireRow.Hidden := p_valor;

    Result := 0;
  end;

  function xlGroupCol(p_cel1,p_cel2:string):Integer;
  begin
    ExcelWorksheet1.Range[p_cel1,p_cel2].Columns.Group(null,null,null,null);

    Result := 0;
  end;

  function xlUnGroupCol(p_cel1,p_cel2:string):Integer;
  begin
    ExcelWorksheet1.Range[p_cel1,p_cel2].Columns.Ungroup;

    Result := 0;
  end;

  function xlGroupRow(p_cel1,p_cel2:string):Integer;
  begin
    ExcelWorksheet1.Range[p_cel1,p_cel2].Rows.Group(null,null,null,null);

    Result := 0;
  end;

  function xlUnGroupRow(p_cel1,p_cel2:string):Integer;
  begin
    ExcelWorksheet1.Range[p_cel1,p_cel2].Rows.Ungroup;

    Result := 0;
  end;

  function xlColLevel(levelRow,levelCol:Integer):integer;
  begin
    ExcelWorksheet1.Outline.ShowLevels(levelRow,levelCol);

    Result := 0;
  end;

  function xlSumCells(c_cell_i,c_cell_f:string):Integer;
  begin
    ExcelWorksheet1.Range[c_col + IntToStr(n_lin), c_col + IntToStr(n_lin)].FormulaLocal := ('=SOMA(' + c_cell_i + ':' + c_cell_f + ')');

    c_col := proximaCol(c_col);

    Result := 0;
  end;

  function xlSumCellsAT(c_cel,c_cell_i,c_cell_f:string):Integer;
  begin
    ExcelWorksheet1.Range[c_cel,c_cel].FormulaLocal := ('=SOMA(' + c_cell_i + ':' + c_cell_f + ')');

    Result := 0;
  end;

  function xlFormula(c_forml:string):Integer;
  begin
    ExcelWorksheet1.Range[c_col + IntToStr(n_lin), c_col + IntToStr(n_lin)].FormulaLocal := ('=' + c_forml);

    c_col := proximaCol(c_col);

    Result := 0;
  end;

  function xlFormulaAT(c_cel,c_forml:string):Integer;
  begin
    ExcelWorksheet1.Range[c_cel,c_cel].FormulaLocal := ('=' + c_forml);

    Result := 0;
  end;

  function xlBorder(c_cel1,c_cel2:string;p_size:Integer):Integer;
  begin
    ExcelWorksheet1.Range[c_cel1,c_cel2].BorderAround(1, p_size, 1, 1);

    Result := 0;
  end;

  function xlLineHeigth(p_cel1,p_cel2:string;p_heigth:Real):Integer;
  begin
    ExcelWorksheet1.Range[p_cel1,p_cel2].RowHeight := p_heigth;

    Result := 0;
  end;

  function xlFontName(p_cel1,p_cel2,c_name:string):Integer;
  begin
    if p_cel1 = '*' then
      ExcelWorksheet1.Cells.Font.Name := c_name
    else
      ExcelWorksheet1.Range[p_cel1,p_cel2].Font.Name := c_name;

    Result := 0;
  end;

  function xlFontSize(c_cel1,c_cel2:string;n_value:Integer):Integer;
  begin
    if c_cel1 = '*' then
      ExcelWorksheet1.Cells.Font.Size := n_value
    else
      ExcelWorksheet1.Range[c_cel1,c_cel2].Font.Size := n_value;

    Result := 0;
  end;

  function xlCenterVert(p_cel1,p_cel2:string):integer;
  begin
    if p_cel1 = '*' then
      ExcelWorksheet1.Cells.VerticalAlignment := 2
    else
      ExcelWorksheet1.Range[p_cel1,p_cel2].VerticalAlignment := 2;

    Result := 0;
  end;

  function xlCenterHoriz(p_cel1,p_cel2:string):integer;
  begin
    if p_cel1 = '*' then
      ExcelWorksheet1.Cells.HorizontalAlignment := 3
    else
      ExcelWorksheet1.Range[p_cel1,p_cel2].HorizontalAlignment := 3;

    Result := 0;
  end;

  function xlRigthHoriz(p_cel1,p_cel2:string):Integer;
  begin
    if p_cel1 = '*' then
      ExcelWorksheet1.Cells.HorizontalAlignment := 4
    else
      ExcelWorksheet1.Range[p_cel1,p_cel2].HorizontalAlignment := 4;

    Result := 0;
  end;

  function xlLeftHoriz(p_cel1,p_cel2:string):Integer;
  begin
    if p_cel1 = '*' then
      ExcelWorksheet1.Cells.HorizontalAlignment := 2
    else
      ExcelWorksheet1.Range[p_cel1,p_cel2].HorizontalAlignment := 2;

    Result := 0;
  end;

  function xlSetComment(c_cel1,c_cel2,c_coment:string):integer;
  begin
    ExcelWorksheet1.Range[c_cel1,c_cel2].AddComment(c_coment);

    Result := 0;
  end;

  function xlFormatPercent(p_cel1,p_cel2:string):Integer;
  begin
    if p_cel1 = '*' then
      ExcelWorksheet1.Cells.NumberFormat := '0.00%'
    else
      ExcelWorksheet1.Range[p_cel1,p_cel2].NumberFormat := '0.00%';

    Result := 0;
  end;

  function xlSetPos(p_col:string;p_lin:integer):Integer;
  begin
    c_col := p_col;
    n_lin := p_lin;
    c_lin := IntToStr(n_lin);

    ExcelWorksheet1.Range[c_col + IntToStr(n_lin),c_col + IntToStr(n_lin)].Select;

    Result := 0;
  end;

  function xlItalic(p_cel1,p_cel2:string):integer;
  begin
    if p_cel1 = '*' then
      ExcelWorksheet1.Cells.Font.Italic := True
    else
      ExcelWorksheet1.Range[p_cel1,p_cel2].Font.Italic := True;

    Result := 0;
  end;

  function xlUnderline(p_cel1,p_cel2:string):Integer;
  begin
    if p_cel1 = '*' then
      ExcelWorksheet1.Cells.Font.Underline := True
    else
      ExcelWorksheet1.Range[p_cel1,p_cel2].Font.Underline := True;

    Result := 0;
  end;

  function xlUnderlineDbl(p_cel1,p_cel2:string):Integer;
  begin
    if p_cel1 = '*' then
      ExcelWorksheet1.Cells.Font.Underline := 3
    else
      ExcelWorksheet1.Range[p_cel1,p_cel2].Font.Underline := 3;

    Result := 0;
  end;

  function xlPageBreak(p_cel1,p_cel2:string):Integer;
  begin
    ExcelWorksheet1.Range[p_cel1,p_cel2].Select;
    ExcelWorksheet1.HPageBreaks.Add(excelAppl.Selection[LCID]);

    Result := 0;
  end;

  function xlAlignHoriz(p_cel1,p_cel2:string;p_align:Integer):integer;
  begin
    if p_cel1 = '*' then
      begin
        if p_align = 2 then
          ExcelWorksheet1.Cells.HorizontalAlignment := (0 - 4108)  //xlCenter
        else
        if p_align = 3 then
          ExcelWorksheet1.Cells.HorizontalAlignment := (0 - 4152)  //xlRigth
        else
          ExcelWorksheet1.Cells.HorizontalAlignment := ( - 4131); //xlLeft
      end
      else
        begin
        if p_align = 2 then
          ExcelWorksheet1.Range[p_cel1,p_cel2].HorizontalAlignment := (0 - 4108)  //xlCenter
        else
        if p_align = 3 then
          ExcelWorksheet1.Range[p_cel1,p_cel2].HorizontalAlignment := (0 - 4152)  //xlRigth
        else
          ExcelWorksheet1.Range[p_cel1,p_cel2].HorizontalAlignment := (0 - 4131); //xlLeft
      end;

      Result := 0;
  end;

  function xlAlignVert(p_cel1,p_cel2:string;p_align:Integer):integer;
  begin
    if p_cel1 = '*' then
      begin
        if p_align = 2 then
          ExcelWorksheet1.Cells.VerticalAlignment := (0 - 4108)  //xlCenter
        else
        if p_align = 3 then
          ExcelWorksheet1.Cells.VerticalAlignment := (0 - 4152)  //xlRigth
        else
          ExcelWorksheet1.Cells.VerticalAlignment := (0 - 4131); //xlLeft
      end
      else
        begin
        if p_align = 2 then
          ExcelWorksheet1.Range[p_cel1,p_cel2].VerticalAlignment := (0 - 4108)  //xlCenter
        else
        if p_align = 3 then
          ExcelWorksheet1.Range[p_cel1,p_cel2].VerticalAlignment := (0 - 4152)  //xlRigth
        else
          ExcelWorksheet1.Range[p_cel1,p_cel2].VerticalAlignment := (0 - 4131); //xlLeft
      end;

      Result := 0;
  end;

  function xlSave(c_path:string):Integer;
  begin
    ExcelWorksheet1.SaveAs(c_path);
  end;

  function xlShowImage(c_path,c_name,c_cel:string;width,heigth:Real):Integer;
  var left, top:Real;
  begin
    left   := ExcelWorksheet1.Range[c_cel,c_cel].Left + 5;
    top    := ExcelWorksheet1.Range[c_cel,c_cel].Top  + 5;

    ExcelWorksheet1.Shapes.AddPicture(c_path, 0, 1, left, top, width, heigth).Name := c_name;

    Result := 0;
  end;

  { Formata o valor Real para Moeda em Real R$ }
  function xlFormatCurrence(p_cel1,p_cel2:string):Integer;
  begin
    if p_cel1 = '*' then
      ExcelWorksheet1.Cells.NumberFormat := 'R$ #.##0,00'
    else
      ExcelWorksheet1.Range[p_cel1,p_cel2].NumberFormat := 'R$ #.##0,00';

    Result := 0;
  end;

  { Formata com um traçado no meio das letras }
  function xlTracejado(p_cel1,p_cel2:string):Integer;
  begin
    if p_cel1 = '*' then
      ExcelWorksheet1.Cells.Font.Strikethrough := True
    else
      ExcelWorksheet1.Range[p_cel1,p_cel2].Font.Strikethrough := True;

    Result := 0;
  end;

  {Anda com a quebra de pagina para próxima coluna da direita}
  function xlMoveQuebraPagina():Integer;
  begin
    excelAppl.Visible[1] := true;
    excelAppl.ActiveWindow.View := xlPageBreakPreview;
    ExcelWorksheet1.VPageBreaks[1].DragOff(xlRight, 1);
    excelAppl.ActiveWindow.View := xlNormalView;

    Result := 0;
  end;

  function xlSetFundoCelula(p_cel1,p_cel2:string; colorIndex:Integer):Integer;
  begin
    ExcelWorksheet1.Range[p_cel1,p_cel2].Interior.ColorIndex        := colorIndex;
    ExcelWorksheet1.Range[p_cel1,p_cel2].Interior.Pattern           := xlSolid;
    ExcelWorksheet1.Range[p_cel1,p_cel2].Interior.PatternColorIndex := xlAutomatic;

    Result := 0;
  end;
end.
