Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4B493258C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 13:25:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DR/UKOJ/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNcDr6rRsz3dHM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 21:25:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DR/UKOJ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNc2w5KSPz3dHD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 21:16:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4CDBECE12F9;
	Tue, 16 Jul 2024 11:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4143C116B1;
	Tue, 16 Jul 2024 11:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721128598;
	bh=7Q9+Mq1OzbCzQ3l6qZ8hFadj8WwRPzHvJheGL7bczxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DR/UKOJ/h4uG7SYpNzlc2X9CWTUegBVq7/FEDSICT5v7b5oob5MruZ1Km9M+sBk9w
	 CrSZGTKrdq+1umF3gBmMGFcaZCoC89EDdmv5WrJaNrdVnw4l1yMWg59lcltDPFCz1C
	 c8WIvtqlHUvYvghfdoL+3hTZwAkV1bCk5YQWIGnPNU+6jfjgj4LABXzboYg8GzruEv
	 7bQ8ryZxvJODCU7frKDMJK8TrhBuw74SWFDmRevbWL2HWc9qWBEUfYl8qlYurs2SfG
	 lMCnTuVPllpeAO8ytYEKcrt5eEcNZcGUU9XEKzAjRzy1dM1dHsXD2cV4R1kri25vkc
	 +ode6C8uopYbw==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 15/17] mm: make numa_memblks more self-contained
Date: Tue, 16 Jul 2024 14:13:44 +0300
Message-ID: <20240716111346.3676969-16-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716111346.3676969-1-rppt@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Introduce numa_memblks_init() and move some code around to avoid several
global variables in numa_memblks.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/numa.c           | 53 ++++---------------------
 include/linux/numa_memblks.h |  9 +----
 mm/numa_memblks.c            | 77 +++++++++++++++++++++++++++---------
 3 files changed, 68 insertions(+), 71 deletions(-)

diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 3848e68d771a..16bc703c9272 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -115,30 +115,19 @@ void __init setup_node_to_cpumask_map(void)
 	pr_debug("Node to cpumask map for %u nodes\n", nr_node_ids);
 }
 
-static int __init numa_register_memblks(struct numa_meminfo *mi)
+static int __init numa_register_nodes(void)
 {
-	int i, nid, err;
-
-	err = numa_register_meminfo(mi);
-	if (err)
-		return err;
+	int nid;
 
 	if (!memblock_validate_numa_coverage(SZ_1M))
 		return -EINVAL;
 
 	/* Finally register nodes. */
 	for_each_node_mask(nid, node_possible_map) {
-		u64 start = PFN_PHYS(max_pfn);
-		u64 end = 0;
-
-		for (i = 0; i < mi->nr_blks; i++) {
-			if (nid != mi->blk[i].nid)
-				continue;
-			start = min(mi->blk[i].start, start);
-			end = max(mi->blk[i].end, end);
-		}
+		unsigned long start_pfn, end_pfn;
 
-		if (start >= end)
+		get_pfn_range_for_nid(nid, &start_pfn, &end_pfn);
+		if (start_pfn >= end_pfn)
 			continue;
 
 		alloc_node_data(nid);
@@ -178,39 +167,11 @@ static int __init numa_init(int (*init_func)(void))
 	for (i = 0; i < MAX_LOCAL_APIC; i++)
 		set_apicid_to_node(i, NUMA_NO_NODE);
 
-	nodes_clear(numa_nodes_parsed);
-	nodes_clear(node_possible_map);
-	nodes_clear(node_online_map);
-	memset(&numa_meminfo, 0, sizeof(numa_meminfo));
-	WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.memory,
-				  NUMA_NO_NODE));
-	WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.reserved,
-				  NUMA_NO_NODE));
-	/* In case that parsing SRAT failed. */
-	WARN_ON(memblock_clear_hotplug(0, ULLONG_MAX));
-	numa_reset_distance();
-
-	ret = init_func();
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * We reset memblock back to the top-down direction
-	 * here because if we configured ACPI_NUMA, we have
-	 * parsed SRAT in init_func(). It is ok to have the
-	 * reset here even if we did't configure ACPI_NUMA
-	 * or acpi numa init fails and fallbacks to dummy
-	 * numa init.
-	 */
-	memblock_set_bottom_up(false);
-
-	ret = numa_cleanup_meminfo(&numa_meminfo);
+	ret = numa_memblks_init(init_func, /* memblock_force_top_down */ true);
 	if (ret < 0)
 		return ret;
 
-	numa_emulation(&numa_meminfo, numa_distance_cnt);
-
-	ret = numa_register_memblks(&numa_meminfo);
+	ret = numa_register_nodes();
 	if (ret < 0)
 		return ret;
 
diff --git a/include/linux/numa_memblks.h b/include/linux/numa_memblks.h
index f81f98678074..5c6e12ad0b7a 100644
--- a/include/linux/numa_memblks.h
+++ b/include/linux/numa_memblks.h
@@ -7,7 +7,6 @@
 
 #define NR_NODE_MEMBLKS		(MAX_NUMNODES * 2)
 
