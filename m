Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B500932582
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 13:23:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UcvrWWAI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNcCG6nKBz3cYx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 21:23:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UcvrWWAI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNc2X5W0Sz3dBr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 21:16:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2BDB2CE130E;
	Tue, 16 Jul 2024 11:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BC8C116B1;
	Tue, 16 Jul 2024 11:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721128578;
	bh=pogWMmbNnCcAMxEldEcXlIF7vDUNrHIph+oQnzUgBrk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UcvrWWAIQbl3FFQkfDjwC2SdD1OdneqblN/fQ+McWzxzpiNWnDEuI9INqZBpAUiac
	 6cze/XMRw+pLZ4RpU2ECWQrpk+CLidDE5AX+eHrTO5kadU806iGp54d1x8DcdIqAak
	 OaJiemO15MxhvuILcxhfeq07xTV1zBzCf6S3KqDVt+de6AuFAb6RyJ4TN7GcMFCKcF
	 gtVUKVzIzR3D82aMj/6b6KdPivX8HT+xAiJ4f11yrAK1uSHfpLcG5VF1udrExV7zca
	 WxUdev+0YkrJeE+HKliTiulwlxpFHS2F+nSNa0TBGPk2fH9twhvAvopvHKQVL6T0Ua
	 VX20PF/A97DQA==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 13/17] mm: move numa_distance and related code from x86 to numa_memblks
Date: Tue, 16 Jul 2024 14:13:42 +0300
Message-ID: <20240716111346.3676969-14-rppt@kernel.org>
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

Move code dealing with numa_distance array from arch/x86 to
mm/numa_memblks.c

This code will be later reused by arch_numa.

No functional changes.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/numa.c                   | 101 ---------------------------
 arch/x86/mm/numa_internal.h          |   2 -
 include/linux/numa_memblks.h         |   4 ++
 {arch/x86/mm => mm}/numa_emulation.c |   0
 mm/numa_memblks.c                    | 101 +++++++++++++++++++++++++++
 5 files changed, 105 insertions(+), 103 deletions(-)
 rename {arch/x86/mm => mm}/numa_emulation.c (100%)

diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 8bc0b34c6ea2..3848e68d771a 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -24,9 +24,6 @@
 
 int numa_off;
 
-static int numa_distance_cnt;
-static u8 *numa_distance;
-
 static __init int numa_setup(char *opt)
 {
 	if (!opt)
@@ -118,104 +115,6 @@ void __init setup_node_to_cpumask_map(void)
 	pr_debug("Node to cpumask map for %u nodes\n", nr_node_ids);
 }
 
