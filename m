Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC36D18A035
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 17:11:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jFR81HGSzDr1r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 03:11:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=vbabka@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jFPZ3fRYzDqws
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 03:10:26 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 01DCCAD43;
 Wed, 18 Mar 2020 16:10:21 +0000 (UTC)
Subject: Re: [RFC 1/2] mm, slub: prevent kmalloc_node crashes and memory leaks
To: bharata@linux.ibm.com
References: <20200318144220.18083-1-vbabka@suse.cz>
 <20200318160610.GD26049@in.ibm.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <148f1b95-86e7-b98a-1446-46ecb42f5610@suse.cz>
Date: Wed, 18 Mar 2020 17:10:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200318160610.GD26049@in.ibm.com>
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
 Nathan Lynch <nathanl@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Michal Hocko <mhocko@kernel.org>, Pekka Enberg <penberg@kernel.org>,
 linux-mm@kvack.org, Kirill Tkhai <ktkhai@virtuozzo.com>,
 David Rientjes <rientjes@google.com>, Christopher Lameter <cl@linux.com>,
 Mel Gorman <mgorman@techsingularity.net>, Joonsoo Kim <iamjoonsoo.kim@lge.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/18/20 5:06 PM, Bharata B Rao wrote:
> On Wed, Mar 18, 2020 at 03:42:19PM +0100, Vlastimil Babka wrote:
>> This is a PowerPC platform with following NUMA topology:
>> 
>> available: 2 nodes (0-1)
>> node 0 cpus:
>> node 0 size: 0 MB
>> node 0 free: 0 MB
>> node 1 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
>> node 1 size: 35247 MB
>> node 1 free: 30907 MB
>> node distances:
>> node   0   1
>>   0:  10  40
>>   1:  40  10
>> 
>> possible numa nodes: 0-31
>> 
>> A related issue was reported by Bharata [3] where a similar PowerPC
>> configuration, but without patch [2] ends up allocating large amounts of pages
>> by kmalloc-1k kmalloc-512. This seems to have the same underlying issue with
>> node_to_mem_node() not behaving as expected, and might probably also lead
>> to an infinite loop with CONFIG_SLUB_CPU_PARTIAL.
> 
> This patch doesn't fix the issue of kmalloc caches consuming more
> memory for the above mentioned topology. Also CONFIG_SLUB_CPU_PARTIAL is set
> here and I have not observed infinite loop till now.

OK that means something is wrong with my analysis.

> Or, are you expecting your fix to work on top of Srikar's other patchset
> https://lore.kernel.org/linuxppc-dev/20200311110237.5731-1-srikar@linux.vnet.ibm.com/t/#u ?

No, I hoped it would work on mainline.

> With the above patchset, no fix is required to address increased memory
> consumption of kmalloc caches because this patchset prevents such
> topology from occuring thereby making it impossible for the problem
> to surface (or at least impossible for the specific topology that I
> mentioned)

Right, I hope to fix it nevertheless.

>> diff --git a/mm/slub.c b/mm/slub.c
>> index 17dc00e33115..4d798cacdae1 100644
>> --- a/mm/slub.c
>> +++ b/mm/slub.c
>> @@ -1511,7 +1511,7 @@ static inline struct page *alloc_slab_page(struct kmem_cache *s,
>>  	struct page *page;
>>  	unsigned int order = oo_order(oo);
>>  
>> -	if (node == NUMA_NO_NODE)
>> +	if (node == NUMA_NO_NODE || !node_online(node))
>>  		page = alloc_pages(flags, order);
>>  	else
>>  		page = __alloc_pages_node(node, flags, order);
>> @@ -1973,8 +1973,6 @@ static void *get_partial(struct kmem_cache *s, gfp_t flags, int node,
>>  
>>  	if (node == NUMA_NO_NODE)
>>  		searchnode = numa_mem_id();
>> -	else if (!node_present_pages(node))
>> -		searchnode = node_to_mem_node(node);
> 
> We still come here with memory-less node=0 (and not NUMA_NO_NODE), fail to
> find partial slab, go back and allocate a new one thereby continuosly
> increasing the number of newly allocated slabs.
> 
>>  
>>  	object = get_partial_node(s, get_node(s, searchnode), c, flags);
>>  	if (object || node != NUMA_NO_NODE)
>> @@ -2568,12 +2566,15 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
>>  redo:
>>  
>>  	if (unlikely(!node_match(page, node))) {
>> -		int searchnode = node;
>> -
>> -		if (node != NUMA_NO_NODE && !node_present_pages(node))
>> -			searchnode = node_to_mem_node(node);
>> -
>> -		if (unlikely(!node_match(page, searchnode))) {
>> +		/*
>> +		 * node_match() false implies node != NUMA_NO_NODE
>> +		 * but if the node is not online or has no pages, just
>> +		 * ignore the constraint
>> +		 */
>> +		if ((!node_online(node) || !node_present_pages(node))) {
>> +			node = NUMA_NO_NODE;
>> +			goto redo;
> 
> Many calls for allocating slab object from memory-less node 0 in my case
> don't even hit the above check because they get short circuited by
> goto new_slab label which is present a few lines above.  Hence I don't see
> any reduction in the amount of slab memory with this fix.

Thanks a lot for the info, I will try again :)

> Regards,
> Bharata.
> 

