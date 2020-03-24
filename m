Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D761911F6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 14:49:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mszx5JRhzDqq3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 00:49:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=OLle3PQv; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48msXs2PzfzDqTn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 00:29:17 +1100 (AEDT)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B079208D5;
 Tue, 24 Mar 2020 13:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585055988;
 bh=No4x+/sF8HH0OSbHMeU9yYgyMCMiaiSJMmI6WFonRjY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OLle3PQvZECCkY9P4PTvmwtIAnKqRqhOkvC0nI9cf/odR7EEcU61xPE0yLPWQQCKV
 im89IrSZxFDo/RPp3VZMfICnDUMwNcsgVpGkYAsQOkKSBq2GGMTcEMHgj6TUz4hRNQ
 x37z4qt4i69qWoaCxRCgVkZCdUlhJVkM15jptS7k=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.4 091/102] mm,
 slub: prevent kmalloc_node crashes and memory leaks
Date: Tue, 24 Mar 2020 14:11:23 +0100
Message-Id: <20200324130816.097967203@linuxfoundation.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200324130806.544601211@linuxfoundation.org>
References: <20200324130806.544601211@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 PUVICHAKRAVARTHY RAMACHANDRAN <puvichakravarthy@in.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Rientjes <rientjes@google.com>, linuxppc-dev@lists.ozlabs.org,
 stable@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 Pekka Enberg <penberg@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Kirill Tkhai <ktkhai@virtuozzo.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
 Mel Gorman <mgorman@techsingularity.net>, Christopher Lameter <cl@linux.com>,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Vlastimil Babka <vbabka@suse.cz>

commit 0715e6c516f106ed553828a671d30ad9a3431536 upstream.

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
  NIP ___slab_alloc+0x1f4/0x760
  LR __slab_alloc+0x34/0x60
  Call Trace:
    ___slab_alloc+0x334/0x760 (unreliable)
    __slab_alloc+0x34/0x60
    __kmalloc_node+0x110/0x490
    kvmalloc_node+0x58/0x110
    mem_cgroup_css_online+0x108/0x270
    online_css+0x48/0xd0
    cgroup_apply_control_enable+0x2ec/0x4d0
    cgroup_mkdir+0x228/0x5f0
    kernfs_iop_mkdir+0x90/0xf0
    vfs_mkdir+0x110/0x230
    do_mkdirat+0xb0/0x1a0
    system_call+0x5c/0x68

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

This only happens with a mmotm patch "mm/memcontrol.c: allocate
shrinker_map on appropriate NUMA node" [2] which effectively calls
kmalloc_node for each possible node.  SLUB however only allocates
kmem_cache_node on online N_NORMAL_MEMORY nodes, and relies on
node_to_mem_node to return such valid node for other nodes since commit
a561ce00b09e ("slub: fall back to node_to_mem_node() node if allocating
on memoryless node").  This is however not true in this configuration
where the _node_numa_mem_ array is not initialized for nodes 0 and 2-31,
thus it contains zeroes and get_partial() ends up accessing
non-allocated kmem_cache_node.

A related issue was reported by Bharata (originally by Ramachandran) [3]
where a similar PowerPC configuration, but with mainline kernel without
patch [2] ends up allocating large amounts of pages by kmalloc-1k
kmalloc-512.  This seems to have the same underlying issue with
node_to_mem_node() not behaving as expected, and might probably also
lead to an infinite loop with CONFIG_SLUB_CPU_PARTIAL [4].

This patch should fix both issues by not relying on node_to_mem_node()
anymore and instead simply falling back to NUMA_NO_NODE, when
kmalloc_node(node) is attempted for a node that's not online, or has no
usable memory.  The "usable memory" condition is also changed from
node_present_pages() to N_NORMAL_MEMORY node state, as that is exactly
the condition that SLUB uses to allocate kmem_cache_node structures.
The check in get_partial() is removed completely, as the checks in
___slab_alloc() are now sufficient to prevent get_partial() being
reached with an invalid node.

[1] https://lore.kernel.org/linux-next/3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com/
[2] https://lore.kernel.org/linux-mm/fff0e636-4c36-ed10-281c-8cdb0687c839@virtuozzo.com/
[3] https://lore.kernel.org/linux-mm/20200317092624.GB22538@in.ibm.com/
[4] https://lore.kernel.org/linux-mm/088b5996-faae-8a56-ef9c-5b567125ae54@suse.cz/

Fixes: a561ce00b09e ("slub: fall back to node_to_mem_node() node if allocating on memoryless node")
Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Reported-by: PUVICHAKRAVARTHY RAMACHANDRAN <puvichakravarthy@in.ibm.com>
Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Tested-by: Bharata B Rao <bharata@linux.ibm.com>
Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
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
Cc: <stable@vger.kernel.org>
Link: http://lkml.kernel.org/r/20200320115533.9604-1-vbabka@suse.cz
Debugged-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 mm/slub.c |   26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1953,8 +1953,6 @@ static void *get_partial(struct kmem_cac
 
 	if (node == NUMA_NO_NODE)
 		searchnode = numa_mem_id();
-	else if (!node_present_pages(node))
-		searchnode = node_to_mem_node(node);
 
 	object = get_partial_node(s, get_node(s, searchnode), c, flags);
 	if (object || node != NUMA_NO_NODE)
@@ -2543,17 +2541,27 @@ static void *___slab_alloc(struct kmem_c
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


