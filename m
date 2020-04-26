Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DEE1B8CCD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 08:00:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498y2H5Cl3zDqgl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 16:00:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498xv24DCFzDqZb
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 15:54:26 +1000 (AEST)
IronPort-SDR: 7bA0RCMquQahPC4vA97ZvPvzuqK4AN1BXe8D54+uHVDrVfyi1MqsocUpJlInVSHSGhEgH9VeMU
 tB2vLO7DqwCg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2020 22:54:24 -0700
IronPort-SDR: ULIPpftXlRuZVncLUHSwuauSzU7AMt8SQ3FSLW4e25oH6OANV+RbXbJFufO4yzakpq0D15kNUU
 6n3sFI9wk+2w==
X-IronPort-AV: E=Sophos;i="5.73,319,1583222400"; d="scan'208";a="245732999"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2020 22:54:23 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 5/5] arch/kunmap_atomic: Consolidate duplicate code
Date: Sat, 25 Apr 2020 22:54:06 -0700
Message-Id: <20200426055406.134198-6-ira.weiny@intel.com>
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

Every single architecture (including !CONFIG_HIGHMEM) calls...

	pagefault_enable();
	preempt_enable();

... before returning from __kunmap_atomic().  Lift this code into the
kunmap_atomic() macro.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/arc/mm/highmem.c                | 3 ---
 arch/arm/mm/highmem.c                | 2 --
 arch/csky/mm/highmem.c               | 5 +----
 arch/microblaze/mm/highmem.c         | 2 --
 arch/mips/mm/highmem.c               | 2 --
 arch/nds32/mm/highmem.c              | 2 --
 arch/parisc/include/asm/cacheflush.h | 2 --
 arch/powerpc/mm/highmem.c            | 2 --
 arch/sparc/mm/highmem.c              | 2 --
 arch/x86/mm/highmem_32.c             | 3 ---
 arch/xtensa/mm/highmem.c             | 3 ---
 include/linux/highmem.h              | 6 ++++--
 12 files changed, 5 insertions(+), 29 deletions(-)

diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
index 1cae4b911a33..0725fc56b016 100644
--- a/arch/arc/mm/highmem.c
+++ b/arch/arc/mm/highmem.c
@@ -91,9 +91,6 @@ void __kunmap_atomic(void *kv)
 
 		kmap_atomic_idx_pop();
 	}
-
-	pagefault_enable();
-	preempt_enable();
 }
 EXPORT_SYMBOL(__kunmap_atomic);
 
diff --git a/arch/arm/mm/highmem.c b/arch/arm/mm/highmem.c
index 4a629f616a6a..4983bf18ec32 100644
--- a/arch/arm/mm/highmem.c
+++ b/arch/arm/mm/highmem.c
@@ -98,8 +98,6 @@ void __kunmap_atomic(void *kvaddr)
 		/* this address was obtained through kmap_high_get() */
 		kunmap_high(pte_page(pkmap_page_table[PKMAP_NR(vaddr)]));
 	}
-	pagefault_enable();
-	preempt_enable();
 }
 EXPORT_SYMBOL(__kunmap_atomic);
 
diff --git a/arch/csky/mm/highmem.c b/arch/csky/mm/highmem.c
index 1191f57f53ae..106fa6773084 100644
--- a/arch/csky/mm/highmem.c
+++ b/arch/csky/mm/highmem.c
@@ -50,7 +50,7 @@ void __kunmap_atomic(void *kvaddr)
 	int idx;
 
 	if (vaddr < FIXADDR_START)
-		goto out;
+		return;
 
 #ifdef CONFIG_DEBUG_HIGHMEM
 	idx = KM_TYPE_NR*smp_processor_id() + kmap_atomic_idx();
@@ -63,9 +63,6 @@ void __kunmap_atomic(void *kvaddr)
 	(void) idx; /* to kill a warning */
 #endif
 	kmap_atomic_idx_pop();
-out:
-	pagefault_enable();
-	preempt_enable();
 }
 EXPORT_SYMBOL(__kunmap_atomic);
 
diff --git a/arch/microblaze/mm/highmem.c b/arch/microblaze/mm/highmem.c
index 99fdf826edc2..d382c6821747 100644
--- a/arch/microblaze/mm/highmem.c
+++ b/arch/microblaze/mm/highmem.c
@@ -81,7 +81,5 @@ void __kunmap_atomic(void *kvaddr)
 	local_flush_tlb_page(NULL, vaddr);
 
 	kmap_atomic_idx_pop();
-	pagefault_enable();
-	preempt_enable();
 }
 EXPORT_SYMBOL(__kunmap_atomic);
