Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 779F230DFAF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 17:26:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW6Wj54l4zF01T
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 03:26:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=u2Y1umIw; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW6VG1lzFzDqCF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 03:25:25 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14C8D64F7C;
 Wed,  3 Feb 2021 16:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612369523;
 bh=z9ad3FcPGYgXVRh24CZ9/1YSXmsb9ldj3XksR7b8UjU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u2Y1umIw/IES91LtdERRjzzLAX5pAqTXeHjZI8tyZhXaLk/SkOLElS7eckB8U6egE
 yPUfU5wXvdH03FVYdM6hoTqLWHhQrgDMWsBbKmfO1MtI5MEg/EByYZQyfpZzkCvMxQ
 RHQDl1y7VfvrTwUTadekjvr+uWNuKa4czVozbiYnTZgrpnnX3MWGBvq0YZKiHKHNb1
 46fhtbfefurD7ekKqEI1JFozk0j4MzldtNlT0smM9eBVPu44EaII9TEiJjSw1SPfjD
 6RMdpbwOsXeUaSQIq5468CQSLczSWOgEov+mvJ8DVqs3RvqKMm3Rr7lTx06CHMtHLv
 JFuHFAaRFCvag==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id ADC8D40513; Wed,  3 Feb 2021 13:25:20 -0300 (-03)
Date: Wed, 3 Feb 2021 13:25:20 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] tools/perf: Add perf tools support to expose
 Performance Monitor Counter SPRs as part of extended regs
Message-ID: <20210203162520.GG854763@kernel.org>
References: <1612335337-1888-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1612335337-1888-4-git-send-email-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612335337-1888-4-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Url: http://acmel.wordpress.com
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jolsa@kernel.org,
 kjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Wed, Feb 03, 2021 at 01:55:37AM -0500, Athira Rajeev escreveu:
> To enable presenting of Performance Monitor Counter Registers
> (PMC1 to PMC6) as part of extended regsiters, patch adds these
> to sample_reg_mask in the tool side (to use with -I? option).
> 
> Simplified the PERF_REG_PMU_MASK_300/31 definition. Excluded the
> unsupported SPRs (MMCR3, SIER2, SIER3) from extended mask value for
> CPU_FTR_ARCH_300.

Applied just 3/3, the tooling part, to my local branch, please holler if
I should wait a bit more.

- Arnaldo
 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/arch/powerpc/include/uapi/asm/perf_regs.h | 28 +++++++++++++++++++------
