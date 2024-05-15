Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA088C6028
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 07:29:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L408mwvU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfMHR0jNtz3blN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 15:29:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L408mwvU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfMGh1LHkz30WS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 15:29:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4531BCE0A3C;
	Wed, 15 May 2024 05:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E080FC2BD11;
	Wed, 15 May 2024 05:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715750950;
	bh=KYV3IyS77KkYiDrdE4Rp2al8luhE12DTz/ap5AMIVKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L408mwvUMOeIe8NIh1DXQD4E9z4z9dV1uQCbEeR/h5oHuaALVr3+KyJVOuWQ1fDBv
	 5kkZKC1c57bnpNb2BZfCzwdB/xxsMnOcn+5Af2yfMOKAXhg7+DI++l09N08TleJaje
	 o86OlC881cWpA1QS5wvrBKBmm0GcnqaWCjpTUHUYwkPKrk47JlfQgJYKCHQT1Ijj9/
	 iMJmkKXjnBF3qYkPlFQF+/eZkIQiueMYbkM2bu5t8ifD0Je6SgKnzPgXjxbt0ZpugZ
	 uDegFDq8prIXnEv2AgBx6drbwQsWJnPLerYGysi8SOo1Sw+qMiabXGeDYnAh54KDZa
	 WJu6guhn66vnQ==
Date: Wed, 15 May 2024 10:53:42 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Gautam Menghani <gautam@linux.ibm.com>
Subject: Re: [PATCH v2] arch/powerpc: Remove unused cede related functions
Message-ID: <cdzbxdhl2cj754m2erxdt5wwsztdsvrjvhq54szow4ufst44j7@bx2i4w7hpo5v>
References: <20240514132457.292865-1-gautam@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240514132457.292865-1-gautam@linux.ibm.com>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com, aboorvad@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 14, 2024 at 06:54:55PM GMT, Gautam Menghani wrote:
> Remove extended_cede_processor() and its helpers as
> extended_cede_processor() has no callers since
> commit 48f6e7f6d948("powerpc/pseries: remove cede offline state for CPUs")
> 
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
> v1 -> v2:
> 1. Remove helpers of extended_cede_processor()

Acked-by: Naveen N Rao <naveen@kernel.org>

> 
>  arch/powerpc/include/asm/plpar_wrappers.h | 28 -----------------------
>  1 file changed, 28 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
> index b3ee44a40c2f..71648c126970 100644
> --- a/arch/powerpc/include/asm/plpar_wrappers.h
> +++ b/arch/powerpc/include/asm/plpar_wrappers.h
> @@ -18,16 +18,6 @@ static inline long poll_pending(void)
>  	return plpar_hcall_norets(H_POLL_PENDING);
>  }
>  
> -static inline u8 get_cede_latency_hint(void)
> -{
> -	return get_lppaca()->cede_latency_hint;
> -}
> -
> -static inline void set_cede_latency_hint(u8 latency_hint)
> -{
> -	get_lppaca()->cede_latency_hint = latency_hint;
> -}
> -
>  static inline long cede_processor(void)
>  {
>  	/*
> @@ -37,24 +27,6 @@ static inline long cede_processor(void)
>  	return plpar_hcall_norets_notrace(H_CEDE);
>  }
>  
> -static inline long extended_cede_processor(unsigned long latency_hint)
> -{
> -	long rc;
> -	u8 old_latency_hint = get_cede_latency_hint();
> -
> -	set_cede_latency_hint(latency_hint);
> -
> -	rc = cede_processor();
> -
> -	/* Ensure that H_CEDE returns with IRQs on */
> -	if (WARN_ON(IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG) && !(mfmsr() & MSR_EE)))
> -		__hard_irq_enable();
> -
> -	set_cede_latency_hint(old_latency_hint);
> -
> -	return rc;
> -}
> -
>  static inline long vpa_call(unsigned long flags, unsigned long cpu,
>  		unsigned long vpa)
>  {
> -- 
> 2.45.0
> 
