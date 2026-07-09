---
title: "Инженерный центр управления"
cssclasses: [dashboard]
---

# 🧠 Инженерный центр управления (MSK-KNOWLEDGE)

**Дата:** `= date(now).toFormat("yyyy-MM-dd")`  
**Всего карточек:** `$= dv.pages('"01_Knowledge"').length`

---

## 📊 Статистика по типам

```dataview
TABLE type, count(rows) as "Количество"
FROM "01_Knowledge"
GROUP BY type
SORT type
```

---

## 📌 Активные карточки (KML ≥ 3, KQC ≥ 3)

```dataview
TABLE title, domain, lifecycle_stage, kml, kqc
FROM "01_Knowledge"
WHERE kml >= 3 AND kqc >= 3 AND lifecycle_stage != "ARCHIVED"
SORT kml DESC
```

---

## 🚨 Требуют внимания

### Карточки с просроченной review_date

```dataview
TABLE title, review_date, lifecycle_stage
FROM "01_Knowledge"
WHERE review_date <= date(today) AND lifecycle_stage != "ARCHIVED"
SORT review_date ASC
```

### Карточки без связей (изолированные)

```dataview
LIST title
FROM "01_Knowledge"
WHERE length(relations) < 1 AND lifecycle_stage != "ARCHIVED"
```

### Карточки без источника

```dataview
LIST title
FROM "01_Knowledge"
WHERE source = "" AND lifecycle_stage != "ARCHIVED" AND kml > 0
```

---

## 🎯 Самые связные карточки (топ-5)

```dataview
TABLE title, length(relations) as "Связей"
FROM "01_Knowledge"
WHERE lifecycle_stage != "ARCHIVED"
SORT length(relations) DESC
LIMIT 5
```

---

## 🆕 Недавно созданные (за 7 дней)

```dataview
TABLE created, type, domain
FROM "01_Knowledge"
WHERE created >= date(today) - dur(7 days)
SORT created DESC
```

---

## 📈 Knowledge Debt (долг знаний)

```dataview
TABLE 
  count(rows) as "Всего",
  count(rows where kml < 2) as "KML<2",
  count(rows where kqc < 2) as "KQC<2",
  count(rows where review_date <= date(today)) as "Просрочено"
FROM "01_Knowledge"
WHERE lifecycle_stage != "ARCHIVED"
```

---

## ⚙️ Быстрые действия

- ➕ [Создать Entity](command:quickadd:choice:Создать%20Entity)
- ➕ [Создать ADR](command:quickadd:choice:Создать%20ADR)
- ➕ [Создать Concept](command:quickadd:choice:Создать%20Concept)
- ➕ [Создать Requirement](command:quickadd:choice:Создать%20Requirement)
- ➕ [Создать Domain](command:quickadd:choice:Создать%20Domain)

---

## 📋 Последние изменения

```dataview
TABLE updated, title
FROM "01_Knowledge"
SORT updated DESC
LIMIT 10
```