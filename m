Return-Path: <linuxppc-dev+bounces-9814-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7296CAE9EC8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 15:30:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSfgx3qFrz2xYl;
	Thu, 26 Jun 2025 23:30:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750944621;
	cv=none; b=Vd5EPKdDS62f2wsmiuTeiTzSa2cqjqMvqifSuGzMbvCBkkuNyV+SY0SYRM1IV46WAccU4R9Us8urVe1RY1BR6JPLazZdS/1rp2EYu9Awka6+XZfg0cyW+QAEYQwCCn8N9gGqmZ8rBSZn4mMaYPyL2oG1PTALWAcbJ/xPg0As5pn4Wkyv0ripAzTlczsTQI57a3/swiMYirW05yXBKPaCWY2i8Wz3t0aGa3jdOKKrhnnnODcJgGd50P7emfQ4z6KbLe8J9e0fFaWkdCKb2a5NOYJuiXF0swtjY3Yq+pN/lyubY3M4d7BROs2oX70MmLkF7oBm/ftSpdW+/OcPJFVEDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750944621; c=relaxed/relaxed;
	bh=p1Vrlz3g9lucIoHJorqCas+zLBoRLvQnyL0+A+0WnpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQB4IIfwq5xJCTdeIFTm4FJF5GHxrCtnfeiRo8i+Kh/MypDo4JRi/dHr3nKJSDd5wlJfqzhR7CB/he4Xq4iEddnhA2l3AhFwPMbPKnzW3ecliZyuPH1JytAJWj6XysRD4AZgK5iLvyVpkUVz/06ffYdyOXnN6fIliCDnqhv9ouxOBcA2CGX497l6QItl/ctOTgu29aFzd+S1W8LetKYcfwTrFrBAwSPmCkI1Wx19VUFv8wLny54Zk9s4+p7VRHYACjs40ynMtG+l4nbQRNA4E4NXuiwyrHJS5y+aT9dbLxq10zXwm0KGTXv6QbK5yBgcHWizq6sSA/OF9muUPDrCNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSfgp0TQZz2xRw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 23:30:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=p1Vrlz3g9lucIoHJorqCas+zLBoRLvQnyL0+A+0WnpA=; b=mBNUpeDFYHG7orfAPa6AC3yITs
	wxmxpTh9AObxBPIaUX4pFb8wE8AnO8c/Ndl23AbEuOrgwlCO6RDGwY9LUiqizTNHkDoI9Ba+0Wgj0
	pX7uLGlriKUYuHwiofMoZiktvWNgyLJyHYp2NhGz5Vprhr18X9IvHfEp22IACOrrf4gpKIotChlGj
	imiUGNU/Z1GhPgSWoqhkp6W93i9q1tqHFWYzVQog0c7J4Qaj9QkShWqygMq6vv6Dv3w4ZgG5CZJ8m
	IkpBbwX/8k7/3PaT7NRHYC9Gv6SQY4hlDJ2hX1sQHoXxFGE5cYATi5pWrT1Hi3oOxmDMXD08EG2Ez
	N9J4GBiA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUmfg-0000000Biam-20O3;
	Thu, 26 Jun 2025 13:29:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5644930BDA9; Thu, 26 Jun 2025 15:29:43 +0200 (CEST)
Date: Thu, 26 Jun 2025 15:29:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
	dvyukov@google.com, vincenzo.frascino@arm.com,
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
	kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
	dave.hansen@linux.intel.com, luto@kernel.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	chris@zankel.net, jcmvbkbc@gmail.com, akpm@linux-foundation.org,
	guoweikang.kernel@gmail.com, geert@linux-m68k.org, rppt@kernel.org,
	tiwei.btw@antgroup.com, richard.weiyang@gmail.com,
	benjamin.berg@intel.com, kevin.brodsky@arm.com,
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH 5/9] kasan/loongarch: call kasan_init_generic in
 kasan_init
