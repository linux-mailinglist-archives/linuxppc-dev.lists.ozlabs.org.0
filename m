Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7188536A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 17:56:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ6tS2jhRz3vYV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 03:56:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ6t25ykhz2y1Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 03:56:26 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FC74DA7;
	Tue, 13 Feb 2024 08:56:36 -0800 (PST)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.36.130])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CD3D3F5A1;
	Tue, 13 Feb 2024 08:55:51 -0800 (PST)
Date: Tue, 13 Feb 2024 16:55:49 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v5 24/25] arm64/mm: __always_inline to improve fork() perf
Message-ID: <ZcufFVa7FJRgrEI1@FVFF77S0Q05N.cambridge.arm.com>
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
 <20240202080756.1453939-25-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202080756.1453939-25-ryan.roberts@arm.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 02, 2024 at 08:07:55AM +0000, Ryan Roberts wrote:
> As set_ptes() and wrprotect_ptes() become a bit more complex, the
> compiler may choose not to inline them. But this is critical for fork()
> performance. So mark the functions, along with contpte_try_unfold()
> which is called by them, as __always_inline. This is worth ~1% on the
> fork() microbenchmark with order-0 folios (the common case).
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

I have no strong feelings either way on this, so:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/include/asm/pgtable.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 353ea67b5d75..cdc310880a3b 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1213,8 +1213,8 @@ extern int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
>  				unsigned long addr, pte_t *ptep,
>  				pte_t entry, int dirty);
>  
> -static inline void contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
> -					pte_t *ptep, pte_t pte)
> +static __always_inline void contpte_try_unfold(struct mm_struct *mm,
> +				unsigned long addr, pte_t *ptep, pte_t pte)
>  {
>  	if (unlikely(pte_valid_cont(pte)))
>  		__contpte_try_unfold(mm, addr, ptep, pte);
> @@ -1279,7 +1279,7 @@ static inline void set_pte(pte_t *ptep, pte_t pte)
>  }
>  
>  #define set_ptes set_ptes
> -static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
> +static __always_inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>  				pte_t *ptep, pte_t pte, unsigned int nr)
>  {
>  	pte = pte_mknoncont(pte);
> @@ -1361,8 +1361,8 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>  }
>  
>  #define wrprotect_ptes wrprotect_ptes
> -static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
> -				pte_t *ptep, unsigned int nr)
> +static __always_inline void wrprotect_ptes(struct mm_struct *mm,
> +				unsigned long addr, pte_t *ptep, unsigned int nr)
>  {
>  	if (likely(nr == 1)) {
>  		/*
> -- 
> 2.25.1
> 
