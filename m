Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 313D31C9539
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 17:37:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HyJq4fLfzDqNv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 01:37:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HxTW4LnwzDqTw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 01:00:15 +1000 (AEST)
IronPort-SDR: 5c0zxLQBGD2EanBftwnHICES+T9OsxuJfUw9v4O3419kXxrBfd3JnfUqye7wXGSi95g6rNXyKk
 FsL44vW2Yy8A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:00:15 -0700
IronPort-SDR: 4BYpT56MbISnCWjwwcSrN4GVaxAd1jqz+DFaLarlM0yXQ2OKqHxr1l1qp4US8Uxsw2qWtwYmJl
 7HOb6t0B+/sA==
X-IronPort-AV: E=Sophos;i="5.73,364,1583222400"; d="scan'208";a="260551589"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:00:11 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH V3 04/15] arch/kunmap: Remove duplicate kunmap implementations
Date: Thu,  7 May 2020 07:59:52 -0700
Message-Id: <20200507150004.1423069-5-ira.weiny@intel.com>
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

All architectures do exactly the same thing for kunmap(); remove all the
duplicate definitions and lift the call to the core.

This also has the benefit of changing kmap_unmap() on a number of
architectures to be an inline call rather than an actual function.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/arc/include/asm/highmem.h        | 10 ----------
 arch/arm/include/asm/highmem.h        |  3 ---
 arch/arm/mm/highmem.c                 |  9 ---------
 arch/csky/include/asm/highmem.h       |  3 ---
 arch/csky/mm/highmem.c                |  9 ---------
 arch/microblaze/include/asm/highmem.h |  9 ---------
 arch/mips/include/asm/highmem.h       |  3 ---
 arch/mips/mm/highmem.c                |  9 ---------
 arch/nds32/include/asm/highmem.h      |  3 ---
 arch/nds32/mm/highmem.c               | 10 ----------
 arch/powerpc/include/asm/highmem.h    |  9 ---------
 arch/sparc/include/asm/highmem.h      | 10 ----------
 arch/x86/include/asm/highmem.h        |  4 ----
 arch/x86/mm/highmem_32.c              |  9 ---------
 arch/xtensa/include/asm/highmem.h     | 10 ----------
 include/linux/highmem.h               |  9 +++++++++
 16 files changed, 9 insertions(+), 110 deletions(-)

diff --git a/arch/arc/include/asm/highmem.h b/arch/arc/include/asm/highmem.h
index 96eb67c86961..8387a5596a91 100644
--- a/arch/arc/include/asm/highmem.h
+++ b/arch/arc/include/asm/highmem.h
@@ -32,7 +32,6 @@
 
 extern void *kmap_atomic(struct page *page);
 extern void __kunmap_atomic(void *kvaddr);
-extern void kunmap_high(struct page *page);
 
 extern void kmap_init(void);
 
@@ -41,15 +40,6 @@ static inline void flush_cache_kmaps(void)
 	flush_cache_all();
 }
 
-static inline void kunmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return;
-	kunmap_high(page);
-}
-
-
 #endif
 
 #endif
diff --git a/arch/arm/include/asm/highmem.h b/arch/arm/include/asm/highmem.h
index c917522541de..736f65283e7b 100644
--- a/arch/arm/include/asm/highmem.h
+++ b/arch/arm/include/asm/highmem.h
@@ -20,8 +20,6 @@
 
 extern pte_t *pkmap_page_table;
 
-extern void kunmap_high(struct page *page);
-
 /*
  * The reason for kmap_high_get() is to ensure that the currently kmap'd
  * page usage count does not decrease to zero while we're using its
@@ -62,7 +60,6 @@ static inline void *kmap_high_get(struct page *page)
  * when CONFIG_HIGHMEM is not set.
  */
 #ifdef CONFIG_HIGHMEM
-extern void kunmap(struct page *page);
 extern void *kmap_atomic(struct page *page);
 extern void __kunmap_atomic(void *kvaddr);
 extern void *kmap_atomic_pfn(unsigned long pfn);
diff --git a/arch/arm/mm/highmem.c b/arch/arm/mm/highmem.c
index e8ba37c36590..c700b32350ee 100644
--- a/arch/arm/mm/highmem.c
+++ b/arch/arm/mm/highmem.c
@@ -31,15 +31,6 @@ static inline pte_t get_fixmap_pte(unsigned long vaddr)
 	return *ptep;
 }
 
