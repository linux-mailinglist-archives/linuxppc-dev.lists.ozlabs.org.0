Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DF759358
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 07:22:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZlWQ4m9DzDqlw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 15:22:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 45ZlTl3DcFzDqWk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 15:20:41 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3800344;
 Thu, 27 Jun 2019 22:20:38 -0700 (PDT)
Received: from p8cg001049571a15.blr.arm.com (p8cg001049571a15.blr.arm.com
 [10.162.40.144])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C89EE3F706;
 Thu, 27 Jun 2019 22:22:23 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [PATCH V2] mm/ioremap: Probe platform for p4d huge map support
Date: Fri, 28 Jun 2019 10:50:31 +0530
Message-Id: <1561699231-20991-1-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 Michal Hocko <mhocko@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Finishing up what the commit c2febafc67734a ("mm: convert generic code to
5-level paging") started out while levelling up P4D huge mapping support
at par with PUD and PMD. A new arch call back arch_ioremap_p4d_supported()
is being added which just maintains status quo (P4D huge map not supported)
on x86, arm64 and powerpc.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: x86@kernel.org

Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Acked-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
---
Changes in V2:

- Added arch_ioremap_p4d_supported() definition for powerpc
- Changed commit message to add powerpc in the arch list
- Added tags from Michael Ellerman

Hello Andrew,

This applies and builds on linux-next (next-20190627) which contains

d909f9109c30 ("powerpc/64s/radix: Enable HAVE_ARCH_HUGE_VMAP")

but after

1. Reverting V1 of this patch

   d31cf72b92ec ("mm/ioremap: probe platform for p4d huge map support")

2. Removing arch_ioremap_p4d_supported() definition which was added with

   153083a99fe431 ("Merge branch 'akpm-current/current'")

- Anshuman

 arch/arm64/mm/mmu.c                      | 5 +++++
 arch/powerpc/mm/book3s64/radix_pgtable.c | 5 +++++
 arch/x86/mm/ioremap.c                    | 5 +++++
 include/linux/io.h                       | 1 +
 lib/ioremap.c                            | 2 ++
 5 files changed, 18 insertions(+)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 97ff0341..750a69d 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -942,6 +942,11 @@ void *__init fixmap_remap_fdt(phys_addr_t dt_phys)
 	return dt_virt;
 }
 
+int __init arch_ioremap_p4d_supported(void)
+{
+	return 0;
+}
+
 int __init arch_ioremap_pud_supported(void)
 {
 	/*
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 22c0637..60c8fca 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1120,6 +1120,11 @@ void radix__ptep_modify_prot_commit(struct vm_area_struct *vma,
 	set_pte_at(mm, addr, ptep, pte);
 }
 
+int __init arch_ioremap_p4d_supported(void)
+{
+	return 0;
+}
+
 int __init arch_ioremap_pud_supported(void)
 {
 	/* HPT does not cope with large pages in the vmalloc area */
diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index e500f1d..63e99f1 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -459,6 +459,11 @@ void iounmap(volatile void __iomem *addr)
 }
 EXPORT_SYMBOL(iounmap);
 
+int __init arch_ioremap_p4d_supported(void)
+{
+	return 0;
+}
+
 int __init arch_ioremap_pud_supported(void)
 {
 #ifdef CONFIG_X86_64
diff --git a/include/linux/io.h b/include/linux/io.h
index 9876e58..accac82 100644
--- a/include/linux/io.h
+++ b/include/linux/io.h
@@ -33,6 +33,7 @@ static inline int ioremap_page_range(unsigned long addr, unsigned long end,
 
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
 void __init ioremap_huge_init(void);
+int arch_ioremap_p4d_supported(void);
 int arch_ioremap_pud_supported(void);
 int arch_ioremap_pmd_supported(void);
 #else
diff --git a/lib/ioremap.c b/lib/ioremap.c
index a95161d..0a2ffad 100644
--- a/lib/ioremap.c
+++ b/lib/ioremap.c
@@ -30,6 +30,8 @@ early_param("nohugeiomap", set_nohugeiomap);
 void __init ioremap_huge_init(void)
 {
 	if (!ioremap_huge_disabled) {
+		if (arch_ioremap_p4d_supported())
+			ioremap_p4d_capable = 1;
 		if (arch_ioremap_pud_supported())
 			ioremap_pud_capable = 1;
 		if (arch_ioremap_pmd_supported())
-- 
2.7.4

