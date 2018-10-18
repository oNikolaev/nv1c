
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ЭтаОбработка = ЭтаОбработка();
	
	дз_СвойстваОбъектаБазы = РеквизитФормыВЗначение("СвойстваОбъектаБазы");
	дз_СвойстваОбъектаБазы.Строки.Очистить();
	
	Если Не (Параметры.ОбъектБазы = Неопределено) Тогда
		Если ТипЗнч(Параметры.ОбъектБазы) = Тип("Структура") Тогда
			
			Если Параметры.ОбъектБазы.ТипОбъекта = "ПользовательИнформационнойБазы" Тогда
				
				ПользовательБазы = ПользователиИнформационнойБазы.НайтиПоИмени(Параметры.ОбъектБазы.ИмяПользователя);
				
				Если Не (ПользовательБазы = Неопределено) Тогда
					
					МетаданныеПользователя = ЭтаОбработка().МетаданныеПользователяИнформационнойБазы();
					
					Для каждого СвойствоПользователя Из МетаданныеПользователя Цикл
						
						стр_СвойстваОбъектаБазы = дз_СвойстваОбъектаБазы.Строки.Добавить();
						стр_СвойстваОбъектаБазы.Имя = СвойствоПользователя.Имя;
						стр_СвойстваОбъектаБазы.Синоним = СвойствоПользователя.Синоним;
						стр_СвойстваОбъектаБазы.Представление = ПользовательБазы[СвойствоПользователя.Имя];
						стр_СвойстваОбъектаБазы.Значение = ПользовательБазы[СвойствоПользователя.Имя];
						стр_СвойстваОбъектаБазы.Тип = "";
						
					КонецЦикла;
					
				КонецЕсли;
				
			КонецЕсли;
			
		КонецЕсли;
	Иначе
		
		Если (Параметры.ИмяКоллекции = "Общие") И (Параметры.ИмяЭлементаКоллекции = "Общие") Тогда
			
			Заголовок = Параметры.ИмяКоллекции;
			
			// Общие
			
			стр_УзелОбщие = дз_СвойстваОбъектаБазы.Строки.Добавить();
			стр_УзелОбщие.Имя = "Общие";
			стр_УзелОбщие.Синоним = "Общие";
			стр_УзелОбщие.Представление = "Общие";
			стр_УзелОбщие.Тип = "СистемнаяИнформация";
			
			СистемнаяИнформация = Новый СистемнаяИнформация;
			ИменаСвойств = ЭтаОбработка.ИменаСвойствОбъектаБазы("СистемнаяИнформация");
			
			Для каждого ИмяСвойства Из ИменаСвойств Цикл
				
				ЗначениеСвойства = СистемнаяИнформация[ИмяСвойства];
				
				стр_СвойстваОбъектаБазы = стр_УзелОбщие.Строки.Добавить();
				
				стр_СвойстваОбъектаБазы.Имя = ИмяСвойства;
				стр_СвойстваОбъектаБазы.Синоним = ИмяСвойства;
				стр_СвойстваОбъектаБазы.Представление = ЗначениеСвойства;
				стр_СвойстваОбъектаБазы.Значение = ЗначениеСвойства;
				стр_СвойстваОбъектаБазы.Тип = "СистемнаяИнформация";
				
			КонецЦикла;
			
			// Конфигурация
			
			стр_УзелКонфигурация = дз_СвойстваОбъектаБазы.Строки.Добавить();
			стр_УзелКонфигурация.Имя = "Конфигурация";
			стр_УзелКонфигурация.Синоним = "Конфигурация";
			стр_УзелКонфигурация.Представление = "Конфигурация";
			стр_УзелКонфигурация.Тип = "Конфигурация";
			
			ИменаСвойств = ЭтаОбработка.ИменаСвойствОбъектаБазы("Конфигурация");
			
			Для каждого ИмяСвойства Из ИменаСвойств Цикл
				
				ЗначениеСвойства = Метаданные[ИмяСвойства];
				
				стр_СвойстваОбъектаБазы = стр_УзелКонфигурация.Строки.Добавить();
				
				стр_СвойстваОбъектаБазы.Имя = ИмяСвойства;
				стр_СвойстваОбъектаБазы.Синоним = ИмяСвойства;
				стр_СвойстваОбъектаБазы.Представление = ЗначениеСвойства;
				стр_СвойстваОбъектаБазы.Значение = ЗначениеСвойства;
				стр_СвойстваОбъектаБазы.Тип = "Конфигурация";
				
			КонецЦикла;
			
		Иначе
			
			Заголовок = Параметры.ИмяКоллекции + "." + Параметры.ИмяОбъектаБазы;
			
			ОбъектБазы = Метаданные[Параметры.ИмяКоллекции][Параметры.ИмяОбъектаБазы];
			ИменаСвойств = ЭтаОбработка.ИменаСвойствОбъектаБазы(Параметры.ИмяЭлементаКоллекции, Параметры.ИмяОбъектаБазы);
			
			стр_УзелВсеСвойства = дз_СвойстваОбъектаБазы.Строки.Добавить();
			стр_УзелВсеСвойства.Имя = Параметры.ИмяОбъектаБазы;
			стр_УзелВсеСвойства.Синоним = Параметры.ИмяОбъектаБазы;
			стр_УзелВсеСвойства.Представление = Параметры.ИмяОбъектаБазы;
			стр_УзелВсеСвойства.Тип = Параметры.ИмяЭлементаКоллекции;
			
			Для каждого ИмяСвойства Из ИменаСвойств Цикл
				
				Попытка
				
					ЗначениеСвойства = ОбъектБазы[ИмяСвойства];
				
				Исключение
					Продолжить;
				КонецПопытки;
				
				стр_СвойстваОбъектаБазы = стр_УзелВсеСвойства.Строки.Добавить();
				
				стр_СвойстваОбъектаБазы.Имя = ИмяСвойства;
				стр_СвойстваОбъектаБазы.Синоним = ИмяСвойства;
				стр_СвойстваОбъектаБазы.Представление = ЗначениеСвойства;
				стр_СвойстваОбъектаБазы.Значение = ЗначениеСвойства;
				стр_СвойстваОбъектаБазы.Тип = "Конфигурация";
				
			КонецЦикла;
			
		КонецЕсли;
		
	КонецЕсли;
	
	ЗначениеВРеквизитФормы(дз_СвойстваОбъектаБазы, "СвойстваОбъектаБазы");
	
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник)
	
	Если Источник = "Навигатор" Тогда
		
		Если ИмяСобытия = "ЗакрытьВсеОкнаРедакторов" Тогда
			Закрыть();
		КонецЕсли;
		
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Функция ЭтаОбработка()
	
	Результат = РеквизитФормыВЗначение("Объект");
	Возврат Результат;
	
КонецФункции
