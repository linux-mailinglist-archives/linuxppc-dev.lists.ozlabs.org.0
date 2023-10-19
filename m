Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B64027CEEAD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 06:34:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Cujzwvfn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9vxV4SG7z3cnK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 15:34:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Cujzwvfn;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9vwd3BxLz3c5j
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 15:33:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697690000;
	bh=mQ5XTmp0WZ0EPEWae5zMXHWuVc77FJWFD50HtSF9EaI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CujzwvfnVGcmNcNeKFrYx6qEi5pDAqQHqLSjd6yLRttlhWQkGZPxi07OX41KdzdwM
	 JLA1ZtEvBvaabEMYPv5rZIOjMpbngy7R3ZsW6TPHg9HB9DkwCnwug0XuXf5TkItSGQ
	 GdVHU5R9HGkHZuZ7aTdMd7atInPfGaSWrSvFsvRCBFjO3QQjUEqPwVnzalQVFpE9c0
	 fIypi4XeC3yp6pHRx7hcOu0+2cIPcNqvK5MdSbCDEbU48pPnyQt1hvibwtnsoQGt7k
	 GsOnILAHORGGJAZ6d+4FhTLTfkOUOaOUebYwN+KxUAxXPDm3RqcjUo75n9K24fSBCD
	 qNEKuTArwq4Mw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S9vwb6RlWz4xZS;
	Thu, 19 Oct 2023 15:33:19 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/6] powerpc/smp: Cache CPU has Asymmetric SMP
In-Reply-To: <20231018163751.2423181-2-srikar@linux.vnet.ibm.com>
References: <20231018163751.2423181-1-srikar@linux.vnet.ibm.com>
 <20231018163751.2423181-2-srikar@linux.vnet.ibm.com>
Date: Thu, 19 Oct 2023 15:33:16 +1100
Message-ID: <87y1fz5j03.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, "ndesaulniers@google.com" <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> Currently cpu feature flag is checked whenever powerpc_smt_flags gets
> called. This is an unnecessary overhead. CPU_FTR_ASYM_SMT is set based
> on the processor and all processors will either have this set or will
> have it unset.

The cpu_has_feature() test is implemented with a static key.

So AFAICS this is just replacing one static key with another?

I see that you use the new static key in subsequent patches. But
couldn't those just use the existing cpu feature test?

Anyway I'd be interested to see how the generated code differs
before/after this.

cheers

> Hence only check for the feature flag once and cache it to be used
> subsequently. This commit will help avoid a branch in powerpc_smt_flags
>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
> Changelog:
> v1->v2: Using static keys instead of a variable.
> Using pr_info_once instead of printk
>
>  arch/powerpc/kernel/smp.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 5826f5108a12..37c41297c9ce 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -988,18 +988,16 @@ static int __init init_thread_group_cache_map(int cpu, int cache_property)
>  }
>  
>  static bool shared_caches;
> +DEFINE_STATIC_KEY_FALSE(powerpc_asym_packing);
>  
>  #ifdef CONFIG_SCHED_SMT
>  /* cpumask of CPUs with asymmetric SMT dependency */
>  static int powerpc_smt_flags(void)
>  {
> -	int flags = SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
> +	if (static_branch_unlikely(&powerpc_asym_packing))
> +		return SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES | SD_ASYM_PACKING;
>  
> -	if (cpu_has_feature(CPU_FTR_ASYM_SMT)) {
> -		printk_once(KERN_INFO "Enabling Asymmetric SMT scheduling\n");
> -		flags |= SD_ASYM_PACKING;
> -	}
> -	return flags;
> +	return SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
>  }
>  #endif
>  
> @@ -1686,6 +1684,11 @@ static void __init fixup_topology(void)
>  {
>  	int i;
>  
> +	if (cpu_has_feature(CPU_FTR_ASYM_SMT)) {
> +		pr_info_once("Enabling Asymmetric SMT scheduling\n");
> +		static_branch_enable(&powerpc_asym_packing);
> +	}
> +
>  #ifdef CONFIG_SCHED_SMT
>  	if (has_big_cores) {
>  		pr_info("Big cores detected but using small core scheduling\n");
> -- 
> 2.31.1
