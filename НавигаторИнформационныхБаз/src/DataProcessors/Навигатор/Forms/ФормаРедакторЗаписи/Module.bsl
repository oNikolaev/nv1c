
#Область Форма

#Область События

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)

	#Область Предусловия
	
	Если (Не ЗначениеЗаполнено(Параметры.АдресЗаписи)) Тогда
		Отказ = Истина;
		Возврат;
	КонецЕсли;
	
	#КонецОбласти

	

КонецПроцедуры
#КонецОбласти

#КонецОбласти