-/**
- * numa_reset_distance - Reset NUMA distance table
- *
- * The current table is freed.  The next numa_set_distance() call will
- * create a new one.
- */
-void __init numa_reset_distance(void)
-{
-	size_t size = numa_distance_cnt * numa_distance_cnt * sizeof(numa_distance[0]);
-
-	if (numa_distance)
-		memblock_free(numa_distance, size);
-	numa_distance_cnt = 0;
-	numa_distance = NULL;	/* enable table creation */
-}
-
-static int __init numa_alloc_distance(void)
-{
-	nodemask_t nodes_parsed;
-	size_t size;
-	int i, j, cnt = 0;
-
-	/* size the new table and allocate it */
-	nodes_parsed = numa_nodes_parsed;
-	numa_nodemask_from_meminfo(&nodes_parsed, &numa_meminfo);
-
-	for_each_node_mask(i, nodes_parsed)
-		cnt = i;
-	cnt++;
-	size = cnt * cnt * sizeof(numa_distance[0]);
-
-	numa_distance = memblock_alloc(size, PAGE_SIZE);
-	if (!numa_distance) {
-		pr_warn("Warning: can't allocate distance table!\n");
-		return -ENOMEM;
-	}
-
-	numa_distance_cnt = cnt;
-
-	/* fill with the default distances */
-	for (i = 0; i < cnt; i++)
-		for (j = 0; j < cnt; j++)
-			numa_distance[i * cnt + j] = i == j ?
-				LOCAL_DISTANCE : REMOTE_DISTANCE;
-	printk(KERN_DEBUG "NUMA: Initialized distance table, cnt=%d\n", cnt);
-
-	return 0;
-}
-
-/**
- * numa_set_distance - Set NUMA distance from one NUMA to another
- * @from: the 'from' node to set distance
- * @to: the 'to'  node to set distance
- * @distance: NUMA distance
- *
- * Set the distance from node @from to @to to @distance.  If distance table
- * doesn't exist, one which is large enough to accommodate all the currently
- * known nodes will be created.
- *
- * If such table cannot be allocated, a warning is printed and further
- * calls are ignored until the distance table is reset with
- * numa_reset_distance().
- *
- * If @from or @to is higher than the highest known node or lower than zero
- * at the time of table creation or @distance doesn't make sense, the call
- * is ignored.
- * This is to allow simplification of specific NUMA config implementations.
- */
-void __init numa_set_distance(int from, int to, int distance)
-{
-	if (!numa_distance && numa_alloc_distance() < 0)
-		return;
-
-	if (from >= numa_distance_cnt || to >= numa_distance_cnt ||
-			from < 0 || to < 0) {
-		pr_warn_once("Warning: node ids are out of bound, from=%d to=%d distance=%d\n",
-			     from, to, distance);
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
-int __node_distance(int from, int to)
-{
-	if (from >= numa_distance_cnt || to >= numa_distance_cnt)
-		return from == to ? LOCAL_DISTANCE : REMOTE_DISTANCE;
-	return numa_distance[from * numa_distance_cnt + to];
-}
-EXPORT_SYMBOL(__node_distance);
-
 static int __init numa_register_memblks(struct numa_meminfo *mi)
 {
 	int i, nid, err;
diff --git a/arch/x86/mm/numa_internal.h b/arch/x86/mm/numa_internal.h
index a51229a2f5af..249e3aaeadce 100644
--- a/arch/x86/mm/numa_internal.h
+++ b/arch/x86/mm/numa_internal.h
@@ -5,8 +5,6 @@
 #include <linux/types.h>
 #include <asm/numa.h>
 
-void __init numa_reset_distance(void);
-
 void __init x86_numa_init(void);
 
 struct numa_meminfo;
diff --git a/include/linux/numa_memblks.h b/include/linux/numa_memblks.h
index 6981cf97d2c9..968a590535ac 100644
--- a/include/linux/numa_memblks.h
+++ b/include/linux/numa_memblks.h
@@ -7,6 +7,10 @@
 
 #define NR_NODE_MEMBLKS		(MAX_NUMNODES * 2)
 
+extern int numa_distance_cnt;
+void __init numa_set_distance(int from, int to, int distance);
+void __init numa_reset_distance(void);
+
 struct numa_memblk {
 	u64			start;
 	u64			end;
diff --git a/arch/x86/mm/numa_emulation.c b/mm/numa_emulation.c
similarity index 100%
rename from arch/x86/mm/numa_emulation.c
rename to mm/numa_emulation.c
diff --git a/mm/numa_memblks.c b/mm/numa_memblks.c
index e31307317ca7..e0039549aaac 100644
--- a/mm/numa_memblks.c
+++ b/mm/numa_memblks.c
@@ -7,11 +7,112 @@
 #include <linux/numa.h>
 #include <linux/numa_memblks.h>
 
+int numa_distance_cnt;
+static u8 *numa_distance;
+
 nodemask_t numa_nodes_parsed __initdata;
 
 struct numa_meminfo numa_meminfo __initdata_or_meminfo;
 struct numa_meminfo numa_reserved_meminfo __initdata_or_meminfo;
 
+/**
+ * numa_reset_distance - Reset NUMA distance table
+ *
+ * The current table is freed.  The next numa_set_distance() call will
+ * create a new one.
+ */
+void __init numa_reset_distance(void)
+{
+	size_t size = numa_distance_cnt * numa_distance_cnt * sizeof(numa_distance[0]);
+
+	if (numa_distance)
+		memblock_free(numa_distance, size);
+	numa_distance_cnt = 0;
+	numa_distance = NULL;	/* enable table creation */
+}
+
+static int __init numa_alloc_distance(void)
+{
+	nodemask_t nodes_parsed;
+	size_t size;
+	int i, j, cnt = 0;
+
+	/* size the new table and allocate it */
+	nodes_parsed = numa_nodes_parsed;
+	numa_nodemask_from_meminfo(&nodes_parsed, &numa_meminfo);
+
+	for_each_node_mask(i, nodes_parsed)
+		cnt = i;
+	cnt++;
+	size = cnt * cnt * sizeof(numa_distance[0]);
+
+	numa_distance = memblock_alloc(size, PAGE_SIZE);
+	if (!numa_distance) {
+		pr_warn("Warning: can't allocate distance table!\n");
+		return -ENOMEM;
+	}
+
+	numa_distance_cnt = cnt;
+
+	/* fill with the default distances */
+	for (i = 0; i < cnt; i++)
+		for (j = 0; j < cnt; j++)
+			numa_distance[i * cnt + j] = i == j ?
+				LOCAL_DISTANCE : REMOTE_DISTANCE;
+	printk(KERN_DEBUG "NUMA: Initialized distance table, cnt=%d\n", cnt);
+
+	return 0;
+}
+
+/**
+ * numa_set_distance - Set NUMA distance from one NUMA to another
+ * @from: the 'from' node to set distance
+ * @to: the 'to'  node to set distance
+ * @distance: NUMA distance
+ *
+ * Set the distance from node @from to @to to @distance.  If distance table
+ * doesn't exist, one which is large enough to accommodate all the currently
+ * known nodes will be created.
+ *
+ * If such table cannot be allocated, a warning is printed and further
+ * calls are ignored until the distance table is reset with
+ * numa_reset_distance().
+ *
+ * If @from or @to is higher than the highest known node or lower than zero
+ * at the time of table creation or @distance doesn't make sense, the call
+ * is ignored.
+ * This is to allow simplification of specific NUMA config implementations.
+ */
+void __init numa_set_distance(int from, int to, int distance)
+{
+	if (!numa_distance && numa_alloc_distance() < 0)
+		return;
+
+	if (from >= numa_distance_cnt || to >= numa_distance_cnt ||
+			from < 0 || to < 0) {
+		pr_warn_once("Warning: node ids are out of bound, from=%d to=%d distance=%d\n",
+			     from, to, distance);
+		return;
+	}
+
+	if ((u8)distance != distance ||
+	    (from == to && distance != LOCAL_DISTANCE)) {
+		pr_warn_once("Warning: invalid distance parameter, from=%d to=%d distance=%d\n",
+			     from, to, distance);
+		return;
+	}
+
+	numa_distance[from * numa_distance_cnt + to] = distance;
+}
+
+int __node_distance(int from, int to)
+{
+	if (from >= numa_distance_cnt || to >= numa_distance_cnt)
+		return from == to ? LOCAL_DISTANCE : REMOTE_DISTANCE;
+	return numa_distance[from * numa_distance_cnt + to];
+}
+EXPORT_SYMBOL(__node_distance);
+
 static int __init numa_add_memblk_to(int nid, u64 start, u64 end,
 				     struct numa_meminfo *mi)
 {
-- 
2.43.0

