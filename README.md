# ⛔ blockr.bi is deprecated — moved to blockr.viz

[![➡️ moved to blockr.viz](https://img.shields.io/badge/➡️_moved_to-blockr.viz-2ea44f?style=for-the-badge)](https://github.com/BristolMyersSquibb/blockr.viz)
[![status: archived / read-only](https://img.shields.io/badge/status-archived_·_read--only-red?style=for-the-badge)](https://github.com/BristolMyersSquibb/blockr.viz)

> [!IMPORTANT]
> **This repository is archived and read-only.** `blockr.bi` has been renamed,
> refactored, and moved to **[BristolMyersSquibb/blockr.viz](https://github.com/BristolMyersSquibb/blockr.viz)**.
> Please switch to it:
>
> ```r
> pak::pak("BristolMyersSquibb/blockr.viz")
> ```
>
> The frozen `cynkra/blockr.bi` still installs (pre-rewrite API) so existing
> pinned workflows keep working — but it receives no further updates. New
> features, fixes, and the consolidated chart / table / tile blocks live only in
> `blockr.viz`.

---

# blockr.bi

Business Intelligence Blocks for [blockr](https://github.com/cynkra/blockr).

> **Deprecated** — use [`blockr.viz`](https://github.com/BristolMyersSquibb/blockr.viz) instead.

## Installation

```r
# install.packages("pak")

# ⛔ deprecated — frozen, no longer maintained:
pak::pak("cynkra/blockr.bi")

# ✅ use this instead:
pak::pak("BristolMyersSquibb/blockr.viz")
```

## Blocks

### KPI Block

Display key performance indicators as prominent numbers with colored labels.

```r
new_kpi_block(
  measures = c("Revenue", "Profit", "Transactions"),
  titles = c(Revenue = "Total Revenue", Profit = "Net Profit"),
  subtitles = c(Revenue = "Year to date")
)
```

### Pivot Table Block

Create pivot tables with rows, columns, and measures.
```r
new_pivot_table_block(
  rows = c("Region", "Country"),
  cols = "Category",
  measures = c("Revenue", "Profit")
)
```

## Demo

```r
library(blockr)
library(blockr.dag)
library(blockr.io)
library(blockr.bi)

run_app(
 blocks = c(
    data = new_read_block(
      path = system.file("extdata", "bi_demo_data.csv", package = "blockr.bi")
    ),
    kpis = new_kpi_block(
      measures = c("Revenue", "Profit", "Transactions"),
      subtitles = c(
        Revenue = "Total revenue this year",
        Profit = "Net profit margin",
        Transactions = "Completed transactions"
      )
    ),
    pivot = new_pivot_table_block(
      rows = c("Region", "Country"),
      cols = "Category",
      measures = c("Revenue", "Profit")
    )
  ),
  links = c(
    new_link("data", "kpis", "data"),
    new_link("data", "pivot", "data")
  ),
  extensions = list(new_dag_extension())
)
```
