Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F921C100C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 10:52:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49D5bx2rFdzDrGG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 18:52:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+bcc6e49d8bb843eac143+6095+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=ojsxdl6W; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49D5WK4y9LzDqvg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 18:48:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5czAzjnPG5qKJBo9Zou6HOc21kK1hACJJXtSJHumLqw=; b=ojsxdl6Wn77klB+GK5yGt4hzzt
 PbWTE8KRF2s0bHgDBYw4BmjS4Z8TPbdOqvJ6W6ED+Y84eLjdR0HxnC6MkrHw4DGBiCnb8FMbHtTrS
 OoiRVTqA3r5y/1JVI0O0CKGC1uGa+K/HrQRWgXXqCL/ZdZqgoYIVR17LG+pPhiLFiuOV2RjXCW+hK
 83tY4Atnuk/hegi3OHBwSo7h1eGJtmADL8rhjYHRLgYGx7YcEmNDizgmdFPi48cGSCIlgj0g/M+09
 2f0tK+xxQg8nXgoNS6x/uRzpJZMsWTSQdZ6N4Jt4KTRxKM/pYZnK4VyuoWEQgka8qRBaXQLCGAiNZ
 Kz21WtrA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jURL8-0003Tc-Mf; Fri, 01 May 2020 08:48:10 +0000
Date: Fri, 1 May 2020 01:48:10 -0700
From: Christoph Hellwig <hch@infradead.org>
To: ira.weiny@intel.com
Subject: Re: [PATCH V1 09/10] arch/kmap: Define kmap_atomic_prot() for all
 arch's
Message-ID: <20200501084810.GJ27858@infradead.org>
References: <20200430203845.582900-1-ira.weiny@intel.com>
 <20200430203845.582900-10-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430203845.582900-10-ira.weiny@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 30, 2020 at 01:38:44PM -0700, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> To support kmap_atomic_prot(), all architectures need to support
> protections passed to their kmap_atomic_high() function.  Pass
> protections into kmap_atomic_high() and change the name to
> kmap_atomic_high_prot() to match.
> 
> Then define kmap_atomic_prot() as a core function which calls
> kmap_atomic_high_prot() when needed.
> 
> Finally, redefine kmap_atomic() as a wrapper of kmap_atomic_prot() with
> the default kmap_prot exported by the architectures.

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

But can you also consolidate the kmap_atomic_high_prot and
kunmap_atomic_high in linux/highmem.h instead of keeping the duplicates
in all arch headers?

> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> ---
>  arch/arc/include/asm/highmem.h        | 2 +-
>  arch/arc/mm/highmem.c                 | 6 +++---
>  arch/arm/include/asm/highmem.h        | 2 +-
>  arch/arm/mm/highmem.c                 | 6 +++---
>  arch/csky/include/asm/highmem.h       | 2 +-
>  arch/csky/mm/highmem.c                | 6 +++---
>  arch/microblaze/include/asm/highmem.h | 7 +------
>  arch/microblaze/mm/highmem.c          | 4 ++--
>  arch/mips/include/asm/highmem.h       | 2 +-
>  arch/mips/mm/highmem.c                | 6 +++---
>  arch/nds32/include/asm/highmem.h      | 2 +-
>  arch/nds32/mm/highmem.c               | 6 +++---
>  arch/powerpc/include/asm/highmem.h    | 8 +-------
>  arch/powerpc/mm/highmem.c             | 4 ++--
>  arch/sparc/include/asm/highmem.h      | 2 +-
>  arch/sparc/mm/highmem.c               | 6 +++---
>  arch/x86/include/asm/highmem.h        | 6 +-----
>  arch/x86/mm/highmem_32.c              | 4 ++--
>  arch/xtensa/include/asm/highmem.h     | 2 +-
>  arch/xtensa/mm/highmem.c              | 6 +++---
>  include/linux/highmem.h               | 5 +++--
>  21 files changed, 40 insertions(+), 54 deletions(-)
> 
> diff --git a/arch/arc/include/asm/highmem.h b/arch/arc/include/asm/highmem.h
> index e16531495620..09f86bde6809 100644
> --- a/arch/arc/include/asm/highmem.h
> +++ b/arch/arc/include/asm/highmem.h
> @@ -30,7 +30,7 @@
>  
>  #include <asm/cacheflush.h>
>  
> -extern void *kmap_atomic_high(struct page *page);
> +extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
>  extern void kunmap_atomic_high(void *kvaddr);
>  
>  extern void kmap_init(void);
> diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
> index 5d3eab4ac0b0..479b0d72d3cf 100644
> --- a/arch/arc/mm/highmem.c
> +++ b/arch/arc/mm/highmem.c
> @@ -49,7 +49,7 @@
>  extern pte_t * pkmap_page_table;
>  static pte_t * fixmap_page_table;
>  
> -void *kmap_atomic_high(struct page *page)
> +void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
>  {
>  	int idx, cpu_idx;
>  	unsigned long vaddr;
> @@ -59,11 +59,11 @@ void *kmap_atomic_high(struct page *page)
>  	vaddr = FIXMAP_ADDR(idx);
>  
>  	set_pte_at(&init_mm, vaddr, fixmap_page_table + idx,
> -		   mk_pte(page, kmap_prot));
> +		   mk_pte(page, prot));
>  
>  	return (void *)vaddr;
>  }
> -EXPORT_SYMBOL(kmap_atomic_high);
> +EXPORT_SYMBOL(kmap_atomic_high_prot);
>  
>  void kunmap_atomic_high(void *kv)
>  {
> diff --git a/arch/arm/include/asm/highmem.h b/arch/arm/include/asm/highmem.h
> index a9d5e9bce1cc..e35f2f73f6aa 100644
> --- a/arch/arm/include/asm/highmem.h
> +++ b/arch/arm/include/asm/highmem.h
> @@ -60,7 +60,7 @@ static inline void *kmap_high_get(struct page *page)
>   * when CONFIG_HIGHMEM is not set.
>   */
>  #ifdef CONFIG_HIGHMEM
> -extern void *kmap_atomic_high(struct page *page);
> +extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
>  extern void kunmap_atomic_high(void *kvaddr);
>  extern void *kmap_atomic_pfn(unsigned long pfn);
>  #endif
> diff --git a/arch/arm/mm/highmem.c b/arch/arm/mm/highmem.c
> index ac8394655a6e..e013f6b81328 100644
> --- a/arch/arm/mm/highmem.c
> +++ b/arch/arm/mm/highmem.c
> @@ -31,7 +31,7 @@ static inline pte_t get_fixmap_pte(unsigned long vaddr)
>  	return *ptep;
>  }
>  
> -void *kmap_atomic_high(struct page *page)
> +void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
>  {
>  	unsigned int idx;
>  	unsigned long vaddr;
> @@ -67,11 +67,11 @@ void *kmap_atomic_high(struct page *page)
>  	 * in place, so the contained TLB flush ensures the TLB is updated
>  	 * with the new mapping.
>  	 */
> -	set_fixmap_pte(idx, mk_pte(page, kmap_prot));
> +	set_fixmap_pte(idx, mk_pte(page, prot));
>  
>  	return (void *)vaddr;
>  }
> -EXPORT_SYMBOL(kmap_atomic_high);
> +EXPORT_SYMBOL(kmap_atomic_high_prot);
>  
>  void kunmap_atomic_high(void *kvaddr)
>  {
> diff --git a/arch/csky/include/asm/highmem.h b/arch/csky/include/asm/highmem.h
> index 5bbbe59e60a9..59854c7ccf78 100644
> --- a/arch/csky/include/asm/highmem.h
> +++ b/arch/csky/include/asm/highmem.h
> @@ -32,7 +32,7 @@ extern pte_t *pkmap_page_table;
>  
>  #define ARCH_HAS_KMAP_FLUSH_TLB
>  extern void kmap_flush_tlb(unsigned long addr);
> -extern void *kmap_atomic_high(struct page *page);
> +extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
>  extern void kunmap_atomic_high(void *kvaddr);
>  extern void *kmap_atomic_pfn(unsigned long pfn);
>  extern struct page *kmap_atomic_to_page(void *ptr);
> diff --git a/arch/csky/mm/highmem.c b/arch/csky/mm/highmem.c
> index f4311669b5bb..3ae5c8cd7619 100644
> --- a/arch/csky/mm/highmem.c
> +++ b/arch/csky/mm/highmem.c
> @@ -21,7 +21,7 @@ EXPORT_SYMBOL(kmap_flush_tlb);
>  
>  EXPORT_SYMBOL(kmap);
>  
> -void *kmap_atomic_high(struct page *page)
> +void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
>  {
>  	unsigned long vaddr;
>  	int idx, type;
> @@ -32,12 +32,12 @@ void *kmap_atomic_high(struct page *page)
>  #ifdef CONFIG_DEBUG_HIGHMEM
>  	BUG_ON(!pte_none(*(kmap_pte - idx)));
>  #endif
> -	set_pte(kmap_pte-idx, mk_pte(page, kmap_prot));
> +	set_pte(kmap_pte-idx, mk_pte(page, prot));
>  	flush_tlb_one((unsigned long)vaddr);
>  
>  	return (void *)vaddr;
>  }
> -EXPORT_SYMBOL(kmap_atomic_high);
> +EXPORT_SYMBOL(kmap_atomic_high_prot);
>  
>  void kunmap_atomic_high(void *kvaddr)
>  {
> diff --git a/arch/microblaze/include/asm/highmem.h b/arch/microblaze/include/asm/highmem.h
> index 66521fdc3a47..eb0a2cb883bd 100644
> --- a/arch/microblaze/include/asm/highmem.h
> +++ b/arch/microblaze/include/asm/highmem.h
> @@ -51,14 +51,9 @@ extern pte_t *pkmap_page_table;
>  #define PKMAP_NR(virt)  ((virt - PKMAP_BASE) >> PAGE_SHIFT)
>  #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
>  
> -extern void *kmap_atomic_prot(struct page *page, pgprot_t prot);
> +extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
>  extern void kunmap_atomic_high(void *kvaddr);
>  
> -static inline void *kmap_atomic_high(struct page *page)
> -{
> -	return kmap_atomic_prot(page, kmap_prot);
> -}
> -
>  #define flush_cache_kmaps()	{ flush_icache(); flush_dcache(); }
>  
>  #endif /* __KERNEL__ */
> diff --git a/arch/microblaze/mm/highmem.c b/arch/microblaze/mm/highmem.c
> index 1026aeffe11a..ee8a422b2b76 100644
> --- a/arch/microblaze/mm/highmem.c
> +++ b/arch/microblaze/mm/highmem.c
> @@ -32,7 +32,7 @@
>   */
>  #include <asm/tlbflush.h>
>  
> -void *kmap_atomic_prot(struct page *page, pgprot_t prot)
> +void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
>  {
>  
>  	unsigned long vaddr;
> @@ -49,7 +49,7 @@ void *kmap_atomic_prot(struct page *page, pgprot_t prot)
>  
>  	return (void *) vaddr;
>  }
> -EXPORT_SYMBOL(kmap_atomic_prot);
> +EXPORT_SYMBOL(kmap_atomic_high_prot);
>  
>  void kunmap_atomic_high(void *kvaddr)
>  {
> diff --git a/arch/mips/include/asm/highmem.h b/arch/mips/include/asm/highmem.h
> index d9f774bd4938..c9f46b450a68 100644
> --- a/arch/mips/include/asm/highmem.h
> +++ b/arch/mips/include/asm/highmem.h
> @@ -48,7 +48,7 @@ extern pte_t *pkmap_page_table;
>  
>  #define ARCH_HAS_KMAP_FLUSH_TLB
>  extern void kmap_flush_tlb(unsigned long addr);
> -extern void *kmap_atomic_high(struct page *page);
> +extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
>  extern void kunmap_atomic_high(void *kvaddr);
>  extern void *kmap_atomic_pfn(unsigned long pfn);
>  
> diff --git a/arch/mips/mm/highmem.c b/arch/mips/mm/highmem.c
> index 87023bd1a33c..37e244cdb14e 100644
> --- a/arch/mips/mm/highmem.c
> +++ b/arch/mips/mm/highmem.c
> @@ -18,7 +18,7 @@ void kmap_flush_tlb(unsigned long addr)
>  }
>  EXPORT_SYMBOL(kmap_flush_tlb);
>  
> -void *kmap_atomic_high(struct page *page)
> +void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
>  {
>  	unsigned long vaddr;
>  	int idx, type;
> @@ -29,12 +29,12 @@ void *kmap_atomic_high(struct page *page)
>  #ifdef CONFIG_DEBUG_HIGHMEM
>  	BUG_ON(!pte_none(*(kmap_pte - idx)));
>  #endif
> -	set_pte(kmap_pte-idx, mk_pte(page, kmap_prot));
> +	set_pte(kmap_pte-idx, mk_pte(page, prot));
>  	local_flush_tlb_one((unsigned long)vaddr);
>  
>  	return (void*) vaddr;
>  }
> -EXPORT_SYMBOL(kmap_atomic_high);
> +EXPORT_SYMBOL(kmap_atomic_high_prot);
>  
>  void kunmap_atomic_high(void *kvaddr)
>  {
> diff --git a/arch/nds32/include/asm/highmem.h b/arch/nds32/include/asm/highmem.h
> index 97648b678108..1f9fc74d112d 100644
> --- a/arch/nds32/include/asm/highmem.h
> +++ b/arch/nds32/include/asm/highmem.h
> @@ -51,7 +51,7 @@ extern void kmap_init(void);
>   * when CONFIG_HIGHMEM is not set.
>   */
>  #ifdef CONFIG_HIGHMEM
> -extern void *kmap_atomic_high(struct page *page);
> +extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
>  extern void kunmap_atomic_high(void *kvaddr);
>  extern void *kmap_atomic_pfn(unsigned long pfn);
>  extern struct page *kmap_atomic_to_page(void *ptr);
> diff --git a/arch/nds32/mm/highmem.c b/arch/nds32/mm/highmem.c
> index 809f8c830f06..63ded527c1e8 100644
> --- a/arch/nds32/mm/highmem.c
> +++ b/arch/nds32/mm/highmem.c
> @@ -10,7 +10,7 @@
>  #include <asm/fixmap.h>
>  #include <asm/tlbflush.h>
>  
> -void *kmap_atomic_high(struct page *page)
> +void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
>  {
>  	unsigned int idx;
>  	unsigned long vaddr, pte;
> @@ -21,7 +21,7 @@ void *kmap_atomic_high(struct page *page)
>  
>  	idx = type + KM_TYPE_NR * smp_processor_id();
>  	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
> -	pte = (page_to_pfn(page) << PAGE_SHIFT) | (kmap_prot);
> +	pte = (page_to_pfn(page) << PAGE_SHIFT) | prot;
>  	ptep = pte_offset_kernel(pmd_off_k(vaddr), vaddr);
>  	set_pte(ptep, pte);
>  
> @@ -32,7 +32,7 @@ void *kmap_atomic_high(struct page *page)
>  	return (void *)vaddr;
>  }
>  
> -EXPORT_SYMBOL(kmap_atomic_high);
> +EXPORT_SYMBOL(kmap_atomic_high_prot);
>  
>  void kunmap_atomic_high(void *kvaddr)
>  {
> diff --git a/arch/powerpc/include/asm/highmem.h b/arch/powerpc/include/asm/highmem.h
> index d264aebcaa9b..edd01bbe5a44 100644
> --- a/arch/powerpc/include/asm/highmem.h
> +++ b/arch/powerpc/include/asm/highmem.h
> @@ -59,15 +59,9 @@ extern pte_t *pkmap_page_table;
>  #define PKMAP_NR(virt)  ((virt-PKMAP_BASE) >> PAGE_SHIFT)
>  #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
>  
> -extern void *kmap_atomic_prot(struct page *page, pgprot_t prot);
> +extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
>  extern void kunmap_atomic_high(void *kvaddr);
>  
> -static inline void *kmap_atomic_high(struct page *page)
> -{
> -	return kmap_atomic_prot(page, kmap_prot);
> -}
> -
> -
>  #define flush_cache_kmaps()	flush_cache_all()
>  
>  #endif /* __KERNEL__ */
> diff --git a/arch/powerpc/mm/highmem.c b/arch/powerpc/mm/highmem.c
> index 162958321e28..35071c2913f1 100644
> --- a/arch/powerpc/mm/highmem.c
> +++ b/arch/powerpc/mm/highmem.c
> @@ -24,7 +24,7 @@
>  #include <linux/highmem.h>
>  #include <linux/module.h>
>  
> -void *kmap_atomic_prot(struct page *page, pgprot_t prot)
> +void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
>  {
>  	unsigned long vaddr;
>  	int idx, type;
> @@ -38,7 +38,7 @@ void *kmap_atomic_prot(struct page *page, pgprot_t prot)
>  
>  	return (void*) vaddr;
>  }
> -EXPORT_SYMBOL(kmap_atomic_prot);
> +EXPORT_SYMBOL(kmap_atomic_high_prot);
>  
>  void kunmap_atomic_high(void *kvaddr)
>  {
> diff --git a/arch/sparc/include/asm/highmem.h b/arch/sparc/include/asm/highmem.h
> index 94dd6e4c5fa4..d5c5700672de 100644
> --- a/arch/sparc/include/asm/highmem.h
> +++ b/arch/sparc/include/asm/highmem.h
> @@ -50,7 +50,7 @@ void kmap_init(void) __init;
>  
>  #define PKMAP_END (PKMAP_ADDR(LAST_PKMAP))
>  
> -void *kmap_atomic_high(struct page *page);
> +void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
>  void kunmap_atomic_high(void *kvaddr);
>  
>  #define flush_cache_kmaps()	flush_cache_all()
> diff --git a/arch/sparc/mm/highmem.c b/arch/sparc/mm/highmem.c
> index 9f06d75e88e1..414f578d1e57 100644
> --- a/arch/sparc/mm/highmem.c
> +++ b/arch/sparc/mm/highmem.c
> @@ -54,7 +54,7 @@ void __init kmap_init(void)
>          kmap_prot = __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CACHE);
>  }
>  
> -void *kmap_atomic_high(struct page *page)
> +void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
>  {
>  	unsigned long vaddr;
>  	long idx, type;
> @@ -73,7 +73,7 @@ void *kmap_atomic_high(struct page *page)
>  #ifdef CONFIG_DEBUG_HIGHMEM
>  	BUG_ON(!pte_none(*(kmap_pte-idx)));
>  #endif
> -	set_pte(kmap_pte-idx, mk_pte(page, kmap_prot));
> +	set_pte(kmap_pte-idx, mk_pte(page, prot));
>  /* XXX Fix - Anton */
>  #if 0
>  	__flush_tlb_one(vaddr);
> @@ -83,7 +83,7 @@ void *kmap_atomic_high(struct page *page)
>  
>  	return (void*) vaddr;
>  }
> -EXPORT_SYMBOL(kmap_atomic_high);
> +EXPORT_SYMBOL(kmap_atomic_high_prot);
>  
>  void kunmap_atomic_high(void *kvaddr)
>  {
> diff --git a/arch/x86/include/asm/highmem.h b/arch/x86/include/asm/highmem.h
> index ff87aba96eee..009b8e22e906 100644
> --- a/arch/x86/include/asm/highmem.h
> +++ b/arch/x86/include/asm/highmem.h
> @@ -58,11 +58,7 @@ extern unsigned long highstart_pfn, highend_pfn;
>  #define PKMAP_NR(virt)  ((virt-PKMAP_BASE) >> PAGE_SHIFT)
>  #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
>  
> -extern void *kmap_atomic_prot(struct page *page, pgprot_t prot);
> -void *kmap_atomic_high(struct page *page)
> -{
> -	return kmap_atomic_prot(page, kmap_prot);
> -}
> +void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
>  void kunmap_atomic_high(void *kvaddr);
>  void *kmap_atomic_pfn(unsigned long pfn);
>  void *kmap_atomic_prot_pfn(unsigned long pfn, pgprot_t prot);
> diff --git a/arch/x86/mm/highmem_32.c b/arch/x86/mm/highmem_32.c
> index af07a6842743..075fe51317b0 100644
> --- a/arch/x86/mm/highmem_32.c
> +++ b/arch/x86/mm/highmem_32.c
> @@ -4,7 +4,7 @@
>  #include <linux/swap.h> /* for totalram_pages */
>  #include <linux/memblock.h>
>  
> -void *kmap_atomic_prot(struct page *page, pgprot_t prot)
> +void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
>  {
>  	unsigned long vaddr;
>  	int idx, type;
> @@ -18,7 +18,7 @@ void *kmap_atomic_prot(struct page *page, pgprot_t prot)
>  
>  	return (void *)vaddr;
>  }
> -EXPORT_SYMBOL(kmap_atomic_prot);
> +EXPORT_SYMBOL(kmap_atomic_high_prot);
>  
>  /*
>   * This is the same as kmap_atomic() but can map memory that doesn't
> diff --git a/arch/xtensa/include/asm/highmem.h b/arch/xtensa/include/asm/highmem.h
> index a60a02dc68f6..7152aeb1e3a4 100644
> --- a/arch/xtensa/include/asm/highmem.h
> +++ b/arch/xtensa/include/asm/highmem.h
> @@ -68,7 +68,7 @@ static inline void flush_cache_kmaps(void)
>  	flush_cache_all();
>  }
>  
> -void *kmap_atomic_high(struct page *page);
> +void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
>  void kunmap_atomic_high(void *kvaddr);
>  
>  void kmap_init(void);
> diff --git a/arch/xtensa/mm/highmem.c b/arch/xtensa/mm/highmem.c
> index 8c58c4c37033..fe56644d7b23 100644
> --- a/arch/xtensa/mm/highmem.c
> +++ b/arch/xtensa/mm/highmem.c
> @@ -37,7 +37,7 @@ static inline enum fixed_addresses kmap_idx(int type, unsigned long color)
>  		color;
>  }
>  
> -void *kmap_atomic_high(struct page *page)
> +void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
>  {
>  	enum fixed_addresses idx;
>  	unsigned long vaddr;
> @@ -48,11 +48,11 @@ void *kmap_atomic_high(struct page *page)
>  #ifdef CONFIG_DEBUG_HIGHMEM
>  	BUG_ON(!pte_none(*(kmap_pte + idx)));
>  #endif
> -	set_pte(kmap_pte + idx, mk_pte(page, kmap_prot));
> +	set_pte(kmap_pte + idx, mk_pte(page, prot));
>  
>  	return (void *)vaddr;
>  }
> -EXPORT_SYMBOL(kmap_atomic_high);
> +EXPORT_SYMBOL(kmap_atomic_high_prot);
>  
>  void kunmap_atomic_high(void *kvaddr)
>  {
> diff --git a/include/linux/highmem.h b/include/linux/highmem.h
> index 601df07607a4..b10e8a39ae60 100644
> --- a/include/linux/highmem.h
> +++ b/include/linux/highmem.h
> @@ -74,14 +74,15 @@ static inline void kunmap(struct page *page)
>   * be used in IRQ contexts, so in some (very limited) cases we need
>   * it.
>   */
> -static inline void *kmap_atomic(struct page *page)
> +static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
>  {
>  	preempt_disable();
>  	pagefault_disable();
>  	if (!PageHighMem(page))
>  		return page_address(page);
> -	return kmap_atomic_high(page);
> +	return kmap_atomic_high_prot(page, prot);
>  }
> +#define kmap_atomic(page)	kmap_atomic_prot(page, kmap_prot)
>  
>  /* declarations for linux/mm/highmem.c */
>  unsigned int nr_free_highpages(void);
> -- 
> 2.25.1
> 
---end quoted text---