diff --git a/arch/mips/mm/highmem.c b/arch/mips/mm/highmem.c
index ba03ca75d4a1..5a3fc7e84e66 100644
--- a/arch/mips/mm/highmem.c
+++ b/arch/mips/mm/highmem.c
@@ -79,8 +79,6 @@ void __kunmap_atomic(void *kvaddr)
 	}
 #endif
 	kmap_atomic_idx_pop();
-	pagefault_enable();
-	preempt_enable();
 }
 EXPORT_SYMBOL(__kunmap_atomic);
 
diff --git a/arch/nds32/mm/highmem.c b/arch/nds32/mm/highmem.c
index 4aabde586489..b8862aafa189 100644
--- a/arch/nds32/mm/highmem.c
+++ b/arch/nds32/mm/highmem.c
@@ -49,8 +49,6 @@ void __kunmap_atomic(void *kvaddr)
 		ptep = pte_offset_kernel(pmd_off_k(vaddr), vaddr);
 		set_pte(ptep, 0);
 	}
-	pagefault_enable();
-	preempt_enable();
 }
 
 EXPORT_SYMBOL(__kunmap_atomic);
diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index 0c83644bfa5c..c8458491b9af 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -125,8 +125,6 @@ static inline void *kmap_atomic(struct page *page)
 static inline void __kunmap_atomic(void *addr)
 {
 	flush_kernel_dcache_page_addr(addr);
-	pagefault_enable();
-	preempt_enable();
 }
 
 #define kmap_atomic_prot(page, prot)	kmap_atomic(page)
diff --git a/arch/powerpc/mm/highmem.c b/arch/powerpc/mm/highmem.c
index cdf5b716801a..7dfccf519621 100644
--- a/arch/powerpc/mm/highmem.c
+++ b/arch/powerpc/mm/highmem.c
@@ -76,7 +76,5 @@ void __kunmap_atomic(void *kvaddr)
 	}
 
 	kmap_atomic_idx_pop();
-	pagefault_enable();
-	preempt_enable();
 }
 EXPORT_SYMBOL(__kunmap_atomic);
diff --git a/arch/sparc/mm/highmem.c b/arch/sparc/mm/highmem.c
index 178641805567..7a99a1097f67 100644
--- a/arch/sparc/mm/highmem.c
+++ b/arch/sparc/mm/highmem.c
@@ -130,7 +130,5 @@ void __kunmap_atomic(void *kvaddr)
 #endif
 
 	kmap_atomic_idx_pop();
-	pagefault_enable();
-	preempt_enable();
 }
 EXPORT_SYMBOL(__kunmap_atomic);
diff --git a/arch/x86/mm/highmem_32.c b/arch/x86/mm/highmem_32.c
index 34770499b0ff..b20e81b2b833 100644
--- a/arch/x86/mm/highmem_32.c
+++ b/arch/x86/mm/highmem_32.c
@@ -78,9 +78,6 @@ void __kunmap_atomic(void *kvaddr)
 		BUG_ON(vaddr >= (unsigned long)high_memory);
 	}
 #endif
-
-	pagefault_enable();
-	preempt_enable();
 }
 EXPORT_SYMBOL(__kunmap_atomic);
 
diff --git a/arch/xtensa/mm/highmem.c b/arch/xtensa/mm/highmem.c
index 38c14e0b578c..9a49263e4cd6 100644
--- a/arch/xtensa/mm/highmem.c
+++ b/arch/xtensa/mm/highmem.c
@@ -77,9 +77,6 @@ void __kunmap_atomic(void *kvaddr)
 
 		kmap_atomic_idx_pop();
 	}
-
-	pagefault_enable();
-	preempt_enable();
 }
 EXPORT_SYMBOL(__kunmap_atomic);
 
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index eee53e151900..94145d4200ab 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -133,8 +133,8 @@ static inline void *kmap_atomic(struct page *page)
 
 static inline void __kunmap_atomic(void *addr)
 {
-	pagefault_enable();
-	preempt_enable();
+	/* Nothing to do in the CONFIG_HIGHMEM=n case as kunmap_atomic()
+	 * handles re-enabling faults + preemption */
 }
 
 #define kmap_atomic_pfn(pfn)	kmap_atomic(pfn_to_page(pfn))
@@ -185,6 +185,8 @@ static inline void kmap_atomic_idx_pop(void)
 do {                                                            \
 	BUILD_BUG_ON(__same_type((addr), struct page *));       \
 	__kunmap_atomic(addr);                                  \
+	pagefault_enable();                                     \
+	preempt_enable();                                       \
 } while (0)
 
 
-- 
2.25.1

