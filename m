Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 651DEDFE0A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 09:13:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y4Tv5J0gzDqHw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 18:13:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Ap4PZJPz"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y4Rn40FmzDqFB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 18:11:16 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46y4Rd70Qlz9tyfh;
 Tue, 22 Oct 2019 09:11:09 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Ap4PZJPz; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ogcji5q0KnHG; Tue, 22 Oct 2019 09:11:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46y4Rd5gXjz9tyfg;
 Tue, 22 Oct 2019 09:11:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1571728269; bh=kOGepsk5Ck4NL5FoHfVezc4/5OGKldi3JIwfABjXAjk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Ap4PZJPzPg5e764D9ApTCr8XIOyguzsvgMwq5AWR4E0/zh0xnRHlQQ+Eo1OlE7aTP
 ZixHcnTE7rBBIzhFUJshZizJQ+smXIHrl6Gc6+NAMSi/5KfWtkWR1KD31Zq3+rbJQP
 +WISNUI41CxdVRlDUOc/jgNhGI81GLU/ouuiJevE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9F5758B916;
 Tue, 22 Oct 2019 09:11:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pUnm5Uq24Z86; Tue, 22 Oct 2019 09:11:10 +0200 (CEST)
Received: from po16098vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4B99C8B752;
 Tue, 22 Oct 2019 09:11:08 +0200 (CEST)
Subject: Re: [PATCH V7] mm/debug: Add tests validating architecture page table
 helpers
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <1571625739-29943-1-git-send-email-anshuman.khandual@arm.com>
 <1571625739-29943-2-git-send-email-anshuman.khandual@arm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <535564eb-65ea-69ab-977d-0038a9e4f785@c-s.fr>
Date: Tue, 22 Oct 2019 07:11:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1571625739-29943-2-git-send-email-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 linux-snps-arc@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Kees Cook <keescook@chromium.org>,
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



On 10/21/2019 02:42 AM, Anshuman Khandual wrote:
> This adds tests which will validate architecture page table helpers and
> other accessors in their compliance with expected generic MM semantics.
> This will help various architectures in validating changes to existing
> page table helpers or addition of new ones.
> 
> This test covers basic page table entry transformations including but not
> limited to old, young, dirty, clean, write, write protect etc at various
> level along with populating intermediate entries with next page table page
> and validating them.
> 
> Test page table pages are allocated from system memory with required size
> and alignments. The mapped pfns at page table levels are derived from a
> real pfn representing a valid kernel text symbol. This test gets called
> right after page_alloc_init_late().
> 
> This gets build and run when CONFIG_DEBUG_VM_PGTABLE is selected along with
> CONFIG_VM_DEBUG. Architectures willing to subscribe this test also need to
> select CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE which for now is limited to x86 and
> arm64. Going forward, other architectures too can enable this after fixing
> build or runtime problems (if any) with their page table helpers.
> 
> Folks interested in making sure that a given platform's page table helpers
> conform to expected generic MM semantics should enable the above config
> which will just trigger this test during boot. Any non conformity here will
> be reported as an warning which would need to be fixed. This test will help
> catch any changes to the agreed upon semantics expected from generic MM and
> enable platforms to accommodate it thereafter.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Steven Price <Steven.Price@arm.com>
> Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Sri Krishna chowdary <schowdary@nvidia.com>
> Cc: Dave Hansen <dave.hansen@intel.com>
> Cc: Russell King - ARM Linux <linux@armlinux.org.uk>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: James Hogan <jhogan@kernel.org>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Kirill A. Shutemov <kirill@shutemov.name>
> Cc: Gerald Schaefer <gerald.schaefer@de.ibm.com>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-ia64@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: x86@kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> Tested-by: Christophe Leroy <christophe.leroy@c-s.fr>		#PPC32
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---

The cover letter have the exact same title as this patch. I think a 
cover letter is not necessary for a singleton series.

