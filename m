Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 298C6B1A66
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 11:04:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46V8p213HdzF5J9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 19:04:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46V8ll5GhwzF5H0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 19:02:09 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FB4C28;
 Fri, 13 Sep 2019 02:02:08 -0700 (PDT)
Received: from [10.162.41.125] (p8cg001049571a15.blr.arm.com [10.162.41.125])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 C94023F59C; Fri, 13 Sep 2019 02:01:54 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V2 2/2] mm/pgtable/debug: Add test validating architecture
 page table helpers
To: Christophe Leroy <christophe.leroy@c-s.fr>, linux-mm@kvack.org
References: <1568268173-31302-1-git-send-email-anshuman.khandual@arm.com>
 <1568268173-31302-3-git-send-email-anshuman.khandual@arm.com>
 <ab0ca38b-1e4f-b636-f8b4-007a15903984@c-s.fr>
Message-ID: <502c497a-9bf1-7d2e-95f2-cfebcd9cf1d9@arm.com>
Date: Fri, 13 Sep 2019 14:32:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <ab0ca38b-1e4f-b636-f8b4-007a15903984@c-s.fr>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-arm-kernel@lists.infradead.org,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 09/12/2019 10:44 PM, Christophe Leroy wrote:
> 
> 
> Le 12/09/2019 à 08:02, Anshuman Khandual a écrit :
>> This adds a test module which will validate architecture page table helpers
>> and accessors regarding compliance with generic MM semantics expectations.
>> This will help various architectures in validating changes to the existing
>> page table helpers or addition of new ones.
>>
>> Test page table and memory pages creating it's entries at various level are
>> all allocated from system memory with required alignments. If memory pages
>> with required size and alignment could not be allocated, then all depending
>> individual tests are skipped.
>>
> 
> [...]
> 
>>
>> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>   arch/x86/include/asm/pgtable_64_types.h |   2 +
>>   mm/Kconfig.debug                        |  14 +
>>   mm/Makefile                             |   1 +
>>   mm/arch_pgtable_test.c                  | 429 ++++++++++++++++++++++++
>>   4 files changed, 446 insertions(+)
>>   create mode 100644 mm/arch_pgtable_test.c
>>
>> diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
>> index 52e5f5f2240d..b882792a3999 100644
>> --- a/arch/x86/include/asm/pgtable_64_types.h
>> +++ b/arch/x86/include/asm/pgtable_64_types.h
>> @@ -40,6 +40,8 @@ static inline bool pgtable_l5_enabled(void)
>>   #define pgtable_l5_enabled() 0
>>   #endif /* CONFIG_X86_5LEVEL */
>>   +#define mm_p4d_folded(mm) (!pgtable_l5_enabled())
>> +
> 
> This is specific to x86, should go in a separate patch.

Thought about it but its just a single line. Kirill suggested this in the
previous version. There is a generic fallback definition but s390 has it's
own. This change overrides the generic one for x86 probably as a fix or as
an improvement. Kirill should be able to help classify it in which case it
can be a separate patch.

