Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE6A2186F0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 14:08:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1yl56qXJzDqTv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 22:08:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1yc10XJ0zDqkm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 22:02:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=bSknxx2a; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1yc01xLfz9sSJ;
 Wed,  8 Jul 2020 22:02:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594209760;
 bh=EhjG9LHxfPVZzaqI7nGJ8xavJVE5BwzFdgCGdaretOg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bSknxx2aFbx3iIq7tg35zAp7r0Cc+jwFrLqND9xVrQkLDQ6mdI3fRMprUOv9X6jZX
 NTpGQSvo8k3/+fg2NAhqiWbB1JL1h0YOb2sHD0gd7Fc3jDsDMuctK4hy+XdZ5kn4Dg
 mwi7bOe+p7BqEY8mPcePTimC6QLQDrPA6m027Zg9X7AJVYUc1vJxvgHaH2EWgy/Ob8
 naXiOylen2wWPCXhOZgEcqxxL24EdJVh5JITwZXlFilxCUxiWx3FnnoT+WzsnETHM/
 C1OjSuNCRjS2p8rWQTDMzLrAOxV+rTzkBuSTdCYJUucG6whLI1VD0Bh/unXCcfPpTa
 02eA5opwKW3Sw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 09/10] tools/perf: Add perf tools support for extended
 register capability in powerpc
In-Reply-To: <1593595262-1433-10-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-10-git-send-email-atrajeev@linux.vnet.ibm.com>
Date: Wed, 08 Jul 2020 22:04:55 +1000
Message-ID: <87pn962owo.fsf@mpe.ellerman.id.au>
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
> From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
>
> Add extended regs to sample_reg_mask in the tool side to use
> with `-I?` option. Perf tools side uses extended mask to display
> the platform supported register names (with -I? option) to the user
> and also send this mask to the kernel to capture the extended registers
> in each sample. Hence decide the mask value based on the processor
> version.
>
> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
> [Decide extended mask at run time based on platform]
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>

Will need an ack from perf tools folks, who are not on Cc by the looks.

