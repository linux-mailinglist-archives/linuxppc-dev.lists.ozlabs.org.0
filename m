Return-Path: <linuxppc-dev+bounces-17707-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MxILhn2p2lFnAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17707-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:06:33 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F491FD2F4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:06:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQmxf1Qbxz3btf;
	Wed, 04 Mar 2026 20:06:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772615190;
	cv=none; b=EsVjZDNqQ5eN0oYNQ+fPse5Xsb4lNpX2NI27ZMxWXDfTmmZrRzPhInrdJTMnj+wN3x6hsSlVPfLW6vczJnqKqVNaRobHSvJ5IJwaLHUxa6RP9N6n2DkWh4noSOqNrvmCISnPdTqllipmvrbdxqmbFq/IrunO8dLWQUFbmgJHA95Uio/tzM00cVio6CI/mwf+uajnA2thx1pMrzXT8hmvzU0xFUf2VRoyfqrV9oZVE57WYUyMA6FlKwPw0bqkrCqfjvV2Q46IztDs7+eHfRpAmsv/ud5BLBhvGXVqlaaDET5X6WFLeIakrQmmiclw8XZY5AaV8huuavfzPvWRl2wMzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772615190; c=relaxed/relaxed;
	bh=KH00A08cR6IT6Hz5UznDJTJn1MmPOQBn/jw8icu2ijk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dmV/4WlEF1bPUfPDmaQr4HYuG9N/rUPB8vYSZ0EjXjDtle0dEeRtzC1XzIpj9GhJMfLrb4OY6cJFQ5Yo3K0NKydwewtCr/3vOgIs7fvgVsqv+VthRGWeGPde7OsNmRdMEwZ2qRbP7IWlIJp1EiujiggL1AcXGoqa52ymfdn+azXQlekkgoVfibubIXzwjQ+cPvxQCQU2BYQl06KFf3vZoFHxiODpj3z8Yd6huDht41JpC7PlseWwihBoedSKHjeFi/4yTG9xXM4Pgy1sTLelzvOETYX6kTdImQsaWovSvNUn4wjj0h3/UT9ix2EMrzaCka8aDNqG8PdxgkVegdmZ4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UsR1FElG; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UsR1FElG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQmxd1TB9z2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 20:06:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0091F600AD;
	Wed,  4 Mar 2026 09:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2965C19423;
	Wed,  4 Mar 2026 09:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772615186;
	bh=oUs+v1pdPjy3Vi0K/gUT11tHnZaaGcGTCSW7iS5qd5c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UsR1FElGhcfLEwKM4L2dEwVCLrCJVas+KWIXGDqKHGtrF9DpFsmG6pAZcxKxWjJKD
	 xIWD8Uwz0f42/a6yLfrLl1ydbhT2oZx82t8APlW4VYUiWftR5tUxFxVM64bgsXmnHG
	 NnUz52ZG5NdnAB5hyio68eFbVHvPJ1TU7GakCH5KQj+AFk8vK73ySXZWbHDGQFI6zZ
	 NQl7H6c0COqGWdAi337BATD7szV/cxBTWD920Il67e6NPoGuxF7scMXNG5vqD3mumv
	 wx6yZUZf39t03Fgntf5kFZs7M0DENuAR6rnbRxsdExp63C+dZBsOSs8YtAk0INByJ8
	 akagilJuaf8AQ==
Message-ID: <5103eb9a-4a50-4f3b-9bcf-f66ed396e3ed@kernel.org>
Date: Wed, 4 Mar 2026 10:06:22 +0100
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
Subject: Re: [RFC v1 08/10] powerpc: book3s64: Rename tlbie_lpid_va to
 tlbie_va_lpid
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, Hugh Dickins <hughd@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>
References: <cover.1772013273.git.ritesh.list@gmail.com>
 <91a6be6c26145dd2ce94d6c1f65aae86d424857d.1772013273.git.ritesh.list@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <91a6be6c26145dd2ce94d6c1f65aae86d424857d.1772013273.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: D2F491FD2F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17707-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ritesh.list@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-mm@kvack.org,m:hughd@google.com,m:akpm@linux-foundation.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:aneesh.kumar@kernel.org,m:venkat88@linux.ibm.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kvack.org,google.com,linux-foundation.org,linux.ibm.com,gmail.com,kernel.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action



