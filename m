Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9044C678E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 11:49:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6cZm0VtTz3bxr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 21:49:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4K6cYx0qXqz2yMD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 21:48:52 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BA101063;
 Mon, 28 Feb 2022 02:48:52 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 84F313F73D;
 Mon, 28 Feb 2022 02:48:44 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH V3 01/30] mm/debug_vm_pgtable: Drop protection_map[] usage
Date: Mon, 28 Feb 2022 16:17:24 +0530
Message-Id: <1646045273-9343-2-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-csky@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 geert@linux-m68k.org, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Although protection_map[] contains the platform defined page protection map
for a given vm_flags combination, vm_get_page_prot() is the right interface
to use. This will also reduce dependency on protection_map[] which is going
to be dropped off completely later on.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 mm/debug_vm_pgtable.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index db2abd9e415b..30fd11a2ed32 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -93,7 +93,7 @@ struct pgtable_debug_args {
 
 static void __init pte_basic_tests(struct pgtable_debug_args *args, int idx)
 {
-	pgprot_t prot = protection_map[idx];
+	pgprot_t prot = vm_get_page_prot(idx);
 	pte_t pte = pfn_pte(args->fixed_pte_pfn, prot);
 	unsigned long val = idx, *ptr = &val;
 
@@ -101,7 +101,7 @@ static void __init pte_basic_tests(struct pgtable_debug_args *args, int idx)
 
 	/*
 	 * This test needs to be executed after the given page table entry
-	 * is created with pfn_pte() to make sure that protection_map[idx]
+	 * is created with pfn_pte() to make sure that vm_get_page_prot(idx)
 	 * does not have the dirty bit enabled from the beginning. This is
 	 * important for platforms like arm64 where (!PTE_RDONLY) indicate
 	 * dirty bit being set.
@@ -190,7 +190,7 @@ static void __init pte_savedwrite_tests(struct pgtable_debug_args *args)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void __init pmd_basic_tests(struct pgtable_debug_args *args, int idx)
 {
-	pgprot_t prot = protection_map[idx];
+	pgprot_t prot = vm_get_page_prot(idx);
 	unsigned long val = idx, *ptr = &val;
 	pmd_t pmd;
 
@@ -202,7 +202,7 @@ static void __init pmd_basic_tests(struct pgtable_debug_args *args, int idx)
 
 	/*
 	 * This test needs to be executed after the given page table entry
-	 * is created with pfn_pmd() to make sure that protection_map[idx]
+	 * is created with pfn_pmd() to make sure that vm_get_page_prot(idx)
 	 * does not have the dirty bit enabled from the beginning. This is
 	 * important for platforms like arm64 where (!PTE_RDONLY) indicate
 	 * dirty bit being set.
@@ -325,7 +325,7 @@ static void __init pmd_savedwrite_tests(struct pgtable_debug_args *args)
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 static void __init pud_basic_tests(struct pgtable_debug_args *args, int idx)
 {
-	pgprot_t prot = protection_map[idx];
+	pgprot_t prot = vm_get_page_prot(idx);
 	unsigned long val = idx, *ptr = &val;
 	pud_t pud;
 
@@ -337,7 +337,7 @@ static void __init pud_basic_tests(struct pgtable_debug_args *args, int idx)
 
 	/*
 	 * This test needs to be executed after the given page table entry
-	 * is created with pfn_pud() to make sure that protection_map[idx]
+	 * is created with pfn_pud() to make sure that vm_get_page_prot(idx)
 	 * does not have the dirty bit enabled from the beginning. This is
 	 * important for platforms like arm64 where (!PTE_RDONLY) indicate
 	 * dirty bit being set.
@@ -1106,14 +1106,14 @@ static int __init init_args(struct pgtable_debug_args *args)
 	/*
 	 * Initialize the debugging data.
 	 *
-	 * protection_map[0] (or even protection_map[8]) will help create
-	 * page table entries with PROT_NONE permission as required for
-	 * pxx_protnone_tests().
+	 * vm_get_page_prot(VM_NONE) or vm_get_page_prot(VM_SHARED|VM_NONE)
+	 * will help create page table entries with PROT_NONE permission as
+	 * required for pxx_protnone_tests().
 	 */
 	memset(args, 0, sizeof(*args));
 	args->vaddr              = get_random_vaddr();
 	args->page_prot          = vm_get_page_prot(VMFLAGS);
-	args->page_prot_none     = protection_map[0];
+	args->page_prot_none     = vm_get_page_prot(VM_NONE);
 	args->is_contiguous_page = false;
 	args->pud_pfn            = ULONG_MAX;
 	args->pmd_pfn            = ULONG_MAX;
@@ -1248,12 +1248,19 @@ static int __init debug_vm_pgtable(void)
 		return ret;
 
 	/*
-	 * Iterate over the protection_map[] to make sure that all
+	 * Iterate over each possible vm_flags to make sure that all
 	 * the basic page table transformation validations just hold
 	 * true irrespective of the starting protection value for a
 	 * given page table entry.
+	 *
+	 * Protection based vm_flags combinatins are always linear
+	 * and increasing i.e starting from VM_NONE and going upto
+	 * (VM_SHARED | READ | WRITE | EXEC).
 	 */
-	for (idx = 0; idx < ARRAY_SIZE(protection_map); idx++) {
+#define VM_FLAGS_START	(VM_NONE)
+#define VM_FLAGS_END	(VM_SHARED | VM_EXEC | VM_WRITE | VM_READ)
+
+	for (idx = VM_FLAGS_START; idx <= VM_FLAGS_END; idx++) {
 		pte_basic_tests(&args, idx);
 		pmd_basic_tests(&args, idx);
 		pud_basic_tests(&args, idx);
-- 
2.25.1

