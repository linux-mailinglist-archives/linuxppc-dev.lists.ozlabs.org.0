Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4157B18A0E6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 17:53:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jGLd1twfzDqyb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 03:52:57 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jGKF265czDqxj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 03:51:45 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4A690ABE9;
 Wed, 18 Mar 2020 16:51:41 +0000 (UTC)
Subject: Re: [RFC 1/2] mm, slub: prevent kmalloc_node crashes and memory leaks
To: bharata@linux.ibm.com
References: <20200318144220.18083-1-vbabka@suse.cz>
 <20200318160610.GD26049@in.ibm.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <e060ad43-ff4e-0e59-2e64-ce8a4916ec70@suse.cz>
Date: Wed, 18 Mar 2020 17:51:39 +0100
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
> 
> Regards,
> Bharata.
 
OK how about this version? It's somewhat ugly, but important is that the fast
path case (c->page exists) is unaffected and another common case (c->page is
NULL, but node is NUMA_NO_NODE) is just one extra check - impossible to avoid at
some point anyway.

----8<----
From d1675363c2ddc3758e5c0d0f435ca46818219194 Mon Sep 17 00:00:00 2001
From: Vlastimil Babka <vbabka@suse.cz>
Date: Wed, 18 Mar 2020 14:47:33 +0100
Subject: [RFC 1/2] mm, slub: prevent kmalloc_node crashes and memory leaks

Sachin reports [1] a crash in SLUB __slab_alloc():

