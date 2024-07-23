Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CBF939B41
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 08:59:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aifPEDXD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSp0V3KPVz3d81
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 16:59:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aifPEDXD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSnkH3JK0z3cbC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 16:46:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8667460187;
	Tue, 23 Jul 2024 06:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3718DC4AF13;
	Tue, 23 Jul 2024 06:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721717205;
	bh=Mej9sxLQixWGdmK565gFwBx2ByPl7rtL0f0ZPnxf/S8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aifPEDXDJfm59czghgzqn6gX2srkwMHjj0MDAYduHgsQYt3LGdewFa3vOyK8Dkumz
	 1HAs5r4jvJXbol55lz55vqk9ZcNeBu4vBBYJBnf5DTsEBF3Q6tPKOkOPEER240Uw29
	 4Gk6WKAuZBstvMWa7OmmJIJmjg37tfJXWJ9rKS3Q7lObr6Dd2VwwdoPNdtfsaGsdI2
	 vV0zrCVw7+zwfqJ/kHdVhStrolfdNSESoJho0dXlPRHtSnDLZia3RoJwCZ9oKUSo6C
	 JEqAEo3ng6ENYfKRpvmqa4razDCj+uioqxOiis3qh54kCu2BTqAMZVkdqr5+j0zQ9z
	 fWe8vNWTVnDlw==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 23/25] arch_numa: switch over to numa_memblks
Date: Tue, 23 Jul 2024 09:41:54 +0300
Message-ID: <20240723064156.4009477-24-rppt@kernel.org>
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

Until now arch_numa was directly translating firmware NUMA information
to memblock.

Using numa_memblks as an intermediate step has a few advantages:
* alignment with more battle tested x86 implementation
* availability of NUMA emulation
* maintaining node information for not yet populated memory

Replace current functionality related to numa_add_memblk() and
__node_distance() with the implementation based on numa_memblks and add
functions required by numa_emulation.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 drivers/base/Kconfig       |   1 +
 drivers/base/arch_numa.c   | 200 +++++++++++--------------------------
 include/asm-generic/numa.h |   6 +-
 3 files changed, 64 insertions(+), 143 deletions(-)

diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index 2b8fd6bb7da0..064eb52ff7e2 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -226,6 +226,7 @@ config GENERIC_ARCH_TOPOLOGY
 
 config GENERIC_ARCH_NUMA
 	bool
+	select NUMA_MEMBLKS
 	help
 	  Enable support for generic NUMA implementation. Currently, RISC-V
 	  and ARM64 use it.
diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index 2ebf12eab99f..806550239d08 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -12,14 +12,12 @@
 #include <linux/memblock.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/numa_memblks.h>
 
 #include <asm/sections.h>
 
-nodemask_t numa_nodes_parsed __initdata;
 static int cpu_to_node_map[NR_CPUS] = { [0 ... NR_CPUS-1] = NUMA_NO_NODE };
 
-static int numa_distance_cnt;
-static u8 *numa_distance;
 bool numa_off;
 
 static __init int numa_parse_early_param(char *opt)
@@ -28,6 +26,8 @@ static __init int numa_parse_early_param(char *opt)
 		return -EINVAL;
 	if (str_has_prefix(opt, "off"))
 		numa_off = true;
+	if (!strncmp(opt, "fake=", 5))
+		return numa_emu_cmdline(opt + 5);
 
 	return 0;
 }
@@ -59,6 +59,7 @@ EXPORT_SYMBOL(cpumask_of_node);
 
 #endif
 
