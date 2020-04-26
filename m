Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2191B8CCF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 08:02:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498y4L4rf2zDqdc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 16:02:42 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 498xv34FHmzDqKS
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 15:54:39 +1000 (AEST)
IronPort-SDR: i3D2qFjTQAyKQDq2xYj9wcVFbsB6jDU2v8soMXQ7PePti2HnrNkG1iNL2sDtwkOysBRV1uqeuE
 IoKJczztblHg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2020 22:54:23 -0700
IronPort-SDR: cx88cSBlRxSL+ntfH3sL2yK1eLs9LSednmue8odGKUh2mrKFYgcR/pzIaZYWqIi2OxqYOInn8s
 94VzyyLw2D4A==
X-IronPort-AV: E=Sophos;i="5.73,319,1583222400"; d="scan'208";a="256859643"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2020 22:54:22 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/5] arch/kmap: Remove redundant arch specific kmaps
Date: Sat, 25 Apr 2020 22:54:03 -0700
Message-Id: <20200426055406.134198-3-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200426055406.134198-1-ira.weiny@intel.com>
References: <20200426055406.134198-1-ira.weiny@intel.com>
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
 Dave Hansen <dave.hansen@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ira Weiny <ira.weiny@intel.com>

The kmap code for all the architectures is almost 100% identical.

Lift the common code to the core.  Use ARCH_HAS_KMAP to indicate if an
arch needs a special kmap.

This also has the benefit of changing kmap() on a number of
architectures to be an inline call rather than an actual function.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/arc/include/asm/highmem.h        |  2 --
 arch/arc/mm/highmem.c                 | 10 ----------
 arch/arm/include/asm/highmem.h        |  2 --
 arch/arm/mm/highmem.c                 |  9 ---------
 arch/csky/include/asm/highmem.h       |  2 +-
 arch/csky/mm/highmem.c                |  7 +------
 arch/microblaze/include/asm/highmem.h |  9 ---------
 arch/mips/include/asm/highmem.h       |  2 +-
 arch/mips/mm/highmem.c                |  7 +------
 arch/nds32/include/asm/highmem.h      |  2 --
 arch/nds32/mm/highmem.c               | 12 ------------
 arch/powerpc/include/asm/highmem.h    |  9 ---------
 arch/sparc/include/asm/highmem.h      |  9 ---------
 arch/x86/include/asm/highmem.h        |  2 --
 arch/x86/mm/highmem_32.c              |  9 ---------
 arch/xtensa/include/asm/highmem.h     |  6 +-----
 include/linux/highmem.h               | 18 ++++++++++++++++++
 17 files changed, 23 insertions(+), 94 deletions(-)

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
index a345a2f2c22e..4caeff143748 100644
--- a/arch/csky/include/asm/highmem.h
+++ b/arch/csky/include/asm/highmem.h
@@ -30,9 +30,9 @@ extern pte_t *pkmap_page_table;
 #define PKMAP_NR(virt)  ((virt-PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-extern void *kmap_high(struct page *page);
 extern void kunmap_high(struct page *page);
 
+#define ARCH_HAS_KMAP
 extern void *kmap(struct page *page);
 extern void kunmap(struct page *page);
 extern void *kmap_atomic(struct page *page);
diff --git a/arch/csky/mm/highmem.c b/arch/csky/mm/highmem.c
index 690d678649d1..5fb0bd855444 100644
--- a/arch/csky/mm/highmem.c
+++ b/arch/csky/mm/highmem.c
@@ -15,14 +15,9 @@ unsigned long highstart_pfn, highend_pfn;
 
 void *kmap(struct page *page)
 {
-	void *addr;
+	void *addr = kmap_generic(page);
 
-	might_sleep();
-	if (!PageHighMem(page))
-		return page_address(page);
-	addr = kmap_high(page);
 	flush_tlb_one((unsigned long)addr);
-
 	return addr;
 }
 EXPORT_SYMBOL(kmap);
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
index 9d84aafc33d0..c30bbb88fcfe 100644
--- a/arch/mips/include/asm/highmem.h
+++ b/arch/mips/include/asm/highmem.h
@@ -46,9 +46,9 @@ extern pte_t *pkmap_page_table;
 #define PKMAP_NR(virt)	((virt-PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)	(PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-extern void * kmap_high(struct page *page);
 extern void kunmap_high(struct page *page);
 
+#define ARCH_HAS_KMAP
 extern void *kmap(struct page *page);
 extern void kunmap(struct page *page);
 extern void *kmap_atomic(struct page *page);
diff --git a/arch/mips/mm/highmem.c b/arch/mips/mm/highmem.c
index edd889f6cede..3867dbe9ef32 100644
--- a/arch/mips/mm/highmem.c
+++ b/arch/mips/mm/highmem.c
@@ -14,14 +14,9 @@ unsigned long highstart_pfn, highend_pfn;
 
 void *kmap(struct page *page)
 {
-	void *addr;
+	void *addr = kmap_generic(page);
 
-	might_sleep();
-	if (!PageHighMem(page))
-		return page_address(page);
-	addr = kmap_high(page);
 	flush_tlb_one((unsigned long)addr);
-
 	return addr;
 }
 EXPORT_SYMBOL(kmap);
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
index 413848cc1e56..fac4f48bde6c 100644
--- a/arch/xtensa/include/asm/highmem.h
+++ b/arch/xtensa/include/asm/highmem.h
@@ -63,7 +63,6 @@ static inline wait_queue_head_t *get_pkmap_wait_queue_head(unsigned int color)
 
 extern pte_t *pkmap_page_table;
 
-void *kmap_high(struct page *page);
 void kunmap_high(struct page *page);
 
 static inline void *kmap(struct page *page)
@@ -73,10 +72,7 @@ static inline void *kmap(struct page *page)
 	 */
 	BUILD_BUG_ON(PKMAP_BASE <
 		     TLBTEMP_BASE_1 + TLBTEMP_SIZE);
-	might_sleep();
-	if (!PageHighMem(page))
-		return page_address(page);
-	return kmap_high(page);
+	return kmap_generic(page);
 }
 
 static inline void kunmap(struct page *page)
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index ea5cdbd8c2c3..2f7f710b7e7d 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -32,8 +32,26 @@ static inline void invalidate_kernel_vmap_range(void *vaddr, int size)
 #include <asm/kmap_types.h>
 
 #ifdef CONFIG_HIGHMEM
+extern void *kmap_high(struct page *page);
+
+/* kmap_generic: architecture independent portion of kmap calls */
+static inline void *kmap_generic(struct page *page)
+{
+	might_sleep();
+	if (!PageHighMem(page))
+		return page_address(page);
+	return kmap_high(page);
+}
+
 #include <asm/highmem.h>
 
+#ifndef ARCH_HAS_KMAP
+static inline void *kmap(struct page *page)
+{
+	return kmap_generic(page);
+}
+#endif
+
 /* declarations for linux/mm/highmem.c */
 unsigned int nr_free_highpages(void);
 extern atomic_long_t _totalhigh_pages;
-- 
2.25.1

