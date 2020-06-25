Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F9F209815
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 03:13:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49shq3161DzDqcX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 11:13:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49shmc48hTzDqZj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 11:11:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kJmcxXCW; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49shmb69B8z9s1x;
 Thu, 25 Jun 2020 11:11:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1593047487;
 bh=RQIyenxXQbHYMtHUjOJ2lug8ouzp2KuX35Kw7NZyeo8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=kJmcxXCWM8MFuc4Ml75Dgq+t4B7yQJ5nmGrgklDwpv0w5QyX/V4lmk9Ap6GOMt2nz
 Rg9ldgciNUeufuQgv9E4KPsLVQZFfPXQUaCx/TvEjyPrXej+lJ74pmWWAC60ttgYUZ
 oPtcxTpuHXFvG2fWsX0mT0PCI2J1fF9bj006Y7AFve7Aj4lhtT4ooNqncwxReBZqmO
 hk//6Tojc4PkCLEgJUbEph3/qd2TbTF6MWqmyOdbAw3Fr5r08GRFFXA4CHBESNYm7L
 RxZDT0brNuJsYc7nA/Q3adMSU7OncD+oa1+HzaeYOCZkSqRG88yQjheK1brq0sYV/D
 cm86zTCQdng4g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries: Use doorbells even if XIVE is available
In-Reply-To: <20200624134724.2343007-1-npiggin@gmail.com>
References: <20200624134724.2343007-1-npiggin@gmail.com>
Date: Thu, 25 Jun 2020 11:11:57 +1000
Message-ID: <87r1u4aqzm.fsf@mpe.ellerman.id.au>
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
Cc: Anton Blanchard <anton@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> KVM supports msgsndp in guests by trapping and emulating the
> instruction, so it was decided to always use XIVE for IPIs if it is
> available. However on PowerVM systems, msgsndp can be used and gives
> better performance. On large systems, high XIVE interrupt rates can
> have sub-linear scaling, and using msgsndp can reduce the load on
> the interrupt controller.
>
> So switch to using core local doorbells even if XIVE is available.
> This reduces performance for KVM guests with an SMT topology by
> about 50% for ping-pong context switching between SMT vCPUs.

You have to take explicit steps to configure KVM in that way with qemu.
eg. "qemu .. -smp 8" will give you 8 SMT1 CPUs by default.

> An option vector (or dt-cpu-ftrs) could be defined to disable msgsndp
> to get KVM performance back.

Qemu/KVM populates /proc/device-tree/hypervisor, so we *could* look at
that. Though adding PowerVM/KVM specific hacks is obviously a very
slippery slope.

> diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
> index 6891710833be..a737a2f87c67 100644
> --- a/arch/powerpc/platforms/pseries/smp.c
> +++ b/arch/powerpc/platforms/pseries/smp.c
> @@ -188,13 +188,14 @@ static int pseries_smp_prepare_cpu(int cpu)
>  	return 0;
>  }
>  
> +static void  (*cause_ipi_offcore)(int cpu) __ro_after_init;
> +
>  static void smp_pseries_cause_ipi(int cpu)

This is static so the name could be more descriptive, it doesn't need
the "smp_pseries" prefix.

>  {
> -	/* POWER9 should not use this handler */
>  	if (doorbell_try_core_ipi(cpu))
>  		return;

Seems like it would be worth making that static inline so we can avoid
the function call overhead.

> -	icp_ops->cause_ipi(cpu);
> +	cause_ipi_offcore(cpu);
>  }
>  
>  static int pseries_cause_nmi_ipi(int cpu)
> @@ -222,10 +223,7 @@ static __init void pSeries_smp_probe_xics(void)
>  {
>  	xics_smp_probe();
>  
> -	if (cpu_has_feature(CPU_FTR_DBELL) && !is_secure_guest())
> -		smp_ops->cause_ipi = smp_pseries_cause_ipi;
> -	else
> -		smp_ops->cause_ipi = icp_ops->cause_ipi;
> +	smp_ops->cause_ipi = icp_ops->cause_ipi;
>  }
>  
>  static __init void pSeries_smp_probe(void)
> @@ -238,6 +236,18 @@ static __init void pSeries_smp_probe(void)

The comment just above here says:

		/*
		 * Don't use P9 doorbells when XIVE is enabled. IPIs
		 * using MMIOs should be faster
		 */
>  		xive_smp_probe();

Which is no longer true.

>  	else
>  		pSeries_smp_probe_xics();

I think you should just fold this in, it would make the logic slightly
easier to follow.

> +	/*
> +	 * KVM emulates doorbells by reading the instruction, which
> +	 * can't be done if the guest is secure. If a secure guest
> +	 * runs under PowerVM, it could use msgsndp but would need a
> +	 * way to distinguish.
> +	 */

It's not clear what it needs to distinguish: That it's running under
PowerVM and therefore *can* use msgsndp even though it's secure.

Also the comment just talks about the is_secure_guest() test, which is
not obvious on first reading.

> +	if (cpu_has_feature(CPU_FTR_DBELL) &&
> +	    cpu_has_feature(CPU_FTR_SMT) && !is_secure_guest()) {
> +		cause_ipi_offcore = smp_ops->cause_ipi;
> +		smp_ops->cause_ipi = smp_pseries_cause_ipi;
> +	}

Because we're at the tail of the function I think this would be clearer
if it used early returns, eg:

	// If the CPU doesn't have doorbells then we must use xics/xive
	if (!cpu_has_feature(CPU_FTR_DBELL))
        	return;

	// If the CPU doesn't have SMT then doorbells don't help us
	if (!cpu_has_feature(CPU_FTR_SMT))
        	return;

	// Secure guests can't use doorbells because ...
	if (!is_secure_guest()
        	return;

	/*
         * Otherwise we want to use doorbells for sibling threads and
         * xics/xive for IPIs off the core, because it performs better
         * on large systems ...
         */
        cause_ipi_offcore = smp_ops->cause_ipi;
	smp_ops->cause_ipi = smp_pseries_cause_ipi;
}


cheers
