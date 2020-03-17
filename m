Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 947AE188797
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 15:36:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hbMj35xlzDqgs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 01:36:33 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hZ072h7lzDqQK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 00:34:31 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9DEAAAD2C;
 Tue, 17 Mar 2020 13:34:26 +0000 (UTC)
Subject: Re: [PATCH 2/4] mm/slub: Use mem_node to allocate a new slab
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com>
 <20200317131753.4074-1-srikar@linux.vnet.ibm.com>
 <20200317131753.4074-3-srikar@linux.vnet.ibm.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <ef34b0bb-4dfa-cb0e-1830-9ad59119da5e@suse.cz>
Date: Tue, 17 Mar 2020 14:34:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200317131753.4074-3-srikar@linux.vnet.ibm.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Kirill Tkhai <ktkhai@virtuozzo.com>,
 Mel Gorman <mgorman@suse.de>, Christopher Lameter <cl@linux.com>,
 Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/17/20 2:17 PM, Srikar Dronamraju wrote:
> Currently while allocating a slab for a offline node, we use its
> associated node_numa_mem to search for a partial slab. If we don't find
> a partial slab, we try allocating a slab from the offline node using
> __alloc_pages_node. However this is bound to fail.
> 
> NIP [c00000000039a300] __alloc_pages_nodemask+0x130/0x3b0
> LR [c00000000039a3c4] __alloc_pages_nodemask+0x1f4/0x3b0
> Call Trace:
> [c0000008b36837f0] [c00000000039a3b4] __alloc_pages_nodemask+0x1e4/0x3b0 (unreliable)
> [c0000008b3683870] [c0000000003d1ff8] new_slab+0x128/0xcf0
> [c0000008b3683950] [c0000000003d6060] ___slab_alloc+0x410/0x820
> [c0000008b3683a40] [c0000000003d64a4] __slab_alloc+0x34/0x60
> [c0000008b3683a70] [c0000000003d78b0] __kmalloc_node+0x110/0x490
> [c0000008b3683af0] [c000000000343a08] kvmalloc_node+0x58/0x110
> [c0000008b3683b30] [c0000000003ffd44] mem_cgroup_css_online+0x104/0x270
> [c0000008b3683b90] [c000000000234e08] online_css+0x48/0xd0
> [c0000008b3683bc0] [c00000000023dedc] cgroup_apply_control_enable+0x2ec/0x4d0
> [c0000008b3683ca0] [c0000000002416f8] cgroup_mkdir+0x228/0x5f0
> [c0000008b3683d10] [c000000000520360] kernfs_iop_mkdir+0x90/0xf0
> [c0000008b3683d50] [c00000000043e400] vfs_mkdir+0x110/0x230
> [c0000008b3683da0] [c000000000441ee0] do_mkdirat+0xb0/0x1a0
> [c0000008b3683e20] [c00000000000b278] system_call+0x5c/0x68
> 
> Mitigate this by allocating the new slab from the node_numa_mem.

Are you sure this is really needed and the other 3 patches are not enough for
the current SLUB code to work as needed? It seems you are changing the semantics
here...

> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -1970,14 +1970,8 @@ static void *get_partial(struct kmem_cache *s, gfp_t flags, int node,
>  		struct kmem_cache_cpu *c)
>  {
>  	void *object;
> -	int searchnode = node;
>  
> -	if (node == NUMA_NO_NODE)
> -		searchnode = numa_mem_id();
> -	else if (!node_present_pages(node))
> -		searchnode = node_to_mem_node(node);
> -
> -	object = get_partial_node(s, get_node(s, searchnode), c, flags);
> +	object = get_partial_node(s, get_node(s, node), c, flags);
>  	if (object || node != NUMA_NO_NODE)>  		return object;
>
>       return get_any_partial(s, flags, c);

I.e. here in this if(), now node will never equal NUMA_NO_NODE (thanks to the
hunk below), thus the get_any_partial() call becomes dead code?

> @@ -2470,6 +2464,11 @@ static inline void *new_slab_objects(struct kmem_cache *s, gfp_t flags,
>  
>  	WARN_ON_ONCE(s->ctor && (flags & __GFP_ZERO));
>  
> +	if (node == NUMA_NO_NODE)
> +		node = numa_mem_id();
> +	else if (!node_present_pages(node))
> +		node = node_to_mem_node(node);
> +
>  	freelist = get_partial(s, flags, node, c);
>  
>  	if (freelist)
> @@ -2569,12 +2568,10 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
>  redo:
>  
>  	if (unlikely(!node_match(page, node))) {
> -		int searchnode = node;
> -
>  		if (node != NUMA_NO_NODE && !node_present_pages(node))
> -			searchnode = node_to_mem_node(node);
> +			node = node_to_mem_node(node);
>  
> -		if (unlikely(!node_match(page, searchnode))) {
> +		if (unlikely(!node_match(page, node))) {
>  			stat(s, ALLOC_NODE_MISMATCH);
>  			deactivate_slab(s, page, c->freelist, c);
>  			goto new_slab;
> 

