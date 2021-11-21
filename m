Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3984582D0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Nov 2021 10:46:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hxlsr6SHzz3dZw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Nov 2021 20:46:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hxlqh0J8Jz2xWt
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Nov 2021 20:44:46 +1100 (AEDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HxlHH4bhmzcbDr;
 Sun, 21 Nov 2021 17:20:11 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 21 Nov 2021 17:25:09 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 21 Nov 2021 17:25:08 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <dennis@kernel.org>, <akpm@linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
Subject: [PATCH RFC 4/4] mm: percpu: Add generic pcpu_populate_pte() function
Date: Sun, 21 Nov 2021 17:35:57 +0800
Message-ID: <20211121093557.139034-5-wangkefeng.wang@huawei.com>
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

When NEED_PER_CPU_PAGE_FIRST_CHUNK enabled, we need a function to
populate pte, add a generic pcpu populate pte function and switch
to use it.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/powerpc/kernel/setup_64.c | 47 +--------------------
 arch/sparc/kernel/smp_64.c     | 57 +------------------------
 arch/x86/kernel/setup_percpu.c |  5 +--
 drivers/base/arch_numa.c       | 51 +---------------------
 include/linux/percpu.h         |  5 +--
 mm/percpu.c                    | 77 +++++++++++++++++++++++++++++++---
 6 files changed, 79 insertions(+), 163 deletions(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 364b1567f822..1a17828af77f 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -788,51 +788,6 @@ static int pcpu_cpu_distance(unsigned int from, unsigned int to)
 unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(__per_cpu_offset);
 
-static void __init pcpu_populate_pte(unsigned long addr)
-{
-	pgd_t *pgd = pgd_offset_k(addr);
-	p4d_t *p4d;
-	pud_t *pud;
-	pmd_t *pmd;
-
-	p4d = p4d_offset(pgd, addr);
-	if (p4d_none(*p4d)) {
-		pud_t *new;
-
-		new = memblock_alloc(PUD_TABLE_SIZE, PUD_TABLE_SIZE);
-		if (!new)
-			goto err_alloc;
-		p4d_populate(&init_mm, p4d, new);
-	}
-
-	pud = pud_offset(p4d, addr);
-	if (pud_none(*pud)) {
-		pmd_t *new;
-
-		new = memblock_alloc(PMD_TABLE_SIZE, PMD_TABLE_SIZE);
-		if (!new)
-			goto err_alloc;
-		pud_populate(&init_mm, pud, new);
-	}
-
-	pmd = pmd_offset(pud, addr);
-	if (!pmd_present(*pmd)) {
-		pte_t *new;
-
-		new = memblock_alloc(PTE_TABLE_SIZE, PTE_TABLE_SIZE);
-		if (!new)
-			goto err_alloc;
-		pmd_populate_kernel(&init_mm, pmd, new);
-	}
-
-	return;
-
-err_alloc:
-	panic("%s: Failed to allocate %lu bytes align=%lx from=%lx\n",
-	      __func__, PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
-}
-
-
 void __init setup_per_cpu_areas(void)
 {
 	const size_t dyn_size = PERCPU_MODULE_RESERVE + PERCPU_DYNAMIC_RESERVE;
@@ -861,7 +816,7 @@ void __init setup_per_cpu_areas(void)
 	}
 
 	if (rc < 0)
-		rc = pcpu_page_first_chunk(0, pcpu_cpu_to_node, pcpu_populate_pte);
+		rc = pcpu_page_first_chunk(0, pcpu_cpu_to_node);
 	if (rc < 0)
 		panic("cannot initialize percpu area (err=%d)", rc);
 
diff --git a/arch/sparc/kernel/smp_64.c b/arch/sparc/kernel/smp_64.c
index 198dadddb75d..00dffe2d834b 100644
--- a/arch/sparc/kernel/smp_64.c
+++ b/arch/sparc/kernel/smp_64.c
@@ -1534,59 +1534,6 @@ static int __init pcpu_cpu_distance(unsigned int from, unsigned int to)
 		return REMOTE_DISTANCE;
 }
 
-static void __init pcpu_populate_pte(unsigned long addr)
-{
-	pgd_t *pgd = pgd_offset_k(addr);
-	p4d_t *p4d;
-	pud_t *pud;
-	pmd_t *pmd;
-
-	if (pgd_none(*pgd)) {
-		pud_t *new;
-
-		new = memblock_alloc_from(PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
-		if (!new)
-			goto err_alloc;
-		pgd_populate(&init_mm, pgd, new);
-	}
-
-	p4d = p4d_offset(pgd, addr);
-	if (p4d_none(*p4d)) {
-		pud_t *new;
-
-		new = memblock_alloc_from(PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
-		if (!new)
-			goto err_alloc;
-		p4d_populate(&init_mm, p4d, new);
-	}
-
-	pud = pud_offset(p4d, addr);
-	if (pud_none(*pud)) {
-		pmd_t *new;
-
-		new = memblock_alloc_from(PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
-		if (!new)
-			goto err_alloc;
-		pud_populate(&init_mm, pud, new);
-	}
-
-	pmd = pmd_offset(pud, addr);
-	if (!pmd_present(*pmd)) {
-		pte_t *new;
-
-		new = memblock_alloc_from(PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
-		if (!new)
-			goto err_alloc;
-		pmd_populate_kernel(&init_mm, pmd, new);
-	}
-
-	return;
-
-err_alloc:
-	panic("%s: Failed to allocate %lu bytes align=%lx from=%lx\n",
-	      __func__, PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
-}
-
 void __init setup_per_cpu_areas(void)
 {
 	unsigned long delta;
@@ -1604,9 +1551,7 @@ void __init setup_per_cpu_areas(void)
 				pcpu_fc_names[pcpu_chosen_fc], rc);
 	}
 	if (rc < 0)
-		rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE,
-					   cpu_to_node,
-					   pcpu_populate_pte);
+		rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE, cpu_to_node);
 	if (rc < 0)
 		panic("cannot initialize percpu area (err=%d)", rc);
 
diff --git a/arch/x86/kernel/setup_percpu.c b/arch/x86/kernel/setup_percpu.c
index cd672bd46241..4eadbe45078e 100644
--- a/arch/x86/kernel/setup_percpu.c
+++ b/arch/x86/kernel/setup_percpu.c
@@ -101,7 +101,7 @@ static int __init pcpu_cpu_to_node(int cpu)
 	return IS_ENABLED(CONFIG_NUMA) ? early_cpu_to_node(cpu) : NUMA_NO_NODE;
 }
 
-static void __init pcpup_populate_pte(unsigned long addr)
+void __init pcpu_populate_pte(unsigned long addr)
 {
 	populate_extra_pte(addr);
 }
@@ -163,8 +163,7 @@ void __init setup_per_cpu_areas(void)
 	}
 	if (rc < 0)
 		rc = pcpu_page_first_chunk(PERCPU_FIRST_CHUNK_RESERVE,
-					   pcpu_cpu_to_node,
-					   pcpup_populate_pte);
+					   pcpu_cpu_to_node);
 	if (rc < 0)
 		panic("cannot initialize percpu area (err=%d)", rc);
 
diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index 23a10cc36165..eaa31e567d1e 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -14,7 +14,6 @@
 #include <linux/of.h>
 
 #include <asm/sections.h>
-#include <asm/pgalloc.h>
 
 struct pglist_data *node_data[MAX_NUMNODES] __read_mostly;
 EXPORT_SYMBOL(node_data);
@@ -155,52 +154,6 @@ static int __init pcpu_cpu_distance(unsigned int from, unsigned int to)
 	return node_distance(early_cpu_to_node(from), early_cpu_to_node(to));
 }
 
