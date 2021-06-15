Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7733A8CBB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 01:39:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4Psn0gYqz3c4S
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 09:39:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=h+l61cWy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=h+l61cWy; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4Prq1VWyz306b
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 09:38:18 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 30A0961350;
 Tue, 15 Jun 2021 23:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1623800296;
 bh=YYZi1FqJZJTl7OkGYeRFM/0PnK1ah/UzViy7u0vMUJI=;
 h=Date:From:To:Subject:From;
 b=h+l61cWyxpANNo8LlVzIOXdQ68vzDNi7fFrAX1sBOkN2deW8r4Ig0CgTFf28DKs+E
 naab/9VIsga8aKy/7Snz2OfjEJo97Urwftqrr3PfEEcOAjWGb4MkDyt7CowEpsd12T
 PM7UuT6Mg9+jkfagrN5TQJ5aAIkrD9mFrjAdXaRE=
Date: Tue, 15 Jun 2021 16:38:15 -0700
From: akpm@linux-foundation.org
To: aneesh.kumar@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, mm-commits@vger.kernel.org,
 sparclinux@vger.kernel.org
Subject: +
 mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t.patch
 added to -mm tree
Message-ID: <20210615233815.VObB7frXE%akpm@linux-foundation.org>
User-Agent: s-nail v14.8.16
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


The patch titled
     Subject: mm: rename p4d_page_vaddr to p4d_pgtable and make it return pud_t *
has been added to the -mm tree.  Its filename is
     mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t.patch

This patch should soon appear at
    https://ozlabs.org/~akpm/mmots/broken-out/mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t.patch
and later at
    https://ozlabs.org/~akpm/mmotm/broken-out/mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t.patch

Before you just go and hit "reply", please:
   a) Consider who else should be cc'ed
   b) Prefer to cc a suitable mailing list as well
   c) Ideally: find the original patch on the mailing list and do a
      reply-to-all to that, adding suitable additional cc's

*** Remember to use Documentation/process/submit-checklist.rst when testing your code ***

The -mm tree is included into linux-next and is updated
there every 3-4 working days

------------------------------------------------------
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: mm: rename p4d_page_vaddr to p4d_pgtable and make it return pud_t *

No functional change in this patch.

Link: https://lkml.kernel.org/r/20210615110859.320299-2-aneesh.kumar@linux.ibm.com
Link: https://lore.kernel.org/linuxppc-dev/CAHk-=wi+J+iodze9FtjM3Zi4j4OeS+qqbKxME9QN4roxPEXH9Q@mail.gmail.com/
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: <linux-alpha@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>
Cc: <linux-ia64@vger.kernel.org>
Cc: <linux-m68k@lists.linux-m68k.org>
Cc: <linux-mips@vger.kernel.org>
Cc: <linux-parisc@vger.kernel.org>
Cc: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-riscv@lists.infradead.org>
Cc: <linux-sh@vger.kernel.org>
Cc: <sparclinux@vger.kernel.org>
Cc: <linux-um@lists.infradead.org>
Cc: <linux-arch@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/arm64/include/asm/pgtable.h                |    4 ++--
 arch/ia64/include/asm/pgtable.h                 |    2 +-
 arch/mips/include/asm/pgtable-64.h              |    4 ++--
 arch/powerpc/include/asm/book3s/64/pgtable.h    |    5 ++++-
 arch/powerpc/include/asm/nohash/64/pgtable-4k.h |    6 +++++-
 arch/powerpc/mm/book3s64/radix_pgtable.c        |    2 +-
 arch/powerpc/mm/pgtable_64.c                    |    2 +-
 arch/sparc/include/asm/pgtable_64.h             |    4 ++--
 arch/x86/include/asm/pgtable.h                  |    4 ++--
 arch/x86/mm/init_64.c                           |    4 ++--
 include/asm-generic/pgtable-nop4d.h             |    2 +-
 include/asm-generic/pgtable-nopud.h             |    2 +-
 include/linux/pgtable.h                         |    2 +-
 13 files changed, 25 insertions(+), 18 deletions(-)

--- a/arch/arm64/include/asm/pgtable.h~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/arch/arm64/include/asm/pgtable.h
@@ -694,9 +694,9 @@ static inline phys_addr_t p4d_page_paddr
 	return __p4d_to_phys(p4d);
 }
 
