#Область Программный_интерфейс

Процедура ОбработатьИзменениеРасписания(ПараметрыРегламентногоЗадания, Форма) Экспорт
	
	Если ПараметрыРегламентногоЗадания.Расписание = Неопределено Тогда
		ПараметрыРегламентногоЗадания.Расписание = Новый РасписаниеРегламентногоЗадания();
	КонецЕсли;
	
	ДополнительныеПараметрыОповещения = Новый Структура();
	ДополнительныеПараметрыОповещения.Вставить("ПараметрыРегламентногоЗадания",ПараметрыРегламентногоЗадания);
	ДополнительныеПараметрыОповещения.Вставить("Форма",Форма);
	ОписаниеОповещения = Новый ОписаниеОповещения("ОбработатьИзменениеРасписанияЗавершение",
		пэмМетрикиКлиент, ДополнительныеПараметрыОповещения);
	
	Диалог = Новый ДиалогРасписанияРегламентногоЗадания(ПараметрыРегламентногоЗадания.Расписание);
	Диалог.Показать(ОписаниеОповещения);
	
КонецПроцедуры

Функция ПолучитьПредставлениеРасписания(ОписаниеРегламентногоЗадания) Экспорт
	
	Если ОписаниеРегламентногоЗадания = Неопределено Тогда
		Возврат НСтр("ru = '<Расписание не задано>'");
	КонецЕсли;
	
	Если ОписаниеРегламентногоЗадания.Использование Тогда
		ПрефиксАктивности = НСтр("ru = ''");
	Иначе
		ПрефиксАктивности = НСтр("ru = '(НЕ АКТИВНО) '");
	КонецЕсли;
	
	Если ОписаниеРегламентногоЗадания.Предопределенное Тогда
		ПрефиксТипРасписания = НСтр("ru = 'Общее расписание: '");
	Иначе
		ПрефиксТипРасписания = НСтр("ru = 'Индивидуальное расписание: '");
	КонецЕсли;
		
	Возврат ПрефиксАктивности + ПрефиксТипРасписания + Строка(ОписаниеРегламентногоЗадания.Расписание);

КонецФункции

#КонецОбласти

#Область Служебные_процедуры_и_Функции

Процедура ОбработатьИзменениеРасписанияЗавершение(Расписание, ДополнительныеПараметры) Экспорт
	
	Если Расписание = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	ДополнительныеПараметры.ПараметрыРегламентногоЗадания.Расписание = Расписание;
	ДополнительныеПараметры.Форма.ПодключитьОбработчикОжидания("ОбновитьСостояниеФормы",0.1,Истина);
		
КонецПроцедуры

#КонецОбласти