> diff --git a/tools/arch/powerpc/include/uapi/asm/perf_regs.h b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
> index f599064..485b1d5 100644
> --- a/tools/arch/powerpc/include/uapi/asm/perf_regs.h
> +++ b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
> @@ -48,6 +48,18 @@ enum perf_event_powerpc_regs {
>  	PERF_REG_POWERPC_DSISR,
>  	PERF_REG_POWERPC_SIER,
>  	PERF_REG_POWERPC_MMCRA,
> -	PERF_REG_POWERPC_MAX,
> +	/* Extended registers */
> +	PERF_REG_POWERPC_MMCR0,
> +	PERF_REG_POWERPC_MMCR1,
> +	PERF_REG_POWERPC_MMCR2,
> +	/* Max regs without the extended regs */
> +	PERF_REG_POWERPC_MAX = PERF_REG_POWERPC_MMCRA + 1,

I don't really understand this idea of a max that's not the max.

>  };
> +
> +#define PERF_REG_PMU_MASK	((1ULL << PERF_REG_POWERPC_MAX) - 1)
> +
> +/* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300 */
> +#define PERF_REG_PMU_MASK_300   (((1ULL << (PERF_REG_POWERPC_MMCR2 + 1)) - 1) \
> +				- PERF_REG_PMU_MASK)
> +
>  #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
> diff --git a/tools/perf/arch/powerpc/include/perf_regs.h b/tools/perf/arch/powerpc/include/perf_regs.h
> index e18a355..46ed00d 100644
> --- a/tools/perf/arch/powerpc/include/perf_regs.h
> +++ b/tools/perf/arch/powerpc/include/perf_regs.h
> @@ -64,7 +64,10 @@
>  	[PERF_REG_POWERPC_DAR] = "dar",
>  	[PERF_REG_POWERPC_DSISR] = "dsisr",
>  	[PERF_REG_POWERPC_SIER] = "sier",
> -	[PERF_REG_POWERPC_MMCRA] = "mmcra"
> +	[PERF_REG_POWERPC_MMCRA] = "mmcra",
> +	[PERF_REG_POWERPC_MMCR0] = "mmcr0",
> +	[PERF_REG_POWERPC_MMCR1] = "mmcr1",
> +	[PERF_REG_POWERPC_MMCR2] = "mmcr2",
>  };
>  
>  static inline const char *perf_reg_name(int id)
> diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/arch/powerpc/util/perf_regs.c
> index 0a52429..9179230 100644
> --- a/tools/perf/arch/powerpc/util/perf_regs.c
> +++ b/tools/perf/arch/powerpc/util/perf_regs.c
> @@ -6,9 +6,14 @@
>  
>  #include "../../../util/perf_regs.h"
>  #include "../../../util/debug.h"
> +#include "../../../util/event.h"
> +#include "../../../util/header.h"
> +#include "../../../perf-sys.h"
>  
>  #include <linux/kernel.h>
>  
> +#define PVR_POWER9		0x004E
> +
>  const struct sample_reg sample_reg_masks[] = {
>  	SMPL_REG(r0, PERF_REG_POWERPC_R0),
>  	SMPL_REG(r1, PERF_REG_POWERPC_R1),
> @@ -55,6 +60,9 @@
>  	SMPL_REG(dsisr, PERF_REG_POWERPC_DSISR),
>  	SMPL_REG(sier, PERF_REG_POWERPC_SIER),
>  	SMPL_REG(mmcra, PERF_REG_POWERPC_MMCRA),
> +	SMPL_REG(mmcr0, PERF_REG_POWERPC_MMCR0),
> +	SMPL_REG(mmcr1, PERF_REG_POWERPC_MMCR1),
> +	SMPL_REG(mmcr2, PERF_REG_POWERPC_MMCR2),
>  	SMPL_REG_END
>  };
>  
> @@ -163,3 +171,50 @@ int arch_sdt_arg_parse_op(char *old_op, char **new_op)
>  
>  	return SDT_ARG_VALID;
>  }
> +
> +uint64_t arch__intr_reg_mask(void)
> +{
> +	struct perf_event_attr attr = {
> +		.type                   = PERF_TYPE_HARDWARE,
> +		.config                 = PERF_COUNT_HW_CPU_CYCLES,
> +		.sample_type            = PERF_SAMPLE_REGS_INTR,
> +		.precise_ip             = 1,
> +		.disabled               = 1,
> +		.exclude_kernel         = 1,
> +	};
> +	int fd, ret;
> +	char buffer[64];
> +	u32 version;
> +	u64 extended_mask = 0;
> +
> +	/* Get the PVR value to set the extended
> +	 * mask specific to platform

Comment format is wrong, and punctuation please.

> +	 */
> +	get_cpuid(buffer, sizeof(buffer));
> +	ret = sscanf(buffer, "%u,", &version);

This is powerpc specific code, why not just use mfspr(SPRN_PVR), rather
than redirecting via printf/sscanf.

> +
> +	if (ret != 1) {
> +		pr_debug("Failed to get the processor version, unable to output extended registers\n");
> +		return PERF_REGS_MASK;
> +	}
> +
> +	if (version == PVR_POWER9)
> +		extended_mask = PERF_REG_PMU_MASK_300;
> +	else
> +		return PERF_REGS_MASK;
> +
> +	attr.sample_regs_intr = extended_mask;
> +	attr.sample_period = 1;
> +	event_attr_init(&attr);
> +
> +	/*
> +	 * check if the pmu supports perf extended regs, before
> +	 * returning the register mask to sample.
> +	 */
> +	fd = sys_perf_event_open(&attr, 0, -1, -1, 0);
> +	if (fd != -1) {
> +		close(fd);
> +		return (extended_mask | PERF_REGS_MASK);
> +	}
> +	return PERF_REGS_MASK;

I think this would read a bit better like:

	mask = PERF_REGS_MASK;

	if (version == PVR_POWER9)
		extended_mask = PERF_REG_PMU_MASK_300;
        else
        	return mask;

        attr.sample_regs_intr = extended_mask;
        attr.sample_period = 1;
        event_attr_init(&attr);

        /*
          * check if the pmu supports perf extended regs, before
          * returning the register mask to sample.
          */
        fd = sys_perf_event_open(&attr, 0, -1, -1, 0);
        if (fd != -1) {
                close(fd);
                mask |= extended_mask;
        }

	return mask;


cheers
