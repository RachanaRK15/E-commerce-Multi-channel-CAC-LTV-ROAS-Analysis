# Multi-Channel CAC, LTV & ROAS Analysis

**Evaluating Marketing Efficiency & Unit Economics Across 5 Acquisition Channels**
![Uploading dashbord.png…]()





## Business Problem
Digital marketing teams often judge campaigns on surface numbers like clicks or first-time sales. A channel can bring high revenue while quietly draining budget through steep acquisition costs. 

This project connects **marketing spend** directly to **customer lifetime revenue** across 5 channels (**Referral, Instagram Ads, YouTube, Organic Search, and Google Ads**) to answer two core business questions:
1. Which channels bring the highest return per rupee spent (**ROAS**)?
2. Are acquired customers worth more over time (**LTV**) than it costs to win them (**CAC**)?

## Executive Snapshot
* **Total Revenue:** ₹36.07L (`₹3.61M`)
* **Total Ad Spend:** ₹26.31L (`₹2.63M`)
* **Overall ROAS:** **1.38x** (`₹1.38` earned per `₹1` spent)
* **Customers Acquired:** **400** (`398` active buyers; `2` non-buyers retained in base)
* **Average CAC:** `₹6,620` (`₹6.62K`)
* **Average LTV:** `₹9,017` (`₹9.02K`)

## Channel Performance Comparison

| Channel | Customers | Share | Ad Spend | Revenue | Avg CAC | Avg LTV | ROAS | Net Value (LTV − CAC) |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **Referral** | 93 | 23.25% | ₹5,06,610 | ₹8,33,465 | **₹5,447** | ₹8,962 | **1.65** | **+₹3,515** |
| **Instagram Ads** | 81 | 20.25% | ₹5,84,867 | ₹7,53,172 | ₹7,221 | **₹9,298** | 1.29 | +₹2,077 |
| **YouTube** | 76 | 19.00% | ₹5,23,683 | ₹6,91,004 | ₹6,891 | ₹9,092 | 1.32 | +₹2,201 |
| **Organic Search** | 76 | 19.00% | ₹5,33,693 | ₹6,88,733 | ₹7,022 | ₹9,062 | 1.29 | +₹2,040 |
| **Google Ads** | 74 | 18.50% | ₹4,81,895 | ₹6,40,303 | ₹6,512 | ₹8,653 | 1.33 | +₹2,141 |

## Key Insights
* **Referral is the clear efficiency leader:** It delivers the highest revenue (`₹8.33L`), most customers (`93`), lowest CAC (`₹5,447`), and highest ROAS (`1.65`), leaving a `+₹3,515` surplus per customer.
* **High spend ≠ high efficiency:** Instagram Ads consumed the largest budget (`₹5.85L`) and attracted the highest-LTV buyers (`₹9,298`), but its steep CAC (`₹7,221`) pulled ROAS down to `1.29`.
* **CAC is the main differentiator:** Average LTV stays tight across all channels (`₹8,653–₹9,298`), meaning customers spend similarly once acquired. Controlling acquisition cost is what drives profitability.
* **Program costs in non-ad channels:** Spend under Referral (`₹5.07L`) and Organic Search (`₹5.34L`) accounts for customer referral incentives/rewards and SEO content/tooling costs—keeping unit economics realistic.

## Actionable Recommendations
1. **Reallocate 15–20% budget toward Referral:** Expand customer referral incentives to scale the highest-ROAS (`1.65`) channel.
2. **Tighten Instagram Ads targeting:** Retain Instagram for high-LTV acquisition, but refine audience segmentation and ad creatives to bring CAC under `₹6,000`.
3. **Boost repeat purchase rate:** Introduce post-purchase bundles and loyalty offers to push overall LTV above `₹12,000+`.
4. **Audit Organic Search overhead:** Review SEO agency and tool costs (`₹5.34L`) to improve return efficiency.

## Technical Approach
* **SQL:** Used CTEs (`WITH`), `LEFT JOIN`, and `COALESCE` across `customers`, `transactions`, and `marketing_spend` to prevent spend double-counting and include non-buying customers in LTV calculations.
* **Power BI:** Built a single-page executive dashboard with synchronized channel sorting (`1–5`) across all visuals for instant cross-chart comparison.

## Files in This Repository
* `dashboard/multi_channel_cac_ltv_roas.pbix` — Interactive Power BI file
* `dashboard/dashboard_overview.png` — Dashboard preview image
* `sql/cac_ltv_roas_queries.sql` — SQL scripts for CAC, LTV, and ROAS

**Author:** Rachana R Kulal | MBA (Finance & Marketing)
