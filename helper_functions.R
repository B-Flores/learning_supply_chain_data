no_choice <- order_list %>%
  inner_join(products_per_plant) %>%
  inner_join(plant_ports) %>%
  group_by(order_id) %>%
  summarise(count = n()) %>%
  filter(count == 1) %>%
  select(order_id) %>%
  as_vector()

choice <- order_list %>%
  inner_join(products_per_plant) %>%
  inner_join(plant_ports) %>%
  group_by(order_id) %>%
  summarise(count = n()) %>%
  filter(count > 1) %>%
  select(order_id) %>%
  as_vector()

df_nc <- order_list %>%
  filter(order_id %in% no_choice) %>%
  inner_join(products_per_plant) %>%
  inner_join(plant_ports) %>%
  inner_join(freight_rates, by = "port_id") %>%
  mutate(cost = )
  
  
  