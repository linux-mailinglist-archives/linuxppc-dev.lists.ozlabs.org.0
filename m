Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C863AD7B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 05:15:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45MdYr41BRzDqPC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 13:15:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bCJg6ZoN"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45MdSC1sJ0zDqFL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 13:10:51 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id p184so1107735pfp.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Jun 2019 20:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GLUnB0dxaaoWsj/6a14EEndBx2fO48AjL6GkM0Elb6Q=;
 b=bCJg6ZoN2hdFIw9or8OYnEz3FbjG/1REOjCw8uTFBinPLS8y4YcxIXlVfRCTwk6AaR
 cwyWUizOW7m2kXLv2puImyqayo93eHuUZt2SiUJ/a6fm+/NtacEGFJ3Q8Ay8gZEFo2wR
 AdH0xTvf4I+cMgN0O4pv7MFTFyH41fKoIstnIYSMVN/9cWR9fq6qTPFLzRqLw62nit34
 gzAO/Ku0y/MSQunpve0qmuJW5XKuqDOFY6VedI9k3c8EQwo+ypwukPq1+SmviKwc2NY4
 2cBymqNxvTgCxrEtU21j4baxXj3l79Oek4EEhw5ZH8Bx0QWMC3ozIuYjXLkP2VvEP2kO
 HlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GLUnB0dxaaoWsj/6a14EEndBx2fO48AjL6GkM0Elb6Q=;
 b=nYQ/rDsl0sUccW5y89Cz86Vj+rgcCOKRCiwC3oEny9pTD2pPsgZqIafAYi81pMi3p5
 dzjnGpnaDUUULtWlH7XPc6Pv6DWU4JF/C3j+jgORur4hIpK53oVivSvAm5s1gyWy9Fu3
 sImhXiov9NiyVxw5muTzCEZaB2XhM6mUXg0WiaTAcVafqQATvgDora4rBSbgApgLcG03
 1//g1hkEn1eenOfsvB99m/b5ZEmCNWpoz2ps4EZAQtDTsBVWpWO4QfD5SVwPDylz7DJR
 OxcZq6tmxze2XkjYPP6KXvZ0zlwPrBh9MhX9GvukP21MkEPa8wXRTkwpboW5umMZR/zX
 F94w==
X-Gm-Message-State: APjAAAWxtokfYBZtb5XMZeRxQ6ead3xF6N1Zjx1syOfO1vZWKWjNhTRa
 oU6X3AQwc83/eVE7k3L2UgWpNCX8K4Y=
X-Google-Smtp-Source: APXvYqxQ1KwSraLkw0ELNrOHFSQVXFSz2Q+TwcVF1E1IM9QZ76XKbRwqv7XjPoSfG2FwmifkHKcwJA==
X-Received: by 2002:a62:834d:: with SMTP id h74mr27013037pfe.254.1560136248519; 
 Sun, 09 Jun 2019 20:10:48 -0700 (PDT)
Received: from bobo.local0.net (60-241-56-246.tpgi.com.au. [60.241.56.246])
 by smtp.gmail.com with ESMTPSA id w1sm11118865pfg.51.2019.06.09.20.10.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 20:10:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc/64s/radix: Enable HAVE_ARCH_HUGE_VMAP
Date: Mon, 10 Jun 2019 13:08:18 +1000
Message-Id: <20190610030818.17965-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190610030818.17965-1-npiggin@gmail.com>
References: <20190610030818.17965-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This sets the HAVE_ARCH_HUGE_VMAP option, and defines the required
page table functions.

This enables huge (2MB and 1GB) ioremap mappings. I don't have a
benchmark for this change, but huge vmap will be used by a later core
kernel change to enable huge vmalloc memory mappings. This improves
cached `git diff` performance by about 5% on a 2-node POWER9 with 32MB
size dentry cache hash.

  Profiling git diff dTLB misses with a vanilla kernel:

  81.75%  git      [kernel.vmlinux]    [k] __d_lookup_rcu
   7.21%  git      [kernel.vmlinux]    [k] strncpy_from_user
   1.77%  git      [kernel.vmlinux]    [k] find_get_entry
   1.59%  git      [kernel.vmlinux]    [k] kmem_cache_free

            40,168      dTLB-miss
       0.100342754 seconds time elapsed

  With powerpc huge vmalloc:

             2,987      dTLB-miss
       0.095933138 seconds time elapsed

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         |   2 +-
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/include/asm/book3s/64/pgtable.h  |   8 ++
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 100 ++++++++++++++++++
 4 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 138f6664b2e2..a4c3538857e9 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2927,7 +2927,7 @@
 			register save and restore. The kernel will only save
 			legacy floating-point registers on task switch.
 
