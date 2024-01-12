# Applying your new skills. A little FAQ

I hope you enjoyed the workshop and learned something new. Now it is time to apply your new skills. Assume you have a small organisation you want to help out. Here are a few things to consider when you want to help them to structure their data needs:

!!! tip "There is no silver bulled for data processing. Just try to keep things as simple as possible"

??? question "We have no access to cloud infrastructure. What can we do?"

    Running things on Cloud Infrastructure definetly makes some things easier but it is not a must have.
    We tried to cover the most relevant categories of tools that you will need to build a data stack that helps teams to get insights from their data.

    Most of the tools we covered today have a Software as a Service (SaaS) offering. 
    This means you can use them without having to worry about infrastructure. Actually this is what we would recommend you to use in most cases, as the majority of organisations do not have the resources to maintain their own infrastructure. 
    Summing up all cost you will most propably end up much cheaper or even for free compared to running things on e.g. AWS.

    So check the tools you like to use. DBT Cloud for example comes free with one seat. Other Tools might also have speical free tier offerings for non profits. If nothing is listed on their Website just hit the sales team with a message. There is a good chance that they will help you out.


??? question "We have no data warehouse. What can we do?"
    As we mentioned before, a data warehouse is not a must have. It is just a tool that helps you to structure your data and make it accessible for your teams. 
    If you are just getting started you can also use a simple database like Postgres or MySQL. 
    The only thing you have to keep in mind is that you will have to do some more work to structure your data. 
    But this is also a good thing as you will learn a lot about the data you are working with.

??? question "I like Pandas and Python, do I need to do everything in SQL now?"
    No, you don't. We just think that SQL is a great tool to structure your data. 
    You can still use Pandas and Python for analysis. 
    But we think that you will benefit from a structured data warehouse in the long run. 
    And as you saw today, you can still use Python to build your data pipeline. DBT for example also supports Python Transformations for some use cases.
    So you can still use your favorite tools.