> 
>>   extern unsigned int pgdir_shift;
>>   extern unsigned int ptrs_per_p4d;
>>   diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
>> index 327b3ebf23bf..ce9c397f7b07 100644
>> --- a/mm/Kconfig.debug
>> +++ b/mm/Kconfig.debug
>> @@ -117,3 +117,17 @@ config DEBUG_RODATA_TEST
>>       depends on STRICT_KERNEL_RWX
>>       ---help---
>>         This option enables a testcase for the setting rodata read-only.
>> +
>> +config DEBUG_ARCH_PGTABLE_TEST
>> +    bool "Test arch page table helpers for semantics compliance"
>> +    depends on MMU
>> +    depends on DEBUG_KERNEL
>> +    help
>> +      This options provides a kernel module which can be used to test
>> +      architecture page table helper functions on various platform in
>> +      verifying if they comply with expected generic MM semantics. This
>> +      will help architectures code in making sure that any changes or
>> +      new additions of these helpers will still conform to generic MM
>> +      expected semantics.
>> +
>> +      If unsure, say N.
>> diff --git a/mm/Makefile b/mm/Makefile
>> index d996846697ef..bb572c5aa8c5 100644
>> --- a/mm/Makefile
>> +++ b/mm/Makefile
>> @@ -86,6 +86,7 @@ obj-$(CONFIG_HWPOISON_INJECT) += hwpoison-inject.o
>>   obj-$(CONFIG_DEBUG_KMEMLEAK) += kmemleak.o
>>   obj-$(CONFIG_DEBUG_KMEMLEAK_TEST) += kmemleak-test.o
>>   obj-$(CONFIG_DEBUG_RODATA_TEST) += rodata_test.o
>> +obj-$(CONFIG_DEBUG_ARCH_PGTABLE_TEST) += arch_pgtable_test.o
>>   obj-$(CONFIG_PAGE_OWNER) += page_owner.o
>>   obj-$(CONFIG_CLEANCACHE) += cleancache.o
>>   obj-$(CONFIG_MEMORY_ISOLATION) += page_isolation.o
>> diff --git a/mm/arch_pgtable_test.c b/mm/arch_pgtable_test.c
>> new file mode 100644
>> index 000000000000..8b4a92756ad8
>> --- /dev/null
>> +++ b/mm/arch_pgtable_test.c
>> @@ -0,0 +1,429 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * This kernel module validates architecture page table helpers &
>> + * accessors and helps in verifying their continued compliance with
>> + * generic MM semantics.
>> + *
>> + * Copyright (C) 2019 ARM Ltd.
>> + *
>> + * Author: Anshuman Khandual <anshuman.khandual@arm.com>
>> + */
>> +#define pr_fmt(fmt) "arch_pgtable_test: %s " fmt, __func__
>> +
>> +#include <linux/gfp.h>
>> +#include <linux/hugetlb.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mm.h>
>> +#include <linux/mman.h>
>> +#include <linux/mm_types.h>
>> +#include <linux/module.h>
>> +#include <linux/pfn_t.h>
>> +#include <linux/printk.h>
>> +#include <linux/random.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/swap.h>
>> +#include <linux/swapops.h>
>> +#include <linux/sched/mm.h>
> 
> Add <linux/highmem.h> (see other mails, build failure on ppc book3s/32)

Okay.

