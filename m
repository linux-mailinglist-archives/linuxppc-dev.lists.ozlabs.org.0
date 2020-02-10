Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECA3157F00
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 16:39:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GVT10QqnzDqMw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 02:39:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=catalin.marinas@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 48GVQk5WdRzDqMn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 02:37:31 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F75B1FB;
 Mon, 10 Feb 2020 07:37:28 -0800 (PST)
Received: from E121110.arm.com (C02TF0J2HF1T.cambridge.arm.com [10.1.26.172])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 1A4B13F68E; Mon, 10 Feb 2020 07:37:18 -0800 (PST)
Date: Mon, 10 Feb 2020 15:37:16 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
Message-ID: <20200210153716.GB9283@E121110.arm.com>
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
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
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Dan Williams <dan.j.williams@intel.com>, Mark Brown <broonie@kernel.org>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Dave Hansen <dave.hansen@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 28, 2020 at 06:57:53AM +0530, Anshuman Khandual wrote:
> This gets build and run when CONFIG_DEBUG_VM_PGTABLE is selected along with
> CONFIG_VM_DEBUG. Architectures willing to subscribe this test also need to
> select CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE which for now is limited to x86 and
> arm64. Going forward, other architectures too can enable this after fixing
> build or runtime problems (if any) with their page table helpers.

It may be worth posting the next version to linux-arch to reach out to
other arch maintainers.

Also I've seen that you posted a v13 but it hasn't reached
linux-arm-kernel (likely held in moderation because of the large amount
of addresses cc'ed) and I don't normally follow LKML. I'm not cc'ed to
this patch either (which is fine as long as you post to a list that I
read).

Since I started the reply on v12 about a week ago, I'll follow up here.
When you post a v14, please trim the people on cc only to those strictly
necessary (e.g. arch maintainers, linux-mm, linux-arch and lkml).

> diff --git a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
> new file mode 100644
> index 000000000000..f3f8111edbe3
> --- /dev/null
> +++ b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
> @@ -0,0 +1,35 @@
> +#
> +# Feature name:          debug-vm-pgtable
> +#         Kconfig:       ARCH_HAS_DEBUG_VM_PGTABLE
> +#         description:   arch supports pgtable tests for semantics compliance
> +#
> +    -----------------------
> +    |         arch |status|
> +    -----------------------
> +    |       alpha: | TODO |
> +    |         arc: |  ok  |
> +    |         arm: | TODO |

I'm sure you can find some arm32 hardware around (or a VM) to give this
a try ;).

> diff --git a/arch/x86/include/asm/pgtable_64.h b/arch/x86/include/asm/pgtable_64.h
> index 0b6c4042942a..fb0e76d254b3 100644
> --- a/arch/x86/include/asm/pgtable_64.h
> +++ b/arch/x86/include/asm/pgtable_64.h
[...]
> @@ -1197,6 +1197,7 @@ static noinline void __init kernel_init_freeable(void)
>  	sched_init_smp();
>  
>  	page_alloc_init_late();
> +	debug_vm_pgtable();
>  	/* Initialize page ext after all struct pages are initialized. */
>  	page_ext_init();

I guess you could even make debug_vm_pgtable() an early_initcall(). I
don't have a strong opinion either way.

> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> new file mode 100644
> index 000000000000..0f37f32d15f1
> --- /dev/null
> +++ b/mm/debug_vm_pgtable.c
> @@ -0,0 +1,388 @@
[...]
> +/*
> + * Basic operations
> + *
> + * mkold(entry)			= An old and not a young entry
> + * mkyoung(entry)		= A young and not an old entry
> + * mkdirty(entry)		= A dirty and not a clean entry
> + * mkclean(entry)		= A clean and not a dirty entry
> + * mkwrite(entry)		= A write and not a write protected entry
> + * wrprotect(entry)		= A write protected and not a write entry
> + * pxx_bad(entry)		= A mapped and non-table entry
> + * pxx_same(entry1, entry2)	= Both entries hold the exact same value
> + */
> +#define VMFLAGS	(VM_READ|VM_WRITE|VM_EXEC)
> +
> +/*
> + * On s390 platform, the lower 12 bits are used to identify given page table
> + * entry type and for other arch specific requirements. But these bits might
> + * affect the ability to clear entries with pxx_clear(). So while loading up
> + * the entries skip all lower 12 bits in order to accommodate s390 platform.
> + * It does not have affect any other platform.
> + */
> +#define RANDOM_ORVALUE	(0xfffffffffffff000UL)

I'd suggest you generate this mask with something like
GENMASK(BITS_PER_LONG, PAGE_SHIFT).