-#ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
-static void __init pcpu_populate_pte(unsigned long addr)
-{
-	pgd_t *pgd = pgd_offset_k(addr);
-	p4d_t *p4d;
-	pud_t *pud;
-	pmd_t *pmd;
-
-	p4d = p4d_offset(pgd, addr);
-	if (p4d_none(*p4d)) {
-		pud_t *new;
-
-		new = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-		if (!new)
-			goto err_alloc;
-		p4d_populate(&init_mm, p4d, new);
-	}
-
-	pud = pud_offset(p4d, addr);
-	if (pud_none(*pud)) {
-		pmd_t *new;
-
-		new = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-		if (!new)
-			goto err_alloc;
-		pud_populate(&init_mm, pud, new);
-	}
-
-	pmd = pmd_offset(pud, addr);
-	if (!pmd_present(*pmd)) {
-		pte_t *new;
-
-		new = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-		if (!new)
-			goto err_alloc;
-		pmd_populate_kernel(&init_mm, pmd, new);
-	}
-
-	return;
-
-err_alloc:
-	panic("%s: Failed to allocate %lu bytes align=%lx from=%lx\n",
-	      __func__, PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
-}
-#endif
-
 void __init setup_per_cpu_areas(void)
 {
 	unsigned long delta;
@@ -225,9 +178,7 @@ void __init setup_per_cpu_areas(void)
 
 #ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
 	if (rc < 0)
-		rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE,
-					   early_cpu_to_node,
-					   pcpu_populate_pte);
+		rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE, early_cpu_to_node);
 #endif
 	if (rc < 0)
 		panic("Failed to initialize percpu areas (err=%d).", rc);
diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index d73c97ef4ff4..f1ec5ad1351c 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -95,7 +95,6 @@ extern const char * const pcpu_fc_names[PCPU_FC_NR];
 extern enum pcpu_fc pcpu_chosen_fc;
 
 typedef int (pcpu_fc_cpu_to_node_fn_t)(int cpu);
