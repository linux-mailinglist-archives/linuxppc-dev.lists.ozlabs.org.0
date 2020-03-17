Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AAC188A4A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 17:32:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hdxK3dJczDqmY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 03:32:21 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hcXp2gDJzDqSB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 02:29:30 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B6359AE2D;
 Tue, 17 Mar 2020 15:29:22 +0000 (UTC)
Subject: Re: [PATCH 2/4] mm/slub: Use mem_node to allocate a new slab
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
References: <3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com>
 <20200317131753.4074-1-srikar@linux.vnet.ibm.com>
 <20200317131753.4074-3-srikar@linux.vnet.ibm.com>
 <ef34b0bb-4dfa-cb0e-1830-9ad59119da5e@suse.cz>
 <20200317134523.GB4334@linux.vnet.ibm.com>
 <3d9629d4-4a6d-d2b5-28b7-58af497671c7@suse.cz>
 <20200317145105.GA27520@linux.vnet.ibm.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <abeaec0d-e9ea-28ce-5b9a-9a6d41ab38c9@suse.cz>
Date: Tue, 17 Mar 2020 16:29:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200317145105.GA27520@linux.vnet.ibm.com>
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
 Mel Gorman <mgorman@suse.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Christopher Lameter <cl@linux.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/17/20 3:51 PM, Srikar Dronamraju wrote:
> * Vlastimil Babka <vbabka@suse.cz> [2020-03-17 14:53:26]:
> 
>> >> > 
>> >> > Mitigate this by allocating the new slab from the node_numa_mem.
>> >> 
>> >> Are you sure this is really needed and the other 3 patches are not enough for
>> >> the current SLUB code to work as needed? It seems you are changing the semantics
>> >> here...
>> >> 
>> > 
>> > The other 3 patches are not enough because we don't carry the searchnode
>> > when the actual alloc_pages_node gets called. 
>> > 
>> > With only the 3 patches, we see the above Panic, its signature is slightly
>> > different from what Sachin first reported and which I have carried in 1st
>> > patch.
>> 
>> Ah, I see. So that's the missing pgdat after your series [1] right?
> 
> Yes the pgdat would be missing after my cpuless, memoryless node patchset.
> However..
>> 
>> That sounds like an argument for Michal's suggestions that pgdats exist and have
>> correctly populated zonelists for all possible nodes.
> 
> Only the first patch in this series would be affected by pgdat existing or
> not.  Even if the pgdat existed, the NODE_DATA[nid]->node_present_pages
> would be 0. Right? So it would look at node_to_mem_node(). And since node 0 is
> cpuless it would return 0.

I thought the point was to return 1 for node 0.

> If we pass this node 0 (which is memoryless/cpuless) to
> alloc_pages_node. Please note I am only setting node_numa_mem only
> for offline nodes. However we could change this to set for all offline and
> memoryless nodes.

That would indeed make sense.

But I guess that alloc_pages would still crash as the result of
numa_to_mem_node() is not passed down to alloc_pages() without this patch. In
__alloc_pages_node() we currently have "The node must be valid and online" so
offline nodes don't have zonelists. Either they get them, or we indeed need
something like this patch. But in order to not make get_any_partial() dead code,
the final replacement of invalid node with a valid one should be done in
alloc_slab_page() I guess?

>> node_to_mem_node() could be just a shortcut for the first zone's node in the
>> zonelist, so that fallback follows the topology.
>> 
>> [1]
>> https://lore.kernel.org/linuxppc-dev/20200311110237.5731-1-srikar@linux.vnet.ibm.com/t/#m76e5b4c4084380b1d4b193d5aa0359b987f2290e
>> 
> 
> 
> 