+#ifndef CONFIG_NUMA_EMU
 static void numa_update_cpu(unsigned int cpu, bool remove)
 {
 	int nid = cpu_to_node(cpu);
@@ -81,6 +82,7 @@ void numa_remove_cpu(unsigned int cpu)
 {
 	numa_update_cpu(cpu, true);
 }
+#endif
 
 void numa_clear_node(unsigned int cpu)
 {
@@ -142,7 +144,7 @@ void __init early_map_cpu_to_node(unsigned int cpu, int nid)
 unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(__per_cpu_offset);
 
-int __init early_cpu_to_node(int cpu)
+int early_cpu_to_node(int cpu)
 {
 	return cpu_to_node_map[cpu];
 }
@@ -187,30 +189,6 @@ void __init setup_per_cpu_areas(void)
 }
 #endif
 
-/**
- * numa_add_memblk() - Set node id to memblk
- * @nid: NUMA node ID of the new memblk
- * @start: Start address of the new memblk
- * @end:  End address of the new memblk
- *
- * RETURNS:
- * 0 on success, -errno on failure.
- */
-int __init numa_add_memblk(int nid, u64 start, u64 end)
-{
-	int ret;
-
-	ret = memblock_set_node(start, (end - start), &memblock.memory, nid);
-	if (ret < 0) {
-		pr_err("memblock [0x%llx - 0x%llx] failed to add on node %d\n",
-			start, (end - 1), nid);
-		return ret;
-	}
-
-	node_set(nid, numa_nodes_parsed);
-	return ret;
-}
-
 /*
  * Initialize NODE_DATA for a node on the local memory
  */
@@ -226,116 +204,9 @@ static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
 	NODE_DATA(nid)->node_spanned_pages = end_pfn - start_pfn;
 }
 
-/*
- * numa_free_distance
- *
- * The current table is freed.
- */
-void __init numa_free_distance(void)
-{
-	size_t size;
-
-	if (!numa_distance)
-		return;
-
-	size = numa_distance_cnt * numa_distance_cnt *
-		sizeof(numa_distance[0]);
-
-	memblock_free(numa_distance, size);
-	numa_distance_cnt = 0;
-	numa_distance = NULL;
-}
-
-/*
- * Create a new NUMA distance table.
- */
-static int __init numa_alloc_distance(void)
-{
-	size_t size;
-	int i, j;
-
-	size = nr_node_ids * nr_node_ids * sizeof(numa_distance[0]);
-	numa_distance = memblock_alloc(size, PAGE_SIZE);
-	if (WARN_ON(!numa_distance))
-		return -ENOMEM;
-
-	numa_distance_cnt = nr_node_ids;
-
-	/* fill with the default distances */
-	for (i = 0; i < numa_distance_cnt; i++)
-		for (j = 0; j < numa_distance_cnt; j++)
-			numa_distance[i * numa_distance_cnt + j] = i == j ?
-				LOCAL_DISTANCE : REMOTE_DISTANCE;
-
-	pr_debug("Initialized distance table, cnt=%d\n", numa_distance_cnt);
-
-	return 0;
-}
-
-/**
- * numa_set_distance() - Set inter node NUMA distance from node to node.
- * @from: the 'from' node to set distance
- * @to: the 'to'  node to set distance
- * @distance: NUMA distance
- *
- * Set the distance from node @from to @to to @distance.
- * If distance table doesn't exist, a warning is printed.
- *
- * If @from or @to is higher than the highest known node or lower than zero
- * or @distance doesn't make sense, the call is ignored.
- */
-void __init numa_set_distance(int from, int to, int distance)
-{
-	if (!numa_distance) {
-		pr_warn_once("Warning: distance table not allocated yet\n");
-		return;
-	}
-
-	if (from >= numa_distance_cnt || to >= numa_distance_cnt ||
-			from < 0 || to < 0) {
-		pr_warn_once("Warning: node ids are out of bound, from=%d to=%d distance=%d\n",
-			    from, to, distance);
-		return;
-	}
-
-	if ((u8)distance != distance ||
-	    (from == to && distance != LOCAL_DISTANCE)) {
-		pr_warn_once("Warning: invalid distance parameter, from=%d to=%d distance=%d\n",
-			     from, to, distance);
-		return;
-	}
-
-	numa_distance[from * numa_distance_cnt + to] = distance;
-}
-
-/*
- * Return NUMA distance @from to @to
- */
-int __node_distance(int from, int to)
-{
-	if (from >= numa_distance_cnt || to >= numa_distance_cnt)
-		return from == to ? LOCAL_DISTANCE : REMOTE_DISTANCE;
-	return numa_distance[from * numa_distance_cnt + to];
-}
-EXPORT_SYMBOL(__node_distance);
-
 static int __init numa_register_nodes(void)
 {
 	int nid;
-	struct memblock_region *mblk;
-
-	/* Check that valid nid is set to memblks */
-	for_each_mem_region(mblk) {
-		int mblk_nid = memblock_get_region_node(mblk);
-		phys_addr_t start = mblk->base;
-		phys_addr_t end = mblk->base + mblk->size - 1;
-
-		if (mblk_nid == NUMA_NO_NODE || mblk_nid >= MAX_NUMNODES) {
-			pr_warn("Warning: invalid memblk node %d [mem %pap-%pap]\n",
-				mblk_nid, &start, &end);
-			return -EINVAL;
-		}
-	}
 
 	/* Finally register nodes. */
 	for_each_node_mask(nid, numa_nodes_parsed) {
@@ -360,11 +231,7 @@ static int __init numa_init(int (*init_func)(void))
 	nodes_clear(node_possible_map);
 	nodes_clear(node_online_map);
 
-	ret = numa_alloc_distance();
-	if (ret < 0)
-		return ret;
-
-	ret = init_func();
+	ret = numa_memblks_init(init_func, /* memblock_force_top_down */ false);
 	if (ret < 0)
 		goto out_free_distance;
 
@@ -382,7 +249,7 @@ static int __init numa_init(int (*init_func)(void))
 
 	return 0;
 out_free_distance:
-	numa_free_distance();
+	numa_reset_distance();
 	return ret;
 }
 
@@ -454,3 +321,54 @@ void __init arch_numa_init(void)
 
 	numa_init(dummy_numa_init);
 }