-void kunmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return;
-	kunmap_high(page);
-}
-EXPORT_SYMBOL(kunmap);
-
 void *kmap_atomic(struct page *page)
 {
 	unsigned int idx;
diff --git a/arch/csky/include/asm/highmem.h b/arch/csky/include/asm/highmem.h
index 9d0516e38110..be11c5b67122 100644
--- a/arch/csky/include/asm/highmem.h
+++ b/arch/csky/include/asm/highmem.h
@@ -30,11 +30,8 @@ extern pte_t *pkmap_page_table;
 #define PKMAP_NR(virt)  ((virt-PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-extern void kunmap_high(struct page *page);
-
 #define ARCH_HAS_KMAP_FLUSH_TLB
 extern void kmap_flush_tlb(unsigned long addr);
-extern void kunmap(struct page *page);
 extern void *kmap_atomic(struct page *page);
 extern void __kunmap_atomic(void *kvaddr);
 extern void *kmap_atomic_pfn(unsigned long pfn);
diff --git a/arch/csky/mm/highmem.c b/arch/csky/mm/highmem.c
index 4a3c273bc8b9..e9952211264b 100644
--- a/arch/csky/mm/highmem.c
+++ b/arch/csky/mm/highmem.c
@@ -21,15 +21,6 @@ EXPORT_SYMBOL(kmap_flush_tlb);
 
 EXPORT_SYMBOL(kmap);
 
-void kunmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return;
-	kunmap_high(page);
-}
-EXPORT_SYMBOL(kunmap);
-
 void *kmap_atomic(struct page *page)
 {
 	unsigned long vaddr;
diff --git a/arch/microblaze/include/asm/highmem.h b/arch/microblaze/include/asm/highmem.h
index 8c5bfd228bd8..0c94046f2d58 100644
--- a/arch/microblaze/include/asm/highmem.h
+++ b/arch/microblaze/include/asm/highmem.h
@@ -51,18 +51,9 @@ extern pte_t *pkmap_page_table;
 #define PKMAP_NR(virt)  ((virt - PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-extern void kunmap_high(struct page *page);
 extern void *kmap_atomic_prot(struct page *page, pgprot_t prot);
 extern void __kunmap_atomic(void *kvaddr);
 
-static inline void kunmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return;
-	kunmap_high(page);
-}
-
 static inline void *kmap_atomic(struct page *page)
 {
 	return kmap_atomic_prot(page, kmap_prot);
diff --git a/arch/mips/include/asm/highmem.h b/arch/mips/include/asm/highmem.h
index 1f741e3ecabf..24e7e7e5cc7b 100644
--- a/arch/mips/include/asm/highmem.h
+++ b/arch/mips/include/asm/highmem.h
@@ -46,11 +46,8 @@ extern pte_t *pkmap_page_table;
 #define PKMAP_NR(virt)	((virt-PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)	(PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-extern void kunmap_high(struct page *page);
-
 #define ARCH_HAS_KMAP_FLUSH_TLB
 extern void kmap_flush_tlb(unsigned long addr);
-extern void kunmap(struct page *page);
 extern void *kmap_atomic(struct page *page);
 extern void __kunmap_atomic(void *kvaddr);
 extern void *kmap_atomic_pfn(unsigned long pfn);
diff --git a/arch/mips/mm/highmem.c b/arch/mips/mm/highmem.c
index c72058bfead6..eb8ec8493f2f 100644
--- a/arch/mips/mm/highmem.c
+++ b/arch/mips/mm/highmem.c
@@ -18,15 +18,6 @@ void kmap_flush_tlb(unsigned long addr)
 }
 EXPORT_SYMBOL(kmap_flush_tlb);
 
-void kunmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return;
-	kunmap_high(page);
-}
-EXPORT_SYMBOL(kunmap);
-
 /*
  * kmap_atomic/kunmap_atomic is significantly faster than kmap/kunmap because
  * no global lock is needed and because the kmap code must perform a global TLB
diff --git a/arch/nds32/include/asm/highmem.h b/arch/nds32/include/asm/highmem.h
index b13654a79069..c93c7368bb3f 100644
--- a/arch/nds32/include/asm/highmem.h
+++ b/arch/nds32/include/asm/highmem.h
@@ -44,8 +44,6 @@ extern unsigned long highstart_pfn, highend_pfn;
 
 extern pte_t *pkmap_page_table;
 
-extern void kunmap_high(struct page *page);
-
 extern void kmap_init(void);
 
 /*
@@ -53,7 +51,6 @@ extern void kmap_init(void);
  * when CONFIG_HIGHMEM is not set.
  */
 #ifdef CONFIG_HIGHMEM
-extern void kunmap(struct page *page);
 extern void *kmap_atomic(struct page *page);
 extern void __kunmap_atomic(void *kvaddr);
 extern void *kmap_atomic_pfn(unsigned long pfn);
