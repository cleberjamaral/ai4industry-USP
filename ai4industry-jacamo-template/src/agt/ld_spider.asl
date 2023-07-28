knownVocabulary("https://w3id.org/bot#") .

+!start :
    true
    <-
    // crawl the building's topology
    !crawl("https://ci.mines-stetienne.fr/kg/") .

+!crawl(URI) :
    true
    <-
    for (knownVocab(Vocab)) {
        .print("Retrieving OWL definitions of ", Vocab) ;
        get(Vocab) ;
        // synchronous call (wait for action's end)
        .wait({ +visited(_) }) ;
    }
    +crawling ;
    get(URI) ;
  .

+rdf(S, "http://www.w3.org/ns/ssn/hasSubSystem", O)[rdf_type_map(_, _, uri), crawler_source(Anchor)] :
    crawling
    <-
    getParentURI(O, Target) ;
    +barrier_resource(Anchor, Target)
  .

+visited(URI) :
    crawling
    <-
    .print("Retrieved representation of ", URI) ;
    !expandCrawl(URI) ;
  .

+!expandCrawl(Anchor) :
    crawling
    <-
    for (barrier_resource(Anchor, URI)) {
        getParentURI(URI, URIp) ;
        if (not visited(URIp) | to_visit(URIp)) { get(URIp) }
    }
    !!checkEndCrawl ;
  .

+!checkEndCrawl :
    crawling
    <-
    if (crawler_status(false) & not .intend(expandCrawl(_))) { !endCrawl }
  .

+!endCrawl :
    crawling
    <-
    -crawling ;
    .print("End crawling...") ;
    //!printThingsFound;
  .

+!printThingsFound
    <-
    for(rdf(RealThing, "https://ci.mines-stetienne.fr/kg/ontology#hasThingDescription", TdName)){
        .print("Found Thing: ", TdName);
        for(rdf(RealThing, "https://www.w3.org/2019/wot/td#hasActionAffordance", BlankNode)){
          for(rdf(BlankNode, "https://www.w3.org/2019/wot/td#name", Affordance)){
            .print("Action Affordance: ", Affordance);
          }
        }
        for(rdf(RealThing, "https://www.w3.org/2019/wot/td#hasPropertyAffordance", BlankNode)){
          for(rdf(BlankNode, "https://www.w3.org/2019/wot/td#name", Affordance)){
            .print("Property Affordance: ", Affordance);
          }
        }
    }
    .

+!countTriples :
    true
    <-
    // all crawled triples are exposed to the agent as rdf/3 terms
    .count(rdf(S, P, O), Count) ;
    .print("found ", Count, " triples in the KG.") .




/*
Exercises:

1. Execute the agent program above. Then, while the program is still running, open the Jason server at http://127.0.1.1:3272/ and select ld_spider. What do you see? How are RDF triples represented in Jason?
Read the documentation of the LD crawler to fully understand the mapping between RDF triples and Jason logical formulas:
https://hypermedea.github.io/javadoc/latest/org/hypermedea/LinkedDataArtifact.html

2. Extend the program so that ld_spider explores all subsystems of the IT'm Factory.
2.1 To do that, after visiting the entry point, write a plan that looks for all triples of the form rdf(_, "http://www.w3.org/ns/ssn/hasSubSystem", Target) and calls get(Target). Use a for loop.
2.2 In your plan, print the target URI being dereferenced. Is it the URI of the resource being actually visited? On the Semantic Web, it is important to distinguish between information resources (an HTML page, a Turtle document, an image, etc.) and non-information or "semantic" resources (a person, an event, a factory workshop, etc.). It is common to identify semantic URIs with hash URIs, i.e. URIs with a fragment. In the resources your program has visited, you should find one identifying the VL10 workshop. What is the URI of this resource? What is the URI of the information resource describing VL10?

3. Synchronous browsing of LD resources is useful for educational purposes but, in practice, one would quickly run into scalability issues. That's why get() is designed to be asynchronous. In the following program, the agent browses another KG (describing Mines Saint-Étienne offices) asynchronously:
https://github.com/Hypermedea/hypermedea/blob/master/examples/fayol/src/agt/controller.asl
Adapt this program to the IT'm Factory KG. How many triples does this KG include?

4. In the KG, the VL10 workshop is declared to be of type td:Thing. In fact, the KG includes the TD documents you saw in the previous exercises, this time in RDF. The Thing therefore exposes affordances to read/write its properties, invoke actions and/or subscribe to events. Instead of counting RDF triples at the end of the crawl, modify ld_spider's program to list all Things it found, along with the affordances they expose.
Once you've done that, look at the file inc/common.asl (in ai4industry_jacamo_template/src/agt/). You will find a goal called !getDescription at the end of the file. What does the associated plan do?

In the file inc/common.asl, you will also see Prolog rules. Jason agents can indeed include rules as beliefs (resolved by the Jason interpreter at runtime). If your agent includes inc/common.asl (see statements e.g. at the bottom of this file), all rules defined in the file will be included as beliefs in the agent's state.

Now that your agent has dynamically discovered WoT affordances, it can select the ones relevant to reach its goals and act on the factory workshops in an adaptive fashion.
*/

{ include("inc/owl-signature.asl") }
{ include("inc/common.asl") }

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
