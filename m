Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BAA4582CF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Nov 2021 10:46:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HxlsD6yF0z301K
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Nov 2021 20:46:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HxlrN5Rnzz3cNH
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Nov 2021 20:45:24 +1100 (AEDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HxlL81cp5z1DJ4B;
 Sun, 21 Nov 2021 17:22:40 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 21 Nov 2021 17:25:08 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 21 Nov 2021 17:25:07 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <dennis@kernel.org>, <akpm@linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
Subject: [PATCH RFC 3/4] mm: percpu: Add generic pcpu_fc_alloc/free funciton
Date: Sun, 21 Nov 2021 17:35:56 +0800
Message-ID: <20211121093557.139034-4-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
References: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, linux-ia64@vger.kernel.org,
 dave.hansen@linux.intel.com, paulus@samba.org, hpa@zytor.com,
 sparclinux@vger.kernel.org, cl@linux.com, will@kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, mingo@redhat.com,
 catalin.marinas@arm.com, aou@eecs.berkeley.edu, bp@alien8.de,
 paul.walmsley@sifive.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, tsbogend@alpha.franken.de,
 gregkh@linuxfoundation.org, linux-mips@vger.kernel.org, palmer@dabbelt.com,
 tj@kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With previous patch, we could add a generic pcpu first chunk
allocation and free function to cleanup the duplicated definations
on each architecture.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/mips/mm/init.c            | 16 +--------
 arch/powerpc/kernel/setup_64.c | 51 ++------------------------
 arch/sparc/kernel/smp_64.c     | 50 +-------------------------
 arch/x86/kernel/setup_percpu.c | 59 +-----------------------------
 drivers/base/arch_numa.c       | 19 +---------
 include/linux/percpu.h         |  9 +----
 mm/percpu.c                    | 66 ++++++++++++++++++----------------
 7 files changed, 42 insertions(+), 228 deletions(-)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index ebbf6923532c..5a8002839550 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -524,19 +524,6 @@ static int __init pcpu_cpu_to_node(int cpu)
 	return cpu_to_node(cpu);
 }
 
-static void * __init pcpu_fc_alloc(unsigned int cpu, size_t size, size_t align,
-				   pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
-{
-	return memblock_alloc_try_nid(size, align, __pa(MAX_DMA_ADDRESS),
-				      MEMBLOCK_ALLOC_ACCESSIBLE,
-				      cpu_to_nd_fun(cpu));
-}
-
-static void __init pcpu_fc_free(void *ptr, size_t size)
-{
-	memblock_free(ptr, size);
-}
-
 void __init setup_per_cpu_areas(void)
 {
 	unsigned long delta;
@@ -550,8 +537,7 @@ void __init setup_per_cpu_areas(void)
 	rc = pcpu_embed_first_chunk(PERCPU_MODULE_RESERVE,
 				    PERCPU_DYNAMIC_RESERVE, PAGE_SIZE,
 				    pcpu_cpu_distance,
-				    pcpu_cpu_to_node,
-				    pcpu_fc_alloc, pcpu_fc_free);
+				    pcpu_cpu_to_node);
 	if (rc < 0)
 		panic("Failed to initialize percpu areas.");
 
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 9a5609c821df..364b1567f822 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -777,50 +777,6 @@ static __init int pcpu_cpu_to_node(int cpu)
 	return IS_ENABLED(CONFIG_NUMA) ? early_cpu_to_node(cpu) : NUMA_NO_NODE;
 }
 
