Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 096FA2400F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 04:38:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQ0X4122XzDqRB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 12:38:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JpBNYLbx; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ0J11fk4zDqQh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 12:28:17 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id k13so4018521plk.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Aug 2020 19:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GViDwBNAuHYIcRqNUdbY3WsI6pN6F9PmQ8RucBVMOSo=;
 b=JpBNYLbxxDzWTz82j5nO9BGdFD8sDiaZIrylyBR1lkYinN1Yn/bEjr2l4qdDr8+KzD
 pmFZle283m8IGl0byL/hLs4RhtyIFCKFWB523sCl5WzlleWKWjJxagSF5bXCuS30NpwH
 I+FP1aGRCV0qC2hkFduEl6nwdEWn/LI0S+FPIMiYMx2wHd/3Mo+o7pe/jqaytB+fSknY
 Rbu2xq4CcSto1Fu/yaLj3MLE0rzU569CR8tDw6nnODhCFu8RiqSYM5HCdlX2j8H8KV/W
 Jjd6s6g9piZPLW6iWEmkjC0d+ZkzdoxFbHedFvXkWKCQoVgiv1jP7ovawV0s2hiYWrFA
 yO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GViDwBNAuHYIcRqNUdbY3WsI6pN6F9PmQ8RucBVMOSo=;
 b=SQUfIcLK4w0cozdkAMQJNKQ2SlkHykvy/f5StOnbz64JXzToW8taz49EXqs4dPdKQ2
 vCKR2wsWw6/HghiMAFptlXA4iyWDRlbwmWWSKGK+6VKYwxs/vTJYGs42lHR56W6WfCPN
 Mz9SRd9UuRYJn8/kAz2nZQgnzfNlzmIj/Eh7JZlnDkhX1m5zSj+aAb4fAy1cjsWS8TIf
 qpd8eSul/g3OsnsPyC93U/8Ki8S9K7pHaTGpuxqab4paOWlgBWROlCz1b5yBjgIPf7Uc
 0B+3/h1WtasmPdBiloJCsvSS5EGthZKUM6akgBsJNjjxYERBrCeo4iakUxmZa/191ErU
 gmjQ==
X-Gm-Message-State: AOAM533FYk6cdSL4NTrnEzWlSc3/UCAeWi+1Ookn5H5Od6nabRnxc/+u
 1Zqc1fE/ytc6m5TRdsyvhp8=
X-Google-Smtp-Source: ABdhPJyakffxZqIrUTgWsubK1L1QMR4hUZy2SqMAi4fIjOwQGJaqDFgSe6nsUArLoGBtvG2gBMs1QQ==
X-Received: by 2002:a17:90a:b10e:: with SMTP id
 z14mr24577698pjq.8.1597026493946; 
 Sun, 09 Aug 2020 19:28:13 -0700 (PDT)
Received: from bobo.ibm.com (193-116-100-32.tpgi.com.au. [193.116.100.32])
 by smtp.gmail.com with ESMTPSA id l17sm21863475pff.126.2020.08.09.19.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2020 19:28:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org
Subject: [PATCH v3 5/8] mm: HUGE_VMAP arch support cleanup
Date: Mon, 10 Aug 2020 12:27:29 +1000
Message-Id: <20200810022732.1150009-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200810022732.1150009-1-npiggin@gmail.com>
References: <20200810022732.1150009-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Zefan Li <lizefan@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This changes the awkward approach where architectures provide init
functions to determine which levels they can provide large mappings for,
to one where the arch is queried for each call.

This removes code and indirection, and allows constant-folding of dead
code for unsupported levels.

This also adds a prot argument to the arch query. This is unused
currently but could help with some architectures (e.g., some powerpc
processors can't map uncacheable memory with large pages).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/arm64/mm/mmu.c                      | 10 +--
 arch/powerpc/mm/book3s64/radix_pgtable.c |  8 +-
 arch/x86/mm/ioremap.c                    | 10 +--
 include/linux/io.h                       |  9 ---
 include/linux/vmalloc.h                  | 10 +++
 init/main.c                              |  1 -
 mm/ioremap.c                             | 96 +++++++++++-------------
 7 files changed, 67 insertions(+), 77 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 75df62fea1b6..184a6e917417 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1304,12 +1304,12 @@ void *__init fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot)
 	return dt_virt;
 }
 
