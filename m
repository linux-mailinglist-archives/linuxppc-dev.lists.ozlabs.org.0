Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 230FF1C30FA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 03:15:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49FlKB3Gy4zDqcR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 11:15:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49FlBM042rzDqfH
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 11:09:27 +1000 (AEST)
IronPort-SDR: s/c8MjDB+d3AqdKKroLVIRMOqXR5gIdcaFmZwhpJSEUu0FsuzQw0kcrPy2VaYGYwjwOZ3mz7iE
 7A8CtoRDtNng==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2020 18:09:25 -0700
IronPort-SDR: 78HfdS5E/sUZTr6rW4qdMrVg2KBSjTymtvnOmDPQ2pQ911uxvpCqRBWfQH/i1qx69xDtF31hj/
 5LV/nPWyE3zQ==
X-IronPort-AV: E=Sophos;i="5.73,350,1583222400"; d="scan'208";a="368958229"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2020 18:09:25 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH V2 06/11] arch/kmap_atomic: Consolidate duplicate code
Date: Sun,  3 May 2020 18:09:07 -0700
Message-Id: <20200504010912.982044-7-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200504010912.982044-1-ira.weiny@intel.com>
References: <20200504010912.982044-1-ira.weiny@intel.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

Every arch has the same code to ensure atomic operations and a check for
!HIGHMEM page.

Remove the duplicate code by defining a core kmap_atomic() which only
calls the arch specific kmap_atomic_high() when the page is high memory.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Changes from V1:
	Adjust to preserve bisect-ability
	Remove unneeded kmap_atomic_high declarations
---
 arch/arc/include/asm/highmem.h        |  1 -
 arch/arc/mm/highmem.c                 |  9 ++-------
 arch/arm/include/asm/highmem.h        |  1 -
 arch/arm/mm/highmem.c                 |  9 ++-------
 arch/csky/include/asm/highmem.h       |  1 -
 arch/csky/mm/highmem.c                |  9 ++-------
 arch/microblaze/include/asm/highmem.h |  4 ++--
 arch/mips/include/asm/highmem.h       |  1 -
 arch/mips/mm/cache.c                  |  2 +-
 arch/mips/mm/highmem.c                | 18 ++----------------
 arch/nds32/include/asm/highmem.h      |  1 -
 arch/nds32/mm/highmem.c               |  9 ++-------
 arch/powerpc/include/asm/highmem.h    |  4 ++--
 arch/powerpc/mm/highmem.c             |  6 ------
 arch/sparc/include/asm/highmem.h      |  1 -
 arch/sparc/mm/highmem.c               |  9 ++-------
 arch/x86/include/asm/highmem.h        |  5 ++++-
 arch/x86/mm/highmem_32.c              | 14 --------------
 arch/xtensa/include/asm/highmem.h     |  1 -
 arch/xtensa/mm/highmem.c              |  9 ++-------
 include/linux/highmem.h               | 23 +++++++++++++++++++++++
 21 files changed, 46 insertions(+), 91 deletions(-)

diff --git a/arch/arc/include/asm/highmem.h b/arch/arc/include/asm/highmem.h
index 8387a5596a91..db425cd38545 100644
--- a/arch/arc/include/asm/highmem.h
+++ b/arch/arc/include/asm/highmem.h
@@ -30,7 +30,6 @@
 
 #include <asm/cacheflush.h>
 
-extern void *kmap_atomic(struct page *page);
 extern void __kunmap_atomic(void *kvaddr);
 
 extern void kmap_init(void);
diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
index 4db13a6b9f3b..0964b011c29f 100644
--- a/arch/arc/mm/highmem.c
+++ b/arch/arc/mm/highmem.c
@@ -49,16 +49,11 @@
 extern pte_t * pkmap_page_table;
 static pte_t * fixmap_page_table;
 
-void *kmap_atomic(struct page *page)
+void *kmap_atomic_high(struct page *page)
 {
 	int idx, cpu_idx;
 	unsigned long vaddr;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
-
 	cpu_idx = kmap_atomic_idx_push();
 	idx = cpu_idx + KM_TYPE_NR * smp_processor_id();
 	vaddr = FIXMAP_ADDR(idx);
@@ -68,7 +63,7 @@ void *kmap_atomic(struct page *page)
 
 	return (void *)vaddr;
 }
