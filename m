Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 676031C961F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 18:14:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Hz6j4mm9zDqQl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 02:14:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HxTd2Y8JzDqLg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 01:00:20 +1000 (AEST)
IronPort-SDR: ZaEs8pH2HgBYyzpXwtEG8sKg2yMaAci2W9sfm5k8tw0wLqbckYkT+wT99EcdnbGEDJLqTojJfQ
 qbU/nNpZLPOw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:00:17 -0700
IronPort-SDR: Dn6Fjj4n2zgdLUZ0IVTIotPJGX159airxYdWwps2UTbpenbtG3S6EHY/RPLJzqSz3bpUsxyRpn
 Lo+JVVU5ydHw==
X-IronPort-AV: E=Sophos;i="5.73,364,1583222400"; d="scan'208";a="295747564"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:00:17 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH V3 10/15] arch/kmap: Define kmap_atomic_prot() for all arch's
Date: Thu,  7 May 2020 07:59:58 -0700
Message-Id: <20200507150004.1423069-11-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150004.1423069-1-ira.weiny@intel.com>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
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
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

To support kmap_atomic_prot(), all architectures need to support
protections passed to their kmap_atomic_high() function.  Pass
protections into kmap_atomic_high() and change the name to
kmap_atomic_high_prot() to match.

Then define kmap_atomic_prot() as a core function which calls
kmap_atomic_high_prot() when needed.

Finally, redefine kmap_atomic() as a wrapper of kmap_atomic_prot() with
the default kmap_prot exported by the architectures.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Changes from V1:
	Adjust for bisect-ability
	Adjust for removing kunmap_atomic_high
	Remove kmap_atomic_high_prot declarations
---
 arch/arc/mm/highmem.c                 |  6 +++---
 arch/arm/mm/highmem.c                 |  6 +++---
 arch/csky/mm/highmem.c                |  6 +++---
 arch/microblaze/include/asm/highmem.h | 16 ----------------
 arch/mips/mm/highmem.c                |  6 +++---
 arch/nds32/mm/highmem.c               |  6 +++---
 arch/powerpc/include/asm/highmem.h    | 17 -----------------
 arch/sparc/mm/highmem.c               |  6 +++---
 arch/x86/include/asm/highmem.h        | 14 --------------
 arch/xtensa/mm/highmem.c              |  6 +++---
 include/linux/highmem.h               |  7 ++++---
 11 files changed, 25 insertions(+), 71 deletions(-)

diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
index 5d3eab4ac0b0..479b0d72d3cf 100644
--- a/arch/arc/mm/highmem.c
+++ b/arch/arc/mm/highmem.c
@@ -49,7 +49,7 @@
 extern pte_t * pkmap_page_table;
 static pte_t * fixmap_page_table;
 
-void *kmap_atomic_high(struct page *page)
+void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
 {
 	int idx, cpu_idx;
 	unsigned long vaddr;
@@ -59,11 +59,11 @@ void *kmap_atomic_high(struct page *page)
 	vaddr = FIXMAP_ADDR(idx);
 
 	set_pte_at(&init_mm, vaddr, fixmap_page_table + idx,
-		   mk_pte(page, kmap_prot));
+		   mk_pte(page, prot));
 
 	return (void *)vaddr;
 }
-EXPORT_SYMBOL(kmap_atomic_high);
+EXPORT_SYMBOL(kmap_atomic_high_prot);
 
 void kunmap_atomic_high(void *kv)
 {
diff --git a/arch/arm/mm/highmem.c b/arch/arm/mm/highmem.c
index ac8394655a6e..e013f6b81328 100644
--- a/arch/arm/mm/highmem.c
+++ b/arch/arm/mm/highmem.c
@@ -31,7 +31,7 @@ static inline pte_t get_fixmap_pte(unsigned long vaddr)
 	return *ptep;
 }
 
-void *kmap_atomic_high(struct page *page)
+void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
 {
 	unsigned int idx;
 	unsigned long vaddr;
@@ -67,11 +67,11 @@ void *kmap_atomic_high(struct page *page)
 	 * in place, so the contained TLB flush ensures the TLB is updated
 	 * with the new mapping.
 	 */
-	set_fixmap_pte(idx, mk_pte(page, kmap_prot));
+	set_fixmap_pte(idx, mk_pte(page, prot));
 
 	return (void *)vaddr;
 }
