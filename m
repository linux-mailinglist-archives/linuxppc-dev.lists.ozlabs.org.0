Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A851C9655
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 18:22:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HzJm1WswzDqVr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 02:22:47 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HxTf0l05zDqQB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 01:00:21 +1000 (AEST)
IronPort-SDR: jvoL6QtLdekNIyReWZ5E5qk7FiM87I8TBkC07asd5PlA08BC3h97+/7cEAxt1HWhjbZm64NnnF
 0RtCpRQ7ULSg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:00:21 -0700
IronPort-SDR: saT76zwPdNDhyVhlS8gGstj7Z1vEVhsiCVSWpU8SA2MZuPcSyBfm4xuaedmODqMXokcDkJBKU+
 8RFyk6fiFs3w==
X-IronPort-AV: E=Sophos;i="5.73,364,1583222400"; d="scan'208";a="370140539"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:00:21 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH V3 13/15] parisc/kmap: Remove duplicate kmap code
Date: Thu,  7 May 2020 08:00:01 -0700
Message-Id: <20200507150004.1423069-14-ira.weiny@intel.com>
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

parisc reimplements the kmap calls except to flush it's dcache.  This is
arguably an abuse of kmap but regardless it is messy and confusing.

Remove the duplicate code and have parisc define
ARCH_HAS_FLUSH_ON_KUNMAP for a kunmap_flush_on_unmap() architecture
specific call to flush the cache.

Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Changes from V2:
	New Patch for this series
---
 arch/parisc/include/asm/cacheflush.h | 28 ++--------------------------
 include/linux/highmem.h              | 10 +++++++---
 2 files changed, 9 insertions(+), 29 deletions(-)

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index 119c9a7681bc..99663fc1f997 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -100,35 +100,11 @@ flush_anon_page(struct vm_area_struct *vma, struct page *page, unsigned long vma
 	}
 }
 
-#include <asm/kmap_types.h>
-
-#define ARCH_HAS_KMAP
-
-static inline void *kmap(struct page *page)
-{
-	might_sleep();
-	return page_address(page);
-}
-
-static inline void kunmap(struct page *page)
-{
-	flush_kernel_dcache_page_addr(page_address(page));
-}
-
-static inline void *kmap_atomic(struct page *page)
-{
-	preempt_disable();
-	pagefault_disable();
-	return page_address(page);
-}
-
-static inline void kunmap_atomic_high(void *addr)
+#define ARCH_HAS_FLUSH_ON_KUNMAP
+static inline void kunmap_flush_on_unmap(void *addr)
 {
 	flush_kernel_dcache_page_addr(addr);
 }
 
-#define kmap_atomic_prot(page, prot)	kmap_atomic(page)
-#define kmap_atomic_pfn(pfn)	kmap_atomic(pfn_to_page(pfn))
-
 #endif /* _PARISC_CACHEFLUSH_H */
 
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 89838306f50d..cc0c3904e501 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -129,7 +129,6 @@ static inline struct page *kmap_to_page(void *addr)
 
 static inline unsigned long totalhigh_pages(void) { return 0UL; }
 
-#ifndef ARCH_HAS_KMAP
 static inline void *kmap(struct page *page)
 {
 	might_sleep();
@@ -138,6 +137,9 @@ static inline void *kmap(struct page *page)
 
 static inline void kunmap(struct page *page)
 {
+#ifdef ARCH_HAS_FLUSH_ON_KUNMAP
+	kunmap_flush_on_unmap(page_address(page));
+#endif
 }
 
 static inline void *kmap_atomic(struct page *page)
@@ -150,14 +152,16 @@ static inline void *kmap_atomic(struct page *page)
 
 static inline void kunmap_atomic_high(void *addr)
 {
-	/* Nothing to do in the CONFIG_HIGHMEM=n case as kunmap_atomic()
+	/* Mostly nothing to do in the CONFIG_HIGHMEM=n case as kunmap_atomic()
 	 * handles re-enabling faults + preemption */
+#ifdef ARCH_HAS_FLUSH_ON_KUNMAP
+	kunmap_flush_on_unmap(addr);
+#endif
 }
 
 #define kmap_atomic_pfn(pfn)	kmap_atomic(pfn_to_page(pfn))
 
 #define kmap_flush_unused()	do {} while(0)
-#endif
 
 #endif /* CONFIG_HIGHMEM */
 
-- 
2.25.1