The history (and any other information you don't want to include in the 
commit message) can be added here, below the '---'. That way it is in 
the mail but won't be included in the commit.

>   .../debug/debug-vm-pgtable/arch-support.txt        |  34 ++
>   arch/arm64/Kconfig                                 |   1 +
>   arch/x86/Kconfig                                   |   1 +
>   arch/x86/include/asm/pgtable_64.h                  |   6 +
>   include/asm-generic/pgtable.h                      |   6 +
>   init/main.c                                        |   1 +
>   lib/Kconfig.debug                                  |  21 ++
>   mm/Makefile                                        |   1 +
>   mm/debug_vm_pgtable.c                              | 388 +++++++++++++++++++++
>   9 files changed, 459 insertions(+)
>   create mode 100644 Documentation/features/debug/debug-vm-pgtable/arch-support.txt
>   create mode 100644 mm/debug_vm_pgtable.c
> 
> diff --git a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
> new file mode 100644
> index 0000000..d6b8185
> --- /dev/null
> +++ b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
> @@ -0,0 +1,34 @@
> +#
> +# Feature name:          debug-vm-pgtable
> +#         Kconfig:       ARCH_HAS_DEBUG_VM_PGTABLE
> +#         description:   arch supports pgtable tests for semantics compliance
> +#
> +    -----------------------
> +    |         arch |status|
> +    -----------------------
> +    |       alpha: | TODO |
> +    |         arc: | TODO |
> +    |         arm: | TODO |
> +    |       arm64: |  ok  |
> +    |         c6x: | TODO |
> +    |        csky: | TODO |
> +    |       h8300: | TODO |
> +    |     hexagon: | TODO |
> +    |        ia64: | TODO |
> +    |        m68k: | TODO |
> +    |  microblaze: | TODO |
> +    |        mips: | TODO |
> +    |       nds32: | TODO |
> +    |       nios2: | TODO |
> +    |    openrisc: | TODO |
> +    |      parisc: | TODO |
> +    |     powerpc: | TODO |

Say ok on ppc32

> +    |       riscv: | TODO |
> +    |        s390: | TODO |
> +    |          sh: | TODO |
> +    |       sparc: | TODO |
> +    |          um: | TODO |
> +    |   unicore32: | TODO |
> +    |         x86: |  ok  |
> +    |      xtensa: | TODO |
> +    -----------------------
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 1b6ea5a..ea62c87 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -11,6 +11,7 @@ config ARM64
>   	select ACPI_PPTT if ACPI
>   	select ARCH_CLOCKSOURCE_DATA
>   	select ARCH_HAS_DEBUG_VIRTUAL
> +	select ARCH_HAS_DEBUG_VM_PGTABLE
>   	select ARCH_HAS_DEVMEM_IS_ALLOWED
>   	select ARCH_HAS_DMA_COHERENT_TO_PFN
>   	select ARCH_HAS_DMA_PREP_COHERENT
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index abe822d..13c9bd9 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -61,6 +61,7 @@ config X86
>   	select ARCH_CLOCKSOURCE_INIT
>   	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
>   	select ARCH_HAS_DEBUG_VIRTUAL
> +	select ARCH_HAS_DEBUG_VM_PGTABLE
>   	select ARCH_HAS_DEVMEM_IS_ALLOWED
>   	select ARCH_HAS_ELF_RANDOMIZE
>   	select ARCH_HAS_FAST_MULTIPLIER

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 3e56c9c2f16e..c50d7cfa566b 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -120,6 +120,7 @@ config PPC
  	#
  	select ARCH_32BIT_OFF_T if PPC32
  	select ARCH_HAS_DEBUG_VIRTUAL
+	select ARCH_HAS_DEBUG_VM_PGTABLE if PPC32
  	select ARCH_HAS_DEVMEM_IS_ALLOWED
  	select ARCH_HAS_ELF_RANDOMIZE
  	select ARCH_HAS_FORTIFY_SOURCE


