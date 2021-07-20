Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C00F3CFCE7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 17:04:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GThnR3K6Vz3bkG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 01:04:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GThn15xvvz2yNK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 01:03:47 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GThms4brpzB9SY;
 Tue, 20 Jul 2021 17:03:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xY-Ufv6zed-4; Tue, 20 Jul 2021 17:03:41 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GThms3bRYzB9SV;
 Tue, 20 Jul 2021 17:03:41 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 818D9C01; Tue, 20 Jul 2021 17:08:54 +0200 (CEST)
Received: from 37.170.147.235 ([37.170.147.235]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Tue, 20 Jul 2021 17:08:54 +0200
Date: Tue, 20 Jul 2021 17:08:54 +0200
Message-ID: <20210720170854.Horde.zUpZp_h7ZiNgRJJV7AKL7g1@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 1/2] Revert "powerpc/8xx: add support for huge pages on
 VMAP and VMALLOC"
References: <20210720123512.8740-1-will@kernel.org>
 <20210720123512.8740-2-will@kernel.org>
In-Reply-To: <20210720123512.8740-2-will@kernel.org>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Marek <jonathan@marek.ca>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Will Deacon <will@kernel.org> a =C3=A9crit=C2=A0:

> This reverts commit a6a8f7c4aa7eb50304b5c4e68eccd24313f3a785.
>
> Commit c742199a014d ("mm/pgtable: add stubs for
> {pmd/pub}_{set/clear}_huge") breaks the boot for arm64 when block
> mappings are used to create the linear map, as this relies on a working
> implementation of pXd_set_huge() even if the corresponding page-table
> levels have been folded.
>
> Although the problematic patch reverts cleanly, doing so breaks the
> build for 32-bit PowerPC 8xx machines, which rely on the default
> function definitions when the corresponding page-table levels are
> folded:
>
>  | powerpc64-linux-ld: mm/vmalloc.o: in function `vunmap_pud_range':
>  | linux/mm/vmalloc.c:362: undefined reference to `pud_clear_huge'
>  | powerpc64-linux-ld: mm/vmalloc.o: in function `vunmap_pmd_range':
>  | linux/mm/vmalloc.c:337: undefined reference to `pmd_clear_huge'
>  | powerpc64-linux-ld: mm/vmalloc.o: in function `vunmap_pud_range':
>  | linux/mm/vmalloc.c:362: undefined reference to `pud_clear_huge'
>  | powerpc64-linux-ld: mm/vmalloc.o: in function `vunmap_pmd_range':
>  | linux/mm/vmalloc.c:337: undefined reference to `pmd_clear_huge'
>  | make: *** [Makefile:1177: vmlinux] Error 1
>
> Although Christophe has kindly offered to look into the arm64 breakage,
> he's on holiday for another 10 days and there isn't an obvious fix on
> the arm64 side which allows us to continue using huge-vmap for affected
> configurations.
>
> In the interest of quickly getting things back to a working state as
> they were in 5.13, revert the huge-vmap changes for PowerPC 8xx prior to
> reverting the change which breaks arm64. We can then work on this
> together for 5.15 once Christophe is back.

Instead of reverting this awaited functionnality,  could you please=20=20
just=20add the two following functions in arch/powerpc/mm/nohash/8xx.c :

int pud_clear_huge(pud_t *pud)
{
	return 0;
}

int pmd_clear_huge(pmd_t *pmd)
{
	return 0;
}

Thank you
Christophe

>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Nicholas Piggin <npiggin@gmail.com
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Link:=20=20
>=20https://lore.kernel.org/r/20210719170615.Horde.Qio1wp3k5ebLo-d9xXHdOg1@=
messagerie.c-s.fr
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/powerpc/Kconfig                         |  2 +-
>  arch/powerpc/include/asm/nohash/32/mmu-8xx.h | 43 --------------------
>  2 files changed, 1 insertion(+), 44 deletions(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index d01e3401581d..5fc19ac62cb9 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -189,7 +189,7 @@ config PPC
>  	select GENERIC_VDSO_TIME_NS
>  	select HAVE_ARCH_AUDITSYSCALL
>  	select HAVE_ARCH_HUGE_VMALLOC		if HAVE_ARCH_HUGE_VMAP
> -	select HAVE_ARCH_HUGE_VMAP		if PPC_RADIX_MMU || PPC_8xx
> +	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
>  	select HAVE_ARCH_JUMP_LABEL
>  	select HAVE_ARCH_JUMP_LABEL_RELATIVE
>  	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <=3D 14
> diff --git a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h=20=20
>=20b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
> index 997cec973406..6e4faa0a9b35 100644
> --- a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
> +++ b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
> @@ -178,7 +178,6 @@
>  #ifndef __ASSEMBLY__
>
>  #include <linux/mmdebug.h>
> -#include <linux/sizes.h>
>
>  void mmu_pin_tlb(unsigned long top, bool readonly);
>
> @@ -226,48 +225,6 @@ static inline unsigned int=20=20
>=20mmu_psize_to_shift(unsigned int mmu_psize)
>  	BUG();
>  }
>
> -static inline bool arch_vmap_try_size(unsigned long addr, unsigned=20=20
>=20long end, u64 pfn,
> -				      unsigned int max_page_shift, unsigned long size)
> -{
> -	if (end - addr < size)
> -		return false;
> -
> -	if ((1UL << max_page_shift) < size)
> -		return false;
> -
> -	if (!IS_ALIGNED(addr, size))
> -		return false;
> -
> -	if (!IS_ALIGNED(PFN_PHYS(pfn), size))
> -		return false;
> -
> -	return true;
> -}
> -
> -static inline unsigned long arch_vmap_pte_range_map_size(unsigned=20=20
>=20long addr, unsigned long end,
> -							 u64 pfn, unsigned int max_page_shift)
> -{
> -	if (arch_vmap_try_size(addr, end, pfn, max_page_shift, SZ_512K))
> -		return SZ_512K;
> -	if (PAGE_SIZE =3D=3D SZ_16K)
> -		return SZ_16K;
> -	if (arch_vmap_try_size(addr, end, pfn, max_page_shift, SZ_16K))
> -		return SZ_16K;
> -	return PAGE_SIZE;
> -}
> -#define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
> -
> -static inline int arch_vmap_pte_supported_shift(unsigned long size)
> -{
> -	if (size >=3D SZ_512K)
> -		return 19;
> -	else if (size >=3D SZ_16K)
> -		return 14;
> -	else
> -		return PAGE_SHIFT;
> -}
> -#define arch_vmap_pte_supported_shift arch_vmap_pte_supported_shift
> -
>  /* patch sites */
>  extern s32 patch__itlbmiss_exit_1, patch__dtlbmiss_exit_1;
>  extern s32 patch__itlbmiss_perf, patch__dtlbmiss_perf;
> --
> 2.32.0.402.g57bb445576-goog