Le 25/02/2026 à 12:04, Ritesh Harjani (IBM) a écrit :
> In previous patch we renamed tlbie_va_lpid functions to
> tlbie_va_pid_lpid() since those were working with PIDs as well.
> This then allows us to rename tlbie_lpid_va to tlbie_va_lpid, which
> finally makes all the tlbie function naming consistent.
> 
> No functional change in this patch.
> 
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   arch/powerpc/mm/book3s64/radix_tlb.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
> index 1adf20798ca6..6ce94eaefc1b 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -185,7 +185,7 @@ static __always_inline void __tlbie_va(unsigned long va, unsigned long pid,
>   	trace_tlbie(0, 0, rb, rs, ric, prs, r);
>   }
>   
> -static __always_inline void __tlbie_lpid_va(unsigned long va, unsigned long lpid,
> +static __always_inline void __tlbie_va_lpid(unsigned long va, unsigned long lpid,
>   					    unsigned long ap, unsigned long ric)
>   {
>   	unsigned long rb,rs,prs,r;
> @@ -249,17 +249,17 @@ static inline void fixup_tlbie_pid(unsigned long pid)
>   	}
>   }
>   
> -static inline void fixup_tlbie_lpid_va(unsigned long va, unsigned long lpid,
> +static inline void fixup_tlbie_va_lpid(unsigned long va, unsigned long lpid,
>   				       unsigned long ap)
>   {
>   	if (cpu_has_feature(CPU_FTR_P9_TLBIE_ERAT_BUG)) {
>   		asm volatile("ptesync": : :"memory");
> -		__tlbie_lpid_va(va, 0, ap, RIC_FLUSH_TLB);
> +		__tlbie_va_lpid(va, 0, ap, RIC_FLUSH_TLB);
>   	}
>   
>   	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
>   		asm volatile("ptesync": : :"memory");
> -		__tlbie_lpid_va(va, lpid, ap, RIC_FLUSH_TLB);
> +		__tlbie_va_lpid(va, lpid, ap, RIC_FLUSH_TLB);
>   	}
>   }
>   
> @@ -278,7 +278,7 @@ static inline void fixup_tlbie_lpid(unsigned long lpid)
>   
>   	if (cpu_has_feature(CPU_FTR_P9_TLBIE_STQ_BUG)) {
>   		asm volatile("ptesync": : :"memory");
> -		__tlbie_lpid_va(va, lpid, mmu_get_ap(MMU_PAGE_64K), RIC_FLUSH_TLB);
> +		__tlbie_va_lpid(va, lpid, mmu_get_ap(MMU_PAGE_64K), RIC_FLUSH_TLB);
>   	}
>   }
>   
> @@ -529,14 +529,14 @@ static void do_tlbiel_va_range(void *info)
>   				    t->psize, t->also_pwc);
>   }
>   
> -static __always_inline void _tlbie_lpid_va(unsigned long va, unsigned long lpid,
> +static __always_inline void _tlbie_va_lpid(unsigned long va, unsigned long lpid,
>   			      unsigned long psize, unsigned long ric)
>   {
>   	unsigned long ap = mmu_get_ap(psize);
>   
>   	asm volatile("ptesync": : :"memory");
> -	__tlbie_lpid_va(va, lpid, ap, ric);
> -	fixup_tlbie_lpid_va(va, lpid, ap);
> +	__tlbie_va_lpid(va, lpid, ap, ric);
> +	fixup_tlbie_va_lpid(va, lpid, ap);
>   	asm volatile("eieio; tlbsync; ptesync": : :"memory");
>   }
>   
> @@ -1147,7 +1147,7 @@ void radix__flush_tlb_lpid_page(unsigned int lpid,
>   {
>   	int psize = radix_get_mmu_psize(page_size);
>   
> -	_tlbie_lpid_va(addr, lpid, psize, RIC_FLUSH_TLB);
> +	_tlbie_va_lpid(addr, lpid, psize, RIC_FLUSH_TLB);
>   }
>   EXPORT_SYMBOL_GPL(radix__flush_tlb_lpid_page);
>   