> diff --git a/arch/x86/include/asm/pgtable_64.h b/arch/x86/include/asm/pgtable_64.h
> index 0b6c4042..fb0e76d 100644
> --- a/arch/x86/include/asm/pgtable_64.h
> +++ b/arch/x86/include/asm/pgtable_64.h
> @@ -53,6 +53,12 @@ static inline void sync_initial_page_table(void) { }
>   
>   struct mm_struct;
>   
> +#define mm_p4d_folded mm_p4d_folded
> +static inline bool mm_p4d_folded(struct mm_struct *mm)
> +{
> +	return !pgtable_l5_enabled();
> +}
> +
>   void set_pte_vaddr_p4d(p4d_t *p4d_page, unsigned long vaddr, pte_t new_pte);
>   void set_pte_vaddr_pud(pud_t *pud_page, unsigned long vaddr, pte_t new_pte);
>   
> diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgtable.h
> index 9cdcbc7..9eb02e1 100644
> --- a/include/asm-generic/pgtable.h
> +++ b/include/asm-generic/pgtable.h
> @@ -1168,6 +1168,12 @@ static inline bool arch_has_pfn_modify_check(void)
>   # define PAGE_KERNEL_EXEC PAGE_KERNEL
>   #endif
>   
> +#ifdef CONFIG_DEBUG_VM_PGTABLE
> +extern void debug_vm_pgtable(void);
> +#else
> +static inline void debug_vm_pgtable(void) { }
> +#endif
> +
>   #endif /* !__ASSEMBLY__ */
>   
>   #ifndef io_remap_pfn_range
> diff --git a/init/main.c b/init/main.c
> index 91f6ebb..af8379e 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1185,6 +1185,7 @@ static noinline void __init kernel_init_freeable(void)
>   	sched_init_smp();
>   
>   	page_alloc_init_late();
> +	debug_vm_pgtable();
>   	/* Initialize page ext after all struct pages are initialized. */
>   	page_ext_init();
>   
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 9c60d7d..cf48d95 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -690,6 +690,27 @@ config DEBUG_VM_PGFLAGS
>   
>   	  If unsure, say N.
>   
> +config ARCH_HAS_DEBUG_VM_PGTABLE
> +	bool
> +	help
> +	  An architecture should select this when it can successfully
> +	  build and run DEBUG_VM_PGTABLE.
> +
> +config DEBUG_VM_PGTABLE
> +	bool "Debug arch page table for semantics compliance"
> +	depends on MMU
> +	depends on DEBUG_VM
> +	depends on ARCH_HAS_DEBUG_VM_PGTABLE
> +	help
> +	  This option provides a debug method which can be used to test
> +	  architecture page table helper functions on various platforms in
> +	  verifying if they comply with expected generic MM semantics. This
> +	  will help architecture code in making sure that any changes or
> +	  new additions of these helpers still conform to expected
> +	  semantics of the generic MM.
> +
> +	  If unsure, say N.
> +

Would be nice to have that one also indented like the other 
DEBUG_VM_XXXXX (see below).

Stack utilization instrumentation (DEBUG_STACK_USAGE) [N/y/?] n
Debug VM (DEBUG_VM) [N/y/?] (NEW) y
   Debug VMA caching (DEBUG_VM_VMACACHE) [N/y/?] (NEW)
   Debug VM red-black trees (DEBUG_VM_RB) [N/y/?] (NEW)
   Debug page-flags operations (DEBUG_VM_PGFLAGS) [N/y/?] (NEW)
Debug arch page table for semantics compliance (DEBUG_VM_PGTABLE) 
[N/y/?] (NEW)
Debug VM translations (DEBUG_VIRTUAL) [N/y/?] n


For that, just move config ARCH_HAS_DEBUG_VM_PGTABLE somewhere else, 
maybe before DEBUG_VM or just after DEBUG_VM_PGTABLE


