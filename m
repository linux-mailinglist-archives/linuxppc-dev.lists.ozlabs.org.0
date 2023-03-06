Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9344F6AC943
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 18:07:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVlPS3Bkcz3f7r
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 04:07:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=<UNKNOWN>)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVlNw3G8yz3c7K
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 04:06:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4FFEEB80FC9;
	Mon,  6 Mar 2023 17:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A21C433D2;
	Mon,  6 Mar 2023 17:06:47 +0000 (UTC)
Date: Mon, 6 Mar 2023 17:06:44 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Subject: Re: [PATCH] mm: add PTE pointer parameter to
 flush_tlb_fix_spurious_fault()
Message-ID: <ZAYdpLCxicptr4MJ@arm.com>
References: <20230306161548.661740-1-gerald.schaefer@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306161548.661740-1-gerald.schaefer@linux.ibm.com>
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
Cc: linux-x86 <x86@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Anshuman Khandual <anshuman.khandual@arm.com>, David Hildenbrand <david@redhat.com>, linux-mips <linux-mips@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-s390 <linux-s390@vger.kernel.org>, linux-power <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 06, 2023 at 05:15:48PM +0100, Gerald Schaefer wrote:
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index b6ba466e2e8a..0bd18de9fd97 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -57,7 +57,7 @@ static inline bool arch_thp_swp_supported(void)
>   * fault on one CPU which has been handled concurrently by another CPU
>   * does not need to perform additional invalidation.
>   */
> -#define flush_tlb_fix_spurious_fault(vma, address) do { } while (0)
> +#define flush_tlb_fix_spurious_fault(vma, address, ptep) do { } while (0)

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
> index 2c70b4d1263d..c1f6b46ec555 100644
> --- a/arch/s390/include/asm/pgtable.h
> +++ b/arch/s390/include/asm/pgtable.h
> @@ -1239,7 +1239,8 @@ static inline int pte_allow_rdp(pte_t old, pte_t new)
>  }
>  
>  static inline void flush_tlb_fix_spurious_fault(struct vm_area_struct *vma,
> -						unsigned long address)
> +						unsigned long address,
> +						pte_t *ptep)
>  {
>  	/*
>  	 * RDP might not have propagated the PTE protection reset to all CPUs,
> @@ -1247,11 +1248,12 @@ static inline void flush_tlb_fix_spurious_fault(struct vm_area_struct *vma,
>  	 * NOTE: This will also be called when a racing pagetable update on
>  	 * another thread already installed the correct PTE. Both cases cannot
>  	 * really be distinguished.
> -	 * Therefore, only do the local TLB flush when RDP can be used, to avoid
> -	 * unnecessary overhead.
> +	 * Therefore, only do the local TLB flush when RDP can be used, and the
> +	 * PTE does not have _PAGE_PROTECT set, to avoid unnecessary overhead.
> +	 * A local RDP can be used to do the flush.
>  	 */
> -	if (MACHINE_HAS_RDP)
> -		asm volatile("ptlb" : : : "memory");
> +	if (MACHINE_HAS_RDP && !(pte_val(*ptep) & _PAGE_PROTECT))
> +		__ptep_rdp(address, ptep, 0, 0, 1);

I wonder whether passing the actual entry is somewhat quicker as it
avoids another memory access (though it might already be in the cache).

-- 
Catalin