> 
>> +#include <asm/pgalloc.h>
>> +#include <asm/pgtable.h>
>> +
>> +/*
>> + * Basic operations
>> + *
>> + * mkold(entry)            = An old and not a young entry
>> + * mkyoung(entry)        = A young and not an old entry
>> + * mkdirty(entry)        = A dirty and not a clean entry
>> + * mkclean(entry)        = A clean and not a dirty entry
>> + * mkwrite(entry)        = A write and not a write protected entry
>> + * wrprotect(entry)        = A write protected and not a write entry
>> + * pxx_bad(entry)        = A mapped and non-table entry
>> + * pxx_same(entry1, entry2)    = Both entries hold the exact same value
>> + */
>> +#define VMFLAGS    (VM_READ|VM_WRITE|VM_EXEC)
>> +
>> +/*
>> + * On s390 platform, the lower 12 bits are used to identify given page table
>> + * entry type and for other arch specific requirements. But these bits might
>> + * affect the ability to clear entries with pxx_clear(). So while loading up
>> + * the entries skip all lower 12 bits in order to accommodate s390 platform.
>> + * It does not have affect any other platform.
>> + */
>> +#define RANDOM_ORVALUE    (0xfffffffffffff000UL)
>> +#define RANDOM_NZVALUE    (0xff)
>> +
>> +static bool pud_aligned;
>> +static bool pmd_aligned;
>> +
>> +static void pte_basic_tests(struct page *page, pgprot_t prot)
>> +{
>> +    pte_t pte = mk_pte(page, prot);
>> +
>> +    WARN_ON(!pte_same(pte, pte));
>> +    WARN_ON(!pte_young(pte_mkyoung(pte)));
>> +    WARN_ON(!pte_dirty(pte_mkdirty(pte)));
>> +    WARN_ON(!pte_write(pte_mkwrite(pte)));
>> +    WARN_ON(pte_young(pte_mkold(pte)));
>> +    WARN_ON(pte_dirty(pte_mkclean(pte)));
>> +    WARN_ON(pte_write(pte_wrprotect(pte)));
>> +}
>> +
>> +#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE
>> +static void pmd_basic_tests(struct page *page, pgprot_t prot)
>> +{
>> +    pmd_t pmd;
>> +
>> +    /*
>> +     * Memory block here must be PMD_SIZE aligned. Abort this
>> +     * test in case we could not allocate such a memory block.
>> +     */
>> +    if (!pmd_aligned) {
>> +        pr_warn("Could not proceed with PMD tests\n");
>> +        return;
>> +    }
>> +
>> +    pmd = mk_pmd(page, prot);
>> +    WARN_ON(!pmd_same(pmd, pmd));
>> +    WARN_ON(!pmd_young(pmd_mkyoung(pmd)));
>> +    WARN_ON(!pmd_dirty(pmd_mkdirty(pmd)));
>> +    WARN_ON(!pmd_write(pmd_mkwrite(pmd)));
>> +    WARN_ON(pmd_young(pmd_mkold(pmd)));
>> +    WARN_ON(pmd_dirty(pmd_mkclean(pmd)));
>> +    WARN_ON(pmd_write(pmd_wrprotect(pmd)));
>> +    /*
>> +     * A huge page does not point to next level page table
>> +     * entry. Hence this must qualify as pmd_bad().
>> +     */
>> +    WARN_ON(!pmd_bad(pmd_mkhuge(pmd)));
>> +}
>> +#else
>> +static void pmd_basic_tests(struct page *page, pgprot_t prot) { }
>> +#endif
>> +
>> +#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
>> +static void pud_basic_tests(struct page *page, pgprot_t prot)
>> +{
>> +    pud_t pud;
>> +
>> +    /*
>> +     * Memory block here must be PUD_SIZE aligned. Abort this
>> +     * test in case we could not allocate such a memory block.
>> +     */
>> +    if (!pud_aligned) {
>> +        pr_warn("Could not proceed with PUD tests\n");
>> +        return;
>> +    }
>> +
>> +    pud = pfn_pud(page_to_pfn(page), prot);
>> +    WARN_ON(!pud_same(pud, pud));
>> +    WARN_ON(!pud_young(pud_mkyoung(pud)));
>> +    WARN_ON(!pud_write(pud_mkwrite(pud)));
>> +    WARN_ON(pud_write(pud_wrprotect(pud)));
>> +    WARN_ON(pud_young(pud_mkold(pud)));
>> +
>> +#if !defined(__PAGETABLE_PMD_FOLDED) && !defined(__ARCH_HAS_4LEVEL_HACK)
>> +    /*
>> +     * A huge page does not point to next level page table
>> +     * entry. Hence this must qualify as pud_bad().
>> +     */
>> +    WARN_ON(!pud_bad(pud_mkhuge(pud)));
>> +#endif
>> +}
>> +#else
>> +static void pud_basic_tests(struct page *page, pgprot_t prot) { }
>> +#endif
>> +
>> +static void p4d_basic_tests(struct page *page, pgprot_t prot)
>> +{
>> +    p4d_t p4d;
>> +
>> +    memset(&p4d, RANDOM_NZVALUE, sizeof(p4d_t));
>> +    WARN_ON(!p4d_same(p4d, p4d));
>> +}
>> +
>> +static void pgd_basic_tests(struct page *page, pgprot_t prot)
>> +{
>> +    pgd_t pgd;
>> +
>> +    memset(&pgd, RANDOM_NZVALUE, sizeof(pgd_t));
>> +    WARN_ON(!pgd_same(pgd, pgd));
>> +}
>> +
>> +#if !defined(__PAGETABLE_PMD_FOLDED) && !defined(__ARCH_HAS_4LEVEL_HACK)
> 
> #ifdefs have to be avoided as much as possible, see below

Yeah but it has been bit difficult to avoid all these $ifdef because of the
availability (or lack of it) for all these pgtable helpers in various config
combinations on all platforms.

