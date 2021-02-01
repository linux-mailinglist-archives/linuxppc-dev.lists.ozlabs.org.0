Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDE130A74F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 13:13:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTn0K3pR4zDqqs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 23:13:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=GtLZOyQe; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTmwS4krjzDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Feb 2021 23:09:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=SiaLfQzlU2jX5BxH4Z//DJZYI1eBlVSulAEY9UDx0pA=; b=GtLZOyQeBhsuT6FFJVSy2v+2/Z
 xTAjqheyRljSkGm6MOLQ/XFlBt32MvLm5Oj+VpOuBidvgZZPsE6afaRelKYBXw0o8a22K5nNtdDDa
 vVJ30anrh4leKFwbHLLyZSlV0wFdPcmO3PlGEXZOULCCjZPjnJ81ko+P5VcGbvKXst03rNdPj3HOX
 3QB1zut7ZICr0P9VqNFHgpTVIHHZ49MKpTzAg51X+STHwPx7zzkTuH6FNXFISnH3DMn0LUGxVzg+o
 4vgV24jt+j0kP/vJ+vWCcNIrimaKTTKX+NGQxnY0cahn/jFaudeICLOtnn65GwuWEDvw5FPB5mnQD
 /v/Vxdmw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6Y1Y-0000Iz-RY; Mon, 01 Feb 2021 12:09:45 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 6B0C83011E6;
 Mon,  1 Feb 2021 13:09:43 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 5349921A2F1E3; Mon,  1 Feb 2021 13:09:43 +0100 (CET)
Date: Mon, 1 Feb 2021 13:09:43 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nadav Amit <nadav.amit@gmail.com>
Subject: Re: [RFC 11/20] mm/tlb: remove arch-specific tlb_start/end_vma()
Message-ID: <YBfvh1Imz6RRTUDV@hirez.programming.kicks-ass.net>
References: <20210131001132.3368247-1-namit@vmware.com>
 <20210131001132.3368247-12-namit@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210131001132.3368247-12-namit@vmware.com>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org,
 x86@kernel.org, Yu Zhao <yuzhao@google.com>, linuxppc-dev@lists.ozlabs.org,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Nick Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 Nadav Amit <namit@vmware.com>, linux-csky@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 30, 2021 at 04:11:23PM -0800, Nadav Amit wrote:

> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> index 427bfcc6cdec..b97136b7010b 100644
> --- a/include/asm-generic/tlb.h
> +++ b/include/asm-generic/tlb.h
> @@ -334,8 +334,8 @@ static inline void __tlb_reset_range(struct mmu_gather *tlb)
>  
>  #ifdef CONFIG_MMU_GATHER_NO_RANGE
>  
> -#if defined(tlb_flush) || defined(tlb_start_vma) || defined(tlb_end_vma)
> -#error MMU_GATHER_NO_RANGE relies on default tlb_flush(), tlb_start_vma() and tlb_end_vma()
> +#if defined(tlb_flush)
> +#error MMU_GATHER_NO_RANGE relies on default tlb_flush()
>  #endif
>  
>  /*
> @@ -362,10 +362,6 @@ static inline void tlb_end_vma(struct mmu_gather *tlb, struct vm_area_struct *vm
>  
>  #ifndef tlb_flush
>  
> -#if defined(tlb_start_vma) || defined(tlb_end_vma)
> -#error Default tlb_flush() relies on default tlb_start_vma() and tlb_end_vma()
> -#endif

#ifdef CONFIG_ARCH_WANT_AGGRESSIVE_TLB_FLUSH_BATCHING
#error ....
#endif

goes here...


>  static inline void tlb_end_vma(struct mmu_gather *tlb, struct vm_area_struct *vma)
>  {
>  	if (tlb->fullmm)
>  		return;
>  
> +	if (IS_ENABLED(CONFIG_ARCH_WANT_AGGRESSIVE_TLB_FLUSH_BATCHING))
> +		return;

Also, can you please stick to the CONFIG_MMU_GATHER_* namespace?

I also don't think AGRESSIVE_FLUSH_BATCHING quite captures what it does.
How about:

	CONFIG_MMU_GATHER_NO_PER_VMA_FLUSH

?


