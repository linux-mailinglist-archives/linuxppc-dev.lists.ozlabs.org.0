Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33489176F02
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 06:57:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WmVz57LhzDqh2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 16:57:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 48WmTP14sszDqXC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 16:55:49 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AFF62F;
 Mon,  2 Mar 2020 21:55:46 -0800 (PST)
Received: from [10.162.16.51] (p8cg001049571a15.blr.arm.com [10.162.16.51])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88AF23F6CF;
 Mon,  2 Mar 2020 21:55:39 -0800 (PST)
Subject: Re: [PATCH V14] mm/debug: Add tests validating architecture page
 table helpers
To: Qian Cai <cai@lca.pw>, Christophe Leroy <christophe.leroy@c-s.fr>,
 linux-mm@kvack.org
References: <1581909460-19148-1-git-send-email-anshuman.khandual@arm.com>
 <1582726182.7365.123.camel@lca.pw>
 <7c707b7f-ce3d-993b-8042-44fdc1ed28bf@c-s.fr>
 <1582732318.7365.129.camel@lca.pw> <1583178042.7365.146.camel@lca.pw>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <e8516497-f1b9-b222-e219-73b68880ac75@arm.com>
Date: Tue, 3 Mar 2020 11:25:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1583178042.7365.146.camel@lca.pw>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, x86@kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, Vasily Gorbik <gor@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 03/03/2020 01:10 AM, Qian Cai wrote:
> On Wed, 2020-02-26 at 10:51 -0500, Qian Cai wrote:
>> On Wed, 2020-02-26 at 15:45 +0100, Christophe Leroy wrote:
>>>
>>> Le 26/02/2020 à 15:09, Qian Cai a écrit :
>>>> On Mon, 2020-02-17 at 08:47 +0530, Anshuman Khandual wrote:
>>>>> This adds tests which will validate architecture page table helpers and
>>>>> other accessors in their compliance with expected generic MM semantics.
>>>>> This will help various architectures in validating changes to existing
>>>>> page table helpers or addition of new ones.
>>>>>
>>>>> This test covers basic page table entry transformations including but not
>>>>> limited to old, young, dirty, clean, write, write protect etc at various
>>>>> level along with populating intermediate entries with next page table page
>>>>> and validating them.
>>>>>
>>>>> Test page table pages are allocated from system memory with required size
>>>>> and alignments. The mapped pfns at page table levels are derived from a
>>>>> real pfn representing a valid kernel text symbol. This test gets called
>>>>> inside kernel_init() right after async_synchronize_full().
>>>>>
>>>>> This test gets built and run when CONFIG_DEBUG_VM_PGTABLE is selected. Any
>>>>> architecture, which is willing to subscribe this test will need to select
>>>>> ARCH_HAS_DEBUG_VM_PGTABLE. For now this is limited to arc, arm64, x86, s390
>>>>> and ppc32 platforms where the test is known to build and run successfully.
>>>>> Going forward, other architectures too can subscribe the test after fixing
>>>>> any build or runtime problems with their page table helpers. Meanwhile for
>>>>> better platform coverage, the test can also be enabled with CONFIG_EXPERT
>>>>> even without ARCH_HAS_DEBUG_VM_PGTABLE.
>>>>>
>>>>> Folks interested in making sure that a given platform's page table helpers
>>>>> conform to expected generic MM semantics should enable the above config
>>>>> which will just trigger this test during boot. Any non conformity here will
>>>>> be reported as an warning which would need to be fixed. This test will help
>>>>> catch any changes to the agreed upon semantics expected from generic MM and
>>>>> enable platforms to accommodate it thereafter.
>>>>
>>>> How useful is this that straightly crash the powerpc?
>>>>
>>>> [   23.263425][    T1] debug_vm_pgtable: debug_vm_pgtable: Validating
>>>> architecture page table helpers
>>>> [   23.263625][    T1] ------------[ cut here ]------------
>>>> [   23.263649][    T1] kernel BUG at arch/powerpc/mm/pgtable.c:274!
>>>
>>> The problem on PPC64 is known and has to be investigated and fixed.
>>
>> It might be interesting to hear what powerpc64 maintainers would say about it
>> and if it is actually worth "fixing" in the arch code, but that BUG_ON() was
>> there since 2009 and had not been exposed until this patch comes alone?
> 
> This patch below makes it works on powerpc64 in order to dodge the BUG_ON()s in 
> assert_pte_locked() triggered by pte_clear_tests().
> 
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 96dd7d574cef..50b385233971 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -55,6 +55,8 @@
>  #define RANDOM_ORVALUE	GENMASK(BITS_PER_LONG - 1, S390_MASK_BITS)
>  #define RANDOM_NZVALUE	GENMASK(7, 0)
>  
> +unsigned long vaddr;
> +
>  static void __init pte_basic_tests(unsigned long pfn, pgprot_t prot)
>  {
>  	pte_t pte = pfn_pte(pfn, prot);
> @@ -256,7 +258,7 @@ static void __init pte_clear_tests(struct mm_struct *mm,
> pte_t *ptep)
>  
>  	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
>  	WRITE_ONCE(*ptep, pte);
> -	pte_clear(mm, 0, ptep);
> +	pte_clear(mm, vaddr, ptep);
>  	pte = READ_ONCE(*ptep);
>  	WARN_ON(!pte_none(pte));
>  }
> @@ -310,8 +312,9 @@ void __init debug_vm_pgtable(void)
>  	pgtable_t saved_ptep;
>  	pgprot_t prot;
>  	phys_addr_t paddr;
> -	unsigned long vaddr, pte_aligned, pmd_aligned;
> +	unsigned long pte_aligned, pmd_aligned;
>  	unsigned long pud_aligned, p4d_aligned, pgd_aligned;
> +	spinlock_t *ptl;
>  
>  	pr_info("Validating architecture page table helpers\n");
>  	prot = vm_get_page_prot(VMFLAGS);
> @@ -344,7 +347,7 @@ void __init debug_vm_pgtable(void)
>  	p4dp = p4d_alloc(mm, pgdp, vaddr);
>  	pudp = pud_alloc(mm, p4dp, vaddr);
>  	pmdp = pmd_alloc(mm, pudp, vaddr);
> -	ptep = pte_alloc_map(mm, pmdp, vaddr);
> +	ptep = pte_alloc_map_lock(mm, pmdp, vaddr, &ptl);
>  
>  	/*
>  	 * Save all the page table page addresses as the page table
> @@ -370,7 +373,7 @@ void __init debug_vm_pgtable(void)
>  	p4d_clear_tests(mm, p4dp);
>  	pgd_clear_tests(mm, pgdp);
>  
> -	pte_unmap(ptep);
> +	pte_unmap_unlock(ptep, ptl);
>  
>  	pmd_populate_tests(mm, pmdp, saved_ptep);
>  	pud_populate_tests(mm, pudp, saved_pmdp);
> 

Below is slightly modified version of your change above and should still
prevent the bug on powerpc. Will it be possible for you to re-test this
? Once confirmed, will send a patch enabling this test on powerpc64
keeping your authorship. Thank you.

 mm/debug_vm_pgtable.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 96dd7d574cef..c310f52c2b80 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -250,13 +250,14 @@ static void __init pgd_populate_tests(struct mm_struct *mm, pgd_t *pgdp,
 }
 #endif

-static void __init pte_clear_tests(struct mm_struct *mm, pte_t *ptep)
+static void __init pte_clear_tests(struct mm_struct *mm, pte_t *ptep,
+                                  unsigned long vaddr)
 {
        pte_t pte = READ_ONCE(*ptep);

        pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
        WRITE_ONCE(*ptep, pte);
-       pte_clear(mm, 0, ptep);
+       pte_clear(mm, vaddr, ptep);
        pte = READ_ONCE(*ptep);
        WARN_ON(!pte_none(pte));
 }
@@ -302,6 +303,7 @@ static unsigned long __init get_random_vaddr(void)
 void __init debug_vm_pgtable(void)
 {
        struct mm_struct *mm;
+       spinlock_t *uninitialized_var(ptl);
        pgd_t *pgdp;
        p4d_t *p4dp, *saved_p4dp;
        pud_t *pudp, *saved_pudp;
@@ -344,7 +346,7 @@ void __init debug_vm_pgtable(void)
        p4dp = p4d_alloc(mm, pgdp, vaddr);
        pudp = pud_alloc(mm, p4dp, vaddr);
        pmdp = pmd_alloc(mm, pudp, vaddr);
-       ptep = pte_alloc_map(mm, pmdp, vaddr);
+       ptep = pte_alloc_map_lock(mm, pmdp, vaddr, &ptl);

        /*
         * Save all the page table page addresses as the page table
@@ -364,13 +366,13 @@ void __init debug_vm_pgtable(void)
        p4d_basic_tests(p4d_aligned, prot);
        pgd_basic_tests(pgd_aligned, prot);

-       pte_clear_tests(mm, ptep);
+       pte_clear_tests(mm, ptep, vaddr);
        pmd_clear_tests(mm, pmdp);
        pud_clear_tests(mm, pudp);
        p4d_clear_tests(mm, p4dp);
        pgd_clear_tests(mm, pgdp);

-       pte_unmap(ptep);
+       pte_unmap_unlock(ptep, ptl);

        pmd_populate_tests(mm, pmdp, saved_ptep);
        pud_populate_tests(mm, pudp, saved_pmdp);
-- 
2.20.1
