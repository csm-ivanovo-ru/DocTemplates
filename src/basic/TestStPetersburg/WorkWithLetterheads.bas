rem ----------------------------------------------------------------------
rem Подготовка документа к печати на бумаге
rem ----------------------------------------------------------------------
sub prepareForPrintingOnPaper
	dim document as object
	dim textFrame as object
	dim frameId as string

	document = ThisComponent

	Common.setDocVariableValue("ПечататьНаБланке", false)

	rem перебираем все врезки (фреймы), наименование которые начинается
	rem с Бланк:, и включаем для них печать
	for each textFrame in document.TextFrames
		if InStr(textFrame.Name, "Бланк:") = 1 then
			textFrame.Print = true
		end if
	next
end sub

rem ----------------------------------------------------------------------
rem Подготовка документа к печати на бланке
rem ----------------------------------------------------------------------
sub prepareForPrintingOnLetterhead
	dim document as object
	dim textFrame as object
	dim frameId as string

	document = ThisComponent

	Common.setDocVariableValue("ПечататьНаБланке", true)

	rem перебираем все врезки (фреймы), наименование которые начинается
	rem с Бланк:, и отключаем для них печать
	for each textFrame in document.TextFrames
		if InStr(textFrame.Name, "Бланк:") = 1 then
			textFrame.Print = false
		end if
	next
end sub
