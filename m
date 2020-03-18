Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E088189930
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 11:22:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48j5h26TgCzDqyg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 21:22:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48j5bF6fprzDqX1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 21:18:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48j5bF5tNBz8tGy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 21:18:17 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48j5bF5hZhz9sQx; Wed, 18 Mar 2020 21:18:17 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=vbabka@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48j5bF126fz9sPk
 for <linuxppc-dev@ozlabs.org>; Wed, 18 Mar 2020 21:18:16 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 43548AB98;
 Wed, 18 Mar 2020 10:18:13 +0000 (UTC)
Subject: Re: Slub: Increased mem consumption on cpu,mem-less node powerpc guest
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
References: <20200317092624.GB22538@in.ibm.com>
 <20200317115339.GA26049@in.ibm.com>
 <4088ae3c-4dfa-62ae-f56a-b46773788fc7@suse.cz>
 <20200317162536.GB27520@linux.vnet.ibm.com>
 <080b2d00-76ef-2187-ec78-c9d181ef1701@suse.cz>
 <20200318032044.GC4879@linux.vnet.ibm.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <088b5996-faae-8a56-ef9c-5b567125ae54@suse.cz>
Date: Wed, 18 Mar 2020 11:18:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200318032044.GC4879@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@ozlabs.org,
 aneesh.kumar@linux.ibm.com, bharata@linux.ibm.com,
 Pekka Enberg <penberg@kernel.org>, linux-mm@kvack.org,
 David Rientjes <rientjes@google.com>, Christoph Lameter <cl@linux.com>,
 Michal Hocko <mhocko@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/18/20 4:20 AM, Srikar Dronamraju wrote:
> * Vlastimil Babka <vbabka@suse.cz> [2020-03-17 17:45:15]:
>> 
>> Yes, that Kirill's patch was about the memcg shrinker map allocation. But the
>> patch hunk that Bharata posted as a "hack" that fixes the problem, it follows
>> that there has to be something else that calls kmalloc_node(node) where node is
>> one that doesn't have present pages.
>> 
>> He mentions alloc_fair_sched_group() which has:
>> 
>>         for_each_possible_cpu(i) {
>>                 cfs_rq = kzalloc_node(sizeof(struct cfs_rq),
>>                                       GFP_KERNEL, cpu_to_node(i));
>> ...
>>                 se = kzalloc_node(sizeof(struct sched_entity),
>>                                   GFP_KERNEL, cpu_to_node(i));
>> 
> 
> 
> Sachin's experiment.
> Upstream-next/ memcg /
> possible nodes were 0-31
> online nodes were 0-1
> kmalloc_node called for_each_node / for_each_possible_node.
> This would crash while allocating slab from !N_ONLINE nodes.

So you're saying the crash was actually for allocation on e.g. node 2, not node 0?
But I believe it was on node 0, because init_kmem_cache_nodes() will only
allocate kmem_cache_node on nodes with N_NORMAL_MEMORY (which doesn't include
0), and slab_mem_going_online_callback() was probably not called for node 0 (it
was not dynamically onlined).
Also if node 0 was fine, node_to_mem_node(2-31) (not initialized explicitly)
would have returned 0 and thus not crash as well.

> Bharata's experiment.
> Upstream
> possible nodes were 0-1
> online nodes were 0-1
> kmalloc_node called for_each_online_node/ for_each_possible_cpu
> i.e kmalloc is called for N_ONLINE nodes.
> So wouldn't crash
> 
> Even if his possible nodes were 0-256. I don't think we have kmalloc_node
> being called in !N_ONLINE nodes. Hence its not crashing.
> If we see the above code that you quote, kzalloc_node is using cpu_to_node
> which in Bharata's case will always return 1.

Are you sure that for_each_possible_cpu(), cpu_to_node() will be 1? Are all of
them properly initialized or is there a similar issue as with
node_to_mem_node(), that some were not initialized and thus cpu_to_node() will
return 0?

Because AFAICS, if kzalloc_node() was always called 1, then
node_present_pages(1) is true, and the "hack" that Bharata reports to work in
his original mail would make no functional difference.

> 
>> I assume one of these structs is 1k and other 512 bytes (rounded) and that for
>> some possible cpu's cpu_to_node(i) will be 0, which has no present pages. And as
>> Bharata pasted, node_to_mem_node(0) = 0
>> So this looks like the same scenario, but it doesn't crash? Is the node 0
>> actually online here, and/or does it have N_NORMAL_MEMORY state?
> 
> I still dont have any clue on the leak though.

Let's assume that kzalloc_node() was called with 0 for some of the possible
CPU's. I still wonder why it won't crash, but let's assume kmem_cache_node does
exist for node 0 here.
So the execution AFAICS goes like this:

slab_alloc_node(0)
  c = raw_cpu_ptr(s->cpu_slab);
  object = c->freelist;
  page = c->page;
  if (unlikely(!object || !node_match(page, node))) {
  // whatever we have in the per-cpu cache must be from node 1
  // because node 0 has no memory, so there's no node_match and thus
   __slab_alloc(node == 0)
    ___slab_alloc(node == 0)
      page = c->page;
     redo:
      if (unlikely(!node_match(page, node))) { // still no match
        int searchnode = node;

        if (node != NUMA_NO_NODE && !node_present_pages(node))
	                   //  true && true for node 0
          searchnode = node_to_mem_node(node);
          // searchnode is 0, not 1

          if (unlikely(!node_match(page, searchnode))) {
          // page still from node 1, searchnode is 0, no match
	
            stat(s, ALLOC_NODE_MISMATCH);
            deactivate_slab(s, page, c->freelist, c);
            // we removed the slab from cpu's cache
            goto new_slab;
          }

     new_slab:
      if (slub_percpu_partial(c)) {
        page = c->page = slub_percpu_partial(c);
        slub_set_percpu_partial(c, page);
        stat(s, CPU_PARTIAL_ALLOC);
        goto redo;
        // huh, so with CONFIG_SLUB_CPU_PARTIAL
        // this can become an infinite loop actually?
      }
// Bharata's slub stats don't include cpu_partial_alloc so I assume
// CONFIG_SLUB_CPU_PARTIAL is not enabled and we don't loop
      freelist = new_slab_objects(s, gfpflags, node, &c);
        freelist = new_slab_objects(s, gfpflags, node, &c);

         if (node == NUMA_NO_NODE) // false, it's 0
         else if (!node_present_pages(node)) // true for 0
            searchnode = node_to_mem_node(node); // still 0

         object = get_partial_node(s, get_node(s, searchnode),...);
         // object is NULL as node 0 has nothing
         // but we have node == 0 so we return the NULL
         if (object || node != NUMA_NO_NODE)
                return object;
         // and we don't fallback to get_any_partial which would
         // have found e.g. the slab we deactivated earlier
         return get_any_partial(s, flags, c);

       page = new_slab(s, flags, node);
       // we attempt to allocate new slab on node 0, but it will come
       // from node 1

So that explains the leak I think. We keep throwing away slabs from node 1 only
to allocate new ones on node 1. Effectively each cfs_rq object and each
sched_entity object will get a new (high-order?) page
for a possible cpu where cpu_to_node() is 0.
