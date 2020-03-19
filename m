Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F34918B955
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 15:27:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jq4k360QzDr5n
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 01:27:50 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jpBt1JdnzDrGG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 00:48:06 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CC5EDACDF;
 Thu, 19 Mar 2020 13:47:59 +0000 (UTC)
Subject: Re: [RFC 1/2] mm, slub: prevent kmalloc_node crashes and memory leaks
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
References: <20200318144220.18083-1-vbabka@suse.cz>
 <20200318160610.GD26049@in.ibm.com>
 <e060ad43-ff4e-0e59-2e64-ce8a4916ec70@suse.cz>
 <0F67B5AA-96DF-4977-BDC6-D72959B3F7EF@linux.vnet.ibm.com>
 <b9b95895-ca6b-5ad2-1f67-45fee93d1e67@suse.cz>
 <658E6AB8-581F-4722-BCBB-4BDD2245D265@linux.vnet.ibm.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <339cf655-393e-c48e-4797-86f61df56c35@suse.cz>
Date: Thu, 19 Mar 2020 14:47:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <658E6AB8-581F-4722-BCBB-4BDD2245D265@linux.vnet.ibm.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Mel Gorman <mgorman@techsingularity.net>, Michal Hocko <mhocko@kernel.org>,
 Pekka Enberg <penberg@kernel.org>, linux-mm@kvack.org,
 Kirill Tkhai <ktkhai@virtuozzo.com>, David Rientjes <rientjes@google.com>,
 Christopher Lameter <cl@linux.com>, bharata@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, Joonsoo Kim <iamjoonsoo.kim@lge.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/19/20 2:26 PM, Sachin Sant wrote:
> 
> 
>> On 19-Mar-2020, at 6:53 PM, Vlastimil Babka <vbabka@suse.cz> wrote:
>> 
>> On 3/19/20 9:52 AM, Sachin Sant wrote:
>>> 
>>>> OK how about this version? It's somewhat ugly, but important is that the fast
>>>> path case (c->page exists) is unaffected and another common case (c->page is
>>>> NULL, but node is NUMA_NO_NODE) is just one extra check - impossible to avoid at
>>>> some point anyway.
>>>> 
>>> 
>>> I attempted the suggested tests.
>>> 
>>> Test 1: March 18 linux-next + Patch 1 [1] + Patch  2 [2]
>>> 
>>> Machine boots fine. numactl o/p after boot:
>> 
>> Great, thanks! Can I add your Tested-by: then?
> 
> Sure.
> Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> 
> Thank you for the fix.

Thanks! Sorry to bother, but in the end I decided to do further change so I
would appreciate verification if it still works as intended.
The point is to use node_state(N_NORMAL_MEMORY) instead of node_present_pages(),
as that is really what SLUB uses to decide whether to allocate the
kmem_cache_node. So we should match this properly given the opportunity.
I have also again removed the node_online() check in alloc_slab_page() as it
really shouldn't be reachable with an offline node - everything is taken care of
in ___slab_alloc, or callers use NUMA_NO_NODE.

----8<----
diff --git a/mm/slub.c b/mm/slub.c
index 17dc00e33115..7113b1f9cd77 100644
--- a/mm/slub.c
+++ b/mm/slub.c
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
+		 * if the node is not online or has no normal memory, just
+		 * ignore the node constraint
+		 */
+		if (unlikely(node != NUMA_NO_NODE &&
+			     !node_state(node, N_NORMAL_MEMORY)))
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
+		if (!node_state(node, N_NORMAL_MEMORY)) {
+			node = NUMA_NO_NODE;
+			goto redo;
+		} else {
 			stat(s, ALLOC_NODE_MISMATCH);
 			deactivate_slab(s, page, c->freelist, c);
 			goto new_slab;
-- 
2.25.1

