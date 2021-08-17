Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6383EED9E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 15:42:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gpsfd31bmz3bT2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 23:42:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=atpg2+FV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=atpg2+FV; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gpsdx525bz2yMg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 23:42:12 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gpsds5RqWz9sW5;
 Tue, 17 Aug 2021 23:42:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629207730;
 bh=edfSa1Zuc6lNmt+pQYtASDYDt9CbykZRaD2bDnH6dL4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=atpg2+FV/S3/HX08R+m/rK4j3EgEZmUyGYcYmlga0bGJA0vXE0qo896hR7TQGMAYW
 RdM+Fh3w9tmYMCe2I/g7uarDD0yzUHCmbVxrahSAFgU7o/hbNGG6YeByRrUcJgeMqw
 GAUdTHa6txeS1ygU0jRcnSPK9430P7OFw6N9sCtSnJJrldbTLDGXJDJwYcyZmoH4t6
 eIMdgL2tnnJTgoPyneehZvqxwdQcxrV8vTKmGUfQms6uI3V3Ear4yaCHrN+n9aFCOr
 cfokj49jhD/O4eUS9DzCAhKzZxnAp91neef81QU9hoPHkJmW81s8lxSHg/jIgCnIDx
 MeeMpuyWrk05g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v1 2/4] powerpc/64s/perf: add power_pmu_running to query
 whether perf is being used
In-Reply-To: <20210816072953.1165964-3-npiggin@gmail.com>
References: <20210816072953.1165964-1-npiggin@gmail.com>
 <20210816072953.1165964-3-npiggin@gmail.com>
Date: Tue, 17 Aug 2021 23:42:05 +1000
Message-ID: <87y290fas2.fsf@mpe.ellerman.id.au>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Interrupt handling code would like to know whether perf is enabled, to
> know whether it should enable MSR[EE] to improve PMI coverage.
>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/hw_irq.h |  2 ++
>  arch/powerpc/perf/core-book3s.c   | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
> index 21cc571ea9c2..2d5c0d3ccbb6 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -306,6 +306,8 @@ static inline bool lazy_irq_pending_nocheck(void)
>  	return __lazy_irq_pending(local_paca->irq_happened);
>  }
>  
> +bool power_pmu_running(void);
> +
>  /*
>   * This is called by asynchronous interrupts to conditionally
>   * re-enable hard interrupts after having cleared the source
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index bb0ee716de91..76114a9afb2b 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2380,6 +2380,19 @@ static void perf_event_interrupt(struct pt_regs *regs)
>  	perf_sample_event_took(sched_clock() - start_clock);
>  }
>  
> +bool power_pmu_running(void)
> +{
> +	struct cpu_hw_events *cpuhw;
> +
> +	/* Could this simply test local_paca->pmcregs_in_use? */

I think it could, except that it's under an ifdef:

#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
	u8 pmcregs_in_use;		/* pseries puts this in lppaca */
#endif

cheers
