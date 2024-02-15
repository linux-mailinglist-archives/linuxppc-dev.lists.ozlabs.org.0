Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2495F856175
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 12:25:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbCQz0YFTz3vd2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 22:25:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbCQZ1yH2z2yNf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 22:24:53 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E6AEDA7;
	Thu, 15 Feb 2024 03:25:03 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.68.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7DF33F7B4;
	Thu, 15 Feb 2024 03:24:18 -0800 (PST)
Date: Thu, 15 Feb 2024 11:24:16 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v6 11/18] arm64/mm: Split __flush_tlb_range() to elide
 trailing DSB
Message-ID: <Zc30YGd3yBVpLNqn@FVFF77S0Q05N>
References: <20240215103205.2607016-1-ryan.roberts@arm.com>
 <20240215103205.2607016-12-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215103205.2607016-12-ryan.roberts@arm.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 15, 2024 at 10:31:58AM +0000, Ryan Roberts wrote:
> Split __flush_tlb_range() into __flush_tlb_range_nosync() +
> __flush_tlb_range(), in the same way as the existing flush_tlb_page()
> arrangement. This allows calling __flush_tlb_range_nosync() to elide the
> trailing DSB. Forthcoming "contpte" code will take advantage of this
> when clearing the young bit from a contiguous range of ptes.
> 
> Ordering between dsb and mmu_notifier_arch_invalidate_secondary_tlbs()
> has changed, but now aligns with the ordering of __flush_tlb_page(). It
> has been discussed that __flush_tlb_page() may be wrong though.
> Regardless, both will be resolved separately if needed.
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Tested-by: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/include/asm/tlbflush.h | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 1deb5d789c2e..3b0e8248e1a4 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -422,7 +422,7 @@ do {									\
>  #define __flush_s2_tlb_range_op(op, start, pages, stride, tlb_level) \
>  	__flush_tlb_range_op(op, start, pages, stride, 0, tlb_level, false, kvm_lpa2_is_enabled());
>  
> -static inline void __flush_tlb_range(struct vm_area_struct *vma,
> +static inline void __flush_tlb_range_nosync(struct vm_area_struct *vma,
>  				     unsigned long start, unsigned long end,
>  				     unsigned long stride, bool last_level,
>  				     int tlb_level)
> @@ -456,10 +456,19 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
>  		__flush_tlb_range_op(vae1is, start, pages, stride, asid,
>  				     tlb_level, true, lpa2_is_enabled());
>  
> -	dsb(ish);
>  	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, start, end);
>  }
>  
> +static inline void __flush_tlb_range(struct vm_area_struct *vma,
> +				     unsigned long start, unsigned long end,
> +				     unsigned long stride, bool last_level,
> +				     int tlb_level)
> +{
> +	__flush_tlb_range_nosync(vma, start, end, stride,
> +				 last_level, tlb_level);
> +	dsb(ish);
> +}
> +
>  static inline void flush_tlb_range(struct vm_area_struct *vma,
>  				   unsigned long start, unsigned long end)
>  {
> -- 
> 2.25.1
> 
