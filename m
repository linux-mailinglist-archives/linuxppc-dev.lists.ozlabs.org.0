Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C1E382C97
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 14:51:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkJt64vH3z3bsb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 22:51:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FkJsh1TxSz2y8C
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 22:51:17 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EBA4113E;
 Mon, 17 May 2021 05:51:15 -0700 (PDT)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2B6D3F73B;
 Mon, 17 May 2021 05:51:08 -0700 (PDT)
Subject: Re: Fwd: [Bug 213069] New: kernel BUG at
 arch/powerpc/include/asm/book3s/64/hash-4k.h:147! Oops: Exception in kernel
 mode, sig: 5 [#1]
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <bug-213069-206035@https.bugzilla.kernel.org/>
 <4deb5cd5-c713-b020-9143-c74a031e3fd5@csgroup.eu>
 <a8841b4e-3bff-f600-eac7-501f78ced54b@arm.com>
 <7ebc28ad-61e3-ef43-d670-9b80a61268c4@csgroup.eu>
 <e9558e0a-314e-ddfd-6776-84c1bfe6f01f@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <6fcdf4f2-9bed-4b0f-8ed8-74cb25484ea6@arm.com>
Date: Mon, 17 May 2021 18:19:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e9558e0a-314e-ddfd-6776-84c1bfe6f01f@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/17/21 11:25 AM, Aneesh Kumar K.V wrote:
> On 5/17/21 11:17 AM, Christophe Leroy wrote:
>> +aneesh
>> +linuxppc-dev list
>>
>> Le 17/05/2021 à 07:44, Anshuman Khandual a écrit :
>>> Hello Christophe,
>>>
>>> DEBUG_VM_PGTABLE has now been re-enabled on powerpc recently ? was not
>>> aware about this. From the error log, it failed explicitly on 4K page
>>> size hash config.
>>>
>>> static inline pmd_t hash__pmd_mkhuge(pmd_t pmd)
>>> {
>>>          BUG();        ------> Failed
>>>          return pmd;
>>> }
>>>
>>> static inline pmd_t __pmd_mkhuge(pmd_t pmd)
>>> {
>>>          if (radix_enabled())
>>>                  return radix__pmd_mkhuge(pmd);
>>>          return hash__pmd_mkhuge(pmd);
>>> }
>>>
>>> pmd_t pfn_pmd(unsigned long pfn, pgprot_t pgprot)
>>> {
>>>          unsigned long pmdv;
>>>
>>>          pmdv = (pfn << PAGE_SHIFT) & PTE_RPN_MASK;
>>>
>>>          return __pmd_mkhuge(pmd_set_protbits(__pmd(pmdv), pgprot));
>>> }
>>>
>>> It seems like on powerpc, where pfn_pmd() makes a huge page but which
>>> is not supported on 4K hash config thus triggering the BUG(). But all
>>> pfn_pmd() call sites inside the debug_vm_pgtable() test are protected
>>> with CONFIG_TRANSPARENT_HUGEPAGE. IIUC unlike powerpc, pfn_pmd() does
>>> not directly make a huge page on other platforms.
>>>
>>> Looking at arch/powerpc/include/asm/book3s/64/hash-4k.h, all relevant
>>> THP helpers has BUG() or 0 which indicates THP might not be supported
>>> on 4K page size hash config ?
>>>
>>> But looking at arch/powerpc/platforms/Kconfig.cputype, it seems like
>>> HAVE_ARCH_TRANSPARENT_HUGEPAGE is invariably selected on PPC_BOOK3S_64
>>> platforms which I assume includes 4K page size hash config as well.
>>>
>>> Is THP some how getting enabled on this 4K page size hash config where
>>> it should not be (thus triggering the BUG) ? OR am I missing something
>>> here.
>>>
>>
> 
> We should put those  pfn_pmd()  and pfn_pud() after
> 
>     if (!has_transparent_hugepage())
>         return;

The following patch has been lightly tested on arm64 and x86 platforms.
Could you please verify if this solves the problem on powerpc 4K hash
config ? Thank you.

- Anshuman

 mm/debug_vm_pgtable.c | 58 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index e2f35db8ba69..6ff92c8b0a00 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -146,13 +146,14 @@ static void __init pte_savedwrite_tests(unsigned long pfn, pgprot_t prot)
 static void __init pmd_basic_tests(unsigned long pfn, int idx)
 {
 	pgprot_t prot = protection_map[idx];
-	pmd_t pmd = pfn_pmd(pfn, prot);
 	unsigned long val = idx, *ptr = &val;
+	pmd_t pmd;
 
 	if (!has_transparent_hugepage())
 		return;
 
 	pr_debug("Validating PMD basic (%pGv)\n", ptr);
+	pmd = pfn_pmd(pfn, prot);
 
 	/*
 	 * This test needs to be executed after the given page table entry
@@ -232,9 +233,14 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
 
 static void __init pmd_leaf_tests(unsigned long pfn, pgprot_t prot)
 {
-	pmd_t pmd = pfn_pmd(pfn, prot);
+	pmd_t pmd;
+
+	if (!has_transparent_hugepage())
+		return;
 
 	pr_debug("Validating PMD leaf\n");
+	pmd = pfn_pmd(pfn, prot);
+
 	/*
 	 * PMD based THP is a leaf entry.
 	 */
@@ -244,12 +250,16 @@ static void __init pmd_leaf_tests(unsigned long pfn, pgprot_t prot)
 
 static void __init pmd_savedwrite_tests(unsigned long pfn, pgprot_t prot)
 {
-	pmd_t pmd = pfn_pmd(pfn, prot);
+	pmd_t pmd;
 
 	if (!IS_ENABLED(CONFIG_NUMA_BALANCING))
 		return;
 
+	if (!has_transparent_hugepage())
+		return;
+
 	pr_debug("Validating PMD saved write\n");
+	pmd = pfn_pmd(pfn, prot);
 	WARN_ON(!pmd_savedwrite(pmd_mk_savedwrite(pmd_clear_savedwrite(pmd))));
 	WARN_ON(pmd_savedwrite(pmd_clear_savedwrite(pmd_mk_savedwrite(pmd))));
 }
@@ -258,13 +268,14 @@ static void __init pmd_savedwrite_tests(unsigned long pfn, pgprot_t prot)
 static void __init pud_basic_tests(struct mm_struct *mm, unsigned long pfn, int idx)
 {
 	pgprot_t prot = protection_map[idx];
-	pud_t pud = pfn_pud(pfn, prot);
 	unsigned long val = idx, *ptr = &val;
+	pud_t pud;
 
 	if (!has_transparent_hugepage())
 		return;
 
 	pr_debug("Validating PUD basic (%pGv)\n", ptr);
+	pud = pfn_pud(pfn, prot);
 
 	/*
 	 * This test needs to be executed after the given page table entry
@@ -348,9 +359,13 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
 
 static void __init pud_leaf_tests(unsigned long pfn, pgprot_t prot)
 {
-	pud_t pud = pfn_pud(pfn, prot);
+	pud_t pud;
+
+	if (!has_transparent_hugepage())
+		return;
 
 	pr_debug("Validating PUD leaf\n");
+	pud = pfn_pud(pfn, prot);
 	/*
 	 * PUD based THP is a leaf entry.
 	 */
@@ -642,12 +657,16 @@ static void __init pte_protnone_tests(unsigned long pfn, pgprot_t prot)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void __init pmd_protnone_tests(unsigned long pfn, pgprot_t prot)
 {
-	pmd_t pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
+	pmd_t pmd;
 
 	if (!IS_ENABLED(CONFIG_NUMA_BALANCING))
 		return;
 
+	if (!has_transparent_hugepage())
+		return;
+
 	pr_debug("Validating PMD protnone\n");
+	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
 	WARN_ON(!pmd_protnone(pmd));
 	WARN_ON(!pmd_present(pmd));
 }
@@ -667,18 +686,26 @@ static void __init pte_devmap_tests(unsigned long pfn, pgprot_t prot)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void __init pmd_devmap_tests(unsigned long pfn, pgprot_t prot)
 {
-	pmd_t pmd = pfn_pmd(pfn, prot);
+	pmd_t pmd;
+
+	if (!has_transparent_hugepage())
+		return;
 
 	pr_debug("Validating PMD devmap\n");
+	pmd = pfn_pmd(pfn, prot);
 	WARN_ON(!pmd_devmap(pmd_mkdevmap(pmd)));
 }
 
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 static void __init pud_devmap_tests(unsigned long pfn, pgprot_t prot)
 {
-	pud_t pud = pfn_pud(pfn, prot);
+	pud_t pud;
+
+	if (!has_transparent_hugepage())
+		return;
 
 	pr_debug("Validating PUD devmap\n");
+	pud = pfn_pud(pfn, prot);
 	WARN_ON(!pud_devmap(pud_mkdevmap(pud)));
 }
 #else  /* !CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
@@ -721,25 +748,33 @@ static void __init pte_swap_soft_dirty_tests(unsigned long pfn, pgprot_t prot)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void __init pmd_soft_dirty_tests(unsigned long pfn, pgprot_t prot)
 {
-	pmd_t pmd = pfn_pmd(pfn, prot);
+	pmd_t pmd;
 
 	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
 		return;
 
+	if (!has_transparent_hugepage())
+		return;
+
 	pr_debug("Validating PMD soft dirty\n");
+	pmd = pfn_pmd(pfn, prot);
 	WARN_ON(!pmd_soft_dirty(pmd_mksoft_dirty(pmd)));
 	WARN_ON(pmd_soft_dirty(pmd_clear_soft_dirty(pmd)));
 }
 
 static void __init pmd_swap_soft_dirty_tests(unsigned long pfn, pgprot_t prot)
 {
-	pmd_t pmd = pfn_pmd(pfn, prot);
+	pmd_t pmd;
 
 	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY) ||
 		!IS_ENABLED(CONFIG_ARCH_ENABLE_THP_MIGRATION))
 		return;
 
+	if (!has_transparent_hugepage())
+		return;
+
 	pr_debug("Validating PMD swap soft dirty\n");
+	pmd = pfn_pmd(pfn, prot);
 	WARN_ON(!pmd_swp_soft_dirty(pmd_swp_mksoft_dirty(pmd)));
 	WARN_ON(pmd_swp_soft_dirty(pmd_swp_clear_soft_dirty(pmd)));
 }
@@ -768,6 +803,9 @@ static void __init pmd_swap_tests(unsigned long pfn, pgprot_t prot)
 	swp_entry_t swp;
 	pmd_t pmd;
 
+	if (!has_transparent_hugepage())
+		return;
+
 	pr_debug("Validating PMD swap\n");
 	pmd = pfn_pmd(pfn, prot);
 	swp = __pmd_to_swp_entry(pmd);
-- 
2.20.1

