Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8622B2F84
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Nov 2020 19:17:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CYNpq1D1zzDqS4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Nov 2020 05:17:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=agner.ch (client-ip=2a02:418:6a02::a2; helo=mail.kmu-office.ch;
 envelope-from=stefan@agner.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=agner.ch header.i=@agner.ch header.a=rsa-sha256
 header.s=dkim header.b=n2TeB026; dkim-atps=neutral
X-Greylist: delayed 489 seconds by postgrey-1.36 at bilbo;
 Sun, 15 Nov 2020 05:15:58 AEDT
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CYNnB1pchzDqR3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Nov 2020 05:15:58 +1100 (AEDT)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 5551A5C2E37;
 Sat, 14 Nov 2020 19:07:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1605377261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sb3trAdNHnBEBlNbdcbEeB4VP1eESqXIt0QS/y9AvzQ=;
 b=n2TeB026DClBYkuw3PuXKVXncRiz0K2uAG1nK+Y54G/XWQIAWo5aH7mZnLPtcEoUw8hDIM
 YBN393BgnUAvXHBK5+9lgv6nDUftoEyn9/a1OMOZDAIFynhVgzsjcfzCV3oP/KjzAe6dEe
 nQYgjzGd4nLiqvVszABF3z1c3K4Q5Ns=
MIME-Version: 1.0
Date: Sat, 14 Nov 2020 19:07:40 +0100
From: Stefan Agner <stefan@agner.ch>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] arch: pgtable: define MAX_POSSIBLE_PHYSMEM_BITS where
 needed
In-Reply-To: <20201113145932.10994-1-arnd@kernel.org>
References: <20201113145932.10994-1-arnd@kernel.org>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <e28bb3cc9ca6f1a07f382e30d8fca43e@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-arch@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Arnd Bergmann <arnd@arndb.de>, Minchan Kim <minchan@kernel.org>,
 Vineet Gupta <vgupta@synopsys.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Mackerras <paulus@samba.org>, Nitin Gupta <ngupta@vflare.org>,
 Mike Rapoport <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-11-13 15:59, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Stefan Agner reported a bug when using zsram on 32-bit Arm machines