-int __init arch_ioremap_p4d_supported(void)
+bool arch_vmap_p4d_supported(pgprot_t prot)
 {
-	return 0;
+	return false;
 }
 
-int __init arch_ioremap_pud_supported(void)
+bool arch_vmap_pud_supported(pgprot_t prot)
 {
 	/*
 	 * Only 4k granule supports level 1 block mappings.
@@ -1319,9 +1319,9 @@ int __init arch_ioremap_pud_supported(void)
 	       !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
 }
 
-int __init arch_ioremap_pmd_supported(void)
+bool arch_vmap_pmd_supported(pgprot_t prot)
 {
-	/* See arch_ioremap_pud_supported() */
+	/* See arch_vmap_pud_supported() */
 	return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
 }
 
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 28c784976bed..eca83a50bf2e 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1134,13 +1134,13 @@ void radix__ptep_modify_prot_commit(struct vm_area_struct *vma,
 	set_pte_at(mm, addr, ptep, pte);
 }
 
-int __init arch_ioremap_pud_supported(void)
+bool arch_vmap_pud_supported(pgprot_t prot)
 {
 	/* HPT does not cope with large pages in the vmalloc area */
 	return radix_enabled();
 }
 
-int __init arch_ioremap_pmd_supported(void)
+bool arch_vmap_pmd_supported(pgprot_t prot)
 {
 	return radix_enabled();
 }
@@ -1234,7 +1234,7 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 	return 1;
 }
 
-int __init arch_ioremap_p4d_supported(void)
+bool arch_vmap_p4d_supported(pgprot_t prot)
 {
-	return 0;
+	return false;
 }
diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index 84d85dbd1dad..159bfca757b9 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -481,21 +481,21 @@ void iounmap(volatile void __iomem *addr)
 }
 EXPORT_SYMBOL(iounmap);
 
-int __init arch_ioremap_p4d_supported(void)
+bool arch_vmap_p4d_supported(pgprot_t prot)
 {
-	return 0;
+	return false;
 }
 
-int __init arch_ioremap_pud_supported(void)
+bool arch_vmap_pud_supported(pgprot_t prot)
 {
 #ifdef CONFIG_X86_64
 	return boot_cpu_has(X86_FEATURE_GBPAGES);
 #else
-	return 0;
+	return false;
 #endif
 }
 
-int __init arch_ioremap_pmd_supported(void)
+bool arch_vmap_pmd_supported(pgprot_t prot)
 {
 	return boot_cpu_has(X86_FEATURE_PSE);
 }
diff --git a/include/linux/io.h b/include/linux/io.h
index 8394c56babc2..f1effd4d7a3c 100644
--- a/include/linux/io.h
+++ b/include/linux/io.h
@@ -31,15 +31,6 @@ static inline int ioremap_page_range(unsigned long addr, unsigned long end,
 }
 #endif
 
-#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
-void __init ioremap_huge_init(void);
-int arch_ioremap_p4d_supported(void);
-int arch_ioremap_pud_supported(void);
-int arch_ioremap_pmd_supported(void);
-#else
-static inline void ioremap_huge_init(void) { }
-#endif
-
 /*
  * Managed iomap interface
  */
diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 0221f852a7e1..787d77ad7536 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -84,6 +84,16 @@ struct vmap_area {
 	};
 };
 
+#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
+bool arch_vmap_p4d_supported(pgprot_t prot);
+bool arch_vmap_pud_supported(pgprot_t prot);
+bool arch_vmap_pmd_supported(pgprot_t prot);
+#else
+static inline bool arch_vmap_p4d_supported(pgprot_t prot) { return false; }
+static inline bool arch_vmap_pud_supported(pgprot_t prot) { return false; }
+static inline bool arch_vmap_pmd_supported(pgprot_t prot) { return false; }
+#endif
+
 /*
  *	Highlevel APIs for driver use
  */
diff --git a/init/main.c b/init/main.c
index ae78fb68d231..1c89aa127b8f 100644
--- a/init/main.c
+++ b/init/main.c
@@ -820,7 +820,6 @@ static void __init mm_init(void)
 	pgtable_init();
 	debug_objects_mem_init();
 	vmalloc_init();
