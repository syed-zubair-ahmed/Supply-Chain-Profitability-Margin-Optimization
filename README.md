# Supply Chain Profitability & Margin Optimization

## Overview

This project focuses on analyzing a supply chain dataset to understand profitability, cost structure, and operational inefficiencies. The goal was not just to visualize data, but to identify where profit is generated, where it is lost, and what factors influence those outcomes.

The analysis was carried out using SQL for data preparation and transformation, and Power BI for building an interactive dashboard.

---

## Problem Statement

In many supply chain systems, businesses track revenue and costs but lack clear visibility into:

* Which products are actually profitable
* Where costs are exceeding expectations
* How defects and logistics impact overall performance

This project aims to answer those questions by building a structured profit and cost model and translating it into actionable insights.

---

## Tools Used

* **SQL**: Data cleaning, transformation, and metric creation
* **Power BI**: Data visualization and dashboard development

---

## Data Preparation

The raw dataset had inconsistencies in key metrics such as revenue, cost, and defect rate. To ensure accurate analysis, the following corrections were made:

* Revenue recalculated as:

  ```
  revenue = price * products_sold
  ```

* Total cost redefined as:

  ```
  total_cost = (manufacturing_cost * products_sold) + shipping_cost
  ```

* Defect rate normalized to a 0–1 range:

  ```
  defect_rate = defect_rate / max(defect_rate)
  ```


---

## Key Metrics

* **Total Revenue**
* **Total Cost**
* **Profit**
* **Profit Margin**
* **Effective Profit (after defect impact)**

---

## Dashboard Highlights

The Power BI dashboard focuses on both overview and detailed insights:

* Profit distribution across product types
* Revenue vs cost comparison
* Supplier-level profitability
* Identification of top loss-making SKUs
* Cost and logistics patterns


---

## Key Insights

* Some product categories contribute significantly more to profit than others
* A small number of SKUs are responsible for a large portion of losses
* Cost structure, especially manufacturing, has a strong impact on margins
* Defect rates reduce effective profitability even when revenue looks strong
* Supplier performance varies noticeably in both cost and quality

---

## Business Implications

Based on the analysis, the following actions can be considered:

* Re-evaluate pricing or discontinue loss-making products
* Optimize supplier selection based on cost and defect rate
* Improve quality control to reduce defect-related losses
* Review cost structure to improve margins

---

## Conclusion

This project demonstrates how structured data modeling and clear visualization can turn raw supply chain data into meaningful business insights. The focus was not only on analysis but also on identifying areas where decisions can improve profitability.

---
