Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B00055888F2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 10:58:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LyQk94Z6zz3bc5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 18:58:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AAXrNqkr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LyQjY2psRz2xVt
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Aug 2022 18:57:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AAXrNqkr;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LyQjY1hYpz4wgv;
	Wed,  3 Aug 2022 18:57:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1659517057;
	bh=k0W4ga7i71gmca1FEFWj49p6usSXkI5cZ7818QrvuP8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AAXrNqkraydMcwbabSegJJl4BlL9VNTNMJuNDhsYgsZzhgqF+XSIDSxtTDvN/2FFW
	 0PoMOlVkYH1NPPgmHHUNhIjeI+feM/2N8C8qNRTH8X4rJHmrKSB1wtWe/C/S0k6uNI
	 bjjju0Alo8wcwItyoYQI+FWaAGcHKbiTSUr+0Npr5pZcDIH617ko1fTrg/lbKKWX9k
	 s0d3anRaYSNJNCqFA5iyZfLpGjCLQyn75CM8CvNyIAZwPZ7HZzESMpkabzAoYOMsWq
	 cYhugZeCqJ1th7LLbtQtoQxG3V6cQJ5Z7idBNNTMxbHwWMRySVyhyCJiMZjb1DvXix
	 eBqz+WtHKxyyw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/2] powerpc/64s: POWER9 DD2.3 CPU feature flag fixes
