Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F161C0899
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 22:52:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Cnck2DcCzDrKh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 06:52:06 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CnKW2nHWzDqC9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 06:38:54 +1000 (AEST)
IronPort-SDR: aclpXDgzF1OuRAAuIdWW66iYwYvpys7SBxB0+/5Tjxj5cUmaFHaL/oyV0Tau7NMNwDpNqso3cp
 4EALc8zkuIAw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 13:38:52 -0700
IronPort-SDR: iNKU1o7mD1UZNgSsrY+EotCmRDuB13yF5T51Us05ZI5xhcHyKwhOrTPyhQ1bHJNDkoXN2zoH7K
 Ekg8fB44niCA==
X-IronPort-AV: E=Sophos;i="5.73,337,1583222400"; d="scan'208";a="337428111"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 13:38:51 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH V1 03/10] arch/kmap: Remove redundant arch specific kmaps
Date: Thu, 30 Apr 2020 13:38:38 -0700
Message-Id: <20200430203845.582900-4-ira.weiny@intel.com>
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

The kmap code for all the architectures is almost 100% identical.

Lift the common code to the core.  Use ARCH_HAS_KMAP_FLUSH_TLB to
indicate if an arch defines kmap_flush_tlb() and call if if needed.

This also has the benefit of changing kmap() on a number of
architectures to be an inline call rather than an actual function.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Changes from V0:
	Define kmap_flush_tlb() and define it in csky/mips
---
 arch/arc/include/asm/highmem.h        |  2 --
 arch/arc/mm/highmem.c                 | 10 ----------
 arch/arm/include/asm/highmem.h        |  2 --
 arch/arm/mm/highmem.c                 |  9 ---------
 arch/csky/include/asm/highmem.h       |  4 ++--
 arch/csky/mm/highmem.c                | 14 ++++----------
 arch/microblaze/include/asm/highmem.h |  9 ---------
 arch/mips/include/asm/highmem.h       |  4 ++--
 arch/mips/mm/highmem.c                | 14 +++-----------
 arch/nds32/include/asm/highmem.h      |  2 --
 arch/nds32/mm/highmem.c               | 12 ------------
 arch/powerpc/include/asm/highmem.h    |  9 ---------
 arch/sparc/include/asm/highmem.h      |  9 ---------
 arch/x86/include/asm/highmem.h        |  2 --
 arch/x86/mm/highmem_32.c              |  9 ---------
 arch/xtensa/include/asm/highmem.h     |  9 ---------
 include/linux/highmem.h               | 18 ++++++++++++++++++
 17 files changed, 29 insertions(+), 109 deletions(-)

diff --git a/arch/arc/include/asm/highmem.h b/arch/arc/include/asm/highmem.h
index 042e92921c4c..96eb67c86961 100644
--- a/arch/arc/include/asm/highmem.h
+++ b/arch/arc/include/asm/highmem.h
@@ -30,8 +30,6 @@
 
 #include <asm/cacheflush.h>
 
-extern void *kmap(struct page *page);
-extern void *kmap_high(struct page *page);
 extern void *kmap_atomic(struct page *page);
 extern void __kunmap_atomic(void *kvaddr);
 extern void kunmap_high(struct page *page);
diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
index 39ef7b9a3aa9..4db13a6b9f3b 100644
--- a/arch/arc/mm/highmem.c
+++ b/arch/arc/mm/highmem.c
@@ -49,16 +49,6 @@
 extern pte_t * pkmap_page_table;
 static pte_t * fixmap_page_table;
 