diff --git a/arch/nds32/mm/highmem.c b/arch/nds32/mm/highmem.c
index d0cde53b84ae..f9348bec0ecb 100644
--- a/arch/nds32/mm/highmem.c
+++ b/arch/nds32/mm/highmem.c
@@ -10,16 +10,6 @@
 #include <asm/fixmap.h>
 #include <asm/tlbflush.h>
 
-void kunmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return;
-	kunmap_high(page);
-}
-
-EXPORT_SYMBOL(kunmap);
-
 void *kmap_atomic(struct page *page)
 {
 	unsigned int idx;
diff --git a/arch/powerpc/include/asm/highmem.h b/arch/powerpc/include/asm/highmem.h
index f14e4feef6d5..ba3371977d49 100644
--- a/arch/powerpc/include/asm/highmem.h
+++ b/arch/powerpc/include/asm/highmem.h
@@ -59,18 +59,9 @@ extern pte_t *pkmap_page_table;
 #define PKMAP_NR(virt)  ((virt-PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-extern void kunmap_high(struct page *page);
 extern void *kmap_atomic_prot(struct page *page, pgprot_t prot);
 extern void __kunmap_atomic(void *kvaddr);
 
-static inline void kunmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return;
-	kunmap_high(page);
-}
-
 static inline void *kmap_atomic(struct page *page)
 {
 	return kmap_atomic_prot(page, kmap_prot);
diff --git a/arch/sparc/include/asm/highmem.h b/arch/sparc/include/asm/highmem.h
index 2ff1192047f7..4bdb79fed02c 100644
--- a/arch/sparc/include/asm/highmem.h
+++ b/arch/sparc/include/asm/highmem.h
@@ -50,16 +50,6 @@ void kmap_init(void) __init;
 
 #define PKMAP_END (PKMAP_ADDR(LAST_PKMAP))
 
-void kunmap_high(struct page *page);
-
-static inline void kunmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return;
-	kunmap_high(page);
-}
-
 void *kmap_atomic(struct page *page);
 void __kunmap_atomic(void *kvaddr);
 
diff --git a/arch/x86/include/asm/highmem.h b/arch/x86/include/asm/highmem.h
index c916a28a9738..90b96594d6c5 100644
--- a/arch/x86/include/asm/highmem.h
+++ b/arch/x86/include/asm/highmem.h
@@ -58,10 +58,6 @@ extern unsigned long highstart_pfn, highend_pfn;
 #define PKMAP_NR(virt)  ((virt-PKMAP_BASE) >> PAGE_SHIFT)
 #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
 
-extern void kunmap_high(struct page *page);
-
-void kunmap(struct page *page);
-
 void *kmap_atomic_prot(struct page *page, pgprot_t prot);
 void *kmap_atomic(struct page *page);
 void __kunmap_atomic(void *kvaddr);
diff --git a/arch/x86/mm/highmem_32.c b/arch/x86/mm/highmem_32.c
index 12591a81b85c..c4ebfd0ae401 100644
--- a/arch/x86/mm/highmem_32.c
+++ b/arch/x86/mm/highmem_32.c
@@ -4,15 +4,6 @@
 #include <linux/swap.h> /* for totalram_pages */
 #include <linux/memblock.h>
 
-void kunmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return;
-	kunmap_high(page);
-}
-EXPORT_SYMBOL(kunmap);
-
 /*
  * kmap_atomic/kunmap_atomic is significantly faster than kmap/kunmap because
  * no global lock is needed and because the kmap code must perform a global TLB
diff --git a/arch/xtensa/include/asm/highmem.h b/arch/xtensa/include/asm/highmem.h
index 2546b88ddecf..5a481f7def0b 100644
--- a/arch/xtensa/include/asm/highmem.h
+++ b/arch/xtensa/include/asm/highmem.h
@@ -63,16 +63,6 @@ static inline wait_queue_head_t *get_pkmap_wait_queue_head(unsigned int color)
 
 extern pte_t *pkmap_page_table;
 
-void kunmap_high(struct page *page);
-
-static inline void kunmap(struct page *page)
-{
-	might_sleep();
-	if (!PageHighMem(page))
-		return;
-	kunmap_high(page);
-}
-
 static inline void flush_cache_kmaps(void)
 {
 	flush_cache_all();
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index fc3adc51254a..ae6e8cb81043 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -52,6 +52,15 @@ static inline void *kmap(struct page *page)
 	return addr;
 }
 
+void kunmap_high(struct page *page);
+static inline void kunmap(struct page *page)
+{
+	might_sleep();
+	if (!PageHighMem(page))
+		return;
+	kunmap_high(page);
+}
+
 /* declarations for linux/mm/highmem.c */
 unsigned int nr_free_highpages(void);
 extern atomic_long_t _totalhigh_pages;
-- 
2.25.1

