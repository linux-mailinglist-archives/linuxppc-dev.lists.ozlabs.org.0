Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE9F1A7A14
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 13:50:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491kMB251HzDqc6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 21:50:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 491kFC0HlmzDqc5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 21:45:18 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A672B1FB;
 Tue, 14 Apr 2020 04:45:16 -0700 (PDT)
Received: from p8cg001049571a15.arm.com (unknown [10.163.1.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8B1B93F6C4;
 Tue, 14 Apr 2020 04:45:06 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [PATCH 3/3] mm/hugetlb: Introduce HAVE_ARCH_CLEAR_HUGEPAGE_FLAGS
Date: Tue, 14 Apr 2020 17:14:30 +0530
Message-Id: <1586864670-21799-4-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586864670-21799-1-git-send-email-anshuman.khandual@arm.com>
References: <1586864670-21799-1-git-send-email-anshuman.khandual@arm.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are multiple similar definitions for arch_clear_hugepage_flags() on
various platforms. This introduces HAVE_ARCH_CLEAR_HUGEPAGE_FLAGS for those
platforms that need to define their own arch_clear_hugepage_flags() while
also providing a generic fallback definition for others to use. This help
reduce code duplication.

Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: x86@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-ia64@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-arch@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm/include/asm/hugetlb.h     | 1 +
 arch/arm64/include/asm/hugetlb.h   | 1 +
 arch/ia64/include/asm/hugetlb.h    | 4 ----
 arch/mips/include/asm/hugetlb.h    | 4 ----
 arch/parisc/include/asm/hugetlb.h  | 4 ----
 arch/powerpc/include/asm/hugetlb.h | 4 ----
 arch/riscv/include/asm/hugetlb.h   | 4 ----
 arch/s390/include/asm/hugetlb.h    | 1 +
 arch/sh/include/asm/hugetlb.h      | 1 +
 arch/sparc/include/asm/hugetlb.h   | 4 ----
 arch/x86/include/asm/hugetlb.h     | 4 ----
 include/linux/hugetlb.h            | 4 ++++
 12 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/arch/arm/include/asm/hugetlb.h b/arch/arm/include/asm/hugetlb.h
index 9ecd516d1ff7..7107c1e6f020 100644
--- a/arch/arm/include/asm/hugetlb.h
+++ b/arch/arm/include/asm/hugetlb.h
@@ -14,6 +14,7 @@
 #include <asm/hugetlb-3level.h>
 #include <asm-generic/hugetlb.h>
 
+#define HAVE_ARCH_CLEAR_HUGEPAGE_FLAGS
 static inline void arch_clear_hugepage_flags(struct page *page)
 {
 	clear_bit(PG_dcache_clean, &page->flags);
diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index 8f58e052697a..5369cf26a05d 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -17,6 +17,7 @@
 extern bool arch_hugetlb_migration_supported(struct hstate *h);
 #endif
 
+#define HAVE_ARCH_CLEAR_HUGEPAGE_FLAGS
 static inline void arch_clear_hugepage_flags(struct page *page)
 {
 	clear_bit(PG_dcache_clean, &page->flags);
diff --git a/arch/ia64/include/asm/hugetlb.h b/arch/ia64/include/asm/hugetlb.h
index f17c1e228045..2ecff18a32e5 100644
--- a/arch/ia64/include/asm/hugetlb.h
+++ b/arch/ia64/include/asm/hugetlb.h
@@ -28,10 +28,6 @@ static inline void huge_ptep_clear_flush(struct vm_area_struct *vma,
 {
 }
 
-static inline void arch_clear_hugepage_flags(struct page *page)
-{
-}
-
 #include <asm-generic/hugetlb.h>
 
 #endif /* _ASM_IA64_HUGETLB_H */
diff --git a/arch/mips/include/asm/hugetlb.h b/arch/mips/include/asm/hugetlb.h
index 8b201e281f67..10e3be870df7 100644
--- a/arch/mips/include/asm/hugetlb.h
+++ b/arch/mips/include/asm/hugetlb.h
@@ -75,10 +75,6 @@ static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	return changed;
 }
 
-static inline void arch_clear_hugepage_flags(struct page *page)
-{
-}
-
 #include <asm-generic/hugetlb.h>
 
 #endif /* __ASM_HUGETLB_H */
diff --git a/arch/parisc/include/asm/hugetlb.h b/arch/parisc/include/asm/hugetlb.h
index 411d9d867baa..a69cf9efb0c1 100644
--- a/arch/parisc/include/asm/hugetlb.h
+++ b/arch/parisc/include/asm/hugetlb.h
@@ -42,10 +42,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 					     unsigned long addr, pte_t *ptep,
 					     pte_t pte, int dirty);
 
-static inline void arch_clear_hugepage_flags(struct page *page)
-{
-}
-
 #include <asm-generic/hugetlb.h>
 
 #endif /* _ASM_PARISC64_HUGETLB_H */
diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index 9dd50e1e4fe5..d259e056e6cf 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -61,10 +61,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 			       unsigned long addr, pte_t *ptep,
 			       pte_t pte, int dirty);
 
-static inline void arch_clear_hugepage_flags(struct page *page)
-{
-}
-
 #include <asm-generic/hugetlb.h>
 
 #else /* ! CONFIG_HUGETLB_PAGE */
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index 866f6ae6467c..a5c2ca1d1cd8 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -5,8 +5,4 @@
 #include <asm-generic/hugetlb.h>
 #include <asm/page.h>
 
-static inline void arch_clear_hugepage_flags(struct page *page)
-{
-}
-
 #endif /* _ASM_RISCV_HUGETLB_H */
diff --git a/arch/s390/include/asm/hugetlb.h b/arch/s390/include/asm/hugetlb.h
index 7d27ea96ec2f..9f067a66609b 100644
--- a/arch/s390/include/asm/hugetlb.h
+++ b/arch/s390/include/asm/hugetlb.h
@@ -35,6 +35,7 @@ static inline int prepare_hugepage_range(struct file *file,
 	return 0;
 }
 
+#define HAVE_ARCH_CLEAR_HUGEPAGE_FLAGS
 static inline void arch_clear_hugepage_flags(struct page *page)
 {
 	clear_bit(PG_arch_1, &page->flags);
diff --git a/arch/sh/include/asm/hugetlb.h b/arch/sh/include/asm/hugetlb.h
index 536ad2cb8aa4..869b5a947f07 100644
--- a/arch/sh/include/asm/hugetlb.h
+++ b/arch/sh/include/asm/hugetlb.h
@@ -26,6 +26,7 @@ static inline void huge_ptep_clear_flush(struct vm_area_struct *vma,
 {
 }
 
+#define HAVE_ARCH_CLEAR_HUGEPAGE_FLAGS
 static inline void arch_clear_hugepage_flags(struct page *page)
 {
 	clear_bit(PG_dcache_clean, &page->flags);
diff --git a/arch/sparc/include/asm/hugetlb.h b/arch/sparc/include/asm/hugetlb.h
index a056fe1119f5..53838a173f62 100644
--- a/arch/sparc/include/asm/hugetlb.h
+++ b/arch/sparc/include/asm/hugetlb.h
@@ -47,10 +47,6 @@ static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	return changed;
 }
 
-static inline void arch_clear_hugepage_flags(struct page *page)
-{
-}
-
 #define __HAVE_ARCH_HUGETLB_FREE_PGD_RANGE
 void hugetlb_free_pgd_range(struct mmu_gather *tlb, unsigned long addr,
 			    unsigned long end, unsigned long floor,
diff --git a/arch/x86/include/asm/hugetlb.h b/arch/x86/include/asm/hugetlb.h
index cc98f79074d0..1721b1aadeb1 100644
--- a/arch/x86/include/asm/hugetlb.h
+++ b/arch/x86/include/asm/hugetlb.h
@@ -7,8 +7,4 @@
 
 #define hugepages_supported() boot_cpu_has(X86_FEATURE_PSE)
 
-static inline void arch_clear_hugepage_flags(struct page *page)
-{
-}
-
 #endif /* _ASM_X86_HUGETLB_H */
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 2342e5a8d1dd..359cfa1b6f54 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -544,6 +544,10 @@ static inline int is_hugepage_only_range(struct mm_struct *mm,
 }
 #endif
 
+#ifndef HAVE_ARCH_CLEAR_HUGEPAGE_FLAGS
+static inline void arch_clear_hugepage_flags(struct page *page) { }
+#endif
+
 #ifndef arch_make_huge_pte
 static inline pte_t arch_make_huge_pte(pte_t entry, struct vm_area_struct *vma,
 				       struct page *page, int writable)
-- 
2.20.1

