---
title: "Инженерный центр управления"
cssclasses: [dashboard]
---

# 🧠 Инженерный центр управления (MSK-KNOWLEDGE)

**Дата:** {{date:YYYY-MM-DD}}  
**Всего карточек:** `= length(rows from "01_Knowledge")`

---

## 📊 Статистика по типам

```dataview
TABLE count(rows) as "Количество"
FROM "01_Knowledge"
GROUP BY type
SORT type