-EXPORT_SYMBOL(kmap_atomic_high);
+EXPORT_SYMBOL(kmap_atomic_high_prot);
 
 void kunmap_atomic_high(void *kvaddr)
 {
diff --git a/arch/csky/mm/highmem.c b/arch/csky/mm/highmem.c
index f4311669b5bb..3ae5c8cd7619 100644
--- a/arch/csky/mm/highmem.c
+++ b/arch/csky/mm/highmem.c
@@ -21,7 +21,7 @@ EXPORT_SYMBOL(kmap_flush_tlb);
 
 EXPORT_SYMBOL(kmap);
 
-void *kmap_atomic_high(struct page *page)
+void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
 {
 	unsigned long vaddr;
 	int idx, type;
@@ -32,12 +32,12 @@ void *kmap_atomic_high(struct page *page)
 #ifdef CONFIG_DEBUG_HIGHMEM
 	BUG_ON(!pte_none(*(kmap_pte - idx)));
 #endif
-	set_pte(kmap_pte-idx, mk_pte(page, kmap_prot));
+	set_pte(kmap_pte-idx, mk_pte(page, prot));
 	flush_tlb_one((unsigned long)vaddr);
 
 	return (void *)vaddr;
 }
-EXPORT_SYMBOL(kmap_atomic_high);
+EXPORT_SYMBOL(kmap_atomic_high_prot);
 
 void kunmap_atomic_high(void *kvaddr)
 {
diff --git a/arch/microblaze/include/asm/highmem.h b/arch/microblaze/include/asm/highmem.h
index 90d96239152f..d7c55cfd27bd 100644
--- a/arch/microblaze/include/asm/highmem.h
+++ b/arch/microblaze/include/asm/highmem.h
@@ -51,22 +51,6 @@ extern pte_t *pkmap_page_table;
 #define PKMAP_NR(virt)  ((virt - PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
-static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
-{
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
-
-	return kmap_atomic_high_prot(page, prot);
-}
-
-static inline void *kmap_atomic_high(struct page *page)
-{
-	return kmap_atomic_high_prot(page, kmap_prot);
-}
-
 #define flush_cache_kmaps()	{ flush_icache(); flush_dcache(); }
 
 #endif /* __KERNEL__ */
diff --git a/arch/mips/mm/highmem.c b/arch/mips/mm/highmem.c
index 87023bd1a33c..37e244cdb14e 100644
--- a/arch/mips/mm/highmem.c
+++ b/arch/mips/mm/highmem.c
@@ -18,7 +18,7 @@ void kmap_flush_tlb(unsigned long addr)
 }
 EXPORT_SYMBOL(kmap_flush_tlb);
 
-void *kmap_atomic_high(struct page *page)
+void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
 {
 	unsigned long vaddr;
 	int idx, type;
@@ -29,12 +29,12 @@ void *kmap_atomic_high(struct page *page)
 #ifdef CONFIG_DEBUG_HIGHMEM
 	BUG_ON(!pte_none(*(kmap_pte - idx)));
 #endif
-	set_pte(kmap_pte-idx, mk_pte(page, kmap_prot));
+	set_pte(kmap_pte-idx, mk_pte(page, prot));
 	local_flush_tlb_one((unsigned long)vaddr);
 
 	return (void*) vaddr;
 }
-EXPORT_SYMBOL(kmap_atomic_high);
+EXPORT_SYMBOL(kmap_atomic_high_prot);
 
 void kunmap_atomic_high(void *kvaddr)
 {
diff --git a/arch/nds32/mm/highmem.c b/arch/nds32/mm/highmem.c
index 809f8c830f06..63ded527c1e8 100644
--- a/arch/nds32/mm/highmem.c
+++ b/arch/nds32/mm/highmem.c
@@ -10,7 +10,7 @@
 #include <asm/fixmap.h>
 #include <asm/tlbflush.h>
 
-void *kmap_atomic_high(struct page *page)
+void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
 {
 	unsigned int idx;
 	unsigned long vaddr, pte;
@@ -21,7 +21,7 @@ void *kmap_atomic_high(struct page *page)
 
 	idx = type + KM_TYPE_NR * smp_processor_id();
 	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
-	pte = (page_to_pfn(page) << PAGE_SHIFT) | (kmap_prot);
+	pte = (page_to_pfn(page) << PAGE_SHIFT) | prot;
 	ptep = pte_offset_kernel(pmd_off_k(vaddr), vaddr);
 	set_pte(ptep, pte);
 
@@ -32,7 +32,7 @@ void *kmap_atomic_high(struct page *page)
 	return (void *)vaddr;
 }
 
-EXPORT_SYMBOL(kmap_atomic_high);
+EXPORT_SYMBOL(kmap_atomic_high_prot);
 
 void kunmap_atomic_high(void *kvaddr)
 {
diff --git a/arch/powerpc/include/asm/highmem.h b/arch/powerpc/include/asm/highmem.h
index ee5de974c5ef..8d8ee3fcd800 100644
--- a/arch/powerpc/include/asm/highmem.h
+++ b/arch/powerpc/include/asm/highmem.h
@@ -59,23 +59,6 @@ extern pte_t *pkmap_page_table;
 #define PKMAP_NR(virt)  ((virt-PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
-static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
-{
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
-
-	return kmap_atomic_high_prot(page, prot);
-}
-
-static inline void *kmap_atomic_high(struct page *page)
-{
-	return kmap_atomic_high_prot(page, kmap_prot);
-}
-
-
 #define flush_cache_kmaps()	flush_cache_all()
 
 #endif /* __KERNEL__ */
diff --git a/arch/sparc/mm/highmem.c b/arch/sparc/mm/highmem.c
index 9f06d75e88e1..414f578d1e57 100644
--- a/arch/sparc/mm/highmem.c
+++ b/arch/sparc/mm/highmem.c
@@ -54,7 +54,7 @@ void __init kmap_init(void)
         kmap_prot = __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CACHE);
 }
 
-void *kmap_atomic_high(struct page *page)
+void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
 {
 	unsigned long vaddr;
 	long idx, type;
@@ -73,7 +73,7 @@ void *kmap_atomic_high(struct page *page)
 #ifdef CONFIG_DEBUG_HIGHMEM
 	BUG_ON(!pte_none(*(kmap_pte-idx)));
 #endif
-	set_pte(kmap_pte-idx, mk_pte(page, kmap_prot));
+	set_pte(kmap_pte-idx, mk_pte(page, prot));
 /* XXX Fix - Anton */
 #if 0
 	__flush_tlb_one(vaddr);
@@ -83,7 +83,7 @@ void *kmap_atomic_high(struct page *page)
 
 	return (void*) vaddr;
 }
-EXPORT_SYMBOL(kmap_atomic_high);
+EXPORT_SYMBOL(kmap_atomic_high_prot);
 
 void kunmap_atomic_high(void *kvaddr)
 {
diff --git a/arch/x86/include/asm/highmem.h b/arch/x86/include/asm/highmem.h
index be66b77885a0..0f420b24e0fc 100644
--- a/arch/x86/include/asm/highmem.h
+++ b/arch/x86/include/asm/highmem.h
@@ -58,20 +58,6 @@ extern unsigned long highstart_pfn, highend_pfn;
 #define PKMAP_NR(virt)  ((virt-PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
-static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
-{
-	preempt_disable();
-	pagefault_disable();
-	if (!PageHighMem(page))
-		return page_address(page);
-
-	return kmap_atomic_high_prot(page, prot);
-}
-static inline void *kmap_atomic_high(struct page *page)
-{
-	return kmap_atomic_high_prot(page, kmap_prot);
-}
 void *kmap_atomic_pfn(unsigned long pfn);
 void *kmap_atomic_prot_pfn(unsigned long pfn, pgprot_t prot);
 
diff --git a/arch/xtensa/mm/highmem.c b/arch/xtensa/mm/highmem.c
index 50168b09510a..99b5ad137ab5 100644
--- a/arch/xtensa/mm/highmem.c
+++ b/arch/xtensa/mm/highmem.c
@@ -37,7 +37,7 @@ static inline enum fixed_addresses kmap_idx(int type, unsigned long color)
 		color;
 }
 
-void *kmap_atomic_high(struct page *page)
+void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
 {
 	enum fixed_addresses idx;
 	unsigned long vaddr;
@@ -48,11 +48,11 @@ void *kmap_atomic_high(struct page *page)
 #ifdef CONFIG_DEBUG_HIGHMEM
 	BUG_ON(!pte_none(*(kmap_pte + idx)));
 #endif
-	set_pte(kmap_pte + idx, mk_pte(page, kmap_prot));
+	set_pte(kmap_pte + idx, mk_pte(page, prot));
 
 	return (void *)vaddr;
 }
-EXPORT_SYMBOL(kmap_atomic_high);
+EXPORT_SYMBOL(kmap_atomic_high_prot);
 
 void kunmap_atomic_high(void *kvaddr)
 {
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index c36c0ee09423..89838306f50d 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -32,7 +32,7 @@ static inline void invalidate_kernel_vmap_range(void *vaddr, int size)
 #include <asm/kmap_types.h>
 
 #ifdef CONFIG_HIGHMEM
-extern void *kmap_atomic_high(struct page *page);
+extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
 extern void kunmap_atomic_high(void *kvaddr);
 #include <asm/highmem.h>
 
@@ -76,14 +76,15 @@ static inline void kunmap(struct page *page)
  * be used in IRQ contexts, so in some (very limited) cases we need
  * it.
  */
-static inline void *kmap_atomic(struct page *page)
+static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 {
 	preempt_disable();
 	pagefault_disable();
 	if (!PageHighMem(page))
 		return page_address(page);
-	return kmap_atomic_high(page);
+	return kmap_atomic_high_prot(page, prot);
 }
+#define kmap_atomic(page)	kmap_atomic_prot(page, kmap_prot)
 
 /* declarations for linux/mm/highmem.c */
 unsigned int nr_free_highpages(void);
-- 
2.25.1