-/**
- * pcpu_alloc_bootmem - NUMA friendly alloc_bootmem wrapper for percpu
- * @cpu: cpu to allocate for
- * @size: size allocation in bytes
- * @align: alignment
- *
- * Allocate @size bytes aligned at @align for cpu @cpu.  This wrapper
- * does the right thing for NUMA regardless of the current
- * configuration.
- *
- * RETURNS:
- * Pointer to the allocated area on success, NULL on failure.
- */
-static void * __init pcpu_alloc_bootmem(unsigned int cpu, size_t size, size_t align,
-					pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
-{
-	const unsigned long goal = __pa(MAX_DMA_ADDRESS);
-#ifdef CONFIG_NUMA
-	int node = cpu_to_nd_fun(cpu);
-	void *ptr;
-
-	if (!node_online(node) || !NODE_DATA(node)) {
-		ptr = memblock_alloc_from(size, align, goal);
-		pr_info("cpu %d has no node %d or node-local memory\n",
-			cpu, node);
-		pr_debug("per cpu data for cpu%d %lu bytes at %016lx\n",
-			 cpu, size, __pa(ptr));
-	} else {
-		ptr = memblock_alloc_try_nid(size, align, goal,
-					     MEMBLOCK_ALLOC_ACCESSIBLE, node);
-		pr_debug("per cpu data for cpu%d %lu bytes on node%d at "
-			 "%016lx\n", cpu, size, node, __pa(ptr));
-	}
-	return ptr;
-#else
-	return memblock_alloc_from(size, align, goal);
-#endif
-}
-
-static void __init pcpu_free_bootmem(void *ptr, size_t size)
-{
-	memblock_free(ptr, size);
-}
-
 static int pcpu_cpu_distance(unsigned int from, unsigned int to)
 {
 	if (early_cpu_to_node(from) == early_cpu_to_node(to))
@@ -897,8 +853,7 @@ void __init setup_per_cpu_areas(void)
 
 	if (pcpu_chosen_fc != PCPU_FC_PAGE) {
 		rc = pcpu_embed_first_chunk(0, dyn_size, atom_size, pcpu_cpu_distance,
-					    pcpu_cpu_to_node,
-					    pcpu_alloc_bootmem, pcpu_free_bootmem);
+					    pcpu_cpu_to_node);
 		if (rc)
 			pr_warn("PERCPU: %s allocator failed (%d), "
 				"falling back to page size\n",
@@ -906,9 +861,7 @@ void __init setup_per_cpu_areas(void)
 	}
 
 	if (rc < 0)
-		rc = pcpu_page_first_chunk(0, pcpu_alloc_bootmem, pcpu_free_bootmem,
-					   pcpu_cpu_to_node,
-					   pcpu_populate_pte);
+		rc = pcpu_page_first_chunk(0, pcpu_cpu_to_node, pcpu_populate_pte);
 	if (rc < 0)
 		panic("cannot initialize percpu area (err=%d)", rc);
 
diff --git a/arch/sparc/kernel/smp_64.c b/arch/sparc/kernel/smp_64.c
index 026aa3ccbc30..198dadddb75d 100644
--- a/arch/sparc/kernel/smp_64.c
+++ b/arch/sparc/kernel/smp_64.c
@@ -1526,50 +1526,6 @@ void smp_send_stop(void)
 		smp_call_function(stop_this_cpu, NULL, 0);
 }
 
-/**
- * pcpu_alloc_bootmem - NUMA friendly alloc_bootmem wrapper for percpu
- * @cpu: cpu to allocate for
- * @size: size allocation in bytes
- * @align: alignment
- *
- * Allocate @size bytes aligned at @align for cpu @cpu.  This wrapper
- * does the right thing for NUMA regardless of the current
- * configuration.
- *
- * RETURNS:
- * Pointer to the allocated area on success, NULL on failure.
- */
-static void * __init pcpu_alloc_bootmem(unsigned int cpu, size_t size, size_t align,
-					pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
-{
-	const unsigned long goal = __pa(MAX_DMA_ADDRESS);
-#ifdef CONFIG_NUMA
-	int node = cpu_to_nd_fn(cpu);
-	void *ptr;
-
-	if (!node_online(node) || !NODE_DATA(node)) {
-		ptr = memblock_alloc_from(size, align, goal);
-		pr_info("cpu %d has no node %d or node-local memory\n",
-			cpu, node);
-		pr_debug("per cpu data for cpu%d %lu bytes at %016lx\n",
-			 cpu, size, __pa(ptr));
-	} else {
-		ptr = memblock_alloc_try_nid(size, align, goal,
-					     MEMBLOCK_ALLOC_ACCESSIBLE, node);
-		pr_debug("per cpu data for cpu%d %lu bytes on node%d at "
-			 "%016lx\n", cpu, size, node, __pa(ptr));
-	}
-	return ptr;
-#else
-	return memblock_alloc_from(size, align, goal);
-#endif
-}
-
-static void __init pcpu_free_bootmem(void *ptr, size_t size)
-{
-	memblock_free(ptr, size);
-}
-
 static int __init pcpu_cpu_distance(unsigned int from, unsigned int to)
 {
 	if (cpu_to_node(from) == cpu_to_node(to))
@@ -1641,9 +1597,7 @@ void __init setup_per_cpu_areas(void)
 		rc = pcpu_embed_first_chunk(PERCPU_MODULE_RESERVE,
 					    PERCPU_DYNAMIC_RESERVE, 4 << 20,
 					    pcpu_cpu_distance,
-					    cpu_to_node,
-					    pcpu_alloc_bootmem,
-					    pcpu_free_bootmem);
+					    cpu_to_node);
 		if (rc)
 			pr_warn("PERCPU: %s allocator failed (%d), "
 				"falling back to page size\n",
@@ -1651,8 +1605,6 @@ void __init setup_per_cpu_areas(void)
 	}
 	if (rc < 0)
 		rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE,
-					   pcpu_alloc_bootmem,
-					   pcpu_free_bootmem,
 					   cpu_to_node,
 					   pcpu_populate_pte);
 	if (rc < 0)
diff --git a/arch/x86/kernel/setup_percpu.c b/arch/x86/kernel/setup_percpu.c
index bba4fa174a16..cd672bd46241 100644
--- a/arch/x86/kernel/setup_percpu.c
+++ b/arch/x86/kernel/setup_percpu.c
@@ -84,61 +84,6 @@ static bool __init pcpu_need_numa(void)
 }
 #endif
 