-void *kmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return page_address(page);
-
-	return kmap_high(page);
-}
-EXPORT_SYMBOL(kmap);
-
 void *kmap_atomic(struct page *page)
 {
 	int idx, cpu_idx;
diff --git a/arch/arm/include/asm/highmem.h b/arch/arm/include/asm/highmem.h
index eb4e4207cd3c..c917522541de 100644
--- a/arch/arm/include/asm/highmem.h
+++ b/arch/arm/include/asm/highmem.h
@@ -20,7 +20,6 @@
 
 extern pte_t *pkmap_page_table;
 
-extern void *kmap_high(struct page *page);
 extern void kunmap_high(struct page *page);
 
 /*
@@ -63,7 +62,6 @@ static inline void *kmap_high_get(struct page *page)
  * when CONFIG_HIGHMEM is not set.
  */
 #ifdef CONFIG_HIGHMEM
-extern void *kmap(struct page *page);
 extern void kunmap(struct page *page);
 extern void *kmap_atomic(struct page *page);
 extern void __kunmap_atomic(void *kvaddr);
diff --git a/arch/arm/mm/highmem.c b/arch/arm/mm/highmem.c
index cc6eb79ef20c..e8ba37c36590 100644
--- a/arch/arm/mm/highmem.c
+++ b/arch/arm/mm/highmem.c
@@ -31,15 +31,6 @@ static inline pte_t get_fixmap_pte(unsigned long vaddr)
 	return *ptep;
 }
 