> with RAM above the 4GB address boundary:
> 
>   Unable to handle kernel NULL pointer dereference at virtual address 00000000
>   pgd = a27bd01c
>   [00000000] *pgd=236a0003, *pmd=1ffa64003
>   Internal error: Oops: 207 [#1] SMP ARM
>   Modules linked in: mdio_bcm_unimac(+) brcmfmac cfg80211 brcmutil
> raspberrypi_hwmon hci_uart crc32_arm_ce bcm2711_thermal phy_generic
> genet
>   CPU: 0 PID: 123 Comm: mkfs.ext4 Not tainted 5.9.6 #1
>   Hardware name: BCM2711
>   PC is at zs_map_object+0x94/0x338
>   LR is at zram_bvec_rw.constprop.0+0x330/0xa64
>   pc : [<c0602b38>]    lr : [<c0bda6a0>]    psr: 60000013
>   sp : e376bbe0  ip : 00000000  fp : c1e2921c
>   r10: 00000002  r9 : c1dda730  r8 : 00000000
>   r7 : e8ff7a00  r6 : 00000000  r5 : 02f9ffa0  r4 : e3710000
>   r3 : 000fdffe  r2 : c1e0ce80  r1 : ebf979a0  r0 : 00000000
>   Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
>   Control: 30c5383d  Table: 235c2a80  DAC: fffffffd
>   Process mkfs.ext4 (pid: 123, stack limit = 0x495a22e6)
>   Stack: (0xe376bbe0 to 0xe376c000)
> 
> As it turns out, zsram needs to know the maximum memory size, which
> is defined in MAX_PHYSMEM_BITS when CONFIG_SPARSEMEM is set, or in
> MAX_POSSIBLE_PHYSMEM_BITS on the x86 architecture.
> 
> The same problem will be hit on all 32-bit architectures that have a
> physical address space larger than 4GB and happen to not enable sparsemem
> and include asm/sparsemem.h from asm/pgtable.h.
> 
> After the initial discussion, I suggested just always defining
> MAX_POSSIBLE_PHYSMEM_BITS whenever CONFIG_PHYS_ADDR_T_64BIT is
> set, or provoking a build error otherwise. This addresses all
> configurations that can currently have this runtime bug, but
> leaves all other configurations unchanged.
> 
> I looked up the possible number of bits in source code and
> datasheets, here is what I found:
> 
>  - on ARC, CONFIG_ARC_HAS_PAE40 controls whether 32 or 40 bits are used
>  - on ARM, CONFIG_LPAE enables 40 bit addressing, without it we never
>    support more than 32 bits, even though supersections in theory allow
>    up to 40 bits as well.
>  - on MIPS, some MIPS32r1 or later chips support 36 bits, and MIPS32r5
>    XPA supports up to 60 bits in theory, but 40 bits are more than
>    anyone will ever ship
>  - On PowerPC, there are three different implementations of 36 bit
>    addressing, but 32-bit is used without CONFIG_PTE_64BIT
>  - On RISC-V, the normal page table format can support 34 bit
>    addressing. There is no highmem support on RISC-V, so anything
>    above 2GB is unused, but it might be useful to eventually support
>    CONFIG_ZRAM for high pages.
> 
> Fixes: 61989a80fb3a ("staging: zsmalloc: zsmalloc memory allocation library")
> Fixes: 02390b87a945 ("mm/zsmalloc: Prepare to variable MAX_PHYSMEM_BITS")
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Cc: Nitin Gupta <ngupta@vflare.org>
> Cc: Minchan Kim <minchan@kernel.org>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: linux-snps-arc@lists.infradead.org
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Link:
> https://lore.kernel.org/linux-mm/bdfa44bf1c570b05d6c70898e2bbb0acf234ecdf.1604762181.git.stefan@agner.ch/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> If everyone is happy with this version, I would suggest merging this as
> a bugfix through my asm-generic tree for linux-5.10. I originally
> said I'd send individual patches for each architecture tree, but
> I now think this is easier and better documents what is going on.
> ---
>  arch/arc/include/asm/pgtable.h               |  2 ++
>  arch/arm/include/asm/pgtable-2level.h        |  2 ++
>  arch/arm/include/asm/pgtable-3level.h        |  2 ++

Tested, it fixed the issue on my test system, thanks!

For ARM:

Reviewed-by: Stefan Agner <stefan@agner.ch>
Tested-by: Stefan Agner <stefan@agner.ch>

--
Stefan

>  arch/mips/include/asm/pgtable-32.h           |  3 +++
>  arch/powerpc/include/asm/book3s/32/pgtable.h |  2 ++
>  arch/powerpc/include/asm/nohash/32/pgtable.h |  2 ++
>  arch/riscv/include/asm/pgtable-32.h          |  2 ++
>  include/linux/pgtable.h                      | 13 +++++++++++++
>  8 files changed, 28 insertions(+)
> 
> diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
> index f1ed17edb085..163641726a2b 100644
> --- a/arch/arc/include/asm/pgtable.h
> +++ b/arch/arc/include/asm/pgtable.h
> @@ -134,8 +134,10 @@
>  
>  #ifdef CONFIG_ARC_HAS_PAE40
>  #define PTE_BITS_NON_RWX_IN_PD1	(0xff00000000 | PAGE_MASK | _PAGE_CACHEABLE)
> +#define MAX_POSSIBLE_PHYSMEM_BITS 40
>  #else
>  #define PTE_BITS_NON_RWX_IN_PD1	(PAGE_MASK | _PAGE_CACHEABLE)
> +#define MAX_POSSIBLE_PHYSMEM_BITS 32
>  #endif
>  
>  /**************************************************************************
> diff --git a/arch/arm/include/asm/pgtable-2level.h
> b/arch/arm/include/asm/pgtable-2level.h
> index 3502c2f746ca..baf7d0204eb5 100644
> --- a/arch/arm/include/asm/pgtable-2level.h
> +++ b/arch/arm/include/asm/pgtable-2level.h
> @@ -75,6 +75,8 @@
>  #define PTE_HWTABLE_OFF		(PTE_HWTABLE_PTRS * sizeof(pte_t))
>  #define PTE_HWTABLE_SIZE	(PTRS_PER_PTE * sizeof(u32))
>  
> +#define MAX_POSSIBLE_PHYSMEM_BITS	32
> +
>  /*
>   * PMD_SHIFT determines the size of the area a second-level page table can map
>   * PGDIR_SHIFT determines what a third-level page table entry can map
> diff --git a/arch/arm/include/asm/pgtable-3level.h
> b/arch/arm/include/asm/pgtable-3level.h
> index fbb6693c3352..2b85d175e999 100644
> --- a/arch/arm/include/asm/pgtable-3level.h
> +++ b/arch/arm/include/asm/pgtable-3level.h
> @@ -25,6 +25,8 @@
>  #define PTE_HWTABLE_OFF		(0)
>  #define PTE_HWTABLE_SIZE	(PTRS_PER_PTE * sizeof(u64))
>  
> +#define MAX_POSSIBLE_PHYSMEM_BITS 40
> +
>  /*
>   * PGDIR_SHIFT determines the size a top-level page table entry can map.
>   */
> diff --git a/arch/mips/include/asm/pgtable-32.h
> b/arch/mips/include/asm/pgtable-32.h
> index a950fc1ddb4d..6c0532d7b211 100644
> --- a/arch/mips/include/asm/pgtable-32.h
> +++ b/arch/mips/include/asm/pgtable-32.h
> @@ -154,6 +154,7 @@ static inline void pmd_clear(pmd_t *pmdp)
>  
>  #if defined(CONFIG_XPA)
>  
> +#define MAX_POSSIBLE_PHYSMEM_BITS 40
>  #define pte_pfn(x)		(((unsigned long)((x).pte_high >> _PFN_SHIFT)) |
> (unsigned long)((x).pte_low << _PAGE_PRESENT_SHIFT))
>  static inline pte_t
>  pfn_pte(unsigned long pfn, pgprot_t prot)
> @@ -169,6 +170,7 @@ pfn_pte(unsigned long pfn, pgprot_t prot)
>  
>  #elif defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32)
>  
> +#define MAX_POSSIBLE_PHYSMEM_BITS 36
>  #define pte_pfn(x)		((unsigned long)((x).pte_high >> 6))
>  
>  static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
> @@ -183,6 +185,7 @@ static inline pte_t pfn_pte(unsigned long pfn,
> pgprot_t prot)
>  
>  #else
>  
> +#define MAX_POSSIBLE_PHYSMEM_BITS 32
>  #ifdef CONFIG_CPU_VR41XX
>  #define pte_pfn(x)		((unsigned long)((x).pte >> (PAGE_SHIFT + 2)))
>  #define pfn_pte(pfn, prot)	__pte(((pfn) << (PAGE_SHIFT + 2)) |
> pgprot_val(prot))
> diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h
> b/arch/powerpc/include/asm/book3s/32/pgtable.h
> index 36443cda8dcf..1376be95e975 100644
> --- a/arch/powerpc/include/asm/book3s/32/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
> @@ -36,8 +36,10 @@ static inline bool pte_user(pte_t pte)
>   */
>  #ifdef CONFIG_PTE_64BIT
>  #define PTE_RPN_MASK	(~((1ULL << PTE_RPN_SHIFT) - 1))
> +#define MAX_POSSIBLE_PHYSMEM_BITS 36
>  #else
>  #define PTE_RPN_MASK	(~((1UL << PTE_RPN_SHIFT) - 1))
> +#define MAX_POSSIBLE_PHYSMEM_BITS 32
>  #endif
>  
>  /*
> diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h
> b/arch/powerpc/include/asm/nohash/32/pgtable.h
> index ee2243ba96cf..96522f7f0618 100644
> --- a/arch/powerpc/include/asm/nohash/32/pgtable.h
> +++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
> @@ -153,8 +153,10 @@ int map_kernel_page(unsigned long va, phys_addr_t
> pa, pgprot_t prot);
>   */
>  #if defined(CONFIG_PPC32) && defined(CONFIG_PTE_64BIT)
>  #define PTE_RPN_MASK	(~((1ULL << PTE_RPN_SHIFT) - 1))
> +#define MAX_POSSIBLE_PHYSMEM_BITS 36
>  #else
>  #define PTE_RPN_MASK	(~((1UL << PTE_RPN_SHIFT) - 1))
> +#define MAX_POSSIBLE_PHYSMEM_BITS 32
>  #endif
>  
>  /*
> diff --git a/arch/riscv/include/asm/pgtable-32.h
> b/arch/riscv/include/asm/pgtable-32.h
> index b0ab66e5fdb1..5b2e79e5bfa5 100644
> --- a/arch/riscv/include/asm/pgtable-32.h
> +++ b/arch/riscv/include/asm/pgtable-32.h
> @@ -14,4 +14,6 @@
>  #define PGDIR_SIZE      (_AC(1, UL) << PGDIR_SHIFT)
>  #define PGDIR_MASK      (~(PGDIR_SIZE - 1))
>  
> +#define MAX_POSSIBLE_PHYSMEM_BITS 34
> +
>  #endif /* _ASM_RISCV_PGTABLE_32_H */
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 71125a4676c4..e237004d498d 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1427,6 +1427,19 @@ typedef unsigned int pgtbl_mod_mask;
>  
>  #endif /* !__ASSEMBLY__ */
>  
> +#if !defined(MAX_POSSIBLE_PHYSMEM_BITS) && !defined(CONFIG_64BIT)
> +#ifdef CONFIG_PHYS_ADDR_T_64BIT
> +/*
> + * ZSMALLOC needs to know the highest PFN on 32-bit architectures
> + * with physical address space extension, but falls back to
> + * BITS_PER_LONG otherwise.
> + */
> +#error Missing MAX_POSSIBLE_PHYSMEM_BITS definition
> +#else
> +#define MAX_POSSIBLE_PHYSMEM_BITS 32
> +#endif
> +#endif
> +
>  #ifndef has_transparent_hugepage
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  #define has_transparent_hugepage() 1