-static inline unsigned long p4d_page_vaddr(p4d_t p4d)
+static inline pud_t *p4d_pgtable(p4d_t p4d)
 {
-	return (unsigned long)__va(p4d_page_paddr(p4d));
+	return (pud_t *)__va(p4d_page_paddr(p4d));
 }
 
 /* Find an entry in the frst-level page table. */
--- a/arch/ia64/include/asm/pgtable.h~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/arch/ia64/include/asm/pgtable.h
@@ -281,7 +281,7 @@ ia64_phys_addr_valid (unsigned long addr
 #define p4d_bad(p4d)			(!ia64_phys_addr_valid(p4d_val(p4d)))
 #define p4d_present(p4d)		(p4d_val(p4d) != 0UL)
 #define p4d_clear(p4dp)			(p4d_val(*(p4dp)) = 0UL)
-#define p4d_page_vaddr(p4d)		((unsigned long) __va(p4d_val(p4d) & _PFN_MASK))
+#define p4d_pgtable(p4d)		((pud_t *) __va(p4d_val(p4d) & _PFN_MASK))
 #define p4d_page(p4d)			virt_to_page((p4d_val(p4d) + PAGE_OFFSET))
 #endif
 
--- a/arch/mips/include/asm/pgtable-64.h~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/arch/mips/include/asm/pgtable-64.h
@@ -209,9 +209,9 @@ static inline void p4d_clear(p4d_t *p4dp
 	p4d_val(*p4dp) = (unsigned long)invalid_pud_table;
 }
 
-static inline unsigned long p4d_page_vaddr(p4d_t p4d)
+static inline pud_t *p4d_pgtable(p4d_t p4d)
 {
-	return p4d_val(p4d);
+	return (pud_t *)p4d_val(p4d);
 }
 
 #define p4d_phys(p4d)		virt_to_phys((void *)p4d_val(p4d))
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1048,7 +1048,10 @@ extern struct page *p4d_page(p4d_t p4d);
 /* Pointers in the page table tree are physical addresses */
 #define __pgtable_ptr_val(ptr)	__pa(ptr)
 
-#define p4d_page_vaddr(p4d)	__va(p4d_val(p4d) & ~P4D_MASKED_BITS)
+static inline pud_t *p4d_pgtable(p4d_t p4d)
+{
+	return (pud_t *)__va(p4d_val(p4d) & ~P4D_MASKED_BITS);
+}
 
 static inline pmd_t *pud_pgtable(pud_t pud)
 {
--- a/arch/powerpc/include/asm/nohash/64/pgtable-4k.h~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/arch/powerpc/include/asm/nohash/64/pgtable-4k.h
@@ -56,10 +56,14 @@
 #define p4d_none(p4d)		(!p4d_val(p4d))
 #define p4d_bad(p4d)		(p4d_val(p4d) == 0)
 #define p4d_present(p4d)	(p4d_val(p4d) != 0)
-#define p4d_page_vaddr(p4d)	(p4d_val(p4d) & ~P4D_MASKED_BITS)
 
 #ifndef __ASSEMBLY__
 
+static inline pud_t *p4d_pgtable(p4d_t p4d)
+{
+	return (pud_t *) (p4d_val(p4d) & ~P4D_MASKED_BITS);
+}
+
 static inline void p4d_clear(p4d_t *p4dp)
 {
 	*p4dp = __p4d(0);
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -860,7 +860,7 @@ static void __meminit remove_pagetable(u
 			continue;
 		}
 
-		pud_base = (pud_t *)p4d_page_vaddr(*p4d);
+		pud_base = p4d_pgtable(*p4d);
 		remove_pud_table(pud_base, addr, next);
 		free_pud_table(pud_base, p4d);
 	}
--- a/arch/powerpc/mm/pgtable_64.c~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/arch/powerpc/mm/pgtable_64.c
@@ -105,7 +105,7 @@ struct page *p4d_page(p4d_t p4d)
 		VM_WARN_ON(!p4d_huge(p4d));
 		return pte_page(p4d_pte(p4d));
 	}
-	return virt_to_page(p4d_page_vaddr(p4d));
+	return virt_to_page(p4d_pgtable(p4d));
 }
 #endif
 