BUG: Kernel NULL pointer dereference on read at 0x000073b0
Faulting instruction address: 0xc0000000003d55f4
Oops: Kernel access of bad area, sig: 11 [#1]
LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
Modules linked in:
CPU: 19 PID: 1 Comm: systemd Not tainted 5.6.0-rc2-next-20200218-autotest #1
NIP:  c0000000003d55f4 LR: c0000000003d5b94 CTR: 0000000000000000
REGS: c0000008b37836d0 TRAP: 0300   Not tainted  (5.6.0-rc2-next-20200218-autotest)
MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24004844  XER: 00000000
CFAR: c00000000000dec4 DAR: 00000000000073b0 DSISR: 40000000 IRQMASK: 1
GPR00: c0000000003d5b94 c0000008b3783960 c00000000155d400 c0000008b301f500
GPR04: 0000000000000dc0 0000000000000002 c0000000003443d8 c0000008bb398620
GPR08: 00000008ba2f0000 0000000000000001 0000000000000000 0000000000000000
GPR12: 0000000024004844 c00000001ec52a00 0000000000000000 0000000000000000
GPR16: c0000008a1b20048 c000000001595898 c000000001750c18 0000000000000002
GPR20: c000000001750c28 c000000001624470 0000000fffffffe0 5deadbeef0000122
GPR24: 0000000000000001 0000000000000dc0 0000000000000002 c0000000003443d8
GPR28: c0000008b301f500 c0000008bb398620 0000000000000000 c00c000002287180
NIP [c0000000003d55f4] ___slab_alloc+0x1f4/0x760
LR [c0000000003d5b94] __slab_alloc+0x34/0x60
Call Trace:
[c0000008b3783960] [c0000000003d5734] ___slab_alloc+0x334/0x760 (unreliable)
[c0000008b3783a40] [c0000000003d5b94] __slab_alloc+0x34/0x60
[c0000008b3783a70] [c0000000003d6fa0] __kmalloc_node+0x110/0x490
[c0000008b3783af0] [c0000000003443d8] kvmalloc_node+0x58/0x110
[c0000008b3783b30] [c0000000003fee38] mem_cgroup_css_online+0x108/0x270
[c0000008b3783b90] [c000000000235aa8] online_css+0x48/0xd0
[c0000008b3783bc0] [c00000000023eaec] cgroup_apply_control_enable+0x2ec/0x4d0
[c0000008b3783ca0] [c000000000242318] cgroup_mkdir+0x228/0x5f0
[c0000008b3783d10] [c00000000051e170] kernfs_iop_mkdir+0x90/0xf0
[c0000008b3783d50] [c00000000043dc00] vfs_mkdir+0x110/0x230
[c0000008b3783da0] [c000000000441c90] do_mkdirat+0xb0/0x1a0
[c0000008b3783e20] [c00000000000b278] system_call+0x5c/0x68

This is a PowerPC platform with following NUMA topology:

available: 2 nodes (0-1)
node 0 cpus:
node 0 size: 0 MB
node 0 free: 0 MB
node 1 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
node 1 size: 35247 MB
node 1 free: 30907 MB
node distances:
node   0   1
  0:  10  40
  1:  40  10

possible numa nodes: 0-31

This only happens with a mmotm patch "mm/memcontrol.c: allocate shrinker_map on
appropriate NUMA node" [2] which effectively calls kmalloc_node for each
possible node. SLUB however only allocates kmem_cache_node on online nodes
with present memory, and relies on node_to_mem_node to return such valid node
for other nodes since commit a561ce00b09e ("slub: fall back to
node_to_mem_node() node if allocating on memoryless node"). This is however not
true in this configuration where the _node_numa_mem_ array is not initialized
for nodes 0 and 2-31, thus it contains zeroes and get_partial() ends up
accessing non-allocated kmem_cache_node.

A related issue was reported by Bharata [3] where a similar PowerPC
configuration, but without patch [2] ends up allocating large amounts of pages
by kmalloc-1k kmalloc-512. This seems to have the same underlying issue with
node_to_mem_node() not behaving as expected, and might probably also lead
to an infinite loop with CONFIG_SLUB_CPU_PARTIAL.

This patch should fix both issues by not relying on node_to_mem_node() anymore
and instead simply falling back to NUMA_NO_NODE, when kmalloc_node(node) is
attempted for a node that's not online or has no pages. Also in case
alloc_slab_page() is reached with a non-online node, fallback as well, until
we have a guarantee that all possible nodes have valid NODE_DATA with proper
zonelist for fallback.

[1] https://lore.kernel.org/linux-next/3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com/
[2] https://lore.kernel.org/linux-mm/fff0e636-4c36-ed10-281c-8cdb0687c839@virtuozzo.com/
[3] https://lore.kernel.org/linux-mm/20200317092624.GB22538@in.ibm.com/
[4] https://lore.kernel.org/linux-mm/088b5996-faae-8a56-ef9c-5b567125ae54@suse.cz/

Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Reported-by: Bharata B Rao <bharata@linux.ibm.com>
Debugged-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Christopher Lameter <cl@linux.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: David Rientjes <rientjes@google.com>
Cc: Kirill Tkhai <ktkhai@virtuozzo.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
---
 mm/slub.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 17dc00e33115..60352f80eb33 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1511,7 +1511,7 @@ static inline struct page *alloc_slab_page(struct kmem_cache *s,
 	struct page *page;
 	unsigned int order = oo_order(oo);
 
-	if (node == NUMA_NO_NODE)
+	if (node == NUMA_NO_NODE || !node_online(node))
 		page = alloc_pages(flags, order);
 	else
 		page = __alloc_pages_node(node, flags, order);
@@ -1973,8 +1973,6 @@ static void *get_partial(struct kmem_cache *s, gfp_t flags, int node,
 
 	if (node == NUMA_NO_NODE)
 		searchnode = numa_mem_id();
-	else if (!node_present_pages(node))
-		searchnode = node_to_mem_node(node);
 
 	object = get_partial_node(s, get_node(s, searchnode), c, flags);
 	if (object || node != NUMA_NO_NODE)
@@ -2563,17 +2561,27 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
 	struct page *page;
 
 	page = c->page;
-	if (!page)
+	if (!page) {
+		/*
+		 * if the node is not online or has no pages, just
+		 * ignore the constraint
+		 */
+		if (unlikely(node != NUMA_NO_NODE &&
+		    (!node_online(node) || !node_present_pages(node))))
+			node = NUMA_NO_NODE;
 		goto new_slab;
+	}
 redo:
 
 	if (unlikely(!node_match(page, node))) {
-		int searchnode = node;
-
-		if (node != NUMA_NO_NODE && !node_present_pages(node))
-			searchnode = node_to_mem_node(node);
-
-		if (unlikely(!node_match(page, searchnode))) {
+		/*
+		 * same as above but node_match() being false already
+		 * implies node != NUMA_NO_NODE
+		 */
+		if ((!node_online(node) || !node_present_pages(node))) {
+			node = NUMA_NO_NODE;
+			goto redo;
+		} else {
 			stat(s, ALLOC_NODE_MISMATCH);
 			deactivate_slab(s, page, c->freelist, c);
 			goto new_slab;
-- 
2.25.1