-	ioremap_huge_init();
 	/* Should be run before the first non-init thread is created */
 	init_espfix_bsp();
 	/* Should be run after espfix64 is set up. */
diff --git a/mm/ioremap.c b/mm/ioremap.c
index 6016ae3227ad..b0032dbadaf7 100644
--- a/mm/ioremap.c
+++ b/mm/ioremap.c
@@ -16,49 +16,16 @@
 #include "pgalloc-track.h"
 
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
-static int __read_mostly ioremap_p4d_capable;
-static int __read_mostly ioremap_pud_capable;
-static int __read_mostly ioremap_pmd_capable;
-static int __read_mostly ioremap_huge_disabled;
+static bool __ro_after_init iomap_allow_huge = true;
 
 static int __init set_nohugeiomap(char *str)
 {
-	ioremap_huge_disabled = 1;
+	iomap_allow_huge = false;
 	return 0;
 }
 early_param("nohugeiomap", set_nohugeiomap);
-
-void __init ioremap_huge_init(void)
-{
-	if (!ioremap_huge_disabled) {
-		if (arch_ioremap_p4d_supported())
-			ioremap_p4d_capable = 1;
-		if (arch_ioremap_pud_supported())
-			ioremap_pud_capable = 1;
-		if (arch_ioremap_pmd_supported())
-			ioremap_pmd_capable = 1;
-	}
-}
-
-static inline int ioremap_p4d_enabled(void)
-{
-	return ioremap_p4d_capable;
-}
-
-static inline int ioremap_pud_enabled(void)
-{
-	return ioremap_pud_capable;
-}
-
-static inline int ioremap_pmd_enabled(void)
-{
-	return ioremap_pmd_capable;
-}
-
-#else	/* !CONFIG_HAVE_ARCH_HUGE_VMAP */
-static inline int ioremap_p4d_enabled(void) { return 0; }
-static inline int ioremap_pud_enabled(void) { return 0; }
-static inline int ioremap_pmd_enabled(void) { return 0; }
+#else /* CONFIG_HAVE_ARCH_HUGE_VMAP */
+static const bool iomap_allow_huge = false;
 #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
 
 static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
@@ -81,9 +48,12 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 }
 
 static int vmap_try_huge_pmd(pmd_t *pmd, unsigned long addr, unsigned long end,
-			phys_addr_t phys_addr, pgprot_t prot)
+			phys_addr_t phys_addr, pgprot_t prot, unsigned int max_page_shift)
 {
-	if (!ioremap_pmd_enabled())
+	if (max_page_shift < PMD_SHIFT)
+		return 0;
+
+	if (!arch_vmap_pmd_supported(prot))
 		return 0;
 
 	if ((end - addr) != PMD_SIZE)
@@ -102,7 +72,8 @@ static int vmap_try_huge_pmd(pmd_t *pmd, unsigned long addr, unsigned long end,
 }
 
 static int vmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
-			phys_addr_t phys_addr, pgprot_t prot, pgtbl_mod_mask *mask)
+			phys_addr_t phys_addr, pgprot_t prot, unsigned int max_page_shift,
+			pgtbl_mod_mask *mask)
 {
 	pmd_t *pmd;
 	unsigned long next;
@@ -113,7 +84,7 @@ static int vmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
 	do {
 		next = pmd_addr_end(addr, end);
 
-		if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot)) {
+		if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot, max_page_shift)) {
 			*mask |= PGTBL_PMD_MODIFIED;
 			continue;
 		}
