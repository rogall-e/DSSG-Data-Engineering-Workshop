# Considerations when using Dashboarding tools

A lot of the Tools like Metabase, Tableau, PowerBI come with a rich set of functionality to not only visualize data, but also create on the fly aggrations, join data etc. To be able to do so they will generate and execute SQL for you under the hood. What sounds nice at first comes with a bunch of risks you should be aware of.


1. The SQL that is generated is quite hard to maintain and keeping a structure like the one you learned about in the DBT Session today is almost impossible to maintain.
2. The Dahboards itself are not versioned and it is hard to keep track of changes and who did what. So keeping the logic of the dashbaord as minimal as possible enables changing them easily later.

You will benefit a lot from this approach after a few months. And your future colleagues will thank you for it. 

!!! tip "Consider moving as much processing logic as possible into your SQL Transformations instead of introducing another layer in your vizualizing tool."

    You might want to check out recent developments like the [DBT Semantic Layer](https://www.getdbt.com/product/semantic-layer) or Dashboarding Tools that integrate with DBT like [LightDash](https://www.lightdash.com/).