+
+#ifdef CONFIG_NUMA_EMU
+void __init numa_emu_update_cpu_to_node(int *emu_nid_to_phys,
+					unsigned int nr_emu_nids)
+{
+	int i, j;
+
+	/*
+	 * Transform cpu_to_node_map table to use emulated nids by
+	 * reverse-mapping phys_nid.  The maps should always exist but fall
+	 * back to zero just in case.
+	 */
+	for (i = 0; i < ARRAY_SIZE(cpu_to_node_map); i++) {
+		if (cpu_to_node_map[i] == NUMA_NO_NODE)
+			continue;
+		for (j = 0; j < nr_emu_nids; j++)
+			if (cpu_to_node_map[i] == emu_nid_to_phys[j])
+				break;
+		cpu_to_node_map[i] = j < nr_emu_nids ? j : 0;
+	}
+}
+
+u64 __init numa_emu_dma_end(void)
+{
+	return PFN_PHYS(memblock_start_of_DRAM() + SZ_4G);
+}
+
+void debug_cpumask_set_cpu(unsigned int cpu, int node, bool enable)
+{
+	struct cpumask *mask;
+
+	if (node == NUMA_NO_NODE)
+		return;
+
+	mask = node_to_cpumask_map[node];
+	if (!cpumask_available(mask)) {
+		pr_err("node_to_cpumask_map[%i] NULL\n", node);
+		dump_stack();
+		return;
+	}
+
+	if (enable)
+		cpumask_set_cpu(cpu, mask);
+	else
+		cpumask_clear_cpu(cpu, mask);
+
+	pr_debug("%s cpu %d node %d: mask now %*pbl\n",
+		 enable ? "numa_add_cpu" : "numa_remove_cpu",
+		 cpu, node, cpumask_pr_args(mask));
+}
+#endif /* CONFIG_NUMA_EMU */
diff --git a/include/asm-generic/numa.h b/include/asm-generic/numa.h
index c32e0cf23c90..c2b046d1fd82 100644
--- a/include/asm-generic/numa.h
+++ b/include/asm-generic/numa.h
@@ -32,8 +32,6 @@ static inline const struct cpumask *cpumask_of_node(int node)
 
 void __init arch_numa_init(void);
 int __init numa_add_memblk(int nodeid, u64 start, u64 end);
-void __init numa_set_distance(int from, int to, int distance);
-void __init numa_free_distance(void);
 void __init early_map_cpu_to_node(unsigned int cpu, int nid);
 int __init early_cpu_to_node(int cpu);
 void numa_store_cpu_info(unsigned int cpu);
@@ -51,4 +49,8 @@ static inline int early_cpu_to_node(int cpu) { return 0; }
 
 #endif	/* CONFIG_NUMA */
 
+#ifdef CONFIG_NUMA_EMU
+void debug_cpumask_set_cpu(unsigned int cpu, int node, bool enable);
+#endif
+
 #endif	/* __ASM_GENERIC_NUMA_H */
-- 
2.43.0