>  tools/perf/arch/powerpc/include/perf_regs.h     |  6 ++++++
>  tools/perf/arch/powerpc/util/perf_regs.c        |  6 ++++++
>  3 files changed, 34 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/arch/powerpc/include/uapi/asm/perf_regs.h b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
> index bdf5f10f8b9f..578b3ee86105 100644
> --- a/tools/arch/powerpc/include/uapi/asm/perf_regs.h
> +++ b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
> @@ -55,17 +55,33 @@ enum perf_event_powerpc_regs {
>  	PERF_REG_POWERPC_MMCR3,
>  	PERF_REG_POWERPC_SIER2,
>  	PERF_REG_POWERPC_SIER3,
> +	PERF_REG_POWERPC_PMC1,
> +	PERF_REG_POWERPC_PMC2,
> +	PERF_REG_POWERPC_PMC3,
> +	PERF_REG_POWERPC_PMC4,
> +	PERF_REG_POWERPC_PMC5,
> +	PERF_REG_POWERPC_PMC6,
>  	/* Max regs without the extended regs */
>  	PERF_REG_POWERPC_MAX = PERF_REG_POWERPC_MMCRA + 1,
>  };
>  
>  #define PERF_REG_PMU_MASK	((1ULL << PERF_REG_POWERPC_MAX) - 1)
>  
> -/* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300 */
> -#define PERF_REG_PMU_MASK_300   (((1ULL << (PERF_REG_POWERPC_MMCR2 + 1)) - 1) - PERF_REG_PMU_MASK)
> -/* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31 */
> -#define PERF_REG_PMU_MASK_31   (((1ULL << (PERF_REG_POWERPC_SIER3 + 1)) - 1) - PERF_REG_PMU_MASK)
> +/* Exclude MMCR3, SIER2, SIER3 for CPU_FTR_ARCH_300 */
> +#define	PERF_EXCLUDE_REG_EXT_300	(7ULL << PERF_REG_POWERPC_MMCR3)
>  
> -#define PERF_REG_MAX_ISA_300   (PERF_REG_POWERPC_MMCR2 + 1)
> -#define PERF_REG_MAX_ISA_31    (PERF_REG_POWERPC_SIER3 + 1)
> +/*
> + * PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300
> + * includes 9 SPRS from MMCR0 to PMC6 excluding the
> + * unsupported SPRS in PERF_EXCLUDE_REG_EXT_300.
> + */
> +#define PERF_REG_PMU_MASK_300   ((0xfffULL << PERF_REG_POWERPC_MMCR0) - PERF_EXCLUDE_REG_EXT_300)
> +
> +/*
> + * PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31
> + * includes 12 SPRs from MMCR0 to PMC6.
> + */
> +#define PERF_REG_PMU_MASK_31   (0xfffULL << PERF_REG_POWERPC_MMCR0)
> +
> +#define PERF_REG_EXTENDED_MAX  (PERF_REG_POWERPC_PMC6 + 1)
>  #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
> diff --git a/tools/perf/arch/powerpc/include/perf_regs.h b/tools/perf/arch/powerpc/include/perf_regs.h
> index 63f3ac91049f..98b6f9eabfc3 100644
> --- a/tools/perf/arch/powerpc/include/perf_regs.h
> +++ b/tools/perf/arch/powerpc/include/perf_regs.h
> @@ -71,6 +71,12 @@
>  	[PERF_REG_POWERPC_MMCR3] = "mmcr3",
>  	[PERF_REG_POWERPC_SIER2] = "sier2",
>  	[PERF_REG_POWERPC_SIER3] = "sier3",
> +	[PERF_REG_POWERPC_PMC1] = "pmc1",
> +	[PERF_REG_POWERPC_PMC2] = "pmc2",
> +	[PERF_REG_POWERPC_PMC3] = "pmc3",
> +	[PERF_REG_POWERPC_PMC4] = "pmc4",
> +	[PERF_REG_POWERPC_PMC5] = "pmc5",
> +	[PERF_REG_POWERPC_PMC6] = "pmc6",
>  };
>  
>  static inline const char *perf_reg_name(int id)
> diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/arch/powerpc/util/perf_regs.c
> index 2b6d4704e3aa..8116a253f91f 100644
> --- a/tools/perf/arch/powerpc/util/perf_regs.c
> +++ b/tools/perf/arch/powerpc/util/perf_regs.c
> @@ -68,6 +68,12 @@
>  	SMPL_REG(mmcr3, PERF_REG_POWERPC_MMCR3),
>  	SMPL_REG(sier2, PERF_REG_POWERPC_SIER2),
>  	SMPL_REG(sier3, PERF_REG_POWERPC_SIER3),
> +	SMPL_REG(pmc1, PERF_REG_POWERPC_PMC1),
> +	SMPL_REG(pmc2, PERF_REG_POWERPC_PMC2),
> +	SMPL_REG(pmc3, PERF_REG_POWERPC_PMC3),
> +	SMPL_REG(pmc4, PERF_REG_POWERPC_PMC4),
> +	SMPL_REG(pmc5, PERF_REG_POWERPC_PMC5),
> +	SMPL_REG(pmc6, PERF_REG_POWERPC_PMC6),
>  	SMPL_REG_END
>  };
>  
> -- 
> 1.8.3.1
> 

-- 

- Arnaldo