-typedef void (*pcpu_fc_populate_pte_fn_t)(unsigned long addr);
 typedef int (pcpu_fc_cpu_distance_fn_t)(unsigned int from, unsigned int to);
 
 extern struct pcpu_alloc_info * __init pcpu_alloc_alloc_info(int nr_groups,
@@ -113,9 +112,9 @@ extern int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
 #endif
 
 #ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
+void __init pcpu_populate_pte(unsigned long addr);
 extern int __init pcpu_page_first_chunk(size_t reserved_size,
-				pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn,
-				pcpu_fc_populate_pte_fn_t populate_pte_fn);
+				pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn);
 #endif
 
 extern void __percpu *__alloc_reserved_percpu(size_t size, size_t align) __alloc_size(1);
diff --git a/mm/percpu.c b/mm/percpu.c
index efaa1cbaf73d..d907daed04eb 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -3162,11 +3162,80 @@ int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
 #endif /* BUILD_EMBED_FIRST_CHUNK */
 
 #ifdef BUILD_PAGE_FIRST_CHUNK
+#include <asm/pgalloc.h>
+
+#ifndef P4D_TABLE_SIZE
+#define P4D_TABLE_SIZE PAGE_SIZE
+#endif
+
+#ifndef PUD_TABLE_SIZE
+#define PUD_TABLE_SIZE PAGE_SIZE
+#endif
+
+#ifndef PMD_TABLE_SIZE
+#define PMD_TABLE_SIZE PAGE_SIZE
+#endif
+
+#ifndef PTE_TABLE_SIZE
+#define PTE_TABLE_SIZE PAGE_SIZE
+#endif
+void __init __weak pcpu_populate_pte(unsigned long addr)
+{
+	pgd_t *pgd = pgd_offset_k(addr);
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+
+	if (pgd_none(*pgd)) {
+		p4d_t *new;
+
+		new = memblock_alloc_from(P4D_TABLE_SIZE, P4D_TABLE_SIZE, PAGE_SIZE);
+		if (!new)
+			goto err_alloc;
+		pgd_populate(&init_mm, pgd, new);
+	}
+
+	p4d = p4d_offset(pgd, addr);
+	if (p4d_none(*p4d)) {
+		pud_t *new;
+
+		new = memblock_alloc_from(PUD_TABLE_SIZE, PUD_TABLE_SIZE, PAGE_SIZE);
+		if (!new)
+			goto err_alloc;
+		p4d_populate(&init_mm, p4d, new);
+	}
+
+	pud = pud_offset(p4d, addr);
+	if (pud_none(*pud)) {
+		pmd_t *new;
+
+		new = memblock_alloc_from(PMD_TABLE_SIZE, PMD_TABLE_SIZE, PAGE_SIZE);
+		if (!new)
+			goto err_alloc;
+		pud_populate(&init_mm, pud, new);
+	}
+
+	pmd = pmd_offset(pud, addr);
+	if (!pmd_present(*pmd)) {
+		pte_t *new;
+
+		new = memblock_alloc_from(PTE_TABLE_SIZE, PTE_TABLE_SIZE, PAGE_SIZE);
+		if (!new)
+			goto err_alloc;
+		pmd_populate_kernel(&init_mm, pmd, new);
+	}
+
+	return;
+
+err_alloc:
+	panic("%s: Failed to allocate %lu bytes align=%lx from=%lx\n",
+	      __func__, PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
+}
+
 /**
  * pcpu_page_first_chunk - map the first chunk using PAGE_SIZE pages
  * @reserved_size: the size of reserved percpu area in bytes
  * @cpu_to_nd_fn: callback to convert cpu to it's node, optional
- * @populate_pte_fn: function to populate pte
  *
  * This is a helper to ease setting up page-remapped first percpu
  * chunk and can be called where pcpu_setup_first_chunk() is expected.
@@ -3177,9 +3246,7 @@ int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
  * RETURNS:
  * 0 on success, -errno on failure.
  */
-int __init pcpu_page_first_chunk(size_t reserved_size,
-				 pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn,
-				 pcpu_fc_populate_pte_fn_t populate_pte_fn)
+int __init pcpu_page_first_chunk(size_t reserved_size, pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
 {
 	static struct vm_struct vm;
 	struct pcpu_alloc_info *ai;
@@ -3243,7 +3310,7 @@ int __init pcpu_page_first_chunk(size_t reserved_size,
 			(unsigned long)vm.addr + unit * ai->unit_size;
 
 		for (i = 0; i < unit_pages; i++)
-			populate_pte_fn(unit_addr + (i << PAGE_SHIFT));
+			pcpu_populate_pte(unit_addr + (i << PAGE_SHIFT));
 
 		/* pte already populated, the following shouldn't fail */
 		rc = __pcpu_map_pages(unit_addr, &pages[unit * unit_pages],
-- 
2.26.2