-/**
- * pcpu_alloc_bootmem - NUMA friendly alloc_bootmem wrapper for percpu
- * @cpu: cpu to allocate for
- * @size: size allocation in bytes
- * @align: alignment
- *
- * Allocate @size bytes aligned at @align for cpu @cpu.  This wrapper
- * does the right thing for NUMA regardless of the current
- * configuration.
- *
- * RETURNS:
- * Pointer to the allocated area on success, NULL on failure.
- */
-static void * __init pcpu_alloc_bootmem(unsigned int cpu, unsigned long size, unsigned long align,
-					pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
-{
-	const unsigned long goal = __pa(MAX_DMA_ADDRESS);
-#ifdef CONFIG_NUMA
-	int node = cpu_to_nd_fn(cpu);
-	void *ptr;
-
-	if (!node_online(node) || !NODE_DATA(node)) {
-		ptr = memblock_alloc_from(size, align, goal);
-		pr_info("cpu %d has no node %d or node-local memory\n",
-			cpu, node);
-		pr_debug("per cpu data for cpu%d %lu bytes at %016lx\n",
-			 cpu, size, __pa(ptr));
-	} else {
-		ptr = memblock_alloc_try_nid(size, align, goal,
-					     MEMBLOCK_ALLOC_ACCESSIBLE,
-					     node);
-
-		pr_debug("per cpu data for cpu%d %lu bytes on node%d at %016lx\n",
-			 cpu, size, node, __pa(ptr));
-	}
-	return ptr;
-#else
-	return memblock_alloc_from(size, align, goal);
-#endif
-}
-
-/*
- * Helpers for first chunk memory allocation
- */
-static void * __init pcpu_fc_alloc(unsigned int cpu, size_t size, size_t align,
-				   pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
-{
-	return pcpu_alloc_bootmem(cpu, size, align, cpu_to_nd_fn);
-}
-
-static void __init pcpu_fc_free(void *ptr, size_t size)
-{
-	memblock_free(ptr, size);
-}
-
 static int __init pcpu_cpu_distance(unsigned int from, unsigned int to)
 {
 #ifdef CONFIG_NUMA
@@ -211,15 +156,13 @@ void __init setup_per_cpu_areas(void)
 		rc = pcpu_embed_first_chunk(PERCPU_FIRST_CHUNK_RESERVE,
 					    dyn_size, atom_size,
 					    pcpu_cpu_distance,
-					    pcpu_cpu_to_node,
-					    pcpu_fc_alloc, pcpu_fc_free);
+					    pcpu_cpu_to_node);
 		if (rc < 0)
 			pr_warn("%s allocator failed (%d), falling back to page size\n",
 				pcpu_fc_names[pcpu_chosen_fc], rc);
 	}
 	if (rc < 0)
 		rc = pcpu_page_first_chunk(PERCPU_FIRST_CHUNK_RESERVE,
-					   pcpu_fc_alloc, pcpu_fc_free,
 					   pcpu_cpu_to_node,
 					   pcpup_populate_pte);
 	if (rc < 0)
diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index 273543d9ff85..23a10cc36165 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -155,20 +155,6 @@ static int __init pcpu_cpu_distance(unsigned int from, unsigned int to)
 	return node_distance(early_cpu_to_node(from), early_cpu_to_node(to));
 }
 