--- a/arch/sparc/include/asm/pgtable_64.h~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/arch/sparc/include/asm/pgtable_64.h
@@ -856,8 +856,8 @@ static inline pmd_t *pud_pgtable(pud_t p
 #define pmd_clear(pmdp)			(pmd_val(*(pmdp)) = 0UL)
 #define pud_present(pud)		(pud_val(pud) != 0U)
 #define pud_clear(pudp)			(pud_val(*(pudp)) = 0UL)
-#define p4d_page_vaddr(p4d)		\
-	((unsigned long) __va(p4d_val(p4d)))
+#define p4d_pgtable(p4d)		\
+	((pud_t *) __va(p4d_val(p4d)))
 #define p4d_present(p4d)		(p4d_val(p4d) != 0U)
 #define p4d_clear(p4dp)			(p4d_val(*(p4dp)) = 0UL)
 
--- a/arch/x86/include/asm/pgtable.h~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/arch/x86/include/asm/pgtable.h
@@ -906,9 +906,9 @@ static inline int p4d_present(p4d_t p4d)
 	return p4d_flags(p4d) & _PAGE_PRESENT;
 }
 
-static inline unsigned long p4d_page_vaddr(p4d_t p4d)
+static inline pud_t *p4d_pgtable(p4d_t p4d)
 {
-	return (unsigned long)__va(p4d_val(p4d) & p4d_pfn_mask(p4d));
+	return (pud_t *)__va(p4d_val(p4d) & p4d_pfn_mask(p4d));
 }
 
 /*
--- a/arch/x86/mm/init_64.c~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/arch/x86/mm/init_64.c
@@ -195,8 +195,8 @@ static void sync_global_pgds_l4(unsigned
 			spin_lock(pgt_lock);
 
 			if (!p4d_none(*p4d_ref) && !p4d_none(*p4d))
-				BUG_ON(p4d_page_vaddr(*p4d)
-				       != p4d_page_vaddr(*p4d_ref));
+				BUG_ON(p4d_pgtable(*p4d)
+				       != p4d_pgtable(*p4d_ref));
 
 			if (p4d_none(*p4d))
 				set_p4d(p4d, *p4d_ref);
--- a/include/asm-generic/pgtable-nop4d.h~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/include/asm-generic/pgtable-nop4d.h
@@ -42,7 +42,7 @@ static inline p4d_t *p4d_offset(pgd_t *p
 #define __p4d(x)				((p4d_t) { __pgd(x) })
 
 #define pgd_page(pgd)				(p4d_page((p4d_t){ pgd }))
-#define pgd_page_vaddr(pgd)			(p4d_page_vaddr((p4d_t){ pgd }))
+#define pgd_page_vaddr(pgd)			(p4d_pgtable((p4d_t){ pgd }))
 
 /*
  * allocating and freeing a p4d is trivial: the 1-entry p4d is
--- a/include/asm-generic/pgtable-nopud.h~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/include/asm-generic/pgtable-nopud.h
@@ -49,7 +49,7 @@ static inline pud_t *pud_offset(p4d_t *p
 #define __pud(x)				((pud_t) { __p4d(x) })
 
 #define p4d_page(p4d)				(pud_page((pud_t){ p4d }))
-#define p4d_page_vaddr(p4d)			(pud_pgtable((pud_t){ p4d }))
+#define p4d_pgtable(p4d)			((pud_t *)(pud_pgtable((pud_t){ p4d })))
 
 /*
  * allocating and freeing a pud is trivial: the 1-entry pud is
--- a/include/linux/pgtable.h~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/include/linux/pgtable.h
@@ -114,7 +114,7 @@ static inline pmd_t *pmd_offset(pud_t *p
 #ifndef pud_offset
 static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
 {
-	return (pud_t *)p4d_page_vaddr(*p4d) + pud_index(address);
+	return p4d_pgtable(*p4d) + pud_index(address);
 }
 #define pud_offset pud_offset
 #endif
_

Patches currently in -mm which might be from aneesh.kumar@linux.ibm.com are

mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t.patch
mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t.patch