In-Reply-To: <20210726031730.729934-1-npiggin@gmail.com>
References: <20210726031730.729934-1-npiggin@gmail.com>
Date: Wed, 03 Aug 2022 18:57:32 +1000
Message-ID: <87r11xaemb.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> DD2.3 missed out on getting its feature flag bits.
>
> This meant when booting with dt-cpu-ftrs, CPU_FTR_P9_TM_HV_ASSIST is
> missing (unless the firmware contains it, which mine does not seem to).
> And when booting without, CPU_FTR_P9_TM_XER_SO_BUG is set.
>
> In practice this doesn't make any difference to pseries guests, only
> powernv.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/cputable.h |  2 ++
>  arch/powerpc/kernel/cputable.c      | 22 ++++++++++++++++++++--
>  arch/powerpc/kernel/dt_cpu_ftrs.c   | 14 +++++---------
>  3 files changed, 27 insertions(+), 11 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
> index e85c849214a2..46bae9624784 100644
> --- a/arch/powerpc/include/asm/cputable.h
> +++ b/arch/powerpc/include/asm/cputable.h
> @@ -440,6 +440,8 @@ static inline void cpu_feature_keys_init(void) { }
>  #define CPU_FTRS_POWER9_DD2_2 (CPU_FTRS_POWER9 | CPU_FTR_POWER9_DD2_1 | \
>  			       CPU_FTR_P9_TM_HV_ASSIST | \
>  			       CPU_FTR_P9_TM_XER_SO_BUG)
> +#define CPU_FTRS_POWER9_DD2_3 (CPU_FTRS_POWER9 | CPU_FTR_POWER9_DD2_1 | \
> +			       CPU_FTR_P9_TM_HV_ASSIST)
>  #define CPU_FTRS_POWER10 (CPU_FTR_LWSYNC | \
>  	    CPU_FTR_PPCAS_ARCH_V2 | CPU_FTR_CTRL | CPU_FTR_ARCH_206 |\
>  	    CPU_FTR_MMCRA | CPU_FTR_SMT | \
> diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
> index ae0fdef0ac11..9ab97d1fd5a2 100644
> --- a/arch/powerpc/kernel/cputable.c
> +++ b/arch/powerpc/kernel/cputable.c
> @@ -487,11 +487,29 @@ static struct cpu_spec __initdata cpu_specs[] = {
>  		.machine_check_early	= __machine_check_early_realmode_p9,
>  		.platform		= "power9",
>  	},
> -	{	/* Power9 DD2.2 or later */
> +	{	/* Power9 DD 2.2 */
> +		.pvr_mask		= 0xffffefff,
> +		.pvr_value		= 0x004e0202,
> +		.cpu_name		= "POWER9 (raw)",
> +		.cpu_features		= CPU_FTRS_POWER9_DD2_2,
> +		.cpu_user_features	= COMMON_USER_POWER9,
> +		.cpu_user_features2	= COMMON_USER2_POWER9,
> +		.mmu_features		= MMU_FTRS_POWER9,
> +		.icache_bsize		= 128,
> +		.dcache_bsize		= 128,
> +		.num_pmcs		= 6,
> +		.pmc_type		= PPC_PMC_IBM,
> +		.oprofile_cpu_type	= "ppc64/power9",
> +		.cpu_setup		= __setup_cpu_power9,
> +		.cpu_restore		= __restore_cpu_power9,
> +		.machine_check_early	= __machine_check_early_realmode_p9,
> +		.platform		= "power9",
> +	},
> +	{	/* Power9 DD 2.3 or later */
>  		.pvr_mask		= 0xffff0000,
>  		.pvr_value		= 0x004e0000,
>  		.cpu_name		= "POWER9 (raw)",
> -		.cpu_features		= CPU_FTRS_POWER9_DD2_2,
> +		.cpu_features		= CPU_FTRS_POWER9_DD2_3,
>  		.cpu_user_features	= COMMON_USER_POWER9,
>  		.cpu_user_features2	= COMMON_USER2_POWER9,
>  		.mmu_features		= MMU_FTRS_POWER9,
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
> index 358aee7c2d79..af95f337e54b 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -764,18 +764,14 @@ static __init void cpufeatures_cpu_quirks(void)
>  	 * Not all quirks can be derived from the cpufeatures device tree.
>  	 */
>  	if ((version & 0xffffefff) == 0x004e0200) {
> -		/* DD2.0 has no feature flag */
> -		cur_cpu_spec->cpu_features |= CPU_FTR_P9_RADIX_PREFETCH_BUG;
> +		cur_cpu_spec->cpu_features |= CPU_FTRS_POWER9_DD2_0;
>  	} else if ((version & 0xffffefff) == 0x004e0201) {
> -		cur_cpu_spec->cpu_features |= CPU_FTR_POWER9_DD2_1;
> -		cur_cpu_spec->cpu_features |= CPU_FTR_P9_RADIX_PREFETCH_BUG;
> +		cur_cpu_spec->cpu_features |= CPU_FTRS_POWER9_DD2_1;
>  	} else if ((version & 0xffffefff) == 0x004e0202) {
> -		cur_cpu_spec->cpu_features |= CPU_FTR_P9_TM_HV_ASSIST;
> -		cur_cpu_spec->cpu_features |= CPU_FTR_P9_TM_XER_SO_BUG;
> -		cur_cpu_spec->cpu_features |= CPU_FTR_POWER9_DD2_1;
> +		cur_cpu_spec->cpu_features |= CPU_FTRS_POWER9_DD2_2;
>  	} else if ((version & 0xffff0000) == 0x004e0000) {
> -		/* DD2.1 and up have DD2_1 */
> -		cur_cpu_spec->cpu_features |= CPU_FTR_POWER9_DD2_1;
> +		/* DD2.3 and up */
> +		cur_cpu_spec->cpu_features |= CPU_FTRS_POWER9_DD2_3;
>  	}

As we discussed on slack, this part is wrong.

Or'ing in the full CPU_FTRS_POWER9_DDx mask sets bits that may have been
turned off, or never enabled, by the device tree CPU features.

In particular it causes CPU_FTR_TM to be turned on (from
CPU_FTRS_POWER9), even though the machine may not have TM enabled.

We can probably just drop the dt_cpu_ftrs.c change, but if you don't
mind I'll get you to test that and resubmit the series.

cheers