> +#define RANDOM_NZVALUE	(0xff)
> +
> +static void __init pte_basic_tests(unsigned long pfn, pgprot_t prot)
> +{
> +	pte_t pte = pfn_pte(pfn, prot);
> +
> +	WARN_ON(!pte_same(pte, pte));
> +	WARN_ON(!pte_young(pte_mkyoung(pte)));
> +	WARN_ON(!pte_dirty(pte_mkdirty(pte)));
> +	WARN_ON(!pte_write(pte_mkwrite(pte)));
> +	WARN_ON(pte_young(pte_mkold(pte)));
> +	WARN_ON(pte_dirty(pte_mkclean(pte)));
> +	WARN_ON(pte_write(pte_wrprotect(pte)));

Given that you start with rwx permissions set,
some of these ops would not have any effect. For example, on arm64 at
least, mkwrite clears a bit already cleared here. You could try with
multiple rwx combinations values (e.g. all set and all cleared) or maybe
something like below:

	WARN_ON(!pte_write(pte_mkwrite(pte_wrprotect(pte))));

You could also try something like this:

	WARN_ON(!pte_same(pte_wrprotect(pte), pte_wrprotect(pte_mkwrite(pte))));

though the above approach may not work for arm64 ptep_set_wrprotect() on
a dirty pte (if you extend these tests later).

> +}
> +
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot)
> +{
> +	pmd_t pmd = pfn_pmd(pfn, prot);
> +
> +	WARN_ON(!pmd_same(pmd, pmd));
> +	WARN_ON(!pmd_young(pmd_mkyoung(pmd)));
> +	WARN_ON(!pmd_dirty(pmd_mkdirty(pmd)));
> +	WARN_ON(!pmd_write(pmd_mkwrite(pmd)));
> +	WARN_ON(pmd_young(pmd_mkold(pmd)));
> +	WARN_ON(pmd_dirty(pmd_mkclean(pmd)));
> +	WARN_ON(pmd_write(pmd_wrprotect(pmd)));
> +	/*
> +	 * A huge page does not point to next level page table
> +	 * entry. Hence this must qualify as pmd_bad().
> +	 */
> +	WARN_ON(!pmd_bad(pmd_mkhuge(pmd)));
> +}
> +
> +#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> +static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot)
> +{
> +	pud_t pud = pfn_pud(pfn, prot);
> +
> +	WARN_ON(!pud_same(pud, pud));
> +	WARN_ON(!pud_young(pud_mkyoung(pud)));
> +	WARN_ON(!pud_write(pud_mkwrite(pud)));
> +	WARN_ON(pud_write(pud_wrprotect(pud)));
> +	WARN_ON(pud_young(pud_mkold(pud)));
> +
> +	if (mm_pmd_folded(mm) || __is_defined(ARCH_HAS_4LEVEL_HACK))
> +		return;
> +
> +	/*
> +	 * A huge page does not point to next level page table
> +	 * entry. Hence this must qualify as pud_bad().
> +	 */
> +	WARN_ON(!pud_bad(pud_mkhuge(pud)));
> +}
> +#else
> +static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot) { }
> +#endif
> +#else
> +static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot) { }
> +static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot) { }
> +#endif
> +
> +static void __init p4d_basic_tests(unsigned long pfn, pgprot_t prot)
> +{
> +	p4d_t p4d;
> +
> +	memset(&p4d, RANDOM_NZVALUE, sizeof(p4d_t));
> +	WARN_ON(!p4d_same(p4d, p4d));
> +}
> +
> +static void __init pgd_basic_tests(unsigned long pfn, pgprot_t prot)
> +{
> +	pgd_t pgd;
> +
> +	memset(&pgd, RANDOM_NZVALUE, sizeof(pgd_t));
> +	WARN_ON(!pgd_same(pgd, pgd));
> +}
> +
> +#ifndef __ARCH_HAS_4LEVEL_HACK

This macro doesn't exist in the kernel anymore (it's a 5LEVEL now). But
can you not use the __PAGETABLE_PUD_FOLDED instead?

> +static void __init pud_clear_tests(struct mm_struct *mm, pud_t *pudp)
> +{
> +	pud_t pud = READ_ONCE(*pudp);
> +
> +	if (mm_pmd_folded(mm))
> +		return;
> +
> +	pud = __pud(pud_val(pud) | RANDOM_ORVALUE);
> +	WRITE_ONCE(*pudp, pud);
> +	pud_clear(pudp);
> +	pud = READ_ONCE(*pudp);
> +	WARN_ON(!pud_none(pud));
> +}
> +
> +static void __init pud_populate_tests(struct mm_struct *mm, pud_t *pudp,
> +				      pmd_t *pmdp)
> +{
> +	pud_t pud;
> +
> +	if (mm_pmd_folded(mm))
> +		return;
> +	/*
> +	 * This entry points to next level page table page.
> +	 * Hence this must not qualify as pud_bad().
> +	 */
> +	pmd_clear(pmdp);
> +	pud_clear(pudp);
> +	pud_populate(mm, pudp, pmdp);
> +	pud = READ_ONCE(*pudp);
> +	WARN_ON(pud_bad(pud));
> +}
> +#else
> +static void __init pud_clear_tests(struct mm_struct *mm, pud_t *pudp) { }
> +static void __init pud_populate_tests(struct mm_struct *mm, pud_t *pudp,
> +				      pmd_t *pmdp)
> +{
> +}
> +#endif
> +
> +#ifndef __ARCH_HAS_5LEVEL_HACK

Could you use __PAGETABLE_P4D_FOLDED instead?

> +static void __init p4d_clear_tests(struct mm_struct *mm, p4d_t *p4dp)
> +{
> +	p4d_t p4d = READ_ONCE(*p4dp);
> +
> +	if (mm_pud_folded(mm))
> +		return;
> +
> +	p4d = __p4d(p4d_val(p4d) | RANDOM_ORVALUE);
> +	WRITE_ONCE(*p4dp, p4d);
> +	p4d_clear(p4dp);
> +	p4d = READ_ONCE(*p4dp);
> +	WARN_ON(!p4d_none(p4d));
> +}

Otherwise the patch looks fine. As per the comment on v13, make sure you
don't break the build on any architecture, so this could either be an
opt-in or patch those architectures before this patch is applied.

Thanks.

-- 
Catalin
