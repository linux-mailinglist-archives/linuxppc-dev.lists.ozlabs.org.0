Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D0B251C0B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 17:18:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbXgn1MrMzDqV6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 01:18:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GAUBvlTx; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbXDq6cRKzDqHL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Aug 2020 00:58:35 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id o5so7003782pgb.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 07:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PoWZjfd9+LgKKwcwd/njX5fpO4STl9e4RnEY5y1S8j4=;
 b=GAUBvlTxy2A9BnS5ZutI8oNgc1UucAOxAr6pjScgXj537JKPb/P+AN4zkpWmUslPVv
 KeAu1QHH74L50dD3zuON5DE4zJDQ1XETD7rQUBjtBlejDQFS/17pyzT18QW5+QWpj027
 OTp11JRuzSijnMU7y4j9ZkuE7oWhSUZzKT84vmtKGLQ8RRj4V08oPpB8xZ1YGxrUj5hr
 KYDmCUoIt6iwasFSr+o2CiZrRLR/szrTTas1tNoi6ouITdiNnnKrrEbZ9nleZie6ueVM
 EswVlgd2MdmX+Lim4FHgoaRM/uqJzi52ypnSZQQKaw/gpLHVfjORhy1n9JX6eWlrz1KQ
 zn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PoWZjfd9+LgKKwcwd/njX5fpO4STl9e4RnEY5y1S8j4=;
 b=nRGZn2opWFC8PU9rVMl+X4yaXDIttyQ4WecXE69MgwNF+JuYfr08I50SzHfeyo/NtH
 53C8XLjnWoscaK40vRxXEEO6EnegO6XTOomsaKfl29AV0mUJmMRaRP9x5I4HbMAaIhWv
 WY/TCxN7ZBHNFPXwK/gDBE+9UAaF/LdMQw1w0be/bPm1f/ZsvoZiCi3KgHnAIFHmYxYX
 aua/d9ok27+fhbKVTJoPfN9E3TVnps/TMdChQRg0HQVOYfv+mu4ZoY+hUnW+iZm8aPcI
 KclCo9eTFrslk6JIvr0+6x6h2JBC/cJqDgvGW2I3pFGbpaeVFTr2yUoThBUrSJluaAGD
 sFQA==
X-Gm-Message-State: AOAM531Cf5ELTYbOtL41jshNfSO+Zrxepl4NjLBzHLugaFH5iiU6gc5u
 InlLJNWwKak/kgJsfIZByfw=
X-Google-Smtp-Source: ABdhPJxciB6Foo8ZH9/2nA6YwZdwto57DtX1Azbp16OcKyr/UBX7pMIRifOCukZ277dSTR5A5TvAEg==
X-Received: by 2002:aa7:8e9c:: with SMTP id a28mr933285pfr.20.1598367508687;
 Tue, 25 Aug 2020 07:58:28 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id e29sm15755956pfj.92.2020.08.25.07.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 07:58:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v7 05/12] mm: HUGE_VMAP arch support cleanup
Date: Wed, 26 Aug 2020 00:57:46 +1000
Message-Id: <20200825145753.529284-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200825145753.529284-1-npiggin@gmail.com>
References: <20200825145753.529284-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Zefan Li <lizefan@huawei.com>, Borislav Petkov <bp@alien8.de>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org
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

Cc: linuxppc-dev@lists.ozlabs.org
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---

Ack or objection from arch maintainers if this goes via the -mm tree?

 arch/arm64/include/asm/vmalloc.h         |  8 +++
 arch/arm64/mm/mmu.c                      | 10 +--
 arch/powerpc/include/asm/vmalloc.h       |  8 +++
 arch/powerpc/mm/book3s64/radix_pgtable.c |  8 +--
 arch/x86/include/asm/vmalloc.h           |  7 ++
 arch/x86/mm/ioremap.c                    | 10 +--
 include/linux/io.h                       |  9 ---
 include/linux/vmalloc.h                  |  6 ++
 init/main.c                              |  1 -
 mm/ioremap.c                             | 88 +++++++++---------------
 10 files changed, 77 insertions(+), 78 deletions(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 2ca708ab9b20..597b40405319 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -1,4 +1,12 @@
 #ifndef _ASM_ARM64_VMALLOC_H
 #define _ASM_ARM64_VMALLOC_H
 
+#include <asm/page.h>
+
+#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
+bool arch_vmap_p4d_supported(pgprot_t prot);
+bool arch_vmap_pud_supported(pgprot_t prot);
+bool arch_vmap_pmd_supported(pgprot_t prot);
+#endif
+
 #endif /* _ASM_ARM64_VMALLOC_H */
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 75df62fea1b6..9df7e0058c78 100644
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
+bool arch_vmap_pud_supported(pgprot_t prot);
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
 
diff --git a/arch/powerpc/include/asm/vmalloc.h b/arch/powerpc/include/asm/vmalloc.h
index b992dfaaa161..105abb73f075 100644
--- a/arch/powerpc/include/asm/vmalloc.h
+++ b/arch/powerpc/include/asm/vmalloc.h
@@ -1,4 +1,12 @@
 #ifndef _ASM_POWERPC_VMALLOC_H
 #define _ASM_POWERPC_VMALLOC_H
 
+#include <asm/page.h>
+
+#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
+bool arch_vmap_p4d_supported(pgprot_t prot);
+bool arch_vmap_pud_supported(pgprot_t prot);
+bool arch_vmap_pmd_supported(pgprot_t prot);
+#endif
+
 #endif /* _ASM_POWERPC_VMALLOC_H */
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
diff --git a/arch/x86/include/asm/vmalloc.h b/arch/x86/include/asm/vmalloc.h
index 29837740b520..094ea2b565f3 100644
--- a/arch/x86/include/asm/vmalloc.h
+++ b/arch/x86/include/asm/vmalloc.h
@@ -1,6 +1,13 @@
 #ifndef _ASM_X86_VMALLOC_H
 #define _ASM_X86_VMALLOC_H
 
+#include <asm/page.h>
 #include <asm/pgtable_areas.h>
 
+#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
+bool arch_vmap_p4d_supported(pgprot_t prot);
+bool arch_vmap_pud_supported(pgprot_t prot);
+bool arch_vmap_pmd_supported(pgprot_t prot);
+#endif
+
 #endif /* _ASM_X86_VMALLOC_H */
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
index 0221f852a7e1..3f6bba4cc9bc 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -84,6 +84,12 @@ struct vmap_area {
 	};
 };
 
