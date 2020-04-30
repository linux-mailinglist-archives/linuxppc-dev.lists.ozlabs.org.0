Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B7C1C0887
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 22:48:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CnXS46n2zDrF0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 06:48:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CnKV4H4pzDq7d
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 06:38:54 +1000 (AEST)
IronPort-SDR: PsFYi4l8Q++mx4IKp0KY2KgdJ+AlHo0tZsLfwQIZsjlI+NzJny1EQGQZIZC5tmL8kijIA5+jw0
 3iYAhNnVfBpQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 13:38:53 -0700
IronPort-SDR: DTBjsFe5hVXyTwPGUJePW+TZpwAJKKEenLOwEkmVEb94UcdDIPrLbrU76RL63q9XkOab+7knBQ
 MPeQ9x+vv8HQ==
X-IronPort-AV: E=Sophos;i="5.73,337,1583222400"; d="scan'208";a="249852710"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 13:38:53 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH V1 05/10] arch/kmap_atomic: Consolidate duplicate code
Date: Thu, 30 Apr 2020 13:38:40 -0700
Message-Id: <20200430203845.582900-6-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200430203845.582900-1-ira.weiny@intel.com>
References: <20200430203845.582900-1-ira.weiny@intel.com>
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
Changes from V0:
	consolidate comments
	Use a similar architecture to kmap() and define
		kmap_atomic_high() for architecture specific
		functionality
	Fix 0-day build issue in arch/mips/mm/cache.c
---
 arch/arc/include/asm/highmem.h        |  2 +-
 arch/arc/mm/highmem.c                 |  9 ++-------
 arch/arm/include/asm/highmem.h        |  2 +-
 arch/arm/mm/highmem.c                 |  9 ++-------
 arch/csky/include/asm/highmem.h       |  2 +-
 arch/csky/mm/highmem.c                |  9 ++-------
 arch/microblaze/include/asm/highmem.h |  2 +-
 arch/microblaze/mm/highmem.c          |  6 ------
 arch/mips/include/asm/highmem.h       |  2 +-
 arch/mips/mm/cache.c                  |  2 +-
 arch/mips/mm/highmem.c                | 18 ++----------------
 arch/nds32/include/asm/highmem.h      |  2 +-
 arch/nds32/mm/highmem.c               |  9 ++-------
 arch/powerpc/include/asm/highmem.h    |  2 +-
 arch/powerpc/mm/highmem.c             | 11 -----------
 arch/sparc/include/asm/highmem.h      |  2 +-
 arch/sparc/mm/highmem.c               |  9 ++-------
 arch/x86/include/asm/highmem.h        |  7 +++++--
 arch/x86/mm/highmem_32.c              | 20 --------------------
 arch/xtensa/include/asm/highmem.h     |  2 +-
 arch/xtensa/mm/highmem.c              |  9 ++-------
 include/linux/highmem.h               | 22 ++++++++++++++++++++++
 22 files changed, 51 insertions(+), 107 deletions(-)

diff --git a/arch/arc/include/asm/highmem.h b/arch/arc/include/asm/highmem.h
index 8387a5596a91..75bd0fa77fe2 100644
--- a/arch/arc/include/asm/highmem.h
+++ b/arch/arc/include/asm/highmem.h
@@ -30,7 +30,7 @@
 
 #include <asm/cacheflush.h>
 
-extern void *kmap_atomic(struct page *page);
+extern void *kmap_atomic_high(struct page *page);
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
index 736f65283e7b..4edb6db3a5c8 100644
--- a/arch/arm/include/asm/highmem.h
+++ b/arch/arm/include/asm/highmem.h
@@ -60,7 +60,7 @@ static inline void *kmap_high_get(struct page *page)
  * when CONFIG_HIGHMEM is not set.
  */
 #ifdef CONFIG_HIGHMEM
-extern void *kmap_atomic(struct page *page);
+extern void *kmap_atomic_high(struct page *page);
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
index be11c5b67122..6807df1232f3 100644
--- a/arch/csky/include/asm/highmem.h
+++ b/arch/csky/include/asm/highmem.h
@@ -32,7 +32,7 @@ extern pte_t *pkmap_page_table;
 
 #define ARCH_HAS_KMAP_FLUSH_TLB
 extern void kmap_flush_tlb(unsigned long addr);
-extern void *kmap_atomic(struct page *page);
+extern void *kmap_atomic_high(struct page *page);
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
index 0c94046f2d58..fe4ad8bac9ae 100644
--- a/arch/microblaze/include/asm/highmem.h
+++ b/arch/microblaze/include/asm/highmem.h
@@ -54,7 +54,7 @@ extern pte_t *pkmap_page_table;
 extern void *kmap_atomic_prot(struct page *page, pgprot_t prot);
 extern void __kunmap_atomic(void *kvaddr);
 
-static inline void *kmap_atomic(struct page *page)
+static inline void *kmap_atomic_high(struct page *page)
 {
 	return kmap_atomic_prot(page, kmap_prot);
 }
diff --git a/arch/microblaze/mm/highmem.c b/arch/microblaze/mm/highmem.c
index d7569f77fa15..a14f356b055b 100644
--- a/arch/microblaze/mm/highmem.c
+++ b/arch/microblaze/mm/highmem.c
@@ -38,12 +38,6 @@ void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 	unsigned long vaddr;
 	int idx, type;
 
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
-
-
 	type = kmap_atomic_idx_push();
 	idx = type + KM_TYPE_NR*smp_processor_id();
 	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