-	nohugeiomap	[KNL,x86] Disable kernel huge I/O mappings.
+	nohugeiomap	[KNL,x86,PPC] Disable kernel huge I/O mappings.
 
 	nosmt		[KNL,S390] Disable symmetric multithreading (SMT).
 			Equivalent to smt=1.
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8c1c636308c8..f0e5b38d52e8 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -167,6 +167,7 @@ config PPC
 	select GENERIC_STRNLEN_USER
 	select GENERIC_TIME_VSYSCALL
 	select HAVE_ARCH_AUDITSYSCALL
+	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_KASAN			if PPC32
 	select HAVE_ARCH_KGDB
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index ccf00a8b98c6..5faceeefd9f9 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -274,6 +274,14 @@ extern unsigned long __vmalloc_end;
 #define VMALLOC_START	__vmalloc_start
 #define VMALLOC_END	__vmalloc_end
 
+static inline unsigned int ioremap_max_order(void)
+{
+	if (radix_enabled())
+		return PUD_SHIFT;
+	return 7 + PAGE_SHIFT; /* default from linux/vmalloc.h */
+}
+#define IOREMAP_MAX_ORDER ioremap_max_order()
+
 extern unsigned long __kernel_virt_start;
 extern unsigned long __kernel_virt_size;
 extern unsigned long __kernel_io_start;
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index db993bc1aef3..35cf04bbd50b 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1124,6 +1124,106 @@ void radix__ptep_modify_prot_commit(struct vm_area_struct *vma,
 	set_pte_at(mm, addr, ptep, pte);
 }
 
+int __init arch_ioremap_pud_supported(void)
+{
+	/* HPT does not cope with large pages in the vmalloc area */
+	return radix_enabled();
+}
+
+int __init arch_ioremap_pmd_supported(void)
+{
+	return radix_enabled();
+}
+
+int p4d_free_pud_page(p4d_t *p4d, unsigned long addr)
+{
+	return 0;
+}
+
+int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
+{
+	pte_t *ptep = (pte_t *)pud;
+	pte_t new_pud = pfn_pte(__phys_to_pfn(addr), prot);
+
+	if (!radix_enabled())
+		return 0;
+
+	set_pte_at(&init_mm, 0 /* radix unused */, ptep, new_pud);
+
+	return 1;
+}
+
+int pud_clear_huge(pud_t *pud)
+{
+	if (pud_huge(*pud)) {
+		pud_clear(pud);
+		return 1;
+	}
+
+	return 0;
+}
+
+int pud_free_pmd_page(pud_t *pud, unsigned long addr)
+{
+	pmd_t *pmd;
+	int i;
+
+	pmd = (pmd_t *)pud_page_vaddr(*pud);
+	pud_clear(pud);
+
+	flush_tlb_kernel_range(addr, addr + PUD_SIZE);
+
+	for (i = 0; i < PTRS_PER_PMD; i++) {
+		if (!pmd_none(pmd[i])) {
+			pte_t *pte;
+			pte = (pte_t *)pmd_page_vaddr(pmd[i]);
+
+			pte_free_kernel(&init_mm, pte);
+		}
+	}
+
+	pmd_free(&init_mm, pmd);
+
+	return 1;
+}
+
+int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
+{
+	pte_t *ptep = (pte_t *)pmd;
+	pte_t new_pmd = pfn_pte(__phys_to_pfn(addr), prot);
+
+	if (!radix_enabled())
+		return 0;
+
+	set_pte_at(&init_mm, 0 /* radix unused */, ptep, new_pmd);
+
+	return 1;
+}
+
+int pmd_clear_huge(pmd_t *pmd)
+{
+	if (pmd_huge(*pmd)) {
+		pmd_clear(pmd);
+		return 1;
+	}
+
+	return 0;
+}
+
+int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
+{
+	pte_t *pte;
+
+	pte = (pte_t *)pmd_page_vaddr(*pmd);
+	pmd_clear(pmd);
+
+	flush_tlb_kernel_range(addr, addr + PMD_SIZE);
+
+	pte_free_kernel(&init_mm, pte);
+
+	return 1;
+}
+
 int radix__ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size,
 			pgprot_t prot, int nid)
 {
-- 
2.20.1

