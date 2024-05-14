Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAD48C4FDD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 12:54:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lhIZOkwa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdtX01q2fz3cF6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 20:54:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lhIZOkwa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdtWG43tGz2yvs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2024 20:53:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D636361228;
	Tue, 14 May 2024 10:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D3CC32781;
	Tue, 14 May 2024 10:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715684008;
	bh=aU1RwmVoZA1OHt1xQFp3L8EH8NSGi/JkZ+0wsLin0kw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lhIZOkwal34GZ1VVw0JrpLrXyv1VHEeYDo7S0XiBZcMN+jqcjxV7nvHqVk5nayOMj
	 EKELqxj/mmmPo/LD+JMHU5hOx1j7KnlWHfKYZjk9M48EwXTwIUCykA5kqnxgqQ+Ove
	 /2iBh+sMiwkGQFBn66lSDnO/sYhBjd/W5J4QQFnK47WLC8cqDl6YIKDYqNI/FKbdxZ
	 qDhKMClYu5SM0jfnrDM/qR6CN8hyjxZpu++QVR0oGKgVXZXCaEV89eWrwYAViqWK45
	 d1gCWgg4KHUukpzf/XAGOKd9fhBrytEaVnlwbMB/GJNI9Ri4QCW5p7Qtf37let0DDk
	 Qw3DeZDcZuFZg==
Date: Tue, 14 May 2024 16:20:04 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Gautam Menghani <gautam@linux.ibm.com>
Subject: Re: [PATCH] arch/powerpc: Remove the definition of unused cede
 function
Message-ID: <vfx2z4dn6afpkl4z7ygewadw7mohfd7l3tfazdya4sbxniurkg@vrubq25slkvs>
References: <20240514100507.271681-1-gautam@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240514100507.271681-1-gautam@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 14, 2024 at 03:35:03PM GMT, Gautam Menghani wrote:
> Remove extended_cede_processor() definition as it has no callers since
> commit 48f6e7f6d948("powerpc/pseries: remove cede offline state for CPUs")

extended_cede_processor() was added in commit 69ddb57cbea0 
("powerpc/pseries: Add extended_cede_processor() helper function."), 
which also added [get|set]_cede_latency_hint(). Those can also be 
removed if extended_cede_processor() is no longer needed.

- Naveen

> 
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/plpar_wrappers.h | 18 ------------------
>  1 file changed, 18 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
> index b3ee44a40c2f..6431fa1e1cb1 100644
> --- a/arch/powerpc/include/asm/plpar_wrappers.h
> +++ b/arch/powerpc/include/asm/plpar_wrappers.h
> @@ -37,24 +37,6 @@ static inline long cede_processor(void)
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
