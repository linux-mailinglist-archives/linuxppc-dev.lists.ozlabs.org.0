Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5737F0C50
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 04:05:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477BHP1LFZzF5B4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 14:05:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 477BFN3JyszF1pB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 14:03:49 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1394D30E;
 Tue,  5 Nov 2019 19:03:44 -0800 (PST)
Received: from [192.168.225.149] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAE593F719;
 Tue,  5 Nov 2019 19:03:20 -0800 (PST)
Subject: Re: [PATCH V8] mm/debug: Add tests validating architecture page table
 helpers
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <1572240562-23630-1-git-send-email-anshuman.khandual@arm.com>
 <e0aa8d49-5511-15e4-f413-62c99eea4fab@arm.com>
 <e0dc3636-8c6e-0177-9a7f-fefd28c74f27@synopsys.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <dc2746c9-bde4-ac00-88d1-2bd1cea1f105@arm.com>
Date: Wed, 6 Nov 2019 08:33:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <e0dc3636-8c6e-0177-9a7f-fefd28c74f27@synopsys.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, James Hogan <jhogan@kernel.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Paul Mackerras <paulus@samba.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, "x86@kernel.org" <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/06/2019 04:00 AM, Vineet Gupta wrote:
> Hi Anshuman,

Hello Vineet,

> 
> On 11/4/19 4:00 PM, Anshuman Khandual wrote:
>> On 10/28/2019 10:59 AM, Anshuman Khandual wrote:
>>> This adds tests which will validate architecture page table helpers and
>>> other accessors in their compliance with expected generic MM semantics.
>>> This will help various architectures in validating changes to existing
>>> page table helpers or addition of new ones.
>>>
>>> This test covers basic page table entry transformations including but not
>>> limited to old, young, dirty, clean, write, write protect etc at various
>>> level along with populating intermediate entries with next page table page
>>> and validating them.
>>>
>>> Test page table pages are allocated from system memory with required size
>>> and alignments. The mapped pfns at page table levels are derived from a
>>> real pfn representing a valid kernel text symbol. This test gets called
>>> right after page_alloc_init_late().
>>>
>>> This gets build and run when CONFIG_DEBUG_VM_PGTABLE is selected along with
>>> CONFIG_VM_DEBUG. Architectures willing to subscribe this test also need to
>>> select CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE which for now is limited to x86 and
>>> arm64. Going forward, other architectures too can enable this after fixing
>>> build or runtime problems (if any) with their page table helpers.
>>>
>>> Folks interested in making sure that a given platform's page table helpers
>>> conform to expected generic MM semantics should enable the above config
>>> which will just trigger this test during boot. Any non conformity here will
>>> be reported as an warning which would need to be fixed. This test will help
>>> catch any changes to the agreed upon semantics expected from generic MM and
>>> enable platforms to accommodate it thereafter.
>>>
> 
> I tried enabling this on ARC and ran into a build issue
> 
> ../mm/debug_vm_pgtable.c: In function ‘pmd_basic_tests’:
> ../mm/debug_vm_pgtable.c:73:14: error: implicit declaration of function ‘pfn_pmd’;
> did you mean ‘pfn_pte’? [-Werror=implicit-function-declaration]
>   pmd_t pmd = pfn_pmd(pfn, prot);
>               ^~~~~~~
> 
> The reason being THP was not enabled (although ARC supports THP) - for the
> combination below
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
> # CONFIG_TRANSPARENT_HUGEPAGE is not set
> 
> I think you need to use latter for guarding pmd_basic_tests()

So the build complains that pfn_pmd() is not defined when the following config
combination is in place.

CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE=n

But should not pfn_pmd() be encapsulated inside HAVE_ARCH_TRANSPARENT_HUGEPAGE
at the minimum (but I would say it should be available always, nonetheless) when
the platform subscribes to THP irrespective of whether THP is enabled or not.

I could see in the file (arch/arc/include/asm/pgtable.h) that fetching pfn_pmd()
and all other basic PMD definitions is conditional on CONFIG_TRANSPARENT_HUGEPAGE.

#ifdef CONFIG_TRANSPARENT_HUGEPAGE
#include <asm/hugepage.h>
#endif

IIUC, CONFIG_TRANSPARENT_HUGEPAGE should only encapsulate PMD page table helpers
which are expected from generic THP code (pmd_trans_huge, pmdp_set_access_flags
etc) but not the basic PMD helpers like pmd_pfn, pmd_mkyoung, pmd_mkdirty,
pmd_mkclean etc. Hence wondering will it be possible to accommodate following
code change on arc platform (not even compiled) in order to fix the problem ?

diff --git a/arch/arc/include/asm/hugepage.h b/arch/arc/include/asm/hugepage.h
index 9a74ce7..2ae15a8 100644
--- a/arch/arc/include/asm/hugepage.h
+++ b/arch/arc/include/asm/hugepage.h
@@ -36,11 +36,11 @@ static inline pmd_t pte_pmd(pte_t pte)
 #define pmd_dirty(pmd)         pte_dirty(pmd_pte(pmd))
 
 #define mk_pmd(page, prot)     pte_pmd(mk_pte(page, prot))
+#define pfn_pmd(pfn, prot)     (__pmd(((pfn) << PAGE_SHIFT) | pgprot_val(prot)))
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define pmd_trans_huge(pmd)    (pmd_val(pmd) & _PAGE_HW_SZ)
 
-#define pfn_pmd(pfn, prot)     (__pmd(((pfn) << PAGE_SHIFT) | pgprot_val(prot)))
-
 static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 {
         /*
@@ -73,5 +73,6 @@ extern void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 
 /* We don't have hardware dirty/accessed bits, generic_pmdp_establish is fine.*/
 #define pmdp_establish generic_pmdp_establish
+#endif
 
 #endif
diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index 9019ed9..20395f1 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -385,7 +385,7 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
  * remap a physical page `pfn' of size `size' with page protection `prot'
  * into virtual address `from'
  */
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE
 #include <asm/hugepage.h>
 #endif

> 
> Other than that the tests pass for !THP and THP too. So once fixed, you could

Glad that it works on arc platform as well.

> enable that for ARC as well> Thx for doing this.
> 
> -Vineet
> 
