Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE1F939B2F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 08:54:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n3HMCfkI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSnvX5jDdz3cZ5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 16:54:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n3HMCfkI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSnhx70T7z3cY1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 16:45:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 28F8C60A23;
	Tue, 23 Jul 2024 06:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971FBC4AF11;
	Tue, 23 Jul 2024 06:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721717135;
	bh=+SS+kBMesJ55WKe6egUFmgElS27y1BsvfZiWIBsrKDc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n3HMCfkIDYgCAdmaqzZirn25m5YCUeyx2+Yt3KdJ6dTe+hC6ma8FVwdGgTevrbpTL
	 V//8S9aE/BnndgxKBfH8v2teL/zytgKLeZ2En2ll04NA+2vnSnRelqp8J/Fc7zmU3u
	 N2YmBf/L2IxONH8YSjWtlPNG2JSUVmrkq/CcYSl2x/7B7gxvE3wGy2UBHd60A2YUFK
	 teggemL4n51lCoSdDB/KK9I/AbKJbXmmMIJ7lg2NBd5Le4xuGf9of21zn3SflH013v
	 pdSEe26Djqlgk2Q3FaJEqaax7RJgiB4I5DBw/NKtOXnzTM+Lp3LjUZbxQa1YIgGrif
	 lMfTVrQ9TgE3g==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/25] mm: introduce numa_memblks
Date: Tue, 23 Jul 2024 09:41:48 +0300
Message-ID: <20240723064156.4009477-18-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240723064156.4009477-1-rppt@kernel.org>
References: <20240723064156.4009477-1-rppt@kernel.org>
MIME-Version: 1.0
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Vasily Gorbik <gor@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Move code dealing with numa_memblks from arch/x86 to mm/ and add Kconfig
options to let x86 select it in its Kconfig.

This code will be later reused by arch_numa.

No functional changes.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/Kconfig             |   1 +
 arch/x86/include/asm/numa.h  |   3 -
 arch/x86/mm/amdtopology.c    |   1 +
 arch/x86/mm/numa.c           | 372 +--------------------------------
 arch/x86/mm/numa_emulation.c |   1 +
 arch/x86/mm/numa_internal.h  |  15 +-
 drivers/acpi/numa/srat.c     |   1 +
 drivers/of/of_numa.c         |   1 +
 include/linux/numa_memblks.h |  35 ++++
 mm/Kconfig                   |   3 +
 mm/Makefile                  |   1 +
 mm/numa_memblks.c            | 385 +++++++++++++++++++++++++++++++++++
 12 files changed, 436 insertions(+), 383 deletions(-)
 create mode 100644 include/linux/numa_memblks.h
 create mode 100644 mm/numa_memblks.c

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 1d7122a1883e..d8084f37157c 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -295,6 +295,7 @@ config X86
 	select NEED_PER_CPU_EMBED_FIRST_CHUNK
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK
 	select NEED_SG_DMA_LENGTH
+	select NUMA_MEMBLKS			if NUMA
 	select PCI_DOMAINS			if PCI
 	select PCI_LOCKLESS_CONFIG		if PCI
 	select PERF_EVENTS
diff --git a/arch/x86/include/asm/numa.h b/arch/x86/include/asm/numa.h
index 6fa5ea925aac..6e9a50bf03d4 100644
--- a/arch/x86/include/asm/numa.h
+++ b/arch/x86/include/asm/numa.h
@@ -10,8 +10,6 @@
 
 #ifdef CONFIG_NUMA
 
