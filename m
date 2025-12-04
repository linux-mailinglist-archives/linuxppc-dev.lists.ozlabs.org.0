Return-Path: <linuxppc-dev+bounces-14593-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E577ACA2930
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 07:53:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMQFB2sdwz2xQC;
	Thu, 04 Dec 2025 17:53:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764831182;
	cv=none; b=ojPIgIgtiK4HKMEEA1AV3ATh0EdPU/kOgtIrH9Cf3AlD3A30W+qbZfEjNFC0cS4kw7N/ACpUxE0vgJ8leF6rknwmmAYr+mMBCfX/mmMM93S+GMhVf+s6tK/T9m/PcELBs218lSS9CDbeWJ8nXE8+ocoER/8jP03ispo5+8v732flIgh0BuHFb9MklxGDLH3rSiqYUyOceEFK6tSQKOJrjHuglICIYqCDWKMkNSME3VUFuOqHCjDyRgA6KnetCBklIsq0J9DMypzeWXJ23Ka/MEXoKC4nsjrPTHvgseUqLnkb/Evam6RRGcc/AAO12gyUjmgv71nTfKtE7oW0eyrwEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764831182; c=relaxed/relaxed;
	bh=RqFa2b+K3fcKtemSHIfEKXbku0CciHAsPdEHPf8F7c8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AdQF81PrIArpJYF0tjeWXNSkqh/oOxvhXRSOwpYaBbu0o84HS1HG2sTYvPvWv47Ppuc3gMaNLMFq6T3UspcYaYzAPfrqGu0DeJ42eL5+PwxJoF6fVzbBqvopttss2qJR4yfpehFUL5Gr6DTMYpOTkkMzipnpd6RU34G20/pPFKOnjJRN81j0hOGXy+Gm/Qrs6zOSqt/JlOOY9J9uoBkUDF3NcQleaweO7UmMMRfh2nnP7VkRtzujuJtpc95fAAq3zBrAePZxcDRpNfcTkm+yybBtpNNO7ssWUDDV9dHOuiHd3gim1LuB1NY94XZgi6BaZFqkqM7LHssIWbDI9aXFEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMQF90Mklz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Dec 2025 17:52:58 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEABB339;
	Wed,  3 Dec 2025 22:52:18 -0800 (PST)
Received: from [10.164.18.78] (unknown [10.164.18.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C0333F59E;
	Wed,  3 Dec 2025 22:52:16 -0800 (PST)
Message-ID: <89ecddb7-83ee-427b-823b-984204939ecf@arm.com>
Date: Thu, 4 Dec 2025 12:22:13 +0530
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
Subject: Re: [PATCH v5 09/12] arm64: mm: replace TIF_LAZY_MMU with
 in_lazy_mmu_mode()
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
 <20251124132228.622678-10-kevin.brodsky@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251124132228.622678-10-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 24/11/25 6:52 PM, Kevin Brodsky wrote:
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode. As a result we no longer need a TIF flag for that purpose -
> let's use the new in_lazy_mmu_mode() helper instead.
> 
> The explicit check for in_interrupt() is no longer necessary either
> as in_lazy_mmu_mode() always returns false in interrupt context.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h     | 19 +++----------------
>  arch/arm64/include/asm/thread_info.h |  3 +--
>  2 files changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index a7d99dee3dc4..dd7ed653a20d 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -62,28 +62,16 @@ static inline void emit_pte_barriers(void)
>  
>  static inline void queue_pte_barriers(void)
>  {
> -	unsigned long flags;
> -
> -	if (in_interrupt()) {
> -		emit_pte_barriers();
> -		return;
> -	}
> -
> -	flags = read_thread_flags();
> -
> -	if (flags & BIT(TIF_LAZY_MMU)) {
> +	if (in_lazy_mmu_mode()) {
>  		/* Avoid the atomic op if already set. */
> -		if (!(flags & BIT(TIF_LAZY_MMU_PENDING)))
> +		if (!test_thread_flag(TIF_LAZY_MMU_PENDING))

A small nit - will it be better not to use test_thread_flag() here and just
keep checking flags like earlier to avoid non-related changes. Although not
a problem TBH.

>  			set_thread_flag(TIF_LAZY_MMU_PENDING);
>  	} else {
>  		emit_pte_barriers();
>  	}
>  }
>  
> -static inline void arch_enter_lazy_mmu_mode(void)
> -{
> -	set_thread_flag(TIF_LAZY_MMU);
> -}
> +static inline void arch_enter_lazy_mmu_mode(void) {}
>  
>  static inline void arch_flush_lazy_mmu_mode(void)
>  {
> @@ -94,7 +82,6 @@ static inline void arch_flush_lazy_mmu_mode(void)
>  static inline void arch_leave_lazy_mmu_mode(void)
>  {
>  	arch_flush_lazy_mmu_mode();
> -	clear_thread_flag(TIF_LAZY_MMU);
>  }
>  
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
> index f241b8601ebd..4ff8da0767d9 100644
> --- a/arch/arm64/include/asm/thread_info.h
> +++ b/arch/arm64/include/asm/thread_info.h
> @@ -84,8 +84,7 @@ void arch_setup_new_exec(void);
>  #define TIF_SME_VL_INHERIT	28	/* Inherit SME vl_onexec across exec */
>  #define TIF_KERNEL_FPSTATE	29	/* Task is in a kernel mode FPSIMD section */
>  #define TIF_TSC_SIGSEGV		30	/* SIGSEGV on counter-timer access */
> -#define TIF_LAZY_MMU		31	/* Task in lazy mmu mode */
> -#define TIF_LAZY_MMU_PENDING	32	/* Ops pending for lazy mmu mode exit */
> +#define TIF_LAZY_MMU_PENDING	31	/* Ops pending for lazy mmu mode exit */
>  
>  #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
>  #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)

LGTM.

Hence with or without the 'flags' changes in queue_pte_barriers() above.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

