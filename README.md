gbox -- Graphite in a Box
================================================================================

I found myself wishing there was a VM that just started up [graphite]. I
couldn't find one, so I made one. Plz to enjoy.

[graphite]: http://graphite.wikidot.com/

Usage
--------------------------------------------------------------------------------

0. `vagrant up`
1. send stats to carbon at localhost:2003
2. `open http://localhost:47274`

gbox also sets up host-only networking on 10.47.27.47 (10.gr.ap.hs) so you can
send stats from other VMs or whatever.

Acknowledgements
--------------------------------------------------------------------------------

I stole a lot of inspiration from the [Heavy Water graphite cookbook][hwgc]. If
you want to set up Graphite in production, you should seriously consider using
that cookbook.

[hwgc]: https://github.com/hw-cookbooks/graphite

License
--------------------------------------------------------------------------------

(The MIT License)

Copyright (c) 2012 Ben Bleything <ben@bleything.net>

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  The