> 
>> +static void pud_clear_tests(pud_t *pudp)
>> +{
>> +    pud_t pud = READ_ONCE(*pudp);
>     if (mm_pmd_folded() || __is_defined(__ARCH_HAS_4LEVEL_HACK))
>         return;
> 
>> +
>> +    pud = __pud(pud_val(pud) | RANDOM_ORVALUE);
>> +    WRITE_ONCE(*pudp, pud);
>> +    pud_clear(pudp);
>> +    pud = READ_ONCE(*pudp);
>> +    WARN_ON(!pud_none(pud));
>> +}
>> +
>> +static void pud_populate_tests(struct mm_struct *mm, pud_t *pudp, pmd_t *pmdp)
>> +{
>> +    pud_t pud;
>> +
>     if (mm_pmd_folded() || __is_defined(__ARCH_HAS_4LEVEL_HACK))
>         return;
>> +    /*
>> +     * This entry points to next level page table page.
>> +     * Hence this must not qualify as pud_bad().
>> +     */
>> +    pmd_clear(pmdp);
>> +    pud_clear(pudp);
>> +    pud_populate(mm, pudp, pmdp);
>> +    pud = READ_ONCE(*pudp);
>> +    WARN_ON(pud_bad(pud));
>> +}
>> +#else
> 
> Then the else branch goes away.
> 
>> +static void pud_clear_tests(pud_t *pudp) { }
>> +static void pud_populate_tests(struct mm_struct *mm, pud_t *pudp, pmd_t *pmdp)
>> +{
>> +}
>> +#endif
>> +
>> +#if !defined(__PAGETABLE_PUD_FOLDED) && !defined(__ARCH_HAS_5LEVEL_HACK)
> 
> The same can be done here.

IIRC not only the page table helpers but there are data types (pxx_t) which
were not present on various configs and these wrappers help prevent build
failures. Any ways will try and see if this can be improved further. But
meanwhile if you have some suggestions, please do let me know.