@@ -125,9 +96,12 @@ static int vmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
 }
 
 static int vmap_try_huge_pud(pud_t *pud, unsigned long addr, unsigned long end,
-			phys_addr_t phys_addr, pgprot_t prot)
+			phys_addr_t phys_addr, pgprot_t prot, unsigned int max_page_shift)
 {
-	if (!ioremap_pud_enabled())
+	if (max_page_shift < PUD_SHIFT)
+		return 0;
+
+	if (!arch_vmap_pud_supported(prot))
 		return 0;
 
 	if ((end - addr) != PUD_SIZE)
@@ -146,7 +120,8 @@ static int vmap_try_huge_pud(pud_t *pud, unsigned long addr, unsigned long end,
 }
 
 static int vmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
-			phys_addr_t phys_addr, pgprot_t prot, pgtbl_mod_mask *mask)
+			phys_addr_t phys_addr, pgprot_t prot, unsigned int max_page_shift,
+			pgtbl_mod_mask *mask)
 {
 	pud_t *pud;
 	unsigned long next;
@@ -157,21 +132,24 @@ static int vmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
 	do {
 		next = pud_addr_end(addr, end);
 
-		if (vmap_try_huge_pud(pud, addr, next, phys_addr, prot)) {
+		if (vmap_try_huge_pud(pud, addr, next, phys_addr, prot, max_page_shift)) {
 			*mask |= PGTBL_PUD_MODIFIED;
 			continue;
 		}
 
-		if (vmap_pmd_range(pud, addr, next, phys_addr, prot, mask))
+		if (vmap_pmd_range(pud, addr, next, phys_addr, prot, max_page_shift, mask))
 			return -ENOMEM;
 	} while (pud++, phys_addr += (next - addr), addr = next, addr != end);
 	return 0;
 }
 
 static int vmap_try_huge_p4d(p4d_t *p4d, unsigned long addr, unsigned long end,
-			phys_addr_t phys_addr, pgprot_t prot)
+			phys_addr_t phys_addr, pgprot_t prot, unsigned int max_page_shift)
 {
-	if (!ioremap_p4d_enabled())
+	if (max_page_shift < P4D_SHIFT)
+		return 0;
+
+	if (!arch_vmap_p4d_supported(prot))
 		return 0;
 
 	if ((end - addr) != P4D_SIZE)
@@ -190,7 +168,8 @@ static int vmap_try_huge_p4d(p4d_t *p4d, unsigned long addr, unsigned long end,
 }
 
 static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
-			phys_addr_t phys_addr, pgprot_t prot, pgtbl_mod_mask *mask)
+			phys_addr_t phys_addr, pgprot_t prot, unsigned int max_page_shift,
+			pgtbl_mod_mask *mask)
 {
 	p4d_t *p4d;
 	unsigned long next;
@@ -201,18 +180,19 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
 	do {
 		next = p4d_addr_end(addr, end);
 
-		if (vmap_try_huge_p4d(p4d, addr, next, phys_addr, prot)) {
+		if (vmap_try_huge_p4d(p4d, addr, next, phys_addr, prot, max_page_shift)) {
 			*mask |= PGTBL_P4D_MODIFIED;
 			continue;
 		}
 
-		if (vmap_pud_range(p4d, addr, next, phys_addr, prot, mask))
+		if (vmap_pud_range(p4d, addr, next, phys_addr, prot, max_page_shift, mask))
 			return -ENOMEM;
 	} while (p4d++, phys_addr += (next - addr), addr = next, addr != end);
 	return 0;
 }
 
-int ioremap_page_range(unsigned long addr, unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
+static int vmap_range(unsigned long addr, unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift)
 {
 	pgd_t *pgd;
 	unsigned long start;
@@ -227,7 +207,7 @@ int ioremap_page_range(unsigned long addr, unsigned long end, phys_addr_t phys_a
 	pgd = pgd_offset_k(addr);
 	do {
 		next = pgd_addr_end(addr, end);
-		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot, &mask);
+		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot, max_page_shift, &mask);
 		if (err)
 			break;
 	} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
@@ -240,6 +220,16 @@ int ioremap_page_range(unsigned long addr, unsigned long end, phys_addr_t phys_a
 	return err;
 }
 
+int ioremap_page_range(unsigned long addr, unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
+{
+	unsigned int max_page_shift = PAGE_SHIFT;
+
+	if (iomap_allow_huge)
+		max_page_shift = P4D_SHIFT;
+
+	return vmap_range(addr, end, phys_addr, prot, max_page_shift);
+}
+
 #ifdef CONFIG_GENERIC_IOREMAP
 void __iomem *ioremap_prot(phys_addr_t addr, size_t size, unsigned long prot)
 {
-- 
2.23.0