diff --git a/arch/mips/include/asm/highmem.h b/arch/mips/include/asm/highmem.h
index 24e7e7e5cc7b..a515bcf15d4b 100644
--- a/arch/mips/include/asm/highmem.h
+++ b/arch/mips/include/asm/highmem.h
@@ -48,7 +48,7 @@ extern pte_t *pkmap_page_table;
 
 #define ARCH_HAS_KMAP_FLUSH_TLB
 extern void kmap_flush_tlb(unsigned long addr);
-extern void *kmap_atomic(struct page *page);
+extern void *kmap_atomic_high(struct page *page);
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
index c93c7368bb3f..28f5e7072c70 100644
--- a/arch/nds32/include/asm/highmem.h
+++ b/arch/nds32/include/asm/highmem.h
@@ -51,7 +51,7 @@ extern void kmap_init(void);
  * when CONFIG_HIGHMEM is not set.
  */
 #ifdef CONFIG_HIGHMEM
-extern void *kmap_atomic(struct page *page);
+extern void *kmap_atomic_high(struct page *page);
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
index ba3371977d49..ac0efc2cf08a 100644
--- a/arch/powerpc/include/asm/highmem.h
+++ b/arch/powerpc/include/asm/highmem.h
@@ -62,7 +62,7 @@ extern pte_t *pkmap_page_table;
 extern void *kmap_atomic_prot(struct page *page, pgprot_t prot);
 extern void __kunmap_atomic(void *kvaddr);
 
-static inline void *kmap_atomic(struct page *page)
+static inline void *kmap_atomic_high(struct page *page)
 {
 	return kmap_atomic_prot(page, kmap_prot);
 }
diff --git a/arch/powerpc/mm/highmem.c b/arch/powerpc/mm/highmem.c
index 320c1672b2ae..f9558ef4b8fa 100644
--- a/arch/powerpc/mm/highmem.c
+++ b/arch/powerpc/mm/highmem.c
@@ -24,22 +24,11 @@
 #include <linux/highmem.h>
 #include <linux/module.h>
 
-/*
- * The use of kmap_atomic/kunmap_atomic is discouraged - kmap/kunmap
- * gives a more generic (and caching) interface. But kmap_atomic can
- * be used in IRQ contexts, so in some (very limited) cases we need
- * it.
- */
 void *kmap_atomic_prot(struct page *page, pgprot_t prot)
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
diff --git a/arch/sparc/include/asm/highmem.h b/arch/sparc/include/asm/highmem.h
index 4bdb79fed02c..c96a0603d821 100644
--- a/arch/sparc/include/asm/highmem.h
+++ b/arch/sparc/include/asm/highmem.h
@@ -50,7 +50,7 @@ void kmap_init(void) __init;
 
 #define PKMAP_END (PKMAP_ADDR(LAST_PKMAP))
 
-void *kmap_atomic(struct page *page);
+void *kmap_atomic_high(struct page *page);
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
index 90b96594d6c5..72e154e17416 100644
--- a/arch/x86/include/asm/highmem.h
+++ b/arch/x86/include/asm/highmem.h
@@ -58,8 +58,11 @@ extern unsigned long highstart_pfn, highend_pfn;
 #define PKMAP_NR(virt)  ((virt-PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-void *kmap_atomic_prot(struct page *page, pgprot_t prot);
-void *kmap_atomic(struct page *page);
+extern void *kmap_atomic_prot(struct page *page, pgprot_t prot);
+void *kmap_atomic_high(struct page *page)
+{
+	return kmap_atomic_prot(page, kmap_prot);
+}
 void __kunmap_atomic(void *kvaddr);
 void *kmap_atomic_pfn(unsigned long pfn);
 void *kmap_atomic_prot_pfn(unsigned long pfn, pgprot_t prot);
diff --git a/arch/x86/mm/highmem_32.c b/arch/x86/mm/highmem_32.c
index c4ebfd0ae401..937d2cc40389 100644
--- a/arch/x86/mm/highmem_32.c
+++ b/arch/x86/mm/highmem_32.c
@@ -4,25 +4,11 @@
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
 void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 {
 	unsigned long vaddr;
 	int idx, type;
 
-	preempt_disable();
-	pagefault_disable();
-
-	if (!PageHighMem(page))
-		return page_address(page);
-
 	type = kmap_atomic_idx_push();
 	idx = type + KM_TYPE_NR*smp_processor_id();
 	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
@@ -34,12 +20,6 @@ void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 }
 EXPORT_SYMBOL(kmap_atomic_prot);
 
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
index 5a481f7def0b..d4fb9f78ba32 100644
--- a/arch/xtensa/include/asm/highmem.h
+++ b/arch/xtensa/include/asm/highmem.h
@@ -68,7 +68,7 @@ static inline void flush_cache_kmaps(void)
 	flush_cache_all();
 }
 
-void *kmap_atomic(struct page *page);
+void *kmap_atomic_high(struct page *page);
 void __kunmap_atomic(void *kvaddr);
 
 void kmap_init(void);
diff --git a/arch/xtensa/mm/highmem.c b/arch/xtensa/mm/highmem.c
index 711641c4d214..217f2ebaa298 100644
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
index ae6e8cb81043..e0106b4f7dbb 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -61,6 +61,28 @@ static inline void kunmap(struct page *page)
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