> 
>> +static void p4d_clear_tests(p4d_t *p4dp)
>> +{
>> +    p4d_t p4d = READ_ONCE(*p4dp);
>> +
>> +    p4d = __p4d(p4d_val(p4d) | RANDOM_ORVALUE);
>> +    WRITE_ONCE(*p4dp, p4d);
>> +    p4d_clear(p4dp);
>> +    p4d = READ_ONCE(*p4dp);
>> +    WARN_ON(!p4d_none(p4d));
>> +}
>> +
>> +static void p4d_populate_tests(struct mm_struct *mm, p4d_t *p4dp, pud_t *pudp)
>> +{
>> +    p4d_t p4d;
>> +
>> +    /*
>> +     * This entry points to next level page table page.
>> +     * Hence this must not qualify as p4d_bad().
>> +     */
>> +    pud_clear(pudp);
>> +    p4d_clear(p4dp);
>> +    p4d_populate(mm, p4dp, pudp);
>> +    p4d = READ_ONCE(*p4dp);
>> +    WARN_ON(p4d_bad(p4d));
>> +}
>> +#else
>> +static void p4d_clear_tests(p4d_t *p4dp) { }
>> +static void p4d_populate_tests(struct mm_struct *mm, p4d_t *p4dp, pud_t *pudp)
>> +{
>> +}
>> +#endif
>> +
>> +#ifndef __ARCH_HAS_5LEVEL_HACK
> 
> And the same here (you already did part of it with testing mm_p4d_folded(mm)

But it was not capturing all the build combinations which will break
otherwise e.g some configs on arm64 was failing to build.

> 
>> +static void pgd_clear_tests(struct mm_struct *mm, pgd_t *pgdp)
>> +{
>> +    pgd_t pgd = READ_ONCE(*pgdp);
>> +
>> +    if (mm_p4d_folded(mm))
>> +        return;
>> +
>> +    pgd = __pgd(pgd_val(pgd) | RANDOM_ORVALUE);
>> +    WRITE_ONCE(*pgdp, pgd);
>> +    pgd_clear(pgdp);
>> +    pgd = READ_ONCE(*pgdp);
>> +    WARN_ON(!pgd_none(pgd));
>> +}
>> +
>> +static void pgd_populate_tests(struct mm_struct *mm, pgd_t *pgdp, p4d_t *p4dp)
>> +{
>> +    pgd_t pgd;
>> +
>> +    if (mm_p4d_folded(mm))
>> +        return;
>> +
>> +    /*
>> +     * This entry points to next level page table page.
>> +     * Hence this must not qualify as pgd_bad().
>> +     */
>> +    p4d_clear(p4dp);
>> +    pgd_clear(pgdp);
>> +    pgd_populate(mm, pgdp, p4dp);
>> +    pgd = READ_ONCE(*pgdp);
>> +    WARN_ON(pgd_bad(pgd));
>> +}
>> +#else
>> +static void pgd_clear_tests(struct mm_struct *mm, pgd_t *pgdp) { }
>> +static void pgd_populate_tests(struct mm_struct *mm, pgd_t *pgdp, p4d_t *p4dp)
>> +{
>> +}
>> +#endif
>> +
>> +static void pte_clear_tests(struct mm_struct *mm, pte_t *ptep)
>> +{
>> +    pte_t pte = READ_ONCE(*ptep);
>> +
>> +    pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
>> +    WRITE_ONCE(*ptep, pte);
>> +    pte_clear(mm, 0, ptep);
>> +    pte = READ_ONCE(*ptep);
>> +    WARN_ON(!pte_none(pte));
>> +}
>> +
>> +static void pmd_clear_tests(pmd_t *pmdp)
>> +{
>> +    pmd_t pmd = READ_ONCE(*pmdp);
>> +
>> +    pmd = __pmd(pmd_val(pmd) | RANDOM_ORVALUE);
>> +    WRITE_ONCE(*pmdp, pmd);
>> +    pmd_clear(pmdp);
>> +    pmd = READ_ONCE(*pmdp);
>> +    WARN_ON(!pmd_none(pmd));
>> +}
>> +
>> +static void pmd_populate_tests(struct mm_struct *mm, pmd_t *pmdp,
>> +                   pgtable_t pgtable)
>> +{
>> +    pmd_t pmd;
>> +
>> +    /*
>> +     * This entry points to next level page table page.
>> +     * Hence this must not qualify as pmd_bad().
>> +     */
>> +    pmd_clear(pmdp);
>> +    pmd_populate(mm, pmdp, pgtable);
>> +    pmd = READ_ONCE(*pmdp);
>> +    WARN_ON(pmd_bad(pmd));
>> +}
>> +
>> +static struct page *alloc_mapped_page(void)
>> +{
>> +    struct page *page;
>> +    gfp_t gfp_mask = GFP_KERNEL | __GFP_ZERO;
>> +
>> +    page = alloc_gigantic_page_order(get_order(PUD_SIZE), gfp_mask,
>> +                first_memory_node, &node_states[N_MEMORY]);
>> +    if (page) {
>> +        pud_aligned = true;
>> +        pmd_aligned = true;
>> +        return page;
>> +    }
>> +
>> +    page = alloc_pages(gfp_mask, get_order(PMD_SIZE));
>> +    if (page) {
>> +        pmd_aligned = true;
>> +        return page;
>> +    }
>> +    return alloc_page(gfp_mask);
>> +}
>> +
>> +static void free_mapped_page(struct page *page)
>> +{
>> +    if (pud_aligned) {
>> +        unsigned long pfn = page_to_pfn(page);
>> +
>> +        free_contig_range(pfn, 1ULL << get_order(PUD_SIZE));
>> +        return;
>> +    }
>> +
>> +    if (pmd_aligned) {
>> +        int order = get_order(PMD_SIZE);
>> +
>> +        free_pages((unsigned long)page_address(page), order);
>> +        return;
>> +    }
>> +    free_page((unsigned long)page_address(page));
>> +}
>> +
>> +static unsigned long get_random_vaddr(void)
>> +{
>> +    unsigned long random_vaddr, random_pages, total_user_pages;
>> +
>> +    total_user_pages = (TASK_SIZE - FIRST_USER_ADDRESS) / PAGE_SIZE;
>> +
>> +    random_pages = get_random_long() % total_user_pages;
>> +    random_vaddr = FIRST_USER_ADDRESS + random_pages * PAGE_SIZE;
>> +
>> +    WARN_ON(random_vaddr > TASK_SIZE);
>> +    WARN_ON(random_vaddr < FIRST_USER_ADDRESS);
>> +    return random_vaddr;
>> +}
>> +
>> +static int __init arch_pgtable_tests_init(void)
>> +{
>> +    struct mm_struct *mm;
>> +    struct page *page;
>> +    pgd_t *pgdp;
>> +    p4d_t *p4dp, *saved_p4dp;
>> +    pud_t *pudp, *saved_pudp;
>> +    pmd_t *pmdp, *saved_pmdp, pmd;
>> +    pte_t *ptep;
>> +    pgtable_t saved_ptep;
>> +    pgprot_t prot;
>> +    unsigned long vaddr;
>> +
>> +    prot = vm_get_page_prot(VMFLAGS);
>> +    vaddr = get_random_vaddr();
>> +    mm = mm_alloc();
>> +    if (!mm) {
>> +        pr_err("mm_struct allocation failed\n");
>> +        return 1;
>> +    }
>> +
>> +    page = alloc_mapped_page();
>> +    if (!page) {
>> +        pr_err("memory allocation failed\n");
>> +        return 1;
>> +    }
>> +
>> +    pgdp = pgd_offset(mm, vaddr);
>> +    p4dp = p4d_alloc(mm, pgdp, vaddr);
>> +    pudp = pud_alloc(mm, p4dp, vaddr);
>> +    pmdp = pmd_alloc(mm, pudp, vaddr);
>> +    ptep = pte_alloc_map(mm, pmdp, vaddr);
>> +
>> +    /*
>> +     * Save all the page table page addresses as the page table
>> +     * entries will be used for testing with random or garbage
>> +     * values. These saved addresses will be used for freeing
>> +     * page table pages.
>> +     */
>> +    pmd = READ_ONCE(*pmdp);
>> +    saved_p4dp = p4d_offset(pgdp, 0UL);
>> +    saved_pudp = pud_offset(p4dp, 0UL);
>> +    saved_pmdp = pmd_offset(pudp, 0UL);
>> +    saved_ptep = pmd_pgtable(pmd);
>> +
>> +    pte_basic_tests(page, prot);
>> +    pmd_basic_tests(page, prot);
>> +    pud_basic_tests(page, prot);
>> +    p4d_basic_tests(page, prot);
>> +    pgd_basic_tests(page, prot);
>> +
>> +    pte_clear_tests(mm, ptep);
>> +    pmd_clear_tests(pmdp);
>> +    pud_clear_tests(pudp);
>> +    p4d_clear_tests(p4dp);
>> +    pgd_clear_tests(mm, pgdp);
>> +
>> +    pmd_populate_tests(mm, pmdp, saved_ptep);
>> +    pud_populate_tests(mm, pudp, saved_pmdp);
>> +    p4d_populate_tests(mm, p4dp, saved_pudp);
>> +    pgd_populate_tests(mm, pgdp, saved_p4dp);
>> +
>> +    p4d_free(mm, saved_p4dp);
>> +    pud_free(mm, saved_pudp);
>> +    pmd_free(mm, saved_pmdp);
>> +    pte_free(mm, saved_ptep);
>> +
>> +    mm_dec_nr_puds(mm);
>> +    mm_dec_nr_pmds(mm);
>> +    mm_dec_nr_ptes(mm);
>> +    __mmdrop(mm);
>> +
>> +    free_mapped_page(page);
>> +    return 0;
> 
> Is there any benefit in keeping the module loaded once the tests are done ? Shouldn't the load fail instead ?

Will change this as late_init() sequence with all __init marked
functions as suggested by Kirill on the other thread.

> 
>> +}
>> +
>> +static void __exit arch_pgtable_tests_exit(void) { }
> 
> Is this function really needed ?

This will be gone as well.

> 
>> +
>> +module_init(arch_pgtable_tests_init);
>> +module_exit(arch_pgtable_tests_exit);
>> +
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_AUTHOR("Anshuman Khandual <anshuman.khandual@arm.com>");
>> +MODULE_DESCRIPTION("Test architecture page table helpers");
>>
> 
> Christophe
> 
