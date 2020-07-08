Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F5A218655
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 13:42:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1y8K3dY2zDr7H
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 21:42:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1y5d6jGbzDqPm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 21:39:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=UZ5/cHuQ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1y5c0HN0z9sDX;
 Wed,  8 Jul 2020 21:39:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594208388;
 bh=UJ9ry/dS2+fm+JogA1F9Drn8jGHbKtFwYs7A3hI7Aec=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=UZ5/cHuQNck7zIKqg33Jz9QyGyi82pJKeUdSACLcUbZXuUCSIN7O+gIZrq6G+5Zi3
 V1XAiI2YGiwWRnJDLbykxe9QcBvabroBuLLOejr0coBCz/0Y0yTBwAzEP1VDnDFk/u
 dmOavR56XMa66o+R3XYBi8MmZnbYXaQdDHSNq8ncEFkGLVCXmuUnnw+cMpKpFbBAm2
 djVkjvlxpxNrZ8HuVJ4kRG+rzJn5bmzJM973VaNaDC9gBVG6+DW3QPfvc7VygNBFy3
 C5oT3rMf0z9xYeNqosI+yliTmwazm77z1m+wWSFl4wdZOGuoKs4ClkZgMzyIpimb/G
 wdokgWQerkz/g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 07/10] powerpc/perf: support BHRB disable bit and new
 filtering modes
In-Reply-To: <1593595262-1433-8-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-8-git-send-email-atrajeev@linux.vnet.ibm.com>
Date: Wed, 08 Jul 2020 21:42:02 +1000
Message-ID: <87v9iy2pyt.fsf@mpe.ellerman.id.au>
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
Cc: mikey@neuling.org, maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:

> PowerISA v3.1 has few updates for the Branch History Rolling Buffer(BHRB).
                   ^
                   a
> First is the addition of BHRB disable bit and second new filtering
                                                      ^
                                                      is
> modes for BHRB.
>
> BHRB disable is controlled via Monitor Mode Control Register A (MMCRA)
> bit 26, namely "BHRB Recording Disable (BHRBRD)". This field controls

Most people call that bit 37.

> whether BHRB entries are written when BHRB recording is enabled by other
> bits. Patch implements support for this BHRB disable bit.
       ^
       This

> Secondly PowerISA v3.1 introduce filtering support for

.. that should be in a separate patch please.

> PERF_SAMPLE_BRANCH_IND_CALL/COND. The patch adds BHRB filter support
                                    ^
                                    This
> for "ind_call" and "cond" in power10_bhrb_filter_map().
>
> 'commit bb19af816025 ("powerpc/perf: Prevent kernel address leak to userspace via BHRB buffer")'

That doesn't need single quotes, and should be wrapped at 72 columns
like the rest of the text.

> added a check in bhrb_read() to filter the kernel address from BHRB buffer. Patch here modified
> it to avoid that check for PowerISA v3.1 based processors, since PowerISA v3.1 allows
> only MSR[PR]=1 address to be written to BHRB buffer.

And that should be a separate patch again please.

> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  arch/powerpc/perf/core-book3s.c       | 27 +++++++++++++++++++++------
>  arch/powerpc/perf/isa207-common.c     | 13 +++++++++++++
>  arch/powerpc/perf/power10-pmu.c       | 13 +++++++++++--
>  arch/powerpc/platforms/powernv/idle.c | 14 ++++++++++++++
>  4 files changed, 59 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index fad5159..9709606 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -466,9 +466,13 @@ static void power_pmu_bhrb_read(struct perf_event *event, struct cpu_hw_events *
>  			 * addresses at this point. Check the privileges before
>  			 * exporting it to userspace (avoid exposure of regions
>  			 * where we could have speculative execution)
> +			 * Incase of ISA 310, BHRB will capture only user-space
                           ^
                           In case of ISA v3.1,

> +			 * address,hence include a check before filtering code
                           ^                                                  ^
                           addresses, hence                                   .
>  			 */
> -			if (is_kernel_addr(addr) && perf_allow_kernel(&event->attr) != 0)
> -				continue;
> +			if (!(ppmu->flags & PPMU_ARCH_310S))
> +				if (is_kernel_addr(addr) &&
> +				perf_allow_kernel(&event->attr) != 0)
> +					continue;

The indentation is weird. You should just check all three conditions
with &&.

>  
>  			/* Branches are read most recent first (ie. mfbhrb 0 is
>  			 * the most recent branch).
> @@ -1212,7 +1216,7 @@ static void write_mmcr0(struct cpu_hw_events *cpuhw, unsigned long mmcr0)
>  static void power_pmu_disable(struct pmu *pmu)
>  {
>  	struct cpu_hw_events *cpuhw;
> -	unsigned long flags, mmcr0, val;
> +	unsigned long flags, mmcr0, val, mmcra = 0;

You initialise it below.

>  	if (!ppmu)
>  		return;
> @@ -1245,12 +1249,23 @@ static void power_pmu_disable(struct pmu *pmu)
>  		mb();
>  		isync();
>  
> +		val = mmcra = cpuhw->mmcr[2];
> +

For mmcr0 (above), val is the variable we mutate and mmcr0 is the
original value. But here you've done the reverse, which is confusing.

>  		/*
>  		 * Disable instruction sampling if it was enabled
>  		 */
> -		if (cpuhw->mmcr[2] & MMCRA_SAMPLE_ENABLE) {
> -			mtspr(SPRN_MMCRA,
> -			      cpuhw->mmcr[2] & ~MMCRA_SAMPLE_ENABLE);
> +		if (cpuhw->mmcr[2] & MMCRA_SAMPLE_ENABLE)
> +			mmcra = cpuhw->mmcr[2] & ~MMCRA_SAMPLE_ENABLE;

You just loaded cpuhw->mmcr[2] into mmcra, use it rather than referring
back to cpuhw->mmcr[2] over and over.

> +
> +		/* Disable BHRB via mmcra [:26] for p10 if needed */
> +		if (!(cpuhw->mmcr[2] & MMCRA_BHRB_DISABLE))

You don't need to check that it's clear AFAICS. Just always set disable
and the check against val below will catch the nop case.

> +			mmcra |= MMCRA_BHRB_DISABLE;
> +
> +		/* Write SPRN_MMCRA if mmcra has either disabled

Comment format is wrong.

> +		 * instruction sampling or BHRB

Full stop please.

> +		 */
> +		if (val != mmcra) {
> +			mtspr(SPRN_MMCRA, mmcra);
>  			mb();
>  			isync();
>  		}
> diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
> index 7d4839e..463d925 100644
> --- a/arch/powerpc/perf/isa207-common.c
> +++ b/arch/powerpc/perf/isa207-common.c
> @@ -404,6 +404,12 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
>  
>  	mmcra = mmcr1 = mmcr2 = mmcr3 = 0;
>  
> +	/* Disable bhrb unless explicitly requested
> +	 * by setting MMCRA [:26] bit.
> +	 */

Comment format again.

> +	if (cpu_has_feature(CPU_FTR_ARCH_31))
> +		mmcra |= MMCRA_BHRB_DISABLE;

Here we do a feature check before setting MMCRA_BHRB_DISABLE, but you
didn't above?

> +
>  	/* Second pass: assign PMCs, set all MMCR1 fields */
>  	for (i = 0; i < n_ev; ++i) {
>  		pmc     = (event[i] >> EVENT_PMC_SHIFT) & EVENT_PMC_MASK;
> @@ -475,10 +481,17 @@ int isa207_compute_mmcr(u64 event[], int n_ev,
>  		}
>  
>  		if (event[i] & EVENT_WANTS_BHRB) {
> +			/* set MMCRA[:26] to 0 for Power10 to enable BHRB */

"set MMCRA[:26] to 0" == "clear MMCRA[:26]"

> +			if (cpu_has_feature(CPU_FTR_ARCH_31))
> +				mmcra &= ~MMCRA_BHRB_DISABLE;

Newline please.

>  			val = (event[i] >> EVENT_IFM_SHIFT) & EVENT_IFM_MASK;
>  			mmcra |= val << MMCRA_IFM_SHIFT;
>  		}
>  
> +		/* set MMCRA[:26] to 0 if there is user request for BHRB */
> +		if (cpu_has_feature(CPU_FTR_ARCH_31) && has_branch_stack(pevents[i]))
> +			mmcra &= ~MMCRA_BHRB_DISABLE;
> +

I think it would be cleaner if you did a single test, eg:

		if (cpu_has_feature(CPU_FTR_ARCH_31) &&
                   (has_branch_stack(pevents[i]) || (event[i] & EVENT_WANTS_BHRB)))
			mmcra &= ~MMCRA_BHRB_DISABLE;

>  		if (pevents[i]->attr.exclude_user)
>  			mmcr2 |= MMCR2_FCP(pmc);
>  
> diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
> index d64d69d..07fb919 100644
> --- a/arch/powerpc/perf/power10-pmu.c
> +++ b/arch/powerpc/perf/power10-pmu.c
> @@ -82,6 +82,8 @@
>  
>  /* MMCRA IFM bits - POWER10 */
>  #define POWER10_MMCRA_IFM1		0x0000000040000000UL
> +#define POWER10_MMCRA_IFM2		0x0000000080000000UL
> +#define POWER10_MMCRA_IFM3		0x00000000C0000000UL
>  #define POWER10_MMCRA_BHRB_MASK	0x00000000C0000000UL
>  
>  /* Table of alternatives, sorted by column 0 */
> @@ -233,8 +235,15 @@ static u64 power10_bhrb_filter_map(u64 branch_sample_type)
>  	if (branch_sample_type & PERF_SAMPLE_BRANCH_ANY_RETURN)
>  		return -1;
>  
> -	if (branch_sample_type & PERF_SAMPLE_BRANCH_IND_CALL)
> -		return -1;
> +	if (branch_sample_type & PERF_SAMPLE_BRANCH_IND_CALL) {
> +		pmu_bhrb_filter |= POWER10_MMCRA_IFM2;
> +		return pmu_bhrb_filter;
> +	}
> +
> +	if (branch_sample_type & PERF_SAMPLE_BRANCH_COND) {
> +		pmu_bhrb_filter |= POWER10_MMCRA_IFM3;
> +		return pmu_bhrb_filter;
> +	}
>  
>  	if (branch_sample_type & PERF_SAMPLE_BRANCH_CALL)
>  		return -1;
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index 2dd4673..7db99c7 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -611,6 +611,7 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>  	unsigned long srr1;
>  	unsigned long pls;
>  	unsigned long mmcr0 = 0;
> +	unsigned long mmcra_bhrb = 0;
>  	struct p9_sprs sprs = {}; /* avoid false used-uninitialised */
>  	bool sprs_saved = false;
>  
> @@ -657,6 +658,15 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>  		  */
>  		mmcr0		= mfspr(SPRN_MMCR0);
>  	}
> +
> +	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> +		/* POWER10 uses MMCRA[:26] as BHRB disable bit

Comment format.

> +		 * to disable BHRB logic when not used. Hence Save and
> +		 * restore MMCRA after a state-loss idle.
> +		 */
> +		mmcra_bhrb		= mfspr(SPRN_MMCRA);
> +	}

It's the whole mmcra it should be called mmcra?

> +
>  	if ((psscr & PSSCR_RL_MASK) >= pnv_first_spr_loss_level) {
>  		sprs.lpcr	= mfspr(SPRN_LPCR);
>  		sprs.hfscr	= mfspr(SPRN_HFSCR);
> @@ -721,6 +731,10 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>  			mtspr(SPRN_MMCR0, mmcr0);
>  		}
>  
> +		/* Reload MMCRA to restore BHRB disable bit for POWER10 */
> +		if (cpu_has_feature(CPU_FTR_ARCH_31))
> +			mtspr(SPRN_MMCRA, mmcra_bhrb);
> +
>  		/*
>  		 * DD2.2 and earlier need to set then clear bit 60 in MMCRA
>  		 * to ensure the PMU starts running.


cheers
