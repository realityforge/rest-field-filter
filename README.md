rest-field-filter
=================

[![Build Status](https://secure.travis-ci.org/realityforge/rest-field-filter.png?branch=master)](http://travis-ci.org/realityforge/rest-field-filter)

A simple library parsing field filters in rest APIs. This allows you to
define filters that restrict the set of data returned in the REST api.
The field filter definition is a comma separated list of fields that should
be returned by the REST api. i.e. A filter value of 'a,b' will return the
values of fields 'a' and 'b' but not 'c'.  The api also supports nested
nested properties enclosed in '[]'. A filter of 'a[p,q],b' returns the value
of field 'b' and the sub-properties 'p' and 'q' of 'a'. Filters can be nested
to any depth.

A typical use in a Jax-RS application looks like

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getData( @QueryParam("fields") @DefaultValue("") FieldFilter filter, ... )
    {
      ...
      final JsonGenerator g = ...;
      g.writeStartObject();
      if ( filter.allow( "id" ) )
      {
        g.write( "id", id );
      }
      if ( filter.allow( "attributes" ) )
      {
        g.writeStartObject( "attributes" );
        addAttributeData( g, entity, filter.subFilter( "attributes" ) );
        g.writeEnd();
      }

      g.writeEnd();
      ...
    }