+#ifndef CONFIG_HAVE_ARCH_HUGE_VMAP
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
index 3f4d36f9745a..c67f91164401 100644
--- a/mm/ioremap.c
+++ b/mm/ioremap.c
@@ -16,49 +16,16 @@
 #include "pgalloc-track.h"
 
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
-static int __read_mostly ioremap_p4d_capable;
-static int __read_mostly ioremap_pud_capable;
-static int __read_mostly ioremap_pmd_capable;
-static int __read_mostly ioremap_huge_disabled;
+static bool __ro_after_init iomap_max_page_shift = PAGE_SHIFT;
 
 static int __init set_nohugeiomap(char *str)
 {
-	ioremap_huge_disabled = 1;
+	iomap_max_page_shift = P4D_SHIFT;
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
+static const bool iomap_max_page_shift = PAGE_SHIFT;
 #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
 
 static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
@@ -82,9 +49,13 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 }
 
 static int vmap_try_huge_pmd(pmd_t *pmd, unsigned long addr, unsigned long end,
-			phys_addr_t phys_addr, pgprot_t prot)
+			phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift)
 {
-	if (!ioremap_pmd_enabled())
+	if (max_page_shift < PMD_SHIFT)
+		return 0;
+
+	if (!arch_vmap_pmd_supported(prot))
 		return 0;
 
 	if ((end - addr) != PMD_SIZE)
@@ -104,7 +75,7 @@ static int vmap_try_huge_pmd(pmd_t *pmd, unsigned long addr, unsigned long end,
 
 static int vmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
-			pgtbl_mod_mask *mask)
+			unsigned int max_page_shift, pgtbl_mod_mask *mask)
 {
 	pmd_t *pmd;
 	unsigned long next;
@@ -115,7 +86,7 @@ static int vmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
 	do {
 		next = pmd_addr_end(addr, end);
 
-		if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot)) {
+		if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot, max_page_shift)) {
 			*mask |= PGTBL_PMD_MODIFIED;
 			continue;
 		}
@@ -127,9 +98,13 @@ static int vmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
 }
 
 static int vmap_try_huge_pud(pud_t *pud, unsigned long addr, unsigned long end,
-			phys_addr_t phys_addr, pgprot_t prot)
+			phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift)
 {
-	if (!ioremap_pud_enabled())
+	if (max_page_shift < PUD_SHIFT)
+		return 0;
+
+	if (!arch_vmap_pud_supported(prot))
 		return 0;
 
 	if ((end - addr) != PUD_SIZE)
@@ -149,7 +124,7 @@ static int vmap_try_huge_pud(pud_t *pud, unsigned long addr, unsigned long end,
 
 static int vmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
-			pgtbl_mod_mask *mask)
+			unsigned int max_page_shift, pgtbl_mod_mask *mask)
 {
 	pud_t *pud;
 	unsigned long next;
@@ -160,21 +135,25 @@ static int vmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
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
+			phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift)
 {
-	if (!ioremap_p4d_enabled())
+	if (max_page_shift < P4D_SHIFT)
+		return 0;
+
+	if (!arch_vmap_p4d_supported(prot))
 		return 0;
 
 	if ((end - addr) != P4D_SIZE)
@@ -194,7 +173,7 @@ static int vmap_try_huge_p4d(p4d_t *p4d, unsigned long addr, unsigned long end,
 
 static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
-			pgtbl_mod_mask *mask)
+			unsigned int max_page_shift, pgtbl_mod_mask *mask)
 {
 	p4d_t *p4d;
 	unsigned long next;
@@ -205,19 +184,20 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
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
 
 static int vmap_range(unsigned long addr, unsigned long end,
-			phys_addr_t phys_addr, pgprot_t prot)
+			phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift)
 {
 	pgd_t *pgd;
 	unsigned long start;
@@ -232,7 +212,7 @@ static int vmap_range(unsigned long addr, unsigned long end,
 	pgd = pgd_offset_k(addr);
 	do {
 		next = pgd_addr_end(addr, end);
-		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot, &mask);
+		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot, max_page_shift, &mask);
 		if (err)
 			break;
 	} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
@@ -248,7 +228,7 @@ static int vmap_range(unsigned long addr, unsigned long end,
 int ioremap_page_range(unsigned long addr,
 		       unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
 {
-	return vmap_range(addr, end, phys_addr, prot);
+	return vmap_range(addr, end, phys_addr, prot, iomap_max_page_shift);
 }
 
 #ifdef CONFIG_GENERIC_IOREMAP
-- 
2.23.0