-EXPORT_SYMBOL(kmap_atomic);
+EXPORT_SYMBOL(kmap_atomic_high);
 
 void __kunmap_atomic(void *kv)
 {
diff --git a/arch/arm/include/asm/highmem.h b/arch/arm/include/asm/highmem.h
index 736f65283e7b..8c80bfe18a34 100644
--- a/arch/arm/include/asm/highmem.h
+++ b/arch/arm/include/asm/highmem.h
@@ -60,7 +60,6 @@ static inline void *kmap_high_get(struct page *page)
  * when CONFIG_HIGHMEM is not set.
  */
 #ifdef CONFIG_HIGHMEM
-extern void *kmap_atomic(struct page *page);
 extern void __kunmap_atomic(void *kvaddr);
 extern void *kmap_atomic_pfn(unsigned long pfn);
 #endif
diff --git a/arch/arm/mm/highmem.c b/arch/arm/mm/highmem.c
index c700b32350ee..075fdc235091 100644
--- a/arch/arm/mm/highmem.c
+++ b/arch/arm/mm/highmem.c
@@ -31,18 +31,13 @@ static inline pte_t get_fixmap_pte(unsigned long vaddr)
 	return *ptep;
 }
 
-void *kmap_atomic(struct page *page)
+void *kmap_atomic_high(struct page *page)
 {
 	unsigned int idx;
 	unsigned long vaddr;
 	void *kmap;
 	int type;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
-
 #ifdef CONFIG_DEBUG_HIGHMEM
 	/*
 	 * There is no cache coherency issue when non VIVT, so force the
@@ -76,7 +71,7 @@ void *kmap_atomic(struct page *page)
 
 	return (void *)vaddr;
 }
-EXPORT_SYMBOL(kmap_atomic);
+EXPORT_SYMBOL(kmap_atomic_high);
 
 void __kunmap_atomic(void *kvaddr)
 {
diff --git a/arch/csky/include/asm/highmem.h b/arch/csky/include/asm/highmem.h
index be11c5b67122..8ceee12f9bc1 100644
--- a/arch/csky/include/asm/highmem.h
+++ b/arch/csky/include/asm/highmem.h
@@ -32,7 +32,6 @@ extern pte_t *pkmap_page_table;
 
 #define ARCH_HAS_KMAP_FLUSH_TLB
 extern void kmap_flush_tlb(unsigned long addr);
-extern void *kmap_atomic(struct page *page);
 extern void __kunmap_atomic(void *kvaddr);
 extern void *kmap_atomic_pfn(unsigned long pfn);
 extern struct page *kmap_atomic_to_page(void *ptr);
diff --git a/arch/csky/mm/highmem.c b/arch/csky/mm/highmem.c
index e9952211264b..63d74b47eee6 100644
--- a/arch/csky/mm/highmem.c
+++ b/arch/csky/mm/highmem.c
@@ -21,16 +21,11 @@ EXPORT_SYMBOL(kmap_flush_tlb);
 
 EXPORT_SYMBOL(kmap);
 
-void *kmap_atomic(struct page *page)
+void *kmap_atomic_high(struct page *page)
 {
 	unsigned long vaddr;
 	int idx, type;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
-
 	type = kmap_atomic_idx_push();
 	idx = type + KM_TYPE_NR*smp_processor_id();
 	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
@@ -42,7 +37,7 @@ void *kmap_atomic(struct page *page)
 
 	return (void *)vaddr;
 }
-EXPORT_SYMBOL(kmap_atomic);
+EXPORT_SYMBOL(kmap_atomic_high);
 
 void __kunmap_atomic(void *kvaddr)
 {
diff --git a/arch/microblaze/include/asm/highmem.h b/arch/microblaze/include/asm/highmem.h
index ec9954b091e1..00c75a423ac4 100644
--- a/arch/microblaze/include/asm/highmem.h
+++ b/arch/microblaze/include/asm/highmem.h
@@ -63,9 +63,9 @@ void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 }
 extern void __kunmap_atomic(void *kvaddr);
 
-static inline void *kmap_atomic(struct page *page)
+static inline void *kmap_atomic_high(struct page *page)
 {
-	return kmap_atomic_prot(page, kmap_prot);
+	return kmap_atomic_high_prot(page, kmap_prot);
 }
 
 #define flush_cache_kmaps()	{ flush_icache(); flush_dcache(); }
diff --git a/arch/mips/include/asm/highmem.h b/arch/mips/include/asm/highmem.h
index 24e7e7e5cc7b..8bdbbfc322ad 100644
--- a/arch/mips/include/asm/highmem.h
+++ b/arch/mips/include/asm/highmem.h
@@ -48,7 +48,6 @@ extern pte_t *pkmap_page_table;
 
 #define ARCH_HAS_KMAP_FLUSH_TLB
 extern void kmap_flush_tlb(unsigned long addr);
-extern void *kmap_atomic(struct page *page);
 extern void __kunmap_atomic(void *kvaddr);
 extern void *kmap_atomic_pfn(unsigned long pfn);
 
diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index 33b409391ddb..f015bb51fab0 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -14,9 +14,9 @@
 #include <linux/sched.h>
 #include <linux/syscalls.h>
 #include <linux/mm.h>
+#include <linux/highmem.h>
 
 #include <asm/cacheflush.h>
-#include <asm/highmem.h>
 #include <asm/processor.h>
 #include <asm/cpu.h>
 #include <asm/cpu-features.h>
diff --git a/arch/mips/mm/highmem.c b/arch/mips/mm/highmem.c
index eb8ec8493f2f..2bda56372995 100644
--- a/arch/mips/mm/highmem.c
+++ b/arch/mips/mm/highmem.c
@@ -18,25 +18,11 @@ void kmap_flush_tlb(unsigned long addr)
 }
 EXPORT_SYMBOL(kmap_flush_tlb);
 
-/*
- * kmap_atomic/kunmap_atomic is significantly faster than kmap/kunmap because
- * no global lock is needed and because the kmap code must perform a global TLB
- * invalidation when the kmap pool wraps.
- *
- * However when holding an atomic kmap is is not legal to sleep, so atomic
- * kmaps are appropriate for short, tight code paths only.
- */
-
-void *kmap_atomic(struct page *page)
+void *kmap_atomic_high(struct page *page)
 {
 	unsigned long vaddr;
 	int idx, type;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
-
 	type = kmap_atomic_idx_push();
 	idx = type + KM_TYPE_NR*smp_processor_id();
 	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
@@ -48,7 +34,7 @@ void *kmap_atomic(struct page *page)
 
 	return (void*) vaddr;
 }
-EXPORT_SYMBOL(kmap_atomic);
+EXPORT_SYMBOL(kmap_atomic_high);
 
 void __kunmap_atomic(void *kvaddr)
 {
diff --git a/arch/nds32/include/asm/highmem.h b/arch/nds32/include/asm/highmem.h
index c93c7368bb3f..a3970e566ede 100644
--- a/arch/nds32/include/asm/highmem.h
+++ b/arch/nds32/include/asm/highmem.h
@@ -51,7 +51,6 @@ extern void kmap_init(void);
  * when CONFIG_HIGHMEM is not set.
  */
 #ifdef CONFIG_HIGHMEM
-extern void *kmap_atomic(struct page *page);
 extern void __kunmap_atomic(void *kvaddr);
 extern void *kmap_atomic_pfn(unsigned long pfn);
 extern struct page *kmap_atomic_to_page(void *ptr);
diff --git a/arch/nds32/mm/highmem.c b/arch/nds32/mm/highmem.c
index f9348bec0ecb..f5f3a21460c4 100644
--- a/arch/nds32/mm/highmem.c
+++ b/arch/nds32/mm/highmem.c
@@ -10,18 +10,13 @@
 #include <asm/fixmap.h>
 #include <asm/tlbflush.h>
 
-void *kmap_atomic(struct page *page)
+void *kmap_atomic_high(struct page *page)
 {
 	unsigned int idx;
 	unsigned long vaddr, pte;
 	int type;
 	pte_t *ptep;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
-
 	type = kmap_atomic_idx_push();
 
 	idx = type + KM_TYPE_NR * smp_processor_id();
@@ -37,7 +32,7 @@ void *kmap_atomic(struct page *page)
 	return (void *)vaddr;
 }
 
-EXPORT_SYMBOL(kmap_atomic);
+EXPORT_SYMBOL(kmap_atomic_high);
 
 void __kunmap_atomic(void *kvaddr)
 {
diff --git a/arch/powerpc/include/asm/highmem.h b/arch/powerpc/include/asm/highmem.h
index d049806a8354..74fa2c726fde 100644
--- a/arch/powerpc/include/asm/highmem.h
+++ b/arch/powerpc/include/asm/highmem.h
@@ -71,9 +71,9 @@ static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 }
 extern void __kunmap_atomic(void *kvaddr);
 
-static inline void *kmap_atomic(struct page *page)
+static inline void *kmap_atomic_high(struct page *page)
 {
-	return kmap_atomic_prot(page, kmap_prot);
+	return kmap_atomic_high_prot(page, kmap_prot);
 }
 
 
diff --git a/arch/powerpc/mm/highmem.c b/arch/powerpc/mm/highmem.c
index f075cef6d663..67aaa5217f7f 100644
--- a/arch/powerpc/mm/highmem.c
+++ b/arch/powerpc/mm/highmem.c
@@ -24,12 +24,6 @@
 #include <linux/highmem.h>
 #include <linux/module.h>
 
-/*
- * The use of kmap_atomic/kunmap_atomic is discouraged - kmap/kunmap
- * gives a more generic (and caching) interface. But kmap_atomic can
- * be used in IRQ contexts, so in some (very limited) cases we need
- * it.
- */
 void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
 {
 	unsigned long vaddr;
diff --git a/arch/sparc/include/asm/highmem.h b/arch/sparc/include/asm/highmem.h
index 4bdb79fed02c..458210c5bc38 100644
--- a/arch/sparc/include/asm/highmem.h
+++ b/arch/sparc/include/asm/highmem.h
@@ -50,7 +50,6 @@ void kmap_init(void) __init;
 
 #define PKMAP_END (PKMAP_ADDR(LAST_PKMAP))
 
-void *kmap_atomic(struct page *page);
 void __kunmap_atomic(void *kvaddr);
 
 #define flush_cache_kmaps()	flush_cache_all()
diff --git a/arch/sparc/mm/highmem.c b/arch/sparc/mm/highmem.c
index d4a80adea7e5..b53070ab6a31 100644
--- a/arch/sparc/mm/highmem.c
+++ b/arch/sparc/mm/highmem.c
@@ -53,16 +53,11 @@ void __init kmap_init(void)
         kmap_prot = __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CACHE);
 }
 
-void *kmap_atomic(struct page *page)
+void *kmap_atomic_high(struct page *page)
 {
 	unsigned long vaddr;
 	long idx, type;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
-
 	type = kmap_atomic_idx_push();
 	idx = type + KM_TYPE_NR*smp_processor_id();
 	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
@@ -87,7 +82,7 @@ void *kmap_atomic(struct page *page)
 
 	return (void*) vaddr;
 }
-EXPORT_SYMBOL(kmap_atomic);
+EXPORT_SYMBOL(kmap_atomic_high);
 
 void __kunmap_atomic(void *kvaddr)
 {
diff --git a/arch/x86/include/asm/highmem.h b/arch/x86/include/asm/highmem.h
index 61f47fef40e5..9393d55a2adb 100644
--- a/arch/x86/include/asm/highmem.h
+++ b/arch/x86/include/asm/highmem.h
@@ -68,7 +68,10 @@ static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 
 	return kmap_atomic_high_prot(page, prot);
 }
-void *kmap_atomic(struct page *page);
+static inline void *kmap_atomic_high(struct page *page)
+{
+	return kmap_atomic_high_prot(page, kmap_prot);
+}
 void __kunmap_atomic(void *kvaddr);
 void *kmap_atomic_pfn(unsigned long pfn);
 void *kmap_atomic_prot_pfn(unsigned long pfn, pgprot_t prot);
diff --git a/arch/x86/mm/highmem_32.c b/arch/x86/mm/highmem_32.c
index 48b56b1af902..c3e272a759e0 100644
--- a/arch/x86/mm/highmem_32.c
+++ b/arch/x86/mm/highmem_32.c
@@ -4,14 +4,6 @@
 #include <linux/swap.h> /* for totalram_pages */
 #include <linux/memblock.h>
 
-/*
- * kmap_atomic/kunmap_atomic is significantly faster than kmap/kunmap because
- * no global lock is needed and because the kmap code must perform a global TLB
- * invalidation when the kmap pool wraps.
- *
- * However when holding an atomic kmap it is not legal to sleep, so atomic
- * kmaps are appropriate for short, tight code paths only.
- */
 void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
 {
 	unsigned long vaddr;
@@ -28,12 +20,6 @@ void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
 }
 EXPORT_SYMBOL(kmap_atomic_high_prot);
 
-void *kmap_atomic(struct page *page)
-{
-	return kmap_atomic_prot(page, kmap_prot);
-}
-EXPORT_SYMBOL(kmap_atomic);
-
 /*
  * This is the same as kmap_atomic() but can map memory that doesn't
  * have a struct page associated with it.
diff --git a/arch/xtensa/include/asm/highmem.h b/arch/xtensa/include/asm/highmem.h
index 5a481f7def0b..1e6aa15c4bdf 100644
--- a/arch/xtensa/include/asm/highmem.h
+++ b/arch/xtensa/include/asm/highmem.h
@@ -68,7 +68,6 @@ static inline void flush_cache_kmaps(void)
 	flush_cache_all();
 }
 
-void *kmap_atomic(struct page *page);
 void __kunmap_atomic(void *kvaddr);
 
 void kmap_init(void);
diff --git a/arch/xtensa/mm/highmem.c b/arch/xtensa/mm/highmem.c
index da734a2ed641..90b85a897cb0 100644
--- a/arch/xtensa/mm/highmem.c
+++ b/arch/xtensa/mm/highmem.c
@@ -37,16 +37,11 @@ static inline enum fixed_addresses kmap_idx(int type, unsigned long color)
 		color;
 }
 
-void *kmap_atomic(struct page *page)
+void *kmap_atomic_high(struct page *page)
 {
 	enum fixed_addresses idx;
 	unsigned long vaddr;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
-
 	idx = kmap_idx(kmap_atomic_idx_push(),
 		       DCACHE_ALIAS(page_to_phys(page)));
 	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
@@ -57,7 +52,7 @@ void *kmap_atomic(struct page *page)
 
 	return (void *)vaddr;
 }
-EXPORT_SYMBOL(kmap_atomic);
+EXPORT_SYMBOL(kmap_atomic_high);
 
 void __kunmap_atomic(void *kvaddr)
 {
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index ae6e8cb81043..86b93dee758a 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -32,6 +32,7 @@ static inline void invalidate_kernel_vmap_range(void *vaddr, int size)
 #include <asm/kmap_types.h>
 
 #ifdef CONFIG_HIGHMEM
+extern void *kmap_atomic_high(struct page *page);
 #include <asm/highmem.h>
 
 #ifndef ARCH_HAS_KMAP_FLUSH_TLB
@@ -61,6 +62,28 @@ static inline void kunmap(struct page *page)
 	kunmap_high(page);
 }
 
+/*
+ * kmap_atomic/kunmap_atomic is significantly faster than kmap/kunmap because
+ * no global lock is needed and because the kmap code must perform a global TLB
+ * invalidation when the kmap pool wraps.
+ *
+ * However when holding an atomic kmap is is not legal to sleep, so atomic
+ * kmaps are appropriate for short, tight code paths only.
+ *
+ * The use of kmap_atomic/kunmap_atomic is discouraged - kmap/kunmap
+ * gives a more generic (and caching) interface. But kmap_atomic can
+ * be used in IRQ contexts, so in some (very limited) cases we need
+ * it.
+ */
+static inline void *kmap_atomic(struct page *page)
+{
+	preempt_disable();
+	pagefault_disable();
+	if (!PageHighMem(page))
+		return page_address(page);
+	return kmap_atomic_high(page);
+}
+
 /* declarations for linux/mm/highmem.c */
 unsigned int nr_free_highpages(void);
 extern atomic_long_t _totalhigh_pages;
-- 
2.25.1

