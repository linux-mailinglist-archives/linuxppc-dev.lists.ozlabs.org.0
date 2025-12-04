Return-Path: <linuxppc-dev+bounces-14587-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1403CA251D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 05:34:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMM9j2dTwz2xNk;
	Thu, 04 Dec 2025 15:34:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764822889;
	cv=none; b=VTqk4mI5U6mXPNAYCJCU8QiOeqQGT3U/JLqcG+OhGskmQFoolJCPVVPEu3UW6XOzHxPPSDr0L9myiqT42FXE+szOlVJxyzKD56eMwDtUFMfepGnHT7lzS101drQGaHEDPrTBz4OPNumktM4GpEtKFNdyFOXhxABFgJoQEPlWpuhJ0wrqok5JBwqbY+gEulQ2FfPKC3pXsLvcFEk6dI11j/Gu8ZVOVSL2WNvNm2GDAekP3DlSQqwdTlCnQ7DTrd3nzA8kEFUb8ALK6z7zqeCP430gx9KUL2Rbx4h6ia8W5eL7Wos78zd5H8BCiRXcP6lqLUb70pJAVX/+0NTj6fS0CA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764822889; c=relaxed/relaxed;
	bh=b2Ag9VGHjtd8hN53cp9DjV4/7coNBMtZPqugNMBysgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TeQ/V+ZoW+pwflOsybPLaPtKpV/zMouQtIpaPkg+Rp+rMsDiLfkj7YhY/VmE/qET1HjOIM1juRNSfp9tZEWnWangKvTs0cbmGeRK0fq9/+bqDk4+STiPH1X/SAQAURGxZoLrDcR+nhoE8prX7sS/fndDx19TIqS45N1CwSivu8BNQf/0q2cJW8rgjjiOCkG3RTo68yFcrnKMuR9ySmcnBVll+qTBYtdWJHwBuFRwEsCuhAQIQKWffJ/AUhcJc9ZSnr2n1NKDakb45x9oKqZo4HcsGqOSoqyvB9B1n2aKwBA0n7wIuUfL2hS2WzlE8N8v/Fzdc5grJV8Q7BlSqEr6XQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMM9h3BFRz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Dec 2025 15:34:48 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64906339;
	Wed,  3 Dec 2025 20:34:09 -0800 (PST)
Received: from [10.164.18.78] (unknown [10.164.18.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E05AF3F73B;
	Wed,  3 Dec 2025 20:34:06 -0800 (PST)
Message-ID: <565ac89c-1e7a-4e2f-a866-15039fbe22f6@arm.com>
Date: Thu, 4 Dec 2025 10:04:04 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/12] mm: bail out of lazy_mmu_mode_* in interrupt
 context
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-8-kevin.brodsky@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251124132228.622678-8-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 24/11/25 6:52 PM, Kevin Brodsky wrote:
> The lazy MMU mode cannot be used in interrupt context. This is
> documented in <linux/pgtable.h>, but isn't consistently handled
> across architectures.
> 
> arm64 ensures that calls to lazy_mmu_mode_* have no effect in
> interrupt context, because such calls do occur in certain
> configurations - see commit b81c688426a9 ("arm64/mm: Disable barrier
> batching in interrupt contexts"). Other architectures do not check
> this situation, most likely because it hasn't occurred so far.
> 
> Let's handle this in the new generic lazy_mmu layer, in the same
> fashion as arm64: bail out of lazy_mmu_mode_* if in_interrupt().
> Also remove the arm64 handling that is now redundant.

Ensuring a common behaviour across platforms such as this in interrupt
context bail out - can now be easily achieved now as there are generic
helpers that call the platform ones.

> > Both arm64 and x86/Xen also ensure that any lazy MMU optimisation is
> disabled while in interrupt (see queue_pte_barriers() and
> xen_get_lazy_mode() respectively). This will be handled in the
> generic layer in a subsequent patch.

Makes sense.

> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h |  9 ---------
>  include/linux/pgtable.h          | 17 +++++++++++++++--
>  2 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 54f8d6bb6f22..e596899f4029 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -94,26 +94,17 @@ static inline void arch_enter_lazy_mmu_mode(void)
>  	 * keeps tracking simple.
>  	 */
>  
> -	if (in_interrupt())
> -		return;
> -
>  	set_thread_flag(TIF_LAZY_MMU);
>  }
>  
>  static inline void arch_flush_lazy_mmu_mode(void)
>  {
> -	if (in_interrupt())
> -		return;
> -
>  	if (test_and_clear_thread_flag(TIF_LAZY_MMU_PENDING))
>  		emit_pte_barriers();
>  }
>  
>  static inline void arch_leave_lazy_mmu_mode(void)
>  {
> -	if (in_interrupt())
> -		return;
> -
>  	arch_flush_lazy_mmu_mode();
>  	clear_thread_flag(TIF_LAZY_MMU);
>  }
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index c121358dba15..8ff6fdb4b13d 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -228,27 +228,40 @@ static inline int pmd_dirty(pmd_t pmd)
>   * of the lazy mode. So the implementation must assume preemption may be enabled
>   * and cpu migration is possible; it must take steps to be robust against this.
>   * (In practice, for user PTE updates, the appropriate page table lock(s) are
> - * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
> - * and the mode cannot be used in interrupt context.
> + * held, but for kernel PTE updates, no lock is held). The mode is disabled in
> + * interrupt context and calls to the lazy_mmu API have no effect.
> + * Nesting is not permitted.

Right - nesting is still not not permitted.

>   */>  #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>  static inline void lazy_mmu_mode_enable(void)
>  {
> +	if (in_interrupt())
> +		return;
> +
>  	arch_enter_lazy_mmu_mode();
>  }
>  
>  static inline void lazy_mmu_mode_disable(void)
>  {
> +	if (in_interrupt())
> +		return;
> +
>  	arch_leave_lazy_mmu_mode();
>  }
>  
>  static inline void lazy_mmu_mode_pause(void)
>  {
> +	if (in_interrupt())
> +		return;
> +
>  	arch_leave_lazy_mmu_mode();
>  }
>  
>  static inline void lazy_mmu_mode_resume(void)
>  {
> +	if (in_interrupt())
> +		return;
> +
>  	arch_enter_lazy_mmu_mode();
>  }
>  #else

LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

