Return-Path: <linuxppc-dev+bounces-13938-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97192C40966
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 16:29:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d32zb37WGz3btL;
	Sat,  8 Nov 2025 02:29:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762529371;
	cv=none; b=BigbA8iaq1yh5FJaMwTvPrCYixxNGujTI19SKi15JsXBYE7PclsKyxoN7sYPtWeA1L7rEIhR6DOOwPiePN9ilqgRVoKOXCTFx+Zh0KSpVleuBczTfPKS2sBezY3YkXyfl0QC2nsqruVH3O5LH1l+Az/UoOsV88zAfgx8xJmNdXfNuK2tThdPj9e8MQYW8FNWj1E/4FhLkGbBgcu+iTjV3erGv0vRNupchviHs85OPPBMwGEJtrh7KCpoJ6XtQXbDPP18RNIeGcvHYT+6POUilhwPVE0O+FF8jGwVFxbK++pcqa7qfeTa7fOycv4BCaKKVfQa+4H+1R9R7PoCuY+v3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762529371; c=relaxed/relaxed;
	bh=CbzUp7HLI49Fg8paD04i5ybzsDse9dFElebqMJiK6fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=meJSwpFL5OjzLyROzTea8zhK6WsESwoDzl0wcXca3DeRZywd1VLZsOzNTnPMMm1n8wfLH5FuALEOXXofOQGCFOq1Ehy4B8qKnG47T6KHSLnUCa5NKx0kghdwtTiFV1UGf7wU4vZFivPSpGjH/G32bKDA2xlIsZ+DSilTDwtcnv2nT5wjE0zYUqtmtLIVh2Ei/wtjVwxlBqjkYEyyu7fqg+RrXRwtuPXYTYhR2V7LYAe13O+yvu4oBKxco9rRoYtXFunz2ERjtJZMN9Hipt4jCnbtF7Rkb5+HkXw44s359AV+6lEZv7l/2Xy1akCzMSghLH3hSmjebQhwF9/rKKQ5GQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d32zZ4f3zz2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 02:29:30 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55F981515;
	Fri,  7 Nov 2025 07:28:51 -0800 (PST)
Received: from [10.57.86.134] (unknown [10.57.86.134])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C13D3F694;
	Fri,  7 Nov 2025 07:28:54 -0800 (PST)
Message-ID: <06026ad7-fb85-4a78-ba70-7fa1f5bca0cd@arm.com>
Date: Fri, 7 Nov 2025 15:28:53 +0000
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
Subject: Re: [PATCH v4 08/12] arm64: mm: replace TIF_LAZY_MMU with
 in_lazy_mmu_mode()
Content-Language: en-GB
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
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-9-kevin.brodsky@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20251029100909.3381140-9-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 29/10/2025 10:09, Kevin Brodsky wrote:
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode. As a result we no longer need a TIF flag for that purpose -
> let's use the new in_lazy_mmu_mode() helper instead.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h     | 16 +++-------------
>  arch/arm64/include/asm/thread_info.h |  3 +--
>  2 files changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 535435248923..61ca88f94551 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -62,30 +62,21 @@ static inline void emit_pte_barriers(void)
>  
>  static inline void queue_pte_barriers(void)
>  {
> -	unsigned long flags;
> -
>  	if (in_interrupt()) {
>  		emit_pte_barriers();
>  		return;
>  	}
>  
> -	flags = read_thread_flags();
> -
> -	if (flags & BIT(TIF_LAZY_MMU)) {
> -		/* Avoid the atomic op if already set. */
> -		if (!(flags & BIT(TIF_LAZY_MMU_PENDING)))
> -			set_thread_flag(TIF_LAZY_MMU_PENDING);
> -	} else {
> +	if (in_lazy_mmu_mode())
> +		test_and_set_thread_flag(TIF_LAZY_MMU_PENDING);

This removes the optimization to only do the atomic set operation if the bit is
not already set. I think that should remain.

> +	else
>  		emit_pte_barriers();
> -	}
>  }
>  
>  static inline void arch_enter_lazy_mmu_mode(void)
>  {
>  	if (in_interrupt())
>  		return;

Why are you keeping this test? Surely it can go?

> -
> -	set_thread_flag(TIF_LAZY_MMU);
>  }
>  
>  static inline void arch_flush_lazy_mmu_mode(void)
> @@ -103,7 +94,6 @@ static inline void arch_leave_lazy_mmu_mode(void)
>  		return;
>  
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