>   config ARCH_HAS_DEBUG_VIRTUAL
>   	bool
>   
> diff --git a/mm/Makefile b/mm/Makefile
> index d996846..2f085b9 100644
> --- a/mm/Makefile
> +++ b/mm/Makefile
> @@ -86,6 +86,7 @@ obj-$(CONFIG_HWPOISON_INJECT) += hwpoison-inject.o
>   obj-$(CONFIG_DEBUG_KMEMLEAK) += kmemleak.o
>   obj-$(CONFIG_DEBUG_KMEMLEAK_TEST) += kmemleak-test.o
>   obj-$(CONFIG_DEBUG_RODATA_TEST) += rodata_test.o
> +obj-$(CONFIG_DEBUG_VM_PGTABLE) += debug_vm_pgtable.o
>   obj-$(CONFIG_PAGE_OWNER) += page_owner.o
>   obj-$(CONFIG_CLEANCACHE) += cleancache.o
>   obj-$(CONFIG_MEMORY_ISOLATION) += page_isolation.o
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> new file mode 100644
> index 0000000..9472566
> --- /dev/null
> +++ b/mm/debug_vm_pgtable.c
> @@ -0,0 +1,388 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * This kernel test validates architecture page table helpers and
> + * accessors and helps in verifying their continued compliance with
> + * expected generic MM semantics.
> + *
> + * Copyright (C) 2019 ARM Ltd.
> + *
> + * Author: Anshuman Khandual <anshuman.khandual@arm.com>
> + */
> +#define pr_fmt(fmt) "arch_pgtable_test: %s " fmt, __func__
> +
> +#include <linux/gfp.h>
> +#include <linux/highmem.h>
> +#include <linux/hugetlb.h>
> +#include <linux/kernel.h>
> +#include <linux/kconfig.h>
> +#include <linux/mm.h>
> +#include <linux/mman.h>
> +#include <linux/mm_types.h>
> +#include <linux/module.h>
> +#include <linux/pfn_t.h>
> +#include <linux/printk.h>
> +#include <linux/random.h>
> +#include <linux/spinlock.h>
> +#include <linux/swap.h>
> +#include <linux/swapops.h>
> +#include <linux/start_kernel.h>
> +#include <linux/sched/mm.h>
> +#include <asm/pgalloc.h>
> +#include <asm/pgtable.h>
> +
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
> +}
> +
> +#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE
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
> +#else
> +static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot) { }
> +#endif
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
> +
> +static void __init p4d_populate_tests(struct mm_struct *mm, p4d_t *p4dp,
> +				      pud_t *pudp)
> +{
> +	p4d_t p4d;
> +
> +	if (mm_pud_folded(mm))
> +		return;
> +
> +	/*
> +	 * This entry points to next level page table page.
> +	 * Hence this must not qualify as p4d_bad().
> +	 */
> +	pud_clear(pudp);
> +	p4d_clear(p4dp);
> +	p4d_populate(mm, p4dp, pudp);
> +	p4d = READ_ONCE(*p4dp);
> +	WARN_ON(p4d_bad(p4d));
> +}
> +
> +static void __init pgd_clear_tests(struct mm_struct *mm, pgd_t *pgdp)
> +{
> +	pgd_t pgd = READ_ONCE(*pgdp);
> +
> +	if (mm_p4d_folded(mm))
> +		return;
> +
> +	pgd = __pgd(pgd_val(pgd) | RANDOM_ORVALUE);
> +	WRITE_ONCE(*pgdp, pgd);
> +	pgd_clear(pgdp);
> +	pgd = READ_ONCE(*pgdp);
> +	WARN_ON(!pgd_none(pgd));
> +}
> +
> +static void __init pgd_populate_tests(struct mm_struct *mm, pgd_t *pgdp,
> +				      p4d_t *p4dp)
> +{
> +	pgd_t pgd;
> +
> +	if (mm_p4d_folded(mm))
> +		return;
> +
> +	/*
> +	 * This entry points to next level page table page.
> +	 * Hence this must not qualify as pgd_bad().
> +	 */
> +	p4d_clear(p4dp);
> +	pgd_clear(pgdp);
> +	pgd_populate(mm, pgdp, p4dp);
> +	pgd = READ_ONCE(*pgdp);
> +	WARN_ON(pgd_bad(pgd));
> +}
> +#else
> +static void __init p4d_clear_tests(struct mm_struct *mm, p4d_t *p4dp) { }
> +static void __init pgd_clear_tests(struct mm_struct *mm, pgd_t *pgdp) { }
> +static void __init p4d_populate_tests(struct mm_struct *mm, p4d_t *p4dp,
> +				      pud_t *pudp)
> +{
> +}
> +static void __init pgd_populate_tests(struct mm_struct *mm, pgd_t *pgdp,
> +				      p4d_t *p4dp)
> +{
> +}
> +#endif
> +
> +static void __init pte_clear_tests(struct mm_struct *mm, pte_t *ptep)
> +{
> +	pte_t pte = READ_ONCE(*ptep);
> +
> +	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
> +	WRITE_ONCE(*ptep, pte);
> +	pte_clear(mm, 0, ptep);
> +	pte = READ_ONCE(*ptep);
> +	WARN_ON(!pte_none(pte));
> +}
> +
> +static void __init pmd_clear_tests(struct mm_struct *mm, pmd_t *pmdp)
> +{
> +	pmd_t pmd = READ_ONCE(*pmdp);
> +
> +	pmd = __pmd(pmd_val(pmd) | RANDOM_ORVALUE);
> +	WRITE_ONCE(*pmdp, pmd);
> +	pmd_clear(pmdp);
> +	pmd = READ_ONCE(*pmdp);
> +	WARN_ON(!pmd_none(pmd));
> +}
> +
> +static void __init pmd_populate_tests(struct mm_struct *mm, pmd_t *pmdp,
> +				      pgtable_t pgtable)
> +{
> +	pmd_t pmd;
> +
> +	/*
> +	 * This entry points to next level page table page.
> +	 * Hence this must not qualify as pmd_bad().
> +	 */
> +	pmd_clear(pmdp);
> +	pmd_populate(mm, pmdp, pgtable);
> +	pmd = READ_ONCE(*pmdp);
> +	WARN_ON(pmd_bad(pmd));
> +}
> +
> +static unsigned long __init get_random_vaddr(void)
> +{
> +	unsigned long random_vaddr, random_pages, total_user_pages;
> +
> +	total_user_pages = (TASK_SIZE - FIRST_USER_ADDRESS) / PAGE_SIZE;
> +
> +	random_pages = get_random_long() % total_user_pages;
> +	random_vaddr = FIRST_USER_ADDRESS + random_pages * PAGE_SIZE;
> +
> +	WARN_ON((random_vaddr > TASK_SIZE) ||
> +		(random_vaddr < FIRST_USER_ADDRESS));
> +	return random_vaddr;
> +}
> +
> +void __init debug_vm_pgtable(void)
> +{
> +	struct mm_struct *mm;
> +	pgd_t *pgdp;
> +	p4d_t *p4dp, *saved_p4dp;
> +	pud_t *pudp, *saved_pudp;
> +	pmd_t *pmdp, *saved_pmdp, pmd;
> +	pte_t *ptep;
> +	pgtable_t saved_ptep;
> +	pgprot_t prot;
> +	phys_addr_t paddr;
> +	unsigned long vaddr, pte_aligned, pmd_aligned;
> +	unsigned long pud_aligned, p4d_aligned, pgd_aligned;

I think an information message would be nice:

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 9472566b7e53..ed7cc3dfc968 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -313,6 +313,8 @@ void __init debug_vm_pgtable(void)
  	unsigned long vaddr, pte_aligned, pmd_aligned;
  	unsigned long pud_aligned, p4d_aligned, pgd_aligned;

+	pr_info("Validating architecture page table helpers\n");
+
  	prot = vm_get_page_prot(VMFLAGS);
  	vaddr = get_random_vaddr();
  	mm = mm_alloc();

Christophe

> +
> +	prot = vm_get_page_prot(VMFLAGS);
> +	vaddr = get_random_vaddr();
> +	mm = mm_alloc();
> +	if (!mm) {
> +		pr_err("mm_struct allocation failed\n");
> +		return;
> +	}
> +
> +	/*
> +	 * PFN for mapping at PTE level is determined from a standard kernel
> +	 * text symbol. But pfns for higher page table levels are derived by
> +	 * masking lower bits of this real pfn. These derived pfns might not
> +	 * exist on the platform but that does not really matter as pfn_pxx()
> +	 * helpers will still create appropriate entries for the test. This
> +	 * helps avoid large memory block allocations to be used for mapping
> +	 * at higher page table levels.
> +	 */
> +	WARN_ON(!virt_addr_valid(&start_kernel));
> +	paddr = __pa(&start_kernel);
> +
> +	pte_aligned = (paddr & PAGE_MASK) >> PAGE_SHIFT;
> +	pmd_aligned = (paddr & PMD_MASK) >> PAGE_SHIFT;
> +	pud_aligned = (paddr & PUD_MASK) >> PAGE_SHIFT;
> +	p4d_aligned = (paddr & P4D_MASK) >> PAGE_SHIFT;
> +	pgd_aligned = (paddr & PGDIR_MASK) >> PAGE_SHIFT;
> +
> +	pgdp = pgd_offset(mm, vaddr);
> +	p4dp = p4d_alloc(mm, pgdp, vaddr);
> +	pudp = pud_alloc(mm, p4dp, vaddr);
> +	pmdp = pmd_alloc(mm, pudp, vaddr);
> +	ptep = pte_alloc_map(mm, pmdp, vaddr);
> +
> +	/*
> +	 * Save all the page table page addresses as the page table
> +	 * entries will be used for testing with random or garbage
> +	 * values. These saved addresses will be used for freeing
> +	 * page table pages.
> +	 */
> +	pmd = READ_ONCE(*pmdp);
> +	saved_p4dp = p4d_offset(pgdp, 0UL);
> +	saved_pudp = pud_offset(p4dp, 0UL);
> +	saved_pmdp = pmd_offset(pudp, 0UL);
> +	saved_ptep = pmd_pgtable(pmd);
> +
> +	pte_basic_tests(pte_aligned, prot);
> +	pmd_basic_tests(pmd_aligned, prot);
> +	pud_basic_tests(pud_aligned, prot);
> +	p4d_basic_tests(p4d_aligned, prot);
> +	pgd_basic_tests(pgd_aligned, prot);
> +
> +	pte_clear_tests(mm, ptep);
> +	pmd_clear_tests(mm, pmdp);
> +	pud_clear_tests(mm, pudp);
> +	p4d_clear_tests(mm, p4dp);
> +	pgd_clear_tests(mm, pgdp);
> +
> +	pte_unmap(ptep);
> +
> +	pmd_populate_tests(mm, pmdp, saved_ptep);
> +	pud_populate_tests(mm, pudp, saved_pmdp);
> +	p4d_populate_tests(mm, p4dp, saved_pudp);
> +	pgd_populate_tests(mm, pgdp, saved_p4dp);
> +
> +	p4d_free(mm, saved_p4dp);
> +	pud_free(mm, saved_pudp);
> +	pmd_free(mm, saved_pmdp);
> +	pte_free(mm, saved_ptep);
> +
> +	mm_dec_nr_puds(mm);
> +	mm_dec_nr_pmds(mm);
> +	mm_dec_nr_ptes(mm);
> +	__mmdrop(mm);
> +}
> 
