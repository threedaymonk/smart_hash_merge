Smart hash merge
================

Recursively merge two hashes, merging array values.

Examples
--------

Values from the left hash are replaced by those from the right hash, or created if they do not exist:

    a = { "overwritten" => "A" }
    b = { "overwritten" => "B", "new" => "C" }
    
    SmartHashMerge.merge(a, b)
    
    # => { "overwritten" => "B", "new" => "C" }

Arrays are merged:

    a = { "array" => [1, 2, 3] }
    b = { "array" => [4, 5, 6] }
    
    SmartHashMerge.merge(a, b)
    
    # => { "array" => [1, 2, 3, 4, 5, 6] }

Single values merged with an array are merged into an array:

    a = { "array" => 1 }
    b = { "array" => [2, 3] }
    
    SmartHashMerge.merge(a, b)
    
    # => { "array" => [1, 2, 3] }

Merging is recursive:

    a = { "foo" => { "bar" => "baz" } }
    b = { "foo" => { "bar" => ["quux"] } }
    
    SmartHashMerge.merge(a, b)
    
    # => { "foo" => { "bar" => ["baz", "quux"] } }
