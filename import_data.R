library(tidyverse)
library(readxl)
# Data Set provided at:
# https://brunel.figshare.com/articles/dataset/Supply_Chain_Logistics_Problem_Dataset/7558679


# Order List
# Order ID : ID of order made by customer
# Product ID : ID of product ordered
order_list <- read_excel(path = "supply_chain_logistics_problem.xlsx") %>%
  janitor::clean_names() %>%
  select(order_id, product_id, destination_port, unit_quantity, weight) 

colnames(order_list) <- c("order_id","product_id","dest_port","unit_quant","weight")
order_list$order_id <- as.numeric(order_list$order_id)
order_list$product_id <- as.numeric(order_list$product_id)



# Freight Rates
# tpt_day_cnt : transportation day count, 
# i.e. estimated shipping time
freight_rates <- read_excel(path = "supply_chain_logistics_problem.xlsx", sheet = "FreightRates") %>%
  janitor::clean_names()
colnames(freight_rates) <- c("carrier", "port_id", "dest_port", "min_weight", "max_weight",
                             "svc_cd", "min_cost", "rate", "mode_dsc", "tpt_day_count", "carrier_type")



wh_costs <- read_excel(path = "supply_chain_logistics_problem.xlsx", sheet = "WhCosts") %>%
  janitor::clean_names()


# WhCapacities correspond to the number of orders. 
# For example, let's say Customer 1 requests 10 units of X, Customer 2 requests 20 units of Y. 
# The total number of orders is 2, thus total capacity in "whCapacity" is 2

# WhCapacities table is the maximum number of orders that can be processed per each plant, 
# it is not dependant on specific products.
wh_capacities <- read_excel(path = "supply_chain_logistics_problem.xlsx", sheet = "WhCapacities") %>%
  janitor::clean_names()



products_per_plant<- read_excel(path = "supply_chain_logistics_problem.xlsx", sheet = "ProductsPerPlant") %>%
  janitor::clean_names()
products_per_plant$product_id <- as.numeric(products_per_plant$product_id)


# VMI : Vendor Managed Inventory
vmi_customers <- read_excel(path = "supply_chain_logistics_problem.xlsx", sheet = "VmiCustomers") %>%
  janitor::clean_names()



plant_ports <- read_excel(path = "supply_chain_logistics_problem.xlsx", sheet = "PlantPorts") %>%
  janitor::clean_names()
colnames(plant_ports) <- c("plant_code", "port_id")
