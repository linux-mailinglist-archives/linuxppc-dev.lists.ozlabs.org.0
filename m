Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFF5476FD4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 12:15:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF8gD0KKqz3dgn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 22:15:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JF8dN2CyPz3c7V
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 22:14:16 +1100 (AEDT)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JF8cP3Y8Mz91jN;
 Thu, 16 Dec 2021 19:13:25 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 19:14:01 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 19:13:59 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <dennis@kernel.org>, <akpm@linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
Subject: [PATCH 4/4] mm: percpu: Add generic pcpu_populate_pte() function
Date: Thu, 16 Dec 2021 19:23:59 +0800
Message-ID: <20211216112359.103822-5-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211216112359.103822-1-wangkefeng.wang@huawei.com>
References: <20211216112359.103822-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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
Cc: wangkefeng.wang@huawei.com, linux-ia64@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, dave.hansen@linux.intel.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org, cl@linux.com,
 will@kernel.org, linux-riscv@lists.infradead.org, x86@kernel.org,
 mingo@redhat.com, catalin.marinas@arm.com, aou@eecs.berkeley.edu, bp@alien8.de,
 paul.walmsley@sifive.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, tsbogend@alpha.franken.de,
 gregkh@linuxfoundation.org, linux-mips@vger.kernel.org, palmer@dabbelt.com,
 tj@kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With NEED_PER_CPU_PAGE_FIRST_CHUNK enabled, we need a function
to populate pte, this patch adds a generic pcpu populate pte
function, pcpu_populate_pte(), which is marked __weak and used
on most architectures, but it is overridden on x86, which has
its own implemention.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Dennis Zhou <dennis@kernel.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Christoph Lameter <cl@linux.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/powerpc/kernel/setup_64.c | 47 +--------------------
 arch/sparc/kernel/smp_64.c     | 56 +------------------------
 arch/x86/kernel/setup_percpu.c |  5 +--
 drivers/base/arch_numa.c       | 51 +----------------------
 include/linux/percpu.h         |  5 +--
 mm/percpu.c                    | 76 +++++++++++++++++++++++++++++++---
 6 files changed, 78 insertions(+), 162 deletions(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index a0c55c6e3023..f7cf408217c5 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -787,51 +787,6 @@ static __init int pcpu_cpu_to_node(int cpu)
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
@@ -860,7 +815,7 @@ void __init setup_per_cpu_areas(void)
 	}
 
 	if (rc < 0)
-		rc = pcpu_page_first_chunk(0, pcpu_cpu_to_node, pcpu_populate_pte);
+		rc = pcpu_page_first_chunk(0, pcpu_cpu_to_node);
 	if (rc < 0)
 		panic("cannot initialize percpu area (err=%d)", rc);
 
diff --git a/arch/sparc/kernel/smp_64.c b/arch/sparc/kernel/smp_64.c
index ef815b3f0592..a1f78e9ddaf3 100644
--- a/arch/sparc/kernel/smp_64.c
+++ b/arch/sparc/kernel/smp_64.c
@@ -1539,59 +1539,6 @@ static int __init pcpu_cpu_to_node(int cpu)
 	return cpu_to_node(cpu);
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
@@ -1610,8 +1557,7 @@ void __init setup_per_cpu_areas(void)
 	}
 	if (rc < 0)
 		rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE,
-					   pcpu_cpu_to_node,
-					   pcpu_populate_pte);
+					   pcpu_cpu_to_node);
 	if (rc < 0)
 		panic("cannot initialize percpu area (err=%d)", rc);
 
diff --git a/arch/x86/kernel/setup_percpu.c b/arch/x86/kernel/setup_percpu.c
index 15c5bf3cbe5f..49325caa7307 100644
--- a/arch/x86/kernel/setup_percpu.c
+++ b/arch/x86/kernel/setup_percpu.c
@@ -101,7 +101,7 @@ static int __init pcpu_cpu_to_node(int cpu)
 	return early_cpu_to_node(cpu);
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
index 0f79b6d9a6d6..fc6f591cb54f 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -3174,11 +3174,79 @@ int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
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
+		new = memblock_alloc(P4D_TABLE_SIZE, P4D_TABLE_SIZE);
+		if (!new)
+			goto err_alloc;
+		pgd_populate(&init_mm, pgd, new);
+	}
+
+	p4d = p4d_offset(pgd, addr);
+	if (p4d_none(*p4d)) {
+		pud_t *new;
+
+		new = memblock_alloc(PUD_TABLE_SIZE, PUD_TABLE_SIZE);
+		if (!new)
+			goto err_alloc;
+		p4d_populate(&init_mm, p4d, new);
+	}
+
+	pud = pud_offset(p4d, addr);
+	if (pud_none(*pud)) {
+		pmd_t *new;
+
+		new = memblock_alloc(PMD_TABLE_SIZE, PMD_TABLE_SIZE);
+		if (!new)
+			goto err_alloc;
+		pud_populate(&init_mm, pud, new);
+	}
+
+	pmd = pmd_offset(pud, addr);
+	if (!pmd_present(*pmd)) {
+		pte_t *new;
+
+		new = memblock_alloc(PTE_TABLE_SIZE, PTE_TABLE_SIZE);
+		if (!new)
+			goto err_alloc;
+		pmd_populate_kernel(&init_mm, pmd, new);
+	}
+
+	return;
+
+err_alloc:
+	panic("%s: Failed to allocate memory\n", __func__);
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
@@ -3189,9 +3257,7 @@ int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
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
@@ -3255,7 +3321,7 @@ int __init pcpu_page_first_chunk(size_t reserved_size,
 			(unsigned long)vm.addr + unit * ai->unit_size;
 
 		for (i = 0; i < unit_pages; i++)
-			populate_pte_fn(unit_addr + (i << PAGE_SHIFT));
+			pcpu_populate_pte(unit_addr + (i << PAGE_SHIFT));
 
 		/* pte already populated, the following shouldn't fail */
 		rc = __pcpu_map_pages(unit_addr, &pages[unit * unit_pages],
-- 
2.18.0.huawei.25