Message-ID: <20250626132943.GJ1613200@noisy.programming.kicks-ass.net>
References: <20250625095224.118679-1-snovitoll@gmail.com>
 <20250625095224.118679-6-snovitoll@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625095224.118679-6-snovitoll@gmail.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 25, 2025 at 02:52:20PM +0500, Sabyrzhan Tasbolatov wrote:
> Call kasan_init_generic() which enables the static flag
> to mark generic KASAN initialized, otherwise it's an inline stub.
> 
> Replace `kasan_arch_is_ready` with `kasan_enabled`.
> Delete the flag `kasan_early_stage` in favor of the global static key
> enabled via kasan_enabled().
> 
> printk banner is printed earlier right where `kasan_early_stage`
> was flipped, just to keep the same flow.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> ---
>  arch/loongarch/include/asm/kasan.h | 7 -------
>  arch/loongarch/mm/kasan_init.c     | 7 ++-----
>  2 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/kasan.h b/arch/loongarch/include/asm/kasan.h
> index 7f52bd31b9d..b0b74871257 100644
> --- a/arch/loongarch/include/asm/kasan.h
> +++ b/arch/loongarch/include/asm/kasan.h
> @@ -66,7 +66,6 @@
>  #define XKPRANGE_WC_SHADOW_OFFSET	(KASAN_SHADOW_START + XKPRANGE_WC_KASAN_OFFSET)
>  #define XKVRANGE_VC_SHADOW_OFFSET	(KASAN_SHADOW_START + XKVRANGE_VC_KASAN_OFFSET)
>  
> -extern bool kasan_early_stage;
>  extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
>  
>  #define kasan_mem_to_shadow kasan_mem_to_shadow
> @@ -75,12 +74,6 @@ void *kasan_mem_to_shadow(const void *addr);
>  #define kasan_shadow_to_mem kasan_shadow_to_mem
>  const void *kasan_shadow_to_mem(const void *shadow_addr);
>  
> -#define kasan_arch_is_ready kasan_arch_is_ready
> -static __always_inline bool kasan_arch_is_ready(void)
> -{
> -	return !kasan_early_stage;
> -}
> -
>  #define addr_has_metadata addr_has_metadata
>  static __always_inline bool addr_has_metadata(const void *addr)
>  {
> diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_init.c
> index d2681272d8f..cf8315f9119 100644
> --- a/arch/loongarch/mm/kasan_init.c
> +++ b/arch/loongarch/mm/kasan_init.c
> @@ -40,11 +40,9 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>  #define __pte_none(early, pte) (early ? pte_none(pte) : \
>  ((pte_val(pte) & _PFN_MASK) == (unsigned long)__pa(kasan_early_shadow_page)))
>  
> -bool kasan_early_stage = true;
> -
>  void *kasan_mem_to_shadow(const void *addr)
>  {
> -	if (!kasan_arch_is_ready()) {
> +	if (!kasan_enabled()) {
>  		return (void *)(kasan_early_shadow_page);
>  	} else {
>  		unsigned long maddr = (unsigned long)addr;
> @@ -298,7 +296,7 @@ void __init kasan_init(void)
>  	kasan_populate_early_shadow(kasan_mem_to_shadow((void *)VMALLOC_START),
>  					kasan_mem_to_shadow((void *)KFENCE_AREA_END));
>  
> -	kasan_early_stage = false;
> +	kasan_init_generic();
>  
>  	/* Populate the linear mapping */
>  	for_each_mem_range(i, &pa_start, &pa_end) {
> @@ -329,5 +327,4 @@ void __init kasan_init(void)
>  
>  	/* At this point kasan is fully initialized. Enable error messages */
>  	init_task.kasan_depth = 0;
> -	pr_info("KernelAddressSanitizer initialized.\n");
>  }

This one is weird because its the only arch that does things after
marking early_state false.

Is that really correct, or should kasan_init_generic() be last, like all
the other architectures?

Also, please move init_task.kasan_depth = 0 into the generic thing.
ARM64 might have fooled you with the wrapper function, but they all do
this right before that pr_info you're taking out.