-extern int numa_distance_cnt;
 void __init numa_set_distance(int from, int to, int distance);
 void __init numa_reset_distance(void);
 
@@ -22,17 +21,13 @@ struct numa_meminfo {
 	struct numa_memblk	blk[NR_NODE_MEMBLKS];
 };
 
-extern struct numa_meminfo numa_meminfo __initdata_or_meminfo;
-extern struct numa_meminfo numa_reserved_meminfo __initdata_or_meminfo;
-
 int __init numa_add_memblk(int nodeid, u64 start, u64 end);
 void __init numa_remove_memblk_from(int idx, struct numa_meminfo *mi);
 
 int __init numa_cleanup_meminfo(struct numa_meminfo *mi);
-int __init numa_register_meminfo(struct numa_meminfo *mi);
 
-void __init numa_nodemask_from_meminfo(nodemask_t *nodemask,
-				       const struct numa_meminfo *mi);
+int __init numa_memblks_init(int (*init_func)(void),
+			     bool memblock_force_top_down);
 
 #ifdef CONFIG_NUMA_EMU
 int numa_emu_cmdline(char *str);
diff --git a/mm/numa_memblks.c b/mm/numa_memblks.c
index e0039549aaac..640f3a3ce0ee 100644
--- a/mm/numa_memblks.c
+++ b/mm/numa_memblks.c
@@ -7,13 +7,27 @@
 #include <linux/numa.h>
 #include <linux/numa_memblks.h>
 
-int numa_distance_cnt;
+static int numa_distance_cnt;
 static u8 *numa_distance;
 
 nodemask_t numa_nodes_parsed __initdata;
 
-struct numa_meminfo numa_meminfo __initdata_or_meminfo;
-struct numa_meminfo numa_reserved_meminfo __initdata_or_meminfo;
+static struct numa_meminfo numa_meminfo __initdata_or_meminfo;
+static struct numa_meminfo numa_reserved_meminfo __initdata_or_meminfo;
+
+/*
+ * Set nodes, which have memory in @mi, in *@nodemask.
+ */
+static void __init numa_nodemask_from_meminfo(nodemask_t *nodemask,
+					      const struct numa_meminfo *mi)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mi->blk); i++)
+		if (mi->blk[i].start != mi->blk[i].end &&
+		    mi->blk[i].nid != NUMA_NO_NODE)
+			node_set(mi->blk[i].nid, *nodemask);
+}
 
 /**
  * numa_reset_distance - Reset NUMA distance table
@@ -287,20 +301,6 @@ int __init numa_cleanup_meminfo(struct numa_meminfo *mi)
 	return 0;
 }
 
-/*
- * Set nodes, which have memory in @mi, in *@nodemask.
- */
-void __init numa_nodemask_from_meminfo(nodemask_t *nodemask,
-				       const struct numa_meminfo *mi)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(mi->blk); i++)
-		if (mi->blk[i].start != mi->blk[i].end &&
-		    mi->blk[i].nid != NUMA_NO_NODE)
-			node_set(mi->blk[i].nid, *nodemask);
-}
-
 /*
  * Mark all currently memblock-reserved physical memory (which covers the
  * kernel's own memory ranges) as hot-unswappable.
@@ -368,7 +368,7 @@ static void __init numa_clear_kernel_node_hotplug(void)
 	}
 }
 
-int __init numa_register_meminfo(struct numa_meminfo *mi)
+static int __init numa_register_meminfo(struct numa_meminfo *mi)
 {
 	int i;
 
@@ -412,6 +412,47 @@ int __init numa_register_meminfo(struct numa_meminfo *mi)
 	return 0;
 }
 
+int __init numa_memblks_init(int (*init_func)(void),
+			     bool memblock_force_top_down)
+{
+	int ret;
+
+	nodes_clear(numa_nodes_parsed);
+	nodes_clear(node_possible_map);
+	nodes_clear(node_online_map);
+	memset(&numa_meminfo, 0, sizeof(numa_meminfo));
+	WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.memory,
+				  NUMA_NO_NODE));
+	WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.reserved,
+				  NUMA_NO_NODE));
+	/* In case that parsing SRAT failed. */
+	WARN_ON(memblock_clear_hotplug(0, ULLONG_MAX));
+	numa_reset_distance();
+
+	ret = init_func();
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * We reset memblock back to the top-down direction
+	 * here because if we configured ACPI_NUMA, we have
+	 * parsed SRAT in init_func(). It is ok to have the
+	 * reset here even if we did't configure ACPI_NUMA
+	 * or acpi numa init fails and fallbacks to dummy
+	 * numa init.
+	 */
+	if (memblock_force_top_down)
+		memblock_set_bottom_up(false);
+
+	ret = numa_cleanup_meminfo(&numa_meminfo);
+	if (ret < 0)
+		return ret;
+
+	numa_emulation(&numa_meminfo, numa_distance_cnt);
+
+	return numa_register_meminfo(&numa_meminfo);
+}
+
 static int __init cmp_memblk(const void *a, const void *b)
 {
 	const struct numa_memblk *ma = *(const struct numa_memblk **)a;
-- 
2.43.0