-#define NR_NODE_MEMBLKS		(MAX_NUMNODES*2)
-
 extern int numa_off;
 
 /*
@@ -25,7 +23,6 @@ extern int numa_off;
 extern s16 __apicid_to_node[MAX_LOCAL_APIC];
 extern nodemask_t numa_nodes_parsed __initdata;
 
-extern int __init numa_add_memblk(int nodeid, u64 start, u64 end);
 extern void __init numa_set_distance(int from, int to, int distance);
 
 static inline void set_apicid_to_node(int apicid, s16 node)
diff --git a/arch/x86/mm/amdtopology.c b/arch/x86/mm/amdtopology.c
index 9332b36a1091..628833afee37 100644
--- a/arch/x86/mm/amdtopology.c
+++ b/arch/x86/mm/amdtopology.c
@@ -12,6 +12,7 @@
 #include <linux/string.h>
 #include <linux/nodemask.h>
 #include <linux/memblock.h>
+#include <linux/numa_memblks.h>
 
 #include <asm/io.h>
 #include <linux/pci_ids.h>
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index cf7b95125d2a..6874d5650b4d 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -13,6 +13,7 @@
 #include <linux/sched.h>
 #include <linux/topology.h>
 #include <linux/sort.h>
+#include <linux/numa_memblks.h>
 
 #include <asm/e820/api.h>
 #include <asm/proto.h>
@@ -22,10 +23,6 @@
 #include "numa_internal.h"
 
 int numa_off;
-nodemask_t numa_nodes_parsed __initdata;
-
-static struct numa_meminfo numa_meminfo __initdata_or_meminfo;
-static struct numa_meminfo numa_reserved_meminfo __initdata_or_meminfo;
 
 static int numa_distance_cnt;
 static u8 *numa_distance;
@@ -121,194 +118,6 @@ void __init setup_node_to_cpumask_map(void)
 	pr_debug("Node to cpumask map for %u nodes\n", nr_node_ids);
 }
 
-static int __init numa_add_memblk_to(int nid, u64 start, u64 end,
-				     struct numa_meminfo *mi)
-{
-	/* ignore zero length blks */
-	if (start == end)
-		return 0;
-
-	/* whine about and ignore invalid blks */
-	if (start > end || nid < 0 || nid >= MAX_NUMNODES) {
-		pr_warn("Warning: invalid memblk node %d [mem %#010Lx-%#010Lx]\n",
-			nid, start, end - 1);
-		return 0;
-	}
-
-	if (mi->nr_blks >= NR_NODE_MEMBLKS) {
-		pr_err("too many memblk ranges\n");
-		return -EINVAL;
-	}
-
-	mi->blk[mi->nr_blks].start = start;
-	mi->blk[mi->nr_blks].end = end;
-	mi->blk[mi->nr_blks].nid = nid;
-	mi->nr_blks++;
-	return 0;
-}
-
-/**
- * numa_remove_memblk_from - Remove one numa_memblk from a numa_meminfo
- * @idx: Index of memblk to remove
- * @mi: numa_meminfo to remove memblk from
- *
- * Remove @idx'th numa_memblk from @mi by shifting @mi->blk[] and
- * decrementing @mi->nr_blks.
- */
-void __init numa_remove_memblk_from(int idx, struct numa_meminfo *mi)
-{
-	mi->nr_blks--;
-	memmove(&mi->blk[idx], &mi->blk[idx + 1],
-		(mi->nr_blks - idx) * sizeof(mi->blk[0]));
-}
-
-/**
- * numa_move_tail_memblk - Move a numa_memblk from one numa_meminfo to another
- * @dst: numa_meminfo to append block to
- * @idx: Index of memblk to remove
- * @src: numa_meminfo to remove memblk from
- */
-static void __init numa_move_tail_memblk(struct numa_meminfo *dst, int idx,
-					 struct numa_meminfo *src)
-{
-	dst->blk[dst->nr_blks++] = src->blk[idx];
-	numa_remove_memblk_from(idx, src);
-}
-
-/**
- * numa_add_memblk - Add one numa_memblk to numa_meminfo
- * @nid: NUMA node ID of the new memblk
- * @start: Start address of the new memblk
- * @end: End address of the new memblk
- *
- * Add a new memblk to the default numa_meminfo.
- *
- * RETURNS:
- * 0 on success, -errno on failure.
- */
-int __init numa_add_memblk(int nid, u64 start, u64 end)
-{
-	return numa_add_memblk_to(nid, start, end, &numa_meminfo);
-}
-
-/**
- * numa_cleanup_meminfo - Cleanup a numa_meminfo
- * @mi: numa_meminfo to clean up
- *
- * Sanitize @mi by merging and removing unnecessary memblks.  Also check for
- * conflicts and clear unused memblks.
- *
- * RETURNS:
- * 0 on success, -errno on failure.
- */
-int __init numa_cleanup_meminfo(struct numa_meminfo *mi)
-{
-	const u64 low = 0;
-	const u64 high = PFN_PHYS(max_pfn);
-	int i, j, k;
-
-	/* first, trim all entries */
-	for (i = 0; i < mi->nr_blks; i++) {
-		struct numa_memblk *bi = &mi->blk[i];
-
-		/* move / save reserved memory ranges */
-		if (!memblock_overlaps_region(&memblock.memory,
-					bi->start, bi->end - bi->start)) {
-			numa_move_tail_memblk(&numa_reserved_meminfo, i--, mi);
-			continue;
-		}
-
-		/* make sure all non-reserved blocks are inside the limits */
-		bi->start = max(bi->start, low);
-
-		/* preserve info for non-RAM areas above 'max_pfn': */
-		if (bi->end > high) {
-			numa_add_memblk_to(bi->nid, high, bi->end,
-					   &numa_reserved_meminfo);
-			bi->end = high;
-		}
-
-		/* and there's no empty block */
-		if (bi->start >= bi->end)
-			numa_remove_memblk_from(i--, mi);
-	}
-
-	/* merge neighboring / overlapping entries */
-	for (i = 0; i < mi->nr_blks; i++) {
-		struct numa_memblk *bi = &mi->blk[i];
-
-		for (j = i + 1; j < mi->nr_blks; j++) {
-			struct numa_memblk *bj = &mi->blk[j];
-			u64 start, end;
-
-			/*
-			 * See whether there are overlapping blocks.  Whine
-			 * about but allow overlaps of the same nid.  They
-			 * will be merged below.
-			 */
-			if (bi->end > bj->start && bi->start < bj->end) {
-				if (bi->nid != bj->nid) {
-					pr_err("node %d [mem %#010Lx-%#010Lx] overlaps with node %d [mem %#010Lx-%#010Lx]\n",
-					       bi->nid, bi->start, bi->end - 1,
-					       bj->nid, bj->start, bj->end - 1);
-					return -EINVAL;
-				}
-				pr_warn("Warning: node %d [mem %#010Lx-%#010Lx] overlaps with itself [mem %#010Lx-%#010Lx]\n",
-					bi->nid, bi->start, bi->end - 1,
-					bj->start, bj->end - 1);
-			}
-
-			/*
-			 * Join together blocks on the same node, holes
-			 * between which don't overlap with memory on other
-			 * nodes.
-			 */
-			if (bi->nid != bj->nid)
-				continue;
-			start = min(bi->start, bj->start);
-			end = max(bi->end, bj->end);
-			for (k = 0; k < mi->nr_blks; k++) {
-				struct numa_memblk *bk = &mi->blk[k];
-
-				if (bi->nid == bk->nid)
-					continue;
-				if (start < bk->end && end > bk->start)
-					break;
-			}
-			if (k < mi->nr_blks)
-				continue;
-			printk(KERN_INFO "NUMA: Node %d [mem %#010Lx-%#010Lx] + [mem %#010Lx-%#010Lx] -> [mem %#010Lx-%#010Lx]\n",
-			       bi->nid, bi->start, bi->end - 1, bj->start,
-			       bj->end - 1, start, end - 1);
-			bi->start = start;
-			bi->end = end;
-			numa_remove_memblk_from(j--, mi);
-		}
-	}
-
-	/* clear unused ones */
-	for (i = mi->nr_blks; i < ARRAY_SIZE(mi->blk); i++) {
-		mi->blk[i].start = mi->blk[i].end = 0;
-		mi->blk[i].nid = NUMA_NO_NODE;
-	}
-
-	return 0;
-}
-
-/*
- * Set nodes, which have memory in @mi, in *@nodemask.
- */
-static void __init numa_nodemask_from_meminfo(nodemask_t *nodemask,
-					      const struct numa_meminfo *mi)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(mi->blk); i++)
-		if (mi->blk[i].start != mi->blk[i].end &&
-		    mi->blk[i].nid != NUMA_NO_NODE)
-			node_set(mi->blk[i].nid, *nodemask);
-}
-
 /**
  * numa_reset_distance - Reset NUMA distance table
  *
@@ -410,111 +219,13 @@ int __node_distance(int from, int to)
 }
 EXPORT_SYMBOL(__node_distance);
 
-/*
- * Mark all currently memblock-reserved physical memory (which covers the
- * kernel's own memory ranges) as hot-unswappable.
- */
-static void __init numa_clear_kernel_node_hotplug(void)
-{
-	nodemask_t reserved_nodemask = NODE_MASK_NONE;
-	struct memblock_region *mb_region;
-	int i;
-
-	/*
-	 * We have to do some preprocessing of memblock regions, to
-	 * make them suitable for reservation.
-	 *
-	 * At this time, all memory regions reserved by memblock are
-	 * used by the kernel, but those regions are not split up
-	 * along node boundaries yet, and don't necessarily have their
-	 * node ID set yet either.
-	 *
-	 * So iterate over all memory known to the x86 architecture,
-	 * and use those ranges to set the nid in memblock.reserved.
-	 * This will split up the memblock regions along node
-	 * boundaries and will set the node IDs as well.
-	 */
-	for (i = 0; i < numa_meminfo.nr_blks; i++) {
-		struct numa_memblk *mb = numa_meminfo.blk + i;
-		int ret;
-
-		ret = memblock_set_node(mb->start, mb->end - mb->start, &memblock.reserved, mb->nid);
-		WARN_ON_ONCE(ret);
-	}
-
-	/*
-	 * Now go over all reserved memblock regions, to construct a
-	 * node mask of all kernel reserved memory areas.
-	 *
-	 * [ Note, when booting with mem=nn[kMG] or in a kdump kernel,
-	 *   numa_meminfo might not include all memblock.reserved
-	 *   memory ranges, because quirks such as trim_snb_memory()
-	 *   reserve specific pages for Sandy Bridge graphics. ]
-	 */
-	for_each_reserved_mem_region(mb_region) {
-		int nid = memblock_get_region_node(mb_region);
-
-		if (nid != NUMA_NO_NODE)
-			node_set(nid, reserved_nodemask);
-	}
-
-	/*
-	 * Finally, clear the MEMBLOCK_HOTPLUG flag for all memory
-	 * belonging to the reserved node mask.
-	 *
-	 * Note that this will include memory regions that reside
-	 * on nodes that contain kernel memory - entire nodes
-	 * become hot-unpluggable:
-	 */
-	for (i = 0; i < numa_meminfo.nr_blks; i++) {
-		struct numa_memblk *mb = numa_meminfo.blk + i;
-
-		if (!node_isset(mb->nid, reserved_nodemask))
-			continue;
-
-		memblock_clear_hotplug(mb->start, mb->end - mb->start);
-	}
-}
-
 static int __init numa_register_memblks(struct numa_meminfo *mi)
 {
-	int i, nid;
+	int nid, err;
 
-	/* Account for nodes with cpus and no memory */
-	node_possible_map = numa_nodes_parsed;
-	numa_nodemask_from_meminfo(&node_possible_map, mi);
-	if (WARN_ON(nodes_empty(node_possible_map)))
-		return -EINVAL;
-
-	for (i = 0; i < mi->nr_blks; i++) {
-		struct numa_memblk *mb = &mi->blk[i];
-		memblock_set_node(mb->start, mb->end - mb->start,
-				  &memblock.memory, mb->nid);
-	}
-
-	/*
-	 * At very early time, the kernel have to use some memory such as
-	 * loading the kernel image. We cannot prevent this anyway. So any
-	 * node the kernel resides in should be un-hotpluggable.
-	 *
-	 * And when we come here, alloc node data won't fail.
-	 */
-	numa_clear_kernel_node_hotplug();
-
-	/*
-	 * If sections array is gonna be used for pfn -> nid mapping, check
-	 * whether its granularity is fine enough.
-	 */
-	if (IS_ENABLED(NODE_NOT_IN_PAGE_FLAGS)) {
-		unsigned long pfn_align = node_map_pfn_alignment();
-
-		if (pfn_align && pfn_align < PAGES_PER_SECTION) {
-			pr_warn("Node alignment %LuMB < min %LuMB, rejecting NUMA config\n",
-				PFN_PHYS(pfn_align) >> 20,
-				PFN_PHYS(PAGES_PER_SECTION) >> 20);
-			return -EINVAL;
-		}
-	}
+	err = numa_register_meminfo(mi);
+	if (err)
+		return err;
 
 	if (!memblock_validate_numa_coverage(SZ_1M))
 		return -EINVAL;
@@ -912,76 +623,3 @@ int memory_add_physaddr_to_nid(u64 start)
 EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
 
 #endif
-
-static int __init cmp_memblk(const void *a, const void *b)
-{
-	const struct numa_memblk *ma = *(const struct numa_memblk **)a;
-	const struct numa_memblk *mb = *(const struct numa_memblk **)b;
-
-	return (ma->start > mb->start) - (ma->start < mb->start);
-}
-
-static struct numa_memblk *numa_memblk_list[NR_NODE_MEMBLKS] __initdata;
-
-/**
- * numa_fill_memblks - Fill gaps in numa_meminfo memblks
- * @start: address to begin fill
- * @end: address to end fill
- *
- * Find and extend numa_meminfo memblks to cover the physical
- * address range @start-@end
- *
- * RETURNS:
- * 0		  : Success
- * NUMA_NO_MEMBLK : No memblks exist in address range @start-@end
- */
-
-int __init numa_fill_memblks(u64 start, u64 end)
-{
-	struct numa_memblk **blk = &numa_memblk_list[0];
-	struct numa_meminfo *mi = &numa_meminfo;
-	int count = 0;
-	u64 prev_end;
-
-	/*
-	 * Create a list of pointers to numa_meminfo memblks that
-	 * overlap start, end. The list is used to make in-place
-	 * changes that fill out the numa_meminfo memblks.
-	 */
-	for (int i = 0; i < mi->nr_blks; i++) {
-		struct numa_memblk *bi = &mi->blk[i];
-
-		if (memblock_addrs_overlap(start, end - start, bi->start,
-					   bi->end - bi->start)) {
-			blk[count] = &mi->blk[i];
-			count++;
-		}
-	}
-	if (!count)
-		return NUMA_NO_MEMBLK;
-
-	/* Sort the list of pointers in memblk->start order */
-	sort(&blk[0], count, sizeof(blk[0]), cmp_memblk, NULL);
-
-	/* Make sure the first/last memblks include start/end */
-	blk[0]->start = min(blk[0]->start, start);
-	blk[count - 1]->end = max(blk[count - 1]->end, end);
-
-	/*
-	 * Fill any gaps by tracking the previous memblks
-	 * end address and backfilling to it if needed.
-	 */
-	prev_end = blk[0]->end;
-	for (int i = 1; i < count; i++) {
-		struct numa_memblk *curr = blk[i];
-
-		if (prev_end >= curr->start) {
-			if (prev_end < curr->end)
-				prev_end = curr->end;
-		} else {
-			curr->start = prev_end;
-			prev_end = curr->end;
-		}
-	}
-	return 0;
-}
diff --git a/arch/x86/mm/numa_emulation.c b/arch/x86/mm/numa_emulation.c
index 235f8a4eb2fa..33610026b7a3 100644
--- a/arch/x86/mm/numa_emulation.c
+++ b/arch/x86/mm/numa_emulation.c
@@ -6,6 +6,7 @@
 #include <linux/errno.h>
 #include <linux/topology.h>
 #include <linux/memblock.h>
+#include <linux/numa_memblks.h>
 #include <asm/dma.h>
 
 #include "numa_internal.h"
diff --git a/arch/x86/mm/numa_internal.h b/arch/x86/mm/numa_internal.h
index 86860f279662..a51229a2f5af 100644
--- a/arch/x86/mm/numa_internal.h
+++ b/arch/x86/mm/numa_internal.h
@@ -5,23 +5,12 @@
 #include <linux/types.h>
 #include <asm/numa.h>
 
-struct numa_memblk {
-	u64			start;
-	u64			end;
-	int			nid;
-};
-
-struct numa_meminfo {
-	int			nr_blks;
-	struct numa_memblk	blk[NR_NODE_MEMBLKS];
-};
-
-void __init numa_remove_memblk_from(int idx, struct numa_meminfo *mi);
-int __init numa_cleanup_meminfo(struct numa_meminfo *mi);
 void __init numa_reset_distance(void);
 
 void __init x86_numa_init(void);
 
+struct numa_meminfo;
+
 #ifdef CONFIG_NUMA_EMU
 void __init numa_emulation(struct numa_meminfo *numa_meminfo,
 			   int numa_dist_cnt);
diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
index e3f26e71637a..6f2983cbe553 100644
--- a/drivers/acpi/numa/srat.c
+++ b/drivers/acpi/numa/srat.c
@@ -17,6 +17,7 @@
 #include <linux/numa.h>
 #include <linux/nodemask.h>
 #include <linux/topology.h>
+#include <linux/numa_memblks.h>
 
 static nodemask_t nodes_found_map = NODE_MASK_NONE;
 
diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index 5949829a1b00..838747e319a2 100644
--- a/drivers/of/of_numa.c
+++ b/drivers/of/of_numa.c
@@ -10,6 +10,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/nodemask.h>
+#include <linux/numa_memblks.h>
 
 #include <asm/numa.h>
 
diff --git a/include/linux/numa_memblks.h b/include/linux/numa_memblks.h
new file mode 100644
index 000000000000..6981cf97d2c9
--- /dev/null
+++ b/include/linux/numa_memblks.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __NUMA_MEMBLKS_H
+#define __NUMA_MEMBLKS_H
+
+#ifdef CONFIG_NUMA_MEMBLKS
+#include <linux/types.h>
+
+#define NR_NODE_MEMBLKS		(MAX_NUMNODES * 2)
+
+struct numa_memblk {
+	u64			start;
+	u64			end;
+	int			nid;
+};
+
+struct numa_meminfo {
+	int			nr_blks;
+	struct numa_memblk	blk[NR_NODE_MEMBLKS];
+};
+
+extern struct numa_meminfo numa_meminfo __initdata_or_meminfo;
+extern struct numa_meminfo numa_reserved_meminfo __initdata_or_meminfo;
+
+int __init numa_add_memblk(int nodeid, u64 start, u64 end);
+void __init numa_remove_memblk_from(int idx, struct numa_meminfo *mi);
+
+int __init numa_cleanup_meminfo(struct numa_meminfo *mi);
+int __init numa_register_meminfo(struct numa_meminfo *mi);
+
+void __init numa_nodemask_from_meminfo(nodemask_t *nodemask,
+				       const struct numa_meminfo *mi);
+
+#endif /* CONFIG_NUMA_MEMBLKS */
+
+#endif	/* __NUMA_MEMBLKS_H */
diff --git a/mm/Kconfig b/mm/Kconfig
index b4cb45255a54..15c6efbaa1df 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1249,6 +1249,9 @@ config IOMMU_MM_DATA
 config EXECMEM
 	bool
 
+config NUMA_MEMBLKS
+	bool
+
 source "mm/damon/Kconfig"
 
 endmenu
diff --git a/mm/Makefile b/mm/Makefile
index 773b3b267438..17bc4013a2c5 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -140,3 +140,4 @@ obj-$(CONFIG_GENERIC_IOREMAP) += ioremap.o
 obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
 obj-$(CONFIG_EXECMEM) += execmem.o
 obj-$(CONFIG_NUMA) += numa.o
+obj-$(CONFIG_NUMA_MEMBLKS) += numa_memblks.o
diff --git a/mm/numa_memblks.c b/mm/numa_memblks.c
new file mode 100644
index 000000000000..72f191a94c66
--- /dev/null
+++ b/mm/numa_memblks.c
@@ -0,0 +1,385 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/array_size.h>
+#include <linux/sort.h>
+#include <linux/printk.h>
+#include <linux/memblock.h>
+#include <linux/numa.h>
+#include <linux/numa_memblks.h>
+
+nodemask_t numa_nodes_parsed __initdata;
+
+struct numa_meminfo numa_meminfo __initdata_or_meminfo;
+struct numa_meminfo numa_reserved_meminfo __initdata_or_meminfo;
+
+static int __init numa_add_memblk_to(int nid, u64 start, u64 end,
+				     struct numa_meminfo *mi)
+{
+	/* ignore zero length blks */
+	if (start == end)
+		return 0;
+
+	/* whine about and ignore invalid blks */
+	if (start > end || nid < 0 || nid >= MAX_NUMNODES) {
+		pr_warn("Warning: invalid memblk node %d [mem %#010Lx-%#010Lx]\n",
+			nid, start, end - 1);
+		return 0;
+	}
+
+	if (mi->nr_blks >= NR_NODE_MEMBLKS) {
+		pr_err("too many memblk ranges\n");
+		return -EINVAL;
+	}
+
+	mi->blk[mi->nr_blks].start = start;
+	mi->blk[mi->nr_blks].end = end;
+	mi->blk[mi->nr_blks].nid = nid;
+	mi->nr_blks++;
+	return 0;
+}
+
+/**
+ * numa_remove_memblk_from - Remove one numa_memblk from a numa_meminfo
+ * @idx: Index of memblk to remove
+ * @mi: numa_meminfo to remove memblk from
+ *
+ * Remove @idx'th numa_memblk from @mi by shifting @mi->blk[] and
+ * decrementing @mi->nr_blks.
+ */
+void __init numa_remove_memblk_from(int idx, struct numa_meminfo *mi)
+{
+	mi->nr_blks--;
+	memmove(&mi->blk[idx], &mi->blk[idx + 1],
+		(mi->nr_blks - idx) * sizeof(mi->blk[0]));
+}
+
+/**
+ * numa_move_tail_memblk - Move a numa_memblk from one numa_meminfo to another
+ * @dst: numa_meminfo to append block to
+ * @idx: Index of memblk to remove
+ * @src: numa_meminfo to remove memblk from
+ */
+static void __init numa_move_tail_memblk(struct numa_meminfo *dst, int idx,
+					 struct numa_meminfo *src)
+{
+	dst->blk[dst->nr_blks++] = src->blk[idx];
+	numa_remove_memblk_from(idx, src);
+}
+
+/**
+ * numa_add_memblk - Add one numa_memblk to numa_meminfo
+ * @nid: NUMA node ID of the new memblk
+ * @start: Start address of the new memblk
+ * @end: End address of the new memblk
+ *
+ * Add a new memblk to the default numa_meminfo.
+ *
+ * RETURNS:
+ * 0 on success, -errno on failure.
+ */
+int __init numa_add_memblk(int nid, u64 start, u64 end)
+{
+	return numa_add_memblk_to(nid, start, end, &numa_meminfo);
+}
+
+/**
+ * numa_cleanup_meminfo - Cleanup a numa_meminfo
+ * @mi: numa_meminfo to clean up
+ *
+ * Sanitize @mi by merging and removing unnecessary memblks.  Also check for
+ * conflicts and clear unused memblks.
+ *
+ * RETURNS:
+ * 0 on success, -errno on failure.
+ */
+int __init numa_cleanup_meminfo(struct numa_meminfo *mi)
+{
+	const u64 low = 0;
+	const u64 high = PFN_PHYS(max_pfn);
+	int i, j, k;
+
+	/* first, trim all entries */
+	for (i = 0; i < mi->nr_blks; i++) {
+		struct numa_memblk *bi = &mi->blk[i];
+
+		/* move / save reserved memory ranges */
+		if (!memblock_overlaps_region(&memblock.memory,
+					bi->start, bi->end - bi->start)) {
+			numa_move_tail_memblk(&numa_reserved_meminfo, i--, mi);
+			continue;
+		}
+
+		/* make sure all non-reserved blocks are inside the limits */
+		bi->start = max(bi->start, low);
+
+		/* preserve info for non-RAM areas above 'max_pfn': */
+		if (bi->end > high) {
+			numa_add_memblk_to(bi->nid, high, bi->end,
+					   &numa_reserved_meminfo);
+			bi->end = high;
+		}
+
+		/* and there's no empty block */
+		if (bi->start >= bi->end)
+			numa_remove_memblk_from(i--, mi);
+	}
+
+	/* merge neighboring / overlapping entries */
+	for (i = 0; i < mi->nr_blks; i++) {
+		struct numa_memblk *bi = &mi->blk[i];
+
+		for (j = i + 1; j < mi->nr_blks; j++) {
+			struct numa_memblk *bj = &mi->blk[j];
+			u64 start, end;
+
+			/*
+			 * See whether there are overlapping blocks.  Whine
+			 * about but allow overlaps of the same nid.  They
+			 * will be merged below.
+			 */
+			if (bi->end > bj->start && bi->start < bj->end) {
+				if (bi->nid != bj->nid) {
+					pr_err("node %d [mem %#010Lx-%#010Lx] overlaps with node %d [mem %#010Lx-%#010Lx]\n",
+					       bi->nid, bi->start, bi->end - 1,
+					       bj->nid, bj->start, bj->end - 1);
+					return -EINVAL;
+				}
+				pr_warn("Warning: node %d [mem %#010Lx-%#010Lx] overlaps with itself [mem %#010Lx-%#010Lx]\n",
+					bi->nid, bi->start, bi->end - 1,
+					bj->start, bj->end - 1);
+			}
+
+			/*
+			 * Join together blocks on the same node, holes
+			 * between which don't overlap with memory on other
+			 * nodes.
+			 */
+			if (bi->nid != bj->nid)
+				continue;
+			start = min(bi->start, bj->start);
+			end = max(bi->end, bj->end);
+			for (k = 0; k < mi->nr_blks; k++) {
+				struct numa_memblk *bk = &mi->blk[k];
+
+				if (bi->nid == bk->nid)
+					continue;
+				if (start < bk->end && end > bk->start)
+					break;
+			}
+			if (k < mi->nr_blks)
+				continue;
+			pr_info("NUMA: Node %d [mem %#010Lx-%#010Lx] + [mem %#010Lx-%#010Lx] -> [mem %#010Lx-%#010Lx]\n",
+			       bi->nid, bi->start, bi->end - 1, bj->start,
+			       bj->end - 1, start, end - 1);
+			bi->start = start;
+			bi->end = end;
+			numa_remove_memblk_from(j--, mi);
+		}
+	}
+
+	/* clear unused ones */
+	for (i = mi->nr_blks; i < ARRAY_SIZE(mi->blk); i++) {
+		mi->blk[i].start = mi->blk[i].end = 0;
+		mi->blk[i].nid = NUMA_NO_NODE;
+	}
+
+	return 0;
+}
+
+/*
+ * Set nodes, which have memory in @mi, in *@nodemask.
+ */
+void __init numa_nodemask_from_meminfo(nodemask_t *nodemask,
+				       const struct numa_meminfo *mi)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mi->blk); i++)
+		if (mi->blk[i].start != mi->blk[i].end &&
+		    mi->blk[i].nid != NUMA_NO_NODE)
+			node_set(mi->blk[i].nid, *nodemask);
+}
+
+/*
+ * Mark all currently memblock-reserved physical memory (which covers the
+ * kernel's own memory ranges) as hot-unswappable.
+ */
+static void __init numa_clear_kernel_node_hotplug(void)
+{
+	nodemask_t reserved_nodemask = NODE_MASK_NONE;
+	struct memblock_region *mb_region;
+	int i;
+
+	/*
+	 * We have to do some preprocessing of memblock regions, to
+	 * make them suitable for reservation.
+	 *
+	 * At this time, all memory regions reserved by memblock are
+	 * used by the kernel, but those regions are not split up
+	 * along node boundaries yet, and don't necessarily have their
+	 * node ID set yet either.
+	 *
+	 * So iterate over all parsed memory blocks and use those ranges to
+	 * set the nid in memblock.reserved.  This will split up the
+	 * memblock regions along node boundaries and will set the node IDs
+	 * as well.
+	 */
+	for (i = 0; i < numa_meminfo.nr_blks; i++) {
+		struct numa_memblk *mb = numa_meminfo.blk + i;
+		int ret;
+
+		ret = memblock_set_node(mb->start, mb->end - mb->start,
+					&memblock.reserved, mb->nid);
+		WARN_ON_ONCE(ret);
+	}
+
+	/*
+	 * Now go over all reserved memblock regions, to construct a
+	 * node mask of all kernel reserved memory areas.
+	 *
+	 * [ Note, when booting with mem=nn[kMG] or in a kdump kernel,
+	 *   numa_meminfo might not include all memblock.reserved
+	 *   memory ranges, because quirks such as trim_snb_memory()
+	 *   reserve specific pages for Sandy Bridge graphics. ]
+	 */
+	for_each_reserved_mem_region(mb_region) {
+		int nid = memblock_get_region_node(mb_region);
+
+		if (nid != MAX_NUMNODES)
+			node_set(nid, reserved_nodemask);
+	}
+
+	/*
+	 * Finally, clear the MEMBLOCK_HOTPLUG flag for all memory
+	 * belonging to the reserved node mask.
+	 *
+	 * Note that this will include memory regions that reside
+	 * on nodes that contain kernel memory - entire nodes
+	 * become hot-unpluggable:
+	 */
+	for (i = 0; i < numa_meminfo.nr_blks; i++) {
+		struct numa_memblk *mb = numa_meminfo.blk + i;
+
+		if (!node_isset(mb->nid, reserved_nodemask))
+			continue;
+
+		memblock_clear_hotplug(mb->start, mb->end - mb->start);
+	}
+}
+
+int __init numa_register_meminfo(struct numa_meminfo *mi)
+{
+	int i;
+
+	/* Account for nodes with cpus and no memory */
+	node_possible_map = numa_nodes_parsed;
+	numa_nodemask_from_meminfo(&node_possible_map, mi);
+	if (WARN_ON(nodes_empty(node_possible_map)))
+		return -EINVAL;
+
+	for (i = 0; i < mi->nr_blks; i++) {
+		struct numa_memblk *mb = &mi->blk[i];
+
+		memblock_set_node(mb->start, mb->end - mb->start,
+				  &memblock.memory, mb->nid);
+	}
+
+	/*
+	 * At very early time, the kernel have to use some memory such as
+	 * loading the kernel image. We cannot prevent this anyway. So any
+	 * node the kernel resides in should be un-hotpluggable.
+	 *
+	 * And when we come here, alloc node data won't fail.
+	 */
+	numa_clear_kernel_node_hotplug();
+
+	/*
+	 * If sections array is gonna be used for pfn -> nid mapping, check
+	 * whether its granularity is fine enough.
+	 */
+	if (IS_ENABLED(NODE_NOT_IN_PAGE_FLAGS)) {
+		unsigned long pfn_align = node_map_pfn_alignment();
+
+		if (pfn_align && pfn_align < PAGES_PER_SECTION) {
+			pr_warn("Node alignment %LuMB < min %LuMB, rejecting NUMA config\n",
+				PFN_PHYS(pfn_align) >> 20,
+				PFN_PHYS(PAGES_PER_SECTION) >> 20);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int __init cmp_memblk(const void *a, const void *b)
+{
+	const struct numa_memblk *ma = *(const struct numa_memblk **)a;
+	const struct numa_memblk *mb = *(const struct numa_memblk **)b;
+
+	return (ma->start > mb->start) - (ma->start < mb->start);
+}
+
+static struct numa_memblk *numa_memblk_list[NR_NODE_MEMBLKS] __initdata;
+
+/**
+ * numa_fill_memblks - Fill gaps in numa_meminfo memblks
+ * @start: address to begin fill
+ * @end: address to end fill
+ *
+ * Find and extend numa_meminfo memblks to cover the physical
+ * address range @start-@end
+ *
+ * RETURNS:
+ * 0		  : Success
+ * NUMA_NO_MEMBLK : No memblks exist in address range @start-@end
+ */
+
+int __init numa_fill_memblks(u64 start, u64 end)
+{
+	struct numa_memblk **blk = &numa_memblk_list[0];
+	struct numa_meminfo *mi = &numa_meminfo;
+	int count = 0;
+	u64 prev_end;
+
+	/*
+	 * Create a list of pointers to numa_meminfo memblks that
+	 * overlap start, end. The list is used to make in-place
+	 * changes that fill out the numa_meminfo memblks.
+	 */
+	for (int i = 0; i < mi->nr_blks; i++) {
+		struct numa_memblk *bi = &mi->blk[i];
+
+		if (memblock_addrs_overlap(start, end - start, bi->start,
+					   bi->end - bi->start)) {
+			blk[count] = &mi->blk[i];
+			count++;
+		}
+	}
+	if (!count)
+		return NUMA_NO_MEMBLK;
+
+	/* Sort the list of pointers in memblk->start order */
+	sort(&blk[0], count, sizeof(blk[0]), cmp_memblk, NULL);
+
+	/* Make sure the first/last memblks include start/end */
+	blk[0]->start = min(blk[0]->start, start);
+	blk[count - 1]->end = max(blk[count - 1]->end, end);
+
+	/*
+	 * Fill any gaps by tracking the previous memblks
+	 * end address and backfilling to it if needed.
+	 */
+	prev_end = blk[0]->end;
+	for (int i = 1; i < count; i++) {
+		struct numa_memblk *curr = blk[i];
+
+		if (prev_end >= curr->start) {
+			if (prev_end < curr->end)
+				prev_end = curr->end;
+		} else {
+			curr->start = prev_end;
+			prev_end = curr->end;
+		}
+	}
+	return 0;
+}
-- 
2.43.0