-static void * __init pcpu_fc_alloc(unsigned int cpu, size_t size, size_t align,
-				   pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
-{
-	int nid = cpu_to_nd_fn(cpu);
-
-	return  memblock_alloc_try_nid(size, align,
-			__pa(MAX_DMA_ADDRESS), MEMBLOCK_ALLOC_ACCESSIBLE, nid);
-}
-
-static void __init pcpu_fc_free(void *ptr, size_t size)
-{
-	memblock_free(ptr, size);
-}
-
 #ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
 static void __init pcpu_populate_pte(unsigned long addr)
 {
@@ -229,8 +215,7 @@ void __init setup_per_cpu_areas(void)
 		rc = pcpu_embed_first_chunk(PERCPU_MODULE_RESERVE,
 					    PERCPU_DYNAMIC_RESERVE, PAGE_SIZE,
 					    pcpu_cpu_distance,
-					    early_cpu_to_node,
-					    pcpu_fc_alloc, pcpu_fc_free);
+					    early_cpu_to_node);
 #ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
 		if (rc < 0)
 			pr_warn("PERCPU: %s allocator failed (%d), falling back to page size\n",
@@ -241,8 +226,6 @@ void __init setup_per_cpu_areas(void)
 #ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
 	if (rc < 0)
 		rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE,
-					   pcpu_fc_alloc,
-					   pcpu_fc_free,
 					   early_cpu_to_node,
 					   pcpu_populate_pte);
 #endif
diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index 41bb54715b0c..d73c97ef4ff4 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -95,9 +95,6 @@ extern const char * const pcpu_fc_names[PCPU_FC_NR];
 extern enum pcpu_fc pcpu_chosen_fc;
 
 typedef int (pcpu_fc_cpu_to_node_fn_t)(int cpu);
-typedef void * (*pcpu_fc_alloc_fn_t)(unsigned int cpu, size_t size, size_t align,
-				     pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn);
-typedef void (*pcpu_fc_free_fn_t)(void *ptr, size_t size);
 typedef void (*pcpu_fc_populate_pte_fn_t)(unsigned long addr);
 typedef int (pcpu_fc_cpu_distance_fn_t)(unsigned int from, unsigned int to);
 
@@ -112,15 +109,11 @@ extern void __init pcpu_setup_first_chunk(const struct pcpu_alloc_info *ai,
 extern int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
 				size_t atom_size,
 				pcpu_fc_cpu_distance_fn_t cpu_distance_fn,
-				pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn,
-				pcpu_fc_alloc_fn_t alloc_fn,
-				pcpu_fc_free_fn_t free_fn);
+				pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn);
 #endif
 
 #ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
 extern int __init pcpu_page_first_chunk(size_t reserved_size,
-				pcpu_fc_alloc_fn_t alloc_fn,
-				pcpu_fc_free_fn_t free_fn,
 				pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn,
 				pcpu_fc_populate_pte_fn_t populate_pte_fn);
 #endif