-void *kmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return page_address(page);
-	return kmap_high(page);
-}
-EXPORT_SYMBOL(kmap);
-
 void kunmap(struct page *page)
 {
 	might_sleep();
diff --git a/arch/csky/include/asm/highmem.h b/arch/csky/include/asm/highmem.h
index a345a2f2c22e..9d0516e38110 100644
--- a/arch/csky/include/asm/highmem.h
+++ b/arch/csky/include/asm/highmem.h
@@ -30,10 +30,10 @@ extern pte_t *pkmap_page_table;
 #define PKMAP_NR(virt)  ((virt-PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-extern void *kmap_high(struct page *page);
 extern void kunmap_high(struct page *page);
 
-extern void *kmap(struct page *page);
+#define ARCH_HAS_KMAP_FLUSH_TLB
+extern void kmap_flush_tlb(unsigned long addr);
 extern void kunmap(struct page *page);
 extern void *kmap_atomic(struct page *page);
 extern void __kunmap_atomic(void *kvaddr);
diff --git a/arch/csky/mm/highmem.c b/arch/csky/mm/highmem.c
index 690d678649d1..4a3c273bc8b9 100644
--- a/arch/csky/mm/highmem.c
+++ b/arch/csky/mm/highmem.c
@@ -13,18 +13,12 @@ static pte_t *kmap_pte;
 
 unsigned long highstart_pfn, highend_pfn;
 
-void *kmap(struct page *page)
+void kmap_flush_tlb(unsigned long addr)
 {
-	void *addr;
-
-	might_sleep();
-	if (!PageHighMem(page))
-		return page_address(page);
-	addr = kmap_high(page);
-	flush_tlb_one((unsigned long)addr);
-
-	return addr;
+	flush_tlb_one(addr);
 }
+EXPORT_SYMBOL(kmap_flush_tlb);
+
 EXPORT_SYMBOL(kmap);
 
 void kunmap(struct page *page)
diff --git a/arch/microblaze/include/asm/highmem.h b/arch/microblaze/include/asm/highmem.h
index 99ced7278b5c..8c5bfd228bd8 100644
--- a/arch/microblaze/include/asm/highmem.h
+++ b/arch/microblaze/include/asm/highmem.h
@@ -51,19 +51,10 @@ extern pte_t *pkmap_page_table;
 #define PKMAP_NR(virt)  ((virt - PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-extern void *kmap_high(struct page *page);
 extern void kunmap_high(struct page *page);
 extern void *kmap_atomic_prot(struct page *page, pgprot_t prot);
 extern void __kunmap_atomic(void *kvaddr);
 
-static inline void *kmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return page_address(page);
-	return kmap_high(page);
-}
-
 static inline void kunmap(struct page *page)
 {
 	might_sleep();
diff --git a/arch/mips/include/asm/highmem.h b/arch/mips/include/asm/highmem.h
index 9d84aafc33d0..1f741e3ecabf 100644
--- a/arch/mips/include/asm/highmem.h
+++ b/arch/mips/include/asm/highmem.h
@@ -46,10 +46,10 @@ extern pte_t *pkmap_page_table;
 #define PKMAP_NR(virt)	((virt-PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)	(PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-extern void * kmap_high(struct page *page);
 extern void kunmap_high(struct page *page);
 
-extern void *kmap(struct page *page);
+#define ARCH_HAS_KMAP_FLUSH_TLB
+extern void kmap_flush_tlb(unsigned long addr);
 extern void kunmap(struct page *page);
 extern void *kmap_atomic(struct page *page);
 extern void __kunmap_atomic(void *kvaddr);
diff --git a/arch/mips/mm/highmem.c b/arch/mips/mm/highmem.c
index edd889f6cede..c72058bfead6 100644
--- a/arch/mips/mm/highmem.c
+++ b/arch/mips/mm/highmem.c
@@ -12,19 +12,11 @@ static pte_t *kmap_pte;
 
 unsigned long highstart_pfn, highend_pfn;
 
-void *kmap(struct page *page)
+void kmap_flush_tlb(unsigned long addr)
 {
-	void *addr;
-
-	might_sleep();
-	if (!PageHighMem(page))
-		return page_address(page);
-	addr = kmap_high(page);
-	flush_tlb_one((unsigned long)addr);
-
-	return addr;
+	flush_tlb_one(addr);
 }
-EXPORT_SYMBOL(kmap);
+EXPORT_SYMBOL(kmap_flush_tlb);
 
 void kunmap(struct page *page)
 {
diff --git a/arch/nds32/include/asm/highmem.h b/arch/nds32/include/asm/highmem.h
index b3a82c97ded3..b13654a79069 100644
--- a/arch/nds32/include/asm/highmem.h
+++ b/arch/nds32/include/asm/highmem.h
@@ -44,7 +44,6 @@ extern unsigned long highstart_pfn, highend_pfn;
 
 extern pte_t *pkmap_page_table;
 
-extern void *kmap_high(struct page *page);
 extern void kunmap_high(struct page *page);
 
 extern void kmap_init(void);
@@ -54,7 +53,6 @@ extern void kmap_init(void);
  * when CONFIG_HIGHMEM is not set.
  */
 #ifdef CONFIG_HIGHMEM
-extern void *kmap(struct page *page);
 extern void kunmap(struct page *page);
 extern void *kmap_atomic(struct page *page);
 extern void __kunmap_atomic(void *kvaddr);
diff --git a/arch/nds32/mm/highmem.c b/arch/nds32/mm/highmem.c
index 4c7c28e994ea..d0cde53b84ae 100644
--- a/arch/nds32/mm/highmem.c
+++ b/arch/nds32/mm/highmem.c
@@ -10,18 +10,6 @@
 #include <asm/fixmap.h>
 #include <asm/tlbflush.h>
 
-void *kmap(struct page *page)
-{
-	unsigned long vaddr;
-	might_sleep();
-	if (!PageHighMem(page))
-		return page_address(page);
-	vaddr = (unsigned long)kmap_high(page);
-	return (void *)vaddr;
-}
-
-EXPORT_SYMBOL(kmap);
-
 void kunmap(struct page *page)
 {
 	might_sleep();
diff --git a/arch/powerpc/include/asm/highmem.h b/arch/powerpc/include/asm/highmem.h
index 529512f6d65a..f14e4feef6d5 100644
--- a/arch/powerpc/include/asm/highmem.h
+++ b/arch/powerpc/include/asm/highmem.h
@@ -59,19 +59,10 @@ extern pte_t *pkmap_page_table;
 #define PKMAP_NR(virt)  ((virt-PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-extern void *kmap_high(struct page *page);
 extern void kunmap_high(struct page *page);
 extern void *kmap_atomic_prot(struct page *page, pgprot_t prot);
 extern void __kunmap_atomic(void *kvaddr);
 
-static inline void *kmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return page_address(page);
-	return kmap_high(page);
-}
-
 static inline void kunmap(struct page *page)
 {
 	might_sleep();
diff --git a/arch/sparc/include/asm/highmem.h b/arch/sparc/include/asm/highmem.h
index 7dd2d4b3f980..2ff1192047f7 100644
--- a/arch/sparc/include/asm/highmem.h
+++ b/arch/sparc/include/asm/highmem.h
@@ -50,17 +50,8 @@ void kmap_init(void) __init;
 
 #define PKMAP_END (PKMAP_ADDR(LAST_PKMAP))
 
-void *kmap_high(struct page *page);
 void kunmap_high(struct page *page);
 
-static inline void *kmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return page_address(page);
-	return kmap_high(page);
-}
-
 static inline void kunmap(struct page *page)
 {
 	might_sleep();
diff --git a/arch/x86/include/asm/highmem.h b/arch/x86/include/asm/highmem.h
index a8059930056d..c916a28a9738 100644
--- a/arch/x86/include/asm/highmem.h
+++ b/arch/x86/include/asm/highmem.h
@@ -58,10 +58,8 @@ extern unsigned long highstart_pfn, highend_pfn;
 #define PKMAP_NR(virt)  ((virt-PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-extern void *kmap_high(struct page *page);
 extern void kunmap_high(struct page *page);
 
-void *kmap(struct page *page);
 void kunmap(struct page *page);
 
 void *kmap_atomic_prot(struct page *page, pgprot_t prot);
diff --git a/arch/x86/mm/highmem_32.c b/arch/x86/mm/highmem_32.c
index 8af66382672b..12591a81b85c 100644
--- a/arch/x86/mm/highmem_32.c
+++ b/arch/x86/mm/highmem_32.c
@@ -4,15 +4,6 @@
 #include <linux/swap.h> /* for totalram_pages */
 #include <linux/memblock.h>
 
-void *kmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return page_address(page);
-	return kmap_high(page);
-}
-EXPORT_SYMBOL(kmap);
-
 void kunmap(struct page *page)
 {
 	might_sleep();
diff --git a/arch/xtensa/include/asm/highmem.h b/arch/xtensa/include/asm/highmem.h
index a9587c85be85..2546b88ddecf 100644
--- a/arch/xtensa/include/asm/highmem.h
+++ b/arch/xtensa/include/asm/highmem.h
@@ -63,17 +63,8 @@ static inline wait_queue_head_t *get_pkmap_wait_queue_head(unsigned int color)
 
 extern pte_t *pkmap_page_table;
 
-void *kmap_high(struct page *page);
 void kunmap_high(struct page *page);
 
-static inline void *kmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return page_address(page);
-	return kmap_high(page);
-}
-
 static inline void kunmap(struct page *page)
 {
 	might_sleep();
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index ea5cdbd8c2c3..fc3adc51254a 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -34,6 +34,24 @@ static inline void invalidate_kernel_vmap_range(void *vaddr, int size)
 #ifdef CONFIG_HIGHMEM
 #include <asm/highmem.h>
 
+#ifndef ARCH_HAS_KMAP_FLUSH_TLB
+static inline void kmap_flush_tlb(unsigned long addr) { }
+#endif
+
+void *kmap_high(struct page *page);
+static inline void *kmap(struct page *page)
+{
+	void *addr;
+
+	might_sleep();
+	if (!PageHighMem(page))
+		addr = page_address(page);
+	else
+		addr = kmap_high(page);
+	kmap_flush_tlb((unsigned long)addr);
+	return addr;
+}
+
 /* declarations for linux/mm/highmem.c */
 unsigned int nr_free_highpages(void);
 extern atomic_long_t _totalhigh_pages;
-- 
2.25.1

