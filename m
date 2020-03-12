Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A7F183266
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 15:07:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dVyY2vCWzDr5V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 01:07:33 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dVcN0XYQzDqp7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 00:51:46 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 96743AC8F;
 Thu, 12 Mar 2020 13:51:39 +0000 (UTC)
Subject: Re: [PATCH 1/3] powerpc/numa: Set numa_node for all possible cpus
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
References: <20200311110237.5731-1-srikar@linux.vnet.ibm.com>
 <20200311110237.5731-2-srikar@linux.vnet.ibm.com>
 <20200311115735.GM23944@dhcp22.suse.cz>
 <20200312052707.GA3277@linux.vnet.ibm.com>
 <C5560C71-483A-41FB-BDE9-526F1E0CFA36@linux.vnet.ibm.com>
 <5e5c736a-a88c-7c76-fc3d-7bc765e8dcba@suse.cz>
 <20200312131438.GB3277@linux.vnet.ibm.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <61437352-8b54-38fa-4471-044a65c9d05a@suse.cz>
Date: Thu, 12 Mar 2020 14:51:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312131438.GB3277@linux.vnet.ibm.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 LKML <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Mel Gorman <mgorman@suse.de>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christopher Lameter <cl@linux.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/12/20 2:14 PM, Srikar Dronamraju wrote:
> * Vlastimil Babka <vbabka@suse.cz> [2020-03-12 10:30:50]:
> 
>> On 3/12/20 9:23 AM, Sachin Sant wrote:
>> >> On 12-Mar-2020, at 10:57 AM, Srikar Dronamraju <srikar@linux.vnet.ibm.com> wrote:
>> >> * Michal Hocko <mhocko@kernel.org> [2020-03-11 12:57:35]:
>> >>> On Wed 11-03-20 16:32:35, Srikar Dronamraju wrote:
>> >>>> To ensure a cpuless, memoryless dummy node is not online, powerpc need
>> >>>> to make sure all possible but not present cpu_to_node are set to a
>> >>>> proper node.
>> >>> 
>> >>> Just curious, is this somehow related to
>> >>> http://lkml.kernel.org/r/20200227182650.GG3771@dhcp22.suse.cz?
>> >>> 
>> >> 
>> >> The issue I am trying to fix is a known issue in Powerpc since many years.
>> >> So this surely not a problem after a75056fc1e7c (mm/memcontrol.c: allocate
>> >> shrinker_map on appropriate NUMA node"). 
>> >> 
>> >> I tried v5.6-rc4 + a75056fc1e7c but didnt face any issues booting the
>> >> kernel. Will work with Sachin/Abdul (reporters of the issue).
> 
> I had used v1 and not v2. So my mistake.
> 
>> > I applied this 3 patch series on top of March 11 next tree (commit d44a64766795 )
>> > The kernel still fails to boot with same call trace.
>> 
> 
> While I am not an expert in the slub area, I looked at the patch
> a75056fc1e7c and had some thoughts on why this could be causing this issue.
> 
> On the system where the crash happens, the possible number of nodes is much
> greater than the number of onlined nodes. The pdgat or the NODE_DATA is only
> available for onlined nodes.
> 
> With a75056fc1e7c memcg_alloc_shrinker_maps, we end up calling kzalloc_node
> for all possible nodes and in ___slab_alloc we end up looking at the
> node_present_pages which is NODE_DATA(nid)->node_present_pages.
> i.e for a node whose pdgat struct is not allocated, we are trying to
> dereference.

From what we saw, the pgdat does exist, the problem is that slab's per-node data
doesn't exist for a node that doesn't have present pages, as it would be a waste
of memory.

Uh actually you are probably right, the NODE_DATA doesn't exist anymore? In
Sachin's first report [1] we have

[    0.000000] numa:   NODE_DATA [mem 0x8bfedc900-0x8bfee3fff]
[    0.000000] numa:     NODE_DATA(0) on node 1
[    0.000000] numa:   NODE_DATA [mem 0x8bfed5200-0x8bfedc8ff]

But in this thread, with your patches Sachin reports:

[    0.000000] numa:   NODE_DATA [mem 0x8bfedc900-0x8bfee3fff]

So I assume it's just node 1. In that case, node_present_pages is really dangerous.

[1]
https://lore.kernel.org/linux-next/3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com/

> Also for a memoryless/cpuless node or possible but not present nodes,
> node_to_mem_node(node) will still end up as node (atleast on powerpc).

I think that's the place where this would be best to fix.

> I tried with this hunk below and it works.
> 
> But I am not sure if we need to check at other places were
> node_present_pages is being called.

I think this seems to defeat the purpose of node_to_mem_node()? Shouldn't it
return only nodes that are online with present memory?
CCing Joonsoo who seems to have introduced this in ad2c8144418c ("topology: add
support for node_to_mem_node() to determine the fallback node")

I think we do need well defined and documented rules around node_to_mem_node(),
cpu_to_node(), existence of NODE_DATA, various node_states bitmaps etc so
everyone handles it the same, safe way.

> diff --git a/mm/slub.c b/mm/slub.c
> index 626cbcbd977f..bddb93bed55e 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -2571,9 +2571,13 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
>  	if (unlikely(!node_match(page, node))) {
>  		int searchnode = node;
>  
> -		if (node != NUMA_NO_NODE && !node_present_pages(node))
> -			searchnode = node_to_mem_node(node);
> -
> +		if (node != NUMA_NO_NODE) {
> +			if (!node_online(node) || !node_present_pages(node)) {
> +				searchnode = node_to_mem_node(node);
> +				if (!node_online(searchnode))
> +					searchnode = first_online_node;
> +			}
> +		}
>  		if (unlikely(!node_match(page, searchnode))) {
>  			stat(s, ALLOC_NODE_MISMATCH);
>  			deactivate_slab(s, page, c->freelist, c);
> 
>> > 
>> 
> 