diff --git a/mm/percpu.c b/mm/percpu.c
index 3f6cf1ff0be2..efaa1cbaf73d 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -2992,6 +2992,30 @@ static struct pcpu_alloc_info * __init __flatten pcpu_build_alloc_info(
 
 	return ai;
 }
+
+static void * __init pcpu_fc_alloc(unsigned int cpu, size_t size, size_t align,
+				   pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
+{
+	const unsigned long goal = __pa(MAX_DMA_ADDRESS);
+	int node = NUMA_NO_NODE;
+	void *ptr;
+
+	if (cpu_to_nd_fn)
+		node = cpu_to_nd_fn(cpu);
+
+	if (node == NUMA_NO_NODE || !node_online(node) || !NODE_DATA(node)) {
+		ptr = memblock_alloc_from(size, align, goal);
+	} else {
+		ptr = memblock_alloc_try_nid(size, align, goal,
+					     MEMBLOCK_ALLOC_ACCESSIBLE, node);
+	}
+	return ptr;
+}
+
+static void __init pcpu_fc_free(void *ptr, size_t size)
+{
+	memblock_free(ptr, size);
+}
 #endif /* BUILD_EMBED_FIRST_CHUNK || BUILD_PAGE_FIRST_CHUNK */
 
 #if defined(BUILD_EMBED_FIRST_CHUNK)
@@ -3002,14 +3026,12 @@ static struct pcpu_alloc_info * __init __flatten pcpu_build_alloc_info(
  * @atom_size: allocation atom size
  * @cpu_distance_fn: callback to determine distance between cpus, optional
  * @cpu_to_nd_fn: callback to convert cpu to it's node, optional
- * @alloc_fn: function to allocate percpu page
- * @free_fn: function to free percpu page
  *
  * This is a helper to ease setting up embedded first percpu chunk and
  * can be called where pcpu_setup_first_chunk() is expected.
  *
  * If this function is used to setup the first chunk, it is allocated
- * by calling @alloc_fn and used as-is without being mapped into
+ * by calling pcpu_fc_alloc and used as-is without being mapped into
  * vmalloc area.  Allocations are always whole multiples of @atom_size
  * aligned to @atom_size.
  *
@@ -3023,7 +3045,7 @@ static struct pcpu_alloc_info * __init __flatten pcpu_build_alloc_info(
  * @dyn_size specifies the minimum dynamic area size.
  *
  * If the needed size is smaller than the minimum or specified unit
- * size, the leftover is returned using @free_fn.
+ * size, the leftover is returned using pcpu_fc_free.
  *
  * RETURNS:
  * 0 on success, -errno on failure.
@@ -3031,9 +3053,7 @@ static struct pcpu_alloc_info * __init __flatten pcpu_build_alloc_info(
 int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
 				  size_t atom_size,
 				  pcpu_fc_cpu_distance_fn_t cpu_distance_fn,
-				  pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn,
-				  pcpu_fc_alloc_fn_t alloc_fn,
-				  pcpu_fc_free_fn_t free_fn)
+				  pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
 {
 	void *base = (void *)ULONG_MAX;
 	void **areas = NULL;
@@ -3068,7 +3088,7 @@ int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
 		BUG_ON(cpu == NR_CPUS);
 
 		/* allocate space for the whole group */
-		ptr = alloc_fn(cpu, gi->nr_units * ai->unit_size, atom_size, cpu_to_nd_fn);
+		ptr = pcpu_fc_alloc(cpu, gi->nr_units * ai->unit_size, atom_size, cpu_to_nd_fn);
 		if (!ptr) {
 			rc = -ENOMEM;
 			goto out_free_areas;
@@ -3107,12 +3127,12 @@ int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
 		for (i = 0; i < gi->nr_units; i++, ptr += ai->unit_size) {
 			if (gi->cpu_map[i] == NR_CPUS) {
 				/* unused unit, free whole */
-				free_fn(ptr, ai->unit_size);
+				pcpu_fc_free(ptr, ai->unit_size);
 				continue;
 			}
 			/* copy and return the unused part */
 			memcpy(ptr, __per_cpu_load, ai->static_size);
-			free_fn(ptr + size_sum, ai->unit_size - size_sum);
+			pcpu_fc_free(ptr + size_sum, ai->unit_size - size_sum);
 		}
 	}
 
@@ -3131,7 +3151,7 @@ int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
 out_free_areas:
 	for (group = 0; group < ai->nr_groups; group++)
 		if (areas[group])
-			free_fn(areas[group],
+			pcpu_fc_free(areas[group],
 				ai->groups[group].nr_units * ai->unit_size);
 out_free:
 	pcpu_free_alloc_info(ai);
@@ -3145,8 +3165,6 @@ int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
 /**
  * pcpu_page_first_chunk - map the first chunk using PAGE_SIZE pages
  * @reserved_size: the size of reserved percpu area in bytes
- * @alloc_fn: function to allocate percpu page, always called with PAGE_SIZE
- * @free_fn: function to free percpu page, always called with PAGE_SIZE
  * @cpu_to_nd_fn: callback to convert cpu to it's node, optional
  * @populate_pte_fn: function to populate pte
  *
@@ -3160,8 +3178,6 @@ int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
  * 0 on success, -errno on failure.
  */
 int __init pcpu_page_first_chunk(size_t reserved_size,
-				 pcpu_fc_alloc_fn_t alloc_fn,
-				 pcpu_fc_free_fn_t free_fn,
 				 pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn,
 				 pcpu_fc_populate_pte_fn_t populate_pte_fn)
 {
@@ -3205,7 +3221,7 @@ int __init pcpu_page_first_chunk(size_t reserved_size,
 		for (i = 0; i < unit_pages; i++) {
 			void *ptr;
 
-			ptr = alloc_fn(cpu, PAGE_SIZE, PAGE_SIZE, cpu_to_nd_fn);
+			ptr = pcpu_fc_alloc(cpu, PAGE_SIZE, PAGE_SIZE, cpu_to_nd_fn);
 			if (!ptr) {
 				pr_warn("failed to allocate %s page for cpu%u\n",
 						psize_str, cpu);
@@ -3257,7 +3273,7 @@ int __init pcpu_page_first_chunk(size_t reserved_size,
 
 enomem:
 	while (--j >= 0)
-		free_fn(page_address(pages[j]), PAGE_SIZE);
+		pcpu_fc_free(page_address(pages[j]), PAGE_SIZE);
 	rc = -ENOMEM;
 out_free_ar:
 	memblock_free(pages, pages_size);
@@ -3282,17 +3298,6 @@ int __init pcpu_page_first_chunk(size_t reserved_size,
 unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(__per_cpu_offset);
 
-static void * __init pcpu_dfl_fc_alloc(unsigned int cpu, size_t size, size_t align,
-				       pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
-{
-	return  memblock_alloc_from(size, align, __pa(MAX_DMA_ADDRESS));
-}
-
-static void __init pcpu_dfl_fc_free(void *ptr, size_t size)
-{
-	memblock_free(ptr, size);
-}
-
 void __init setup_per_cpu_areas(void)
 {
 	unsigned long delta;
@@ -3303,9 +3308,8 @@ void __init setup_per_cpu_areas(void)
 	 * Always reserve area for module percpu variables.  That's
 	 * what the legacy allocator did.
 	 */
-	rc = pcpu_embed_first_chunk(PERCPU_MODULE_RESERVE,
-				    PERCPU_DYNAMIC_RESERVE, PAGE_SIZE, NULL, NULL,
-				    pcpu_dfl_fc_alloc, pcpu_dfl_fc_free);
+	rc = pcpu_embed_first_chunk(PERCPU_MODULE_RESERVE, PERCPU_DYNAMIC_RESERVE,
+				    PAGE_SIZE, NULL, NULL);
 	if (rc < 0)
 		panic("Failed to initialize percpu areas.");
 
-- 
2.26.2

