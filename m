Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E1614BE52
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 18:07:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486Y2n5DxLzDqLR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 04:07:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=NyfqsIb0; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486Y0W5d5LzDqKf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 04:05:45 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 486Y0M18SRz9tyrg;
 Tue, 28 Jan 2020 18:05:39 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=NyfqsIb0; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id BxhrHtxf1fJY; Tue, 28 Jan 2020 18:05:39 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 486Y0L6ltRz9tyrf;
 Tue, 28 Jan 2020 18:05:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580231138; bh=ihfPCvoS5mhssdU/CWQGRQyoTkFqbnCSL7XYZpDWBBI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NyfqsIb0WYfGkwwRXCi4mviBXVht5035XRkQEUMkYVrK+kvXsqyC01Ge/84pDXico
 JiX6P4e/rd1XwHKFdfUYAulUl8Bab7lOcDCfWoS6b7lkyqkPzcXggxczTjMouWp1w8
 BakNDUS9X1lr5teDKcou4UiSzbqUTfYKRsLhysmw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 775F08B7E7;
 Tue, 28 Jan 2020 18:05:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 34jfQVcpYhXe; Tue, 28 Jan 2020 18:05:40 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AE28C8B7E6;
 Tue, 28 Jan 2020 18:05:37 +0100 (CET)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <68ed6488-aa25-ab41-8da6-f0ddeb15d52b@c-s.fr>
Date: Tue, 28 Jan 2020 18:05:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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



Le 28/01/2020 à 02:27, Anshuman Khandual a écrit :
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

[...]

> 
> Tested-by: Christophe Leroy <christophe.leroy@c-s.fr>		#PPC32

Also tested on PPC64 (under QEMU): book3s/64 64k pages, book3s/64 4k 
pages and book3e/64

> Reviewed-by: Ingo Molnar <mingo@kernel.org>
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---

[...]

> 
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
> +    |  powerpc/32: |  ok  |
> +    |  powerpc/64: | TODO |

You can change the two above lines by

	powerpc: ok

> +    |       riscv: | TODO |
> +    |        s390: | TODO |
> +    |          sh: | TODO |
> +    |       sparc: | TODO |
> +    |          um: | TODO |
> +    |   unicore32: | TODO |
> +    |         x86: |  ok  |
> +    |      xtensa: | TODO |
> +    -----------------------

> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 1ec34e16ed65..253dcab0bebc 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -120,6 +120,7 @@ config PPC
>   	#
>   	select ARCH_32BIT_OFF_T if PPC32
>   	select ARCH_HAS_DEBUG_VIRTUAL
> +	select ARCH_HAS_DEBUG_VM_PGTABLE if PPC32

Remove the 'if PPC32' as we now know it also work on PPC64.

>   	select ARCH_HAS_DEVMEM_IS_ALLOWED
>   	select ARCH_HAS_ELF_RANDOMIZE
>   	select ARCH_HAS_FORTIFY_SOURCE

> diff --git a/arch/x86/include/asm/pgtable_64.h b/arch/x86/include/asm/pgtable_64.h
> index 0b6c4042942a..fb0e76d254b3 100644
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

For me this should be part of another patch, it is not directly linked 
to the tests.

>   void set_pte_vaddr_p4d(p4d_t *p4d_page, unsigned long vaddr, pte_t new_pte);
>   void set_pte_vaddr_pud(pud_t *pud_page, unsigned long vaddr, pte_t new_pte);
>   
> diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgtable.h
> index 798ea36a0549..e0b04787e789 100644
> --- a/include/asm-generic/pgtable.h
> +++ b/include/asm-generic/pgtable.h
> @@ -1208,6 +1208,12 @@ static inline bool arch_has_pfn_modify_check(void)
>   # define PAGE_KERNEL_EXEC PAGE_KERNEL
>   #endif
>   
> +#ifdef CONFIG_DEBUG_VM_PGTABLE

Not sure it is a good idea to put that in include/asm-generic/pgtable.h

By doing this you are forcing a rebuild of almost all files, whereas 
only init/main.o and mm/debug_vm_pgtable.o should be rebuilt when 
activating this config option.

> +extern void debug_vm_pgtable(void);

Please don't use the 'extern' keyword, it is useless and not to be used 
for functions declaration.

> +#else
> +static inline void debug_vm_pgtable(void) { }
> +#endif
> +
>   #endif /* !__ASSEMBLY__ */
>   
>   #ifndef io_remap_pfn_range
> diff --git a/init/main.c b/init/main.c
> index da1bc0b60a7d..5e59e6ac0780 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1197,6 +1197,7 @@ static noinline void __init kernel_init_freeable(void)
>   	sched_init_smp();
>   
>   	page_alloc_init_late();
> +	debug_vm_pgtable();

Wouldn't it be better to call debug_vm_pgtable() in kernel_init() 
between the call to async_synchronise_full() and ftrace_free_init_mem() ?

>   	/* Initialize page ext after all struct pages are initialized. */
>   	page_ext_init();
>   
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 5ffe144c9794..7cceae923c05 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -653,6 +653,12 @@ config SCHED_STACK_END_CHECK
>   	  data corruption or a sporadic crash at a later stage once the region
>   	  is examined. The runtime overhead introduced is minimal.
>   
> +config ARCH_HAS_DEBUG_VM_PGTABLE
> +	bool
> +	help
> +	  An architecture should select this when it can successfully
> +	  build and run DEBUG_VM_PGTABLE.
> +
>   config DEBUG_VM
>   	bool "Debug VM"
>   	depends on DEBUG_KERNEL
> @@ -688,6 +694,22 @@ config DEBUG_VM_PGFLAGS
>   
>   	  If unsure, say N.
>   
> +config DEBUG_VM_PGTABLE
> +	bool "Debug arch page table for semantics compliance"
> +	depends on MMU
> +	depends on DEBUG_VM

Does it really need to depend on DEBUG_VM ?
I think we could make it standalone and 'default y if DEBUG_VM' instead.

> +	depends on ARCH_HAS_DEBUG_VM_PGTABLE
> +	default y
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

Does it make sense to make it 'default y' and say 'If unsure, say N' ?

>   config ARCH_HAS_DEBUG_VIRTUAL
>   	bool
>   

Christophe
