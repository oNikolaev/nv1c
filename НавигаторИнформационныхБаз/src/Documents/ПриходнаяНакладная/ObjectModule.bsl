
Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	
	Движения.ТоварыНаСкладах.Записывать = Истина;
	Движения.ЦеныЗакупки.Записывать = Истина;
	Движения.ХозрасчетныйОбычныйКорр3Субконто.Записывать = Истина;
	
	Для Каждого	стр_Товары Из Товары Цикл
		
		зп_ТоварыНаСкладах = Движения.ТоварыНаСкладах.Добавить();
		ЗаполнитьЗначенияСвойств(зп_ТоварыНаСкладах, стр_Товары);
		зп_ТоварыНаСкладах.Товар = стр_Товары.Номенклатура; 
		зп_ТоварыНаСкладах.Склад = Склад;
		зп_ТоварыНаСкладах.Период = Дата;
		
		зп_ЦеныЗакупки = Движения.ЦеныЗакупки.Добавить();
		ЗаполнитьЗначенияСвойств(зп_ЦеныЗакупки, стр_Товары);
		зп_ЦеныЗакупки.Товар = стр_Товары.Номенклатура;
		зп_ЦеныЗакупки.Контрагент = Контрагент;
		зп_ЦеныЗакупки.Период = Дата;
		
		Проводка = Движения.ХозрасчетныйОбычныйКорр3Субконто.Добавить();
		Проводка.Период = Дата;
		Проводка.Организация = Организация;
		Проводка.Комментарий = "Комментарий - " + стр_Товары.Номенклатура;
		
		Проводка.СчетДт = ПланыСчетов.Хозрасчетный.Товары;
		Проводка.СубконтоДт.Вставить(ПланыВидовХарактеристик.ВидыСубконтоХозрасчетный.Товары, стр_Товары.Номенклатура);
		Проводка.СубконтоДт.Вставить(ПланыВидовХарактеристик.ВидыСубконтоХозрасчетный.Склады, Склад);
		
		Проводка.СчетКт = ПланыСчетов.Хозрасчетный.РасчетыСПоставщиками;
		Проводка.СубконтоКт.Вставить(ПланыВидовХарактеристик.ВидыСубконтоХозрасчетный.Поставщики, Контрагент);
		
		Проводка.Сумма = стр_Товары.Сумма;
		
	КонецЦикла
	
КонецПроцедуры
