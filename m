Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A5F1D1134
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 13:22:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MXMh4pkBzDqlK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 21:22:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=hmvp=63=linux-m68k.org=gerg@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MXJr35P3zDq77
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 21:20:11 +1000 (AEST)
Received: from [10.44.0.192] (unknown [103.48.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2F70206E5;
 Wed, 13 May 2020 11:19:49 +0000 (UTC)
Subject: Re: [PATCH 06/12] m68k/mm: move {cache,nocahe}_page() definitions
 close to their user
To: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
References: <20200512184422.12418-1-rppt@kernel.org>
 <20200512184422.12418-7-rppt@kernel.org>
From: Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <b59ef7eb-537e-c092-949f-225322f94e2c@linux-m68k.org>
Date: Wed, 13 May 2020 21:19:45 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512184422.12418-7-rppt@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Brian Cain <bcain@codeaurora.org>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-parisc@vger.kernel.org,
 Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mike,

On 13/5/20 4:44 am, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The cache_page() and nocache_page() functions are only used by the morotola
                                                                      ^^^^^^^^
                                                                      motorola

> MMU variant for setting caching attributes for the page table pages.
> 
> Move the definitions of these functions from
> arch/m68k/include/asm/motorola_pgtable.h closer to their usage in
> arch/m68k/mm/motorola.c and drop unused definition in
> arch/m68k/include/asm/mcf_pgtable.h.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Acked-by: Greg Ungerer <gerg@linux-m68k.org>

Regards
Greg


> ---
>   arch/m68k/include/asm/mcf_pgtable.h      | 40 ---------------------
>   arch/m68k/include/asm/motorola_pgtable.h | 44 ------------------------
>   arch/m68k/mm/motorola.c                  | 43 +++++++++++++++++++++++
>   3 files changed, 43 insertions(+), 84 deletions(-)
> 
> diff --git a/arch/m68k/include/asm/mcf_pgtable.h b/arch/m68k/include/asm/mcf_pgtable.h
> index 0031cd387b75..737e826294f3 100644
> --- a/arch/m68k/include/asm/mcf_pgtable.h
> +++ b/arch/m68k/include/asm/mcf_pgtable.h
> @@ -328,46 +328,6 @@ extern pgd_t kernel_pg_dir[PTRS_PER_PGD];
>   #define pte_offset_kernel(dir, address) \
>   	((pte_t *) __pmd_page(*(dir)) + __pte_offset(address))
>   
> -/*
> - * Disable caching for page at given kernel virtual address.
> - */
> -static inline void nocache_page(void *vaddr)
> -{
> -	pgd_t *dir;
> -	p4d_t *p4dp;
> -	pud_t *pudp;
> -	pmd_t *pmdp;
> -	pte_t *ptep;
> -	unsigned long addr = (unsigned long) vaddr;
> -
> -	dir = pgd_offset_k(addr);
> -	p4dp = p4d_offset(dir, addr);
> -	pudp = pud_offset(p4dp, addr);
> -	pmdp = pmd_offset(pudp, addr);
> -	ptep = pte_offset_kernel(pmdp, addr);
> -	*ptep = pte_mknocache(*ptep);
> -}
> -
> -/*
> - * Enable caching for page at given kernel virtual address.
> - */
> -static inline void cache_page(void *vaddr)
> -{
> -	pgd_t *dir;
> -	p4d_t *p4dp;
> -	pud_t *pudp;
> -	pmd_t *pmdp;
> -	pte_t *ptep;
> -	unsigned long addr = (unsigned long) vaddr;
> -
> -	dir = pgd_offset_k(addr);
> -	p4dp = p4d_offset(dir, addr);
> -	pudp = pud_offset(p4dp, addr);
> -	pmdp = pmd_offset(pudp, addr);
> -	ptep = pte_offset_kernel(pmdp, addr);
> -	*ptep = pte_mkcache(*ptep);
> -}
> -
>   /*
>    * Encode and de-code a swap entry (must be !pte_none(e) && !pte_present(e))
>    */
> diff --git a/arch/m68k/include/asm/motorola_pgtable.h b/arch/m68k/include/asm/motorola_pgtable.h
> index 9e5a3de21e15..e1594acf7c7e 100644
> --- a/arch/m68k/include/asm/motorola_pgtable.h
> +++ b/arch/m68k/include/asm/motorola_pgtable.h
> @@ -227,50 +227,6 @@ static inline pte_t *pte_offset_kernel(pmd_t *pmdp, unsigned long address)
>   #define pte_offset_map(pmdp,address) ((pte_t *)__pmd_page(*pmdp) + (((address) >> PAGE_SHIFT) & (PTRS_PER_PTE - 1)))
>   #define pte_unmap(pte)		((void)0)
>   
> -/* Prior to calling these routines, the page should have been flushed
> - * from both the cache and ATC, or the CPU might not notice that the
> - * cache setting for the page has been changed. -jskov
> - */
> -static inline void nocache_page(void *vaddr)
> -{
> -	unsigned long addr = (unsigned long)vaddr;
> -
> -	if (CPU_IS_040_OR_060) {
> -		pgd_t *dir;
> -		p4d_t *p4dp;
> -		pud_t *pudp;
> -		pmd_t *pmdp;
> -		pte_t *ptep;
> -
> -		dir = pgd_offset_k(addr);
> -		p4dp = p4d_offset(dir, addr);
> -		pudp = pud_offset(p4dp, addr);
> -		pmdp = pmd_offset(pudp, addr);
> -		ptep = pte_offset_kernel(pmdp, addr);
> -		*ptep = pte_mknocache(*ptep);
> -	}
> -}
> -
> -static inline void cache_page(void *vaddr)
> -{
> -	unsigned long addr = (unsigned long)vaddr;
> -
> -	if (CPU_IS_040_OR_060) {
> -		pgd_t *dir;
> -		p4d_t *p4dp;
> -		pud_t *pudp;
> -		pmd_t *pmdp;
> -		pte_t *ptep;
> -
> -		dir = pgd_offset_k(addr);
> -		p4dp = p4d_offset(dir, addr);
> -		pudp = pud_offset(p4dp, addr);
> -		pmdp = pmd_offset(pudp, addr);
> -		ptep = pte_offset_kernel(pmdp, addr);
> -		*ptep = pte_mkcache(*ptep);
> -	}
> -}
> -
>   /* Encode and de-code a swap entry (must be !pte_none(e) && !pte_present(e)) */
>   #define __swp_type(x)		(((x).val >> 4) & 0xff)
>   #define __swp_offset(x)		((x).val >> 12)
> diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
> index 904c2a663977..8e5e74121a78 100644
> --- a/arch/m68k/mm/motorola.c
> +++ b/arch/m68k/mm/motorola.c
> @@ -45,6 +45,49 @@ unsigned long mm_cachebits;
>   EXPORT_SYMBOL(mm_cachebits);
>   #endif
>   
> +/* Prior to calling these routines, the page should have been flushed
> + * from both the cache and ATC, or the CPU might not notice that the
> + * cache setting for the page has been changed. -jskov
> + */
> +static inline void nocache_page(void *vaddr)
> +{
> +	unsigned long addr = (unsigned long)vaddr;
> +
> +	if (CPU_IS_040_OR_060) {
> +		pgd_t *dir;
> +		p4d_t *p4dp;
> +		pud_t *pudp;
> +		pmd_t *pmdp;
> +		pte_t *ptep;
> +
> +		dir = pgd_offset_k(addr);
> +		p4dp = p4d_offset(dir, addr);
> +		pudp = pud_offset(p4dp, addr);
> +		pmdp = pmd_offset(pudp, addr);
> +		ptep = pte_offset_kernel(pmdp, addr);
> +		*ptep = pte_mknocache(*ptep);
> +	}
> +}
> +
> +static inline void cache_page(void *vaddr)
> +{
> +	unsigned long addr = (unsigned long)vaddr;
> +
> +	if (CPU_IS_040_OR_060) {
> +		pgd_t *dir;
> +		p4d_t *p4dp;
> +		pud_t *pudp;
> +		pmd_t *pmdp;
> +		pte_t *ptep;
> +
> +		dir = pgd_offset_k(addr);
> +		p4dp = p4d_offset(dir, addr);
> +		pudp = pud_offset(p4dp, addr);
> +		pmdp = pmd_offset(pudp, addr);
> +		ptep = pte_offset_kernel(pmdp, addr);
> +		*ptep = pte_mkcache(*ptep);
> +	}
> +}
>   
>   /*
>    * Motorola 680x0 user's manual recommends using uncached memory for address
> 
