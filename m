Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BD018A9D7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 01:33:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jSZ322SqzDr7J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 11:33:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jSXS35Z6zDr2j
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 11:32:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=FHDf+uNy; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48jSXQ3Wplz9sPk;
 Thu, 19 Mar 2020 11:32:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584577928;
 bh=p3yUK94n4o5XB56udaZYSN32CZNrZihzKes8EAjuyqs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FHDf+uNyKd+uHmaJKbOcCweS5THEDDnXJ7upesQDGiasynhR/m433VKbxgAiT59mS
 46z29WS4PqaOs0b/u9Zn8qG8KsRrVlYsFOaOWpwWVm4j9ex61w2MQswBxQNDxn/XKL
 KXzT4wSFYA/Z6ZIuP/QiIs3kpZmu+vZqLjFxsSjw9iriFC1Kpn26giV+kH32qr9Rc7
 kmIV4DoLMhHV9vy/y3q4bxhlKrgAf+kbjxFqzJ5kbt/EFECrC7t5uPD1cQewh0D7qh
 zSxXnRXAD9d+TMVGk61Dqz7E9xTD8GQXaDQHaNPD0T+Z45ofqTJYna1q8WA4NEXqIB
 Ts80jBORlXaHA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vlastimil Babka <vbabka@suse.cz>, Michal Hocko <mhocko@suse.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/4] mm: Check for node_online in node_present_pages
In-Reply-To: <2d7c55ed-0f67-bd47-e478-9726734abcc9@suse.cz>
References: <20200318072810.9735-1-srikar@linux.vnet.ibm.com>
 <20200318072810.9735-2-srikar@linux.vnet.ibm.com>
 <20200318100256.GH21362@dhcp22.suse.cz>
 <2d7c55ed-0f67-bd47-e478-9726734abcc9@suse.cz>
Date: Thu, 19 Mar 2020 11:32:07 +1100
Message-ID: <87tv2ldw1k.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
 Nathan Lynch <nathanl@linux.ibm.com>, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, Kirill Tkhai <ktkhai@virtuozzo.com>,
 Mel Gorman <mgorman@suse.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christopher Lameter <cl@linux.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vlastimil Babka <vbabka@suse.cz> writes:
> On 3/18/20 11:02 AM, Michal Hocko wrote:
>> On Wed 18-03-20 12:58:07, Srikar Dronamraju wrote:
>>> Calling a kmalloc_node on a possible node which is not yet onlined can
>>> lead to panic. Currently node_present_pages() doesn't verify the node is
>>> online before accessing the pgdat for the node. However pgdat struct may
>>> not be available resulting in a crash.
>>> 
>>> NIP [c0000000003d55f4] ___slab_alloc+0x1f4/0x760
>>> LR [c0000000003d5b94] __slab_alloc+0x34/0x60
>>> Call Trace:
>>> [c0000008b3783960] [c0000000003d5734] ___slab_alloc+0x334/0x760 (unreliable)
>>> [c0000008b3783a40] [c0000000003d5b94] __slab_alloc+0x34/0x60
>>> [c0000008b3783a70] [c0000000003d6fa0] __kmalloc_node+0x110/0x490
>>> [c0000008b3783af0] [c0000000003443d8] kvmalloc_node+0x58/0x110
>>> [c0000008b3783b30] [c0000000003fee38] mem_cgroup_css_online+0x108/0x270
>>> [c0000008b3783b90] [c000000000235aa8] online_css+0x48/0xd0
>>> [c0000008b3783bc0] [c00000000023eaec] cgroup_apply_control_enable+0x2ec/0x4d0
>>> [c0000008b3783ca0] [c000000000242318] cgroup_mkdir+0x228/0x5f0
>>> [c0000008b3783d10] [c00000000051e170] kernfs_iop_mkdir+0x90/0xf0
>>> [c0000008b3783d50] [c00000000043dc00] vfs_mkdir+0x110/0x230
>>> [c0000008b3783da0] [c000000000441c90] do_mkdirat+0xb0/0x1a0
>>> [c0000008b3783e20] [c00000000000b278] system_call+0x5c/0x68
>>> 
>>> Fix this by verifying the node is online before accessing the pgdat
>>> structure. Fix the same for node_spanned_pages() too.
>>> 
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: linux-mm@kvack.org
>>> Cc: Mel Gorman <mgorman@suse.de>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>
>>> Cc: Michal Hocko <mhocko@kernel.org>
>>> Cc: Christopher Lameter <cl@linux.com>
>>> Cc: linuxppc-dev@lists.ozlabs.org
>>> Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
>>> Cc: Kirill Tkhai <ktkhai@virtuozzo.com>
>>> Cc: Vlastimil Babka <vbabka@suse.cz>
>>> Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
>>> Cc: Bharata B Rao <bharata@linux.ibm.com>
>>> Cc: Nathan Lynch <nathanl@linux.ibm.com>
>>> 
>>> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
>>> Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
>>> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
>>> ---
>>>  include/linux/mmzone.h | 6 ++++--
>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>> 
>>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>>> index f3f264826423..88078a3b95e5 100644
>>> --- a/include/linux/mmzone.h
>>> +++ b/include/linux/mmzone.h
>>> @@ -756,8 +756,10 @@ typedef struct pglist_data {
>>>  	atomic_long_t		vm_stat[NR_VM_NODE_STAT_ITEMS];
>>>  } pg_data_t;
>>>  
>>> -#define node_present_pages(nid)	(NODE_DATA(nid)->node_present_pages)
>>> -#define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
>>> +#define node_present_pages(nid)		\
>>> +	(node_online(nid) ? NODE_DATA(nid)->node_present_pages : 0)
>>> +#define node_spanned_pages(nid)		\
>>> +	(node_online(nid) ? NODE_DATA(nid)->node_spanned_pages : 0)
>> 
>> I believe this is a wrong approach. We really do not want to special
>> case all the places which require NODE_DATA. Can we please go and
>> allocate pgdat for all possible nodes?
>> 
>> The current state of memory less hacks subtle bugs poping up here and
>> there just prove that we should have done that from the very begining
>> IMHO.
>
> Yes. So here's an alternative proposal for fixing the current situation in SLUB,
> before the long-term solution of having all possible nodes provide valid pgdat
> with zonelists:
>
> - fix SLUB with the hunk at the end of this mail - the point is to use NUMA_NO_NODE
>   as fallback instead of node_to_mem_node()
> - this removes all uses of node_to_mem_node (luckily it's just SLUB),
>   kill it completely instead of trying to fix it up
> - patch 1/4 is not needed with the fix
> - perhaps many of your other patches are alss not needed 
> - once we get the long-term solution, some of the !node_online() checks can be removed

Seems like a nice solution to me :)

> ----8<----
> diff --git a/mm/slub.c b/mm/slub.c
> index 17dc00e33115..1d4f2d7a0080 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -1511,7 +1511,7 @@ static inline struct page *alloc_slab_page(struct kmem_cache *s,
>  	struct page *page;
>  	unsigned int order = oo_order(oo);
>  
> -	if (node == NUMA_NO_NODE)
> +	if (node == NUMA_NO_NODE || !node_online(node))

Why don't we need the node_present_pages() check here?

>  		page = alloc_pages(flags, order);
>  	else
>  		page = __alloc_pages_node(node, flags, order);
> @@ -1973,8 +1973,6 @@ static void *get_partial(struct kmem_cache *s, gfp_t flags, int node,
>  
>  	if (node == NUMA_NO_NODE)
>  		searchnode = numa_mem_id();
> -	else if (!node_present_pages(node))
> -		searchnode = node_to_mem_node(node);
>  
>  	object = get_partial_node(s, get_node(s, searchnode), c, flags);
>  	if (object || node != NUMA_NO_NODE)
> @@ -2568,12 +2566,15 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
>  redo:
>  
>  	if (unlikely(!node_match(page, node))) {
> -		int searchnode = node;
> -
> -		if (node != NUMA_NO_NODE && !node_present_pages(node))
> -			searchnode = node_to_mem_node(node);
> -
> -		if (unlikely(!node_match(page, searchnode))) {
> +		/*
> +		 * node_match() false implies node != NUMA_NO_NODE
> +		 * but if the node is not online and has no pages, just
                                                 ^
                                                 this should be 'or' ?

> +		 * ignore the constraint
> +		 */
> +		if ((!node_online(node) || !node_present_pages(node))) {
> +			node = NUMA_NO_NODE;
> +			goto redo;
> +		} else {
>  			stat(s, ALLOC_NODE_MISMATCH);
>  			deactivate_slab(s, page, c->freelist, c);
>  			goto new_slab;

cheers
