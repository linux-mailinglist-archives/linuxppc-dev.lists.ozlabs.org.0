Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 091B02186DF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 14:05:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1yfq4XBszDqlD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 22:05:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1ybv3cTvzDqQS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 22:02:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=oGgwpobw; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1ybt67RRz9sRf;
 Wed,  8 Jul 2020 22:02:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594209754;
 bh=QR6QJ4WFvb8YTI/SXIeahW/0IVN707IxK533i92Vjj0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=oGgwpobw8urcvVp4DSmt/+4D728Qd88ouZ5z/av1H4Ha63ETAB+q08jtrUe/6/Vzs
 LY8uuhz34GdM0UHj57uxTELcV4KG6ugVqLr06sCnm5BvvPK9H7xkijSYxYOFupKxix
 VZ5olUIXaWZfc6SindQTqsgmN+7e0fnavneE5dP2b87bc90sDH2QObMY2sWfdZyDce
 rAgQzaIr4btV8bXJiwMWktXro/MUjKC2j6aD6yR5rSl896Wse9aYYwO6uAcLGps+zc
 5mkt56yQwPGJ/rMpThRu8+dNbSevrsMawOLdn/Qp38nZdag5kuoHh+8QHAjLbVbilq
 hjwfUsXbi1+sA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 10/10] powerpc/perf: Add extended regs support for
 power10 platform
In-Reply-To: <1593595262-1433-11-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-11-git-send-email-atrajeev@linux.vnet.ibm.com>
Date: Wed, 08 Jul 2020 22:04:49 +1000
Message-ID: <87r1tm2owu.fsf@mpe.ellerman.id.au>
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
> Include capability flag `PERF_PMU_CAP_EXTENDED_REGS` for power10
> and expose MMCR3, SIER2, SIER3 registers as part of extended regs.
> Also introduce `PERF_REG_PMU_MASK_31` to define extended mask
> value at runtime for power10
>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/uapi/asm/perf_regs.h       |  6 ++++++
>  arch/powerpc/perf/perf_regs.c                   | 10 +++++++++-
>  arch/powerpc/perf/power10-pmu.c                 |  6 ++++++
>  tools/arch/powerpc/include/uapi/asm/perf_regs.h |  6 ++++++
>  tools/perf/arch/powerpc/include/perf_regs.h     |  3 +++
>  tools/perf/arch/powerpc/util/perf_regs.c        |  6 ++++++

Please split into a kernel patch and a tools patch. And cc the tools people.

>  6 files changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/uapi/asm/perf_regs.h b/arch/powerpc/include/uapi/asm/perf_regs.h
> index 485b1d5..020b51c 100644
> --- a/arch/powerpc/include/uapi/asm/perf_regs.h
> +++ b/arch/powerpc/include/uapi/asm/perf_regs.h
> @@ -52,6 +52,9 @@ enum perf_event_powerpc_regs {
>  	PERF_REG_POWERPC_MMCR0,
>  	PERF_REG_POWERPC_MMCR1,
>  	PERF_REG_POWERPC_MMCR2,
> +	PERF_REG_POWERPC_MMCR3,
> +	PERF_REG_POWERPC_SIER2,
> +	PERF_REG_POWERPC_SIER3,
>  	/* Max regs without the extended regs */
>  	PERF_REG_POWERPC_MAX = PERF_REG_POWERPC_MMCRA + 1,
>  };
> @@ -62,4 +65,7 @@ enum perf_event_powerpc_regs {
>  #define PERF_REG_PMU_MASK_300   (((1ULL << (PERF_REG_POWERPC_MMCR2 + 1)) - 1) \
>  				- PERF_REG_PMU_MASK)
>  
> +/* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31 */
> +#define PERF_REG_PMU_MASK_31	(((1ULL << (PERF_REG_POWERPC_SIER3 + 1)) - 1) \
> +				- PERF_REG_PMU_MASK)

Wrapping that provides no benefit, just let it be long.

>  #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
> diff --git a/arch/powerpc/perf/perf_regs.c b/arch/powerpc/perf/perf_regs.c
> index c8a7e8c..c969935 100644
> --- a/arch/powerpc/perf/perf_regs.c
> +++ b/arch/powerpc/perf/perf_regs.c
> @@ -81,6 +81,12 @@ static u64 get_ext_regs_value(int idx)
>  		return mfspr(SPRN_MMCR1);
>  	case PERF_REG_POWERPC_MMCR2:
>  		return mfspr(SPRN_MMCR2);
> +	case PERF_REG_POWERPC_MMCR3:
> +			return mfspr(SPRN_MMCR3);
> +	case PERF_REG_POWERPC_SIER2:
> +			return mfspr(SPRN_SIER2);
> +	case PERF_REG_POWERPC_SIER3:
> +			return mfspr(SPRN_SIER3);

Indentation is wrong.

>  	default: return 0;
>  	}
>  }
> @@ -89,7 +95,9 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
>  {
>  	u64 PERF_REG_EXTENDED_MAX;
>  
> -	if (cpu_has_feature(CPU_FTR_ARCH_300))
> +	if (cpu_has_feature(CPU_FTR_ARCH_31))
> +		PERF_REG_EXTENDED_MAX = PERF_REG_POWERPC_SIER3 + 1;

There's no way to know if that's correct other than going back to the
header to look at the list of values.

So instead you should define it in the header, next to the other values,
with a meaningful name, like PERF_REG_MAX_ISA_31 or something.

> +	else if (cpu_has_feature(CPU_FTR_ARCH_300))
>  		PERF_REG_EXTENDED_MAX = PERF_REG_POWERPC_MMCR2 + 1;

Same.

>  	if (idx == PERF_REG_POWERPC_SIER &&
> diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
> index 07fb919..51082d6 100644
> --- a/arch/powerpc/perf/power10-pmu.c
> +++ b/arch/powerpc/perf/power10-pmu.c
> @@ -86,6 +86,8 @@
>  #define POWER10_MMCRA_IFM3		0x00000000C0000000UL
>  #define POWER10_MMCRA_BHRB_MASK		0x00000000C0000000UL
>  
> +extern u64 mask_var;

Why is it extern? Also not a good name for a global.

Hang on, it's not even used? Is there some macro magic somewhere?

>  /* Table of alternatives, sorted by column 0 */
>  static const unsigned int power10_event_alternatives[][MAX_ALT] = {
>  	{ PM_RUN_CYC_ALT,		PM_RUN_CYC },
> @@ -397,6 +399,7 @@ static void power10_config_bhrb(u64 pmu_bhrb_filter)
>  	.cache_events		= &power10_cache_events,
>  	.attr_groups		= power10_pmu_attr_groups,
>  	.bhrb_nr		= 32,
> +	.capabilities           = PERF_PMU_CAP_EXTENDED_REGS,
>  };
>  
>  int init_power10_pmu(void)
> @@ -408,6 +411,9 @@ int init_power10_pmu(void)
>  	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power10"))
>  		return -ENODEV;
>  
> +	/* Set the PERF_REG_EXTENDED_MASK here */
> +	mask_var = PERF_REG_PMU_MASK_31;
> +
>  	rc = register_power_pmu(&power10_pmu);
>  	if (rc)
>  		return rc;


cheers
