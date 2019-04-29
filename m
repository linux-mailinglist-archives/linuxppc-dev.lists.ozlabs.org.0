Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6DBDB9A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 07:43:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44str30j55zDqNZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 15:43:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="GBn5k5rb"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44stpg2VJBzDqNN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 15:42:35 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44stpW2dr9z9v2qc;
 Mon, 29 Apr 2019 07:42:27 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=GBn5k5rb; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sIqs7sYSYNTh; Mon, 29 Apr 2019 07:42:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44stpW1PDDz9v2qb;
 Mon, 29 Apr 2019 07:42:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556516547; bh=vCo6HO+bvH6twPE8JOuA6qlWCorfETJ9g6zPu5afPpc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=GBn5k5rbn/rFkpRcToTfYS04YqzBxPbpn+UorRZC1KUW98mjXWab5LRW6UjXlSOos
 uUk8NmKW6Klgpl16MwbZjUmNs76nSq1Sq/e0dnRKkBuPUzCSFfx96xdC0KlcwGeH1u
 6oj8GW2nHRwMdGREquLvJXMdjCAsbPQ6W6RdhpoI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 995888B798;
 Mon, 29 Apr 2019 07:42:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OjHvgxC0o7bT; Mon, 29 Apr 2019 07:42:31 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 719CC8B795;
 Mon, 29 Apr 2019 07:42:31 +0200 (CEST)
Subject: Re: [PATCH v2 2/2] powerpc/perf: Add generic compat mode pmu driver
To: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <1556506368-29329-1-git-send-email-maddy@linux.vnet.ibm.com>
 <1556506368-29329-2-git-send-email-maddy@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <639fe9ec-365e-10dd-551e-44eb4bffd352@c-s.fr>
Date: Mon, 29 Apr 2019 07:42:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556506368-29329-2-git-send-email-maddy@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 29/04/2019 à 04:52, Madhavan Srinivasan a écrit :
> Most of the power processor generation performance monitoring
> unit (PMU) driver code is bundled in the kernel and one of those
> is enabled/registered based on the oprofile_cpu_type check at
> the boot.
> 
> But things get little tricky incase of "compat" mode boot.
> IBM POWER System Server based processors has a compactibility
> mode feature, which simpily put is, Nth generation processor
> (lets say POWER8) will act and appear in a mode consistent
> with an earlier generation (N-1) processor (that is POWER7).
> And in this "compat" mode boot, kernel modify the
> "oprofile_cpu_type" to be Nth generation (POWER8). If Nth
> generation pmu driver is bundled (POWER8), it gets registered.
> 
> Key dependency here is to have distro support for latest
> processor performance monitoring support. Patch here adds
> a generic "compat-mode" performance monitoring driver to
> be register in absence of powernv platform specific pmu driver.
> 
> Driver supports "cycles", "instruction" and "branch-miss" events.
> "0x100F0" used as event code for "cycles", "0x00002"
> used as event code for "instruction" events and "0x400F6"
> used as event code for "branch miss". These are architected events
> as part of ISA. New file called "generic-compat-pmu.c" is
> created to contain the driver specific code. And base raw event
> code format modeled on PPMU_ARCH_207S.
> 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
> ---
> Changelog v1:
> - Updated architected event opcodes
> - included branch miss with architected event opcode
> 
>   arch/powerpc/perf/Makefile             |   3 +-
>   arch/powerpc/perf/core-book3s.c        |   2 +-
>   arch/powerpc/perf/generic-compat-pmu.c | 245 +++++++++++++++++++++++++++++++++
>   arch/powerpc/perf/internal.h           |   1 +
>   4 files changed, 249 insertions(+), 2 deletions(-)
>   create mode 100644 arch/powerpc/perf/generic-compat-pmu.c
> 
> diff --git a/arch/powerpc/perf/Makefile b/arch/powerpc/perf/Makefile
> index ab26df5bacb9..c155dcbb8691 100644
> --- a/arch/powerpc/perf/Makefile
> +++ b/arch/powerpc/perf/Makefile
> @@ -5,7 +5,8 @@ obj-$(CONFIG_PERF_EVENTS)	+= callchain.o perf_regs.o
>   obj-$(CONFIG_PPC_PERF_CTRS)	+= core-book3s.o bhrb.o
>   obj64-$(CONFIG_PPC_PERF_CTRS)	+= ppc970-pmu.o power5-pmu.o \
>   				   power5+-pmu.o power6-pmu.o power7-pmu.o \
> -				   isa207-common.o power8-pmu.o power9-pmu.o
> +				   isa207-common.o power8-pmu.o power9-pmu.o \
> +				   generic-compat-pmu.o

Isn't that name a bit long ? What about compat-pmu instead ?

>   obj32-$(CONFIG_PPC_PERF_CTRS)	+= mpc7450-pmu.o
>   
>   obj-$(CONFIG_PPC_POWERNV)	+= imc-pmu.o
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index a96f9420139c..a66fb9c01c9e 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2318,7 +2318,7 @@ static int __init init_ppc64_pmu(void)
>   	else if (!init_ppc970_pmu())
>   		return 0;
>   	else
> -		return -ENODEV;
> +		return init_generic_compat_pmu();
>   }
>   early_initcall(init_ppc64_pmu);
>   #endif
> diff --git a/arch/powerpc/perf/generic-compat-pmu.c b/arch/powerpc/perf/generic-compat-pmu.c
> new file mode 100644
> index 000000000000..9c2d4bbc5c87
> --- /dev/null
> +++ b/arch/powerpc/perf/generic-compat-pmu.c
> @@ -0,0 +1,245 @@
> +/*
> + * Performance counter support.
> + *
> + * Copyright 2019 Madhavan Srinivasan, IBM Corporation.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or later version.

Shouldn't we use the new licence format for new files ? ie:

// SPDX-License-Identifier: GPL-2.0+

> + */
> +
> +#define pr_fmt(fmt)	"generic-compat-pmu: " fmt
> +
> +#include "isa207-common.h"
> +
> +/*
> + * Raw event encoding:
> + *
> + *        60        56        52        48        44        40        36        32
> + * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
> + *
> + *        28        24        20        16        12         8         4         0
> + * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
> + *                                 [ pmc ]   [unit ]   [ ]   m   [    pmcxsel    ]
> + *                                                     |     |
> + *                                                     |     *- mark
> + *                                                     |
> + *                                                     |
> + *                                                     *- combine
> + *
> + * Below uses IBM bit numbering.
> + *
> + * MMCR1[x:y] = unit    (PMCxUNIT)
> + * MMCR1[24]   = pmc1combine[0]
> + * MMCR1[25]   = pmc1combine[1]
> + * MMCR1[26]   = pmc2combine[0]
> + * MMCR1[27]   = pmc2combine[1]
> + * MMCR1[28]   = pmc3combine[0]
> + * MMCR1[29]   = pmc3combine[1]
> + * MMCR1[30]   = pmc4combine[0]
> + * MMCR1[31]   = pmc4combine[1]
> + *
> + */
> +
> +/*
> + * Some power9 event codes.
> + */
> +#define EVENT(_name, _code)	_name = _code,
> +
> +enum {
> +EVENT(PM_CYC,					0x100F0)
> +EVENT(PM_INST_CMPL,				0x00002)
> +EVENT(PM_BR_MPRED_CMPL,				0x400F6)
> +};
> +
> +#undef EVENT
> +
> +GENERIC_EVENT_ATTR(cpu-cycles,			PM_CYC);
> +GENERIC_EVENT_ATTR(instructions,		PM_INST_CMPL);
> +GENERIC_EVENT_ATTR(branch-misses,               PM_BR_MPRED_CMPL);
> +
> +static struct attribute *generic_compat_events_attr[] = {
> +	GENERIC_EVENT_PTR(PM_CYC),
> +	GENERIC_EVENT_PTR(PM_INST_CMPL),
> +	GENERIC_EVENT_PTR(PM_BR_MPRED_CMPL),
> +	NULL
> +};
> +
> +static struct attribute_group generic_compat_pmu_events_group = {
> +	.name = "events",
> +	.attrs = generic_compat_events_attr,
> +};
> +
> +PMU_FORMAT_ATTR(event,		"config:0-19");
> +PMU_FORMAT_ATTR(pmcxsel,	"config:0-7");
> +PMU_FORMAT_ATTR(mark,		"config:8");
> +PMU_FORMAT_ATTR(combine,	"config:10-11");
> +PMU_FORMAT_ATTR(unit,		"config:12-15");
> +PMU_FORMAT_ATTR(pmc,		"config:16-19");
> +
> +static struct attribute *generic_compat_pmu_format_attr[] = {
> +	&format_attr_event.attr,
> +	&format_attr_pmcxsel.attr,
> +	&format_attr_mark.attr,
> +	&format_attr_combine.attr,
> +	&format_attr_unit.attr,
> +	&format_attr_pmc.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group generic_compat_pmu_format_group = {
> +	.name = "format",
> +	.attrs = generic_compat_pmu_format_attr,
> +};
> +
> +static const struct attribute_group *generic_compat_pmu_attr_groups[] = {
> +	&generic_compat_pmu_format_group,
> +	&generic_compat_pmu_events_group,
> +	NULL,
> +};
> +
> +static int compat_generic_events[] = {
> +	[PERF_COUNT_HW_CPU_CYCLES] =			PM_CYC,
> +	[PERF_COUNT_HW_INSTRUCTIONS] =			PM_INST_CMPL,
> +	[PERF_COUNT_HW_BRANCH_MISSES] =                 PM_BR_MPRED_CMPL,
> +};
> +
> +#define C(x)	PERF_COUNT_HW_CACHE_##x
> +
> +/*
> + * Table of generalized cache-related events.
> + * 0 means not supported, -1 means nonsensical, other values
> + * are event codes.
> + */
> +static int generic_compat_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
> +	[ C(L1D) ] = {
> +		[ C(OP_READ) ] = {
> +			[ C(RESULT_ACCESS) ] = 0,
> +			[ C(RESULT_MISS)   ] = 0,
> +		},
> +		[ C(OP_WRITE) ] = {
> +			[ C(RESULT_ACCESS) ] = 0,
> +			[ C(RESULT_MISS)   ] = 0,
> +		},
> +		[ C(OP_PREFETCH) ] = {
> +			[ C(RESULT_ACCESS) ] = 0,
> +			[ C(RESULT_MISS)   ] = 0,
> +		},
> +	},
> +	[ C(L1I) ] = {
> +		[ C(OP_READ) ] = {
> +			[ C(RESULT_ACCESS) ] = 0,
> +			[ C(RESULT_MISS)   ] = 0,
> +		},
> +		[ C(OP_WRITE) ] = {
> +			[ C(RESULT_ACCESS) ] = 0,
> +			[ C(RESULT_MISS)   ] = -1,
> +		},
> +		[ C(OP_PREFETCH) ] = {
> +			[ C(RESULT_ACCESS) ] = 0,
> +			[ C(RESULT_MISS)   ] = 0,
> +		},
> +	},
> +	[ C(LL) ] = {
> +		[ C(OP_READ) ] = {
> +			[ C(RESULT_ACCESS) ] = 0,
> +			[ C(RESULT_MISS)   ] = 0,
> +		},
> +		[ C(OP_WRITE) ] = {
> +			[ C(RESULT_ACCESS) ] = 0,
> +			[ C(RESULT_MISS)   ] = 0,
> +		},
> +		[ C(OP_PREFETCH) ] = {
> +			[ C(RESULT_ACCESS) ] = 0,
> +			[ C(RESULT_MISS)   ] = 0,
> +		},
> +	},
> +	[ C(DTLB) ] = {
> +		[ C(OP_READ) ] = {
> +			[ C(RESULT_ACCESS) ] = 0,
> +			[ C(RESULT_MISS)   ] = 0,
> +		},
> +		[ C(OP_WRITE) ] = {
> +			[ C(RESULT_ACCESS) ] = -1,
> +			[ C(RESULT_MISS)   ] = -1,
> +		},
> +		[ C(OP_PREFETCH) ] = {
> +			[ C(RESULT_ACCESS) ] = -1,
> +			[ C(RESULT_MISS)   ] = -1,
> +		},
> +	},
> +	[ C(ITLB) ] = {
> +		[ C(OP_READ) ] = {
> +			[ C(RESULT_ACCESS) ] = 0,
> +			[ C(RESULT_MISS)   ] = 0,
> +		},
> +		[ C(OP_WRITE) ] = {
> +			[ C(RESULT_ACCESS) ] = -1,
> +			[ C(RESULT_MISS)   ] = -1,
> +		},
> +		[ C(OP_PREFETCH) ] = {
> +			[ C(RESULT_ACCESS) ] = -1,
> +			[ C(RESULT_MISS)   ] = -1,
> +		},
> +	},
> +	[ C(BPU) ] = {
> +		[ C(OP_READ) ] = {
> +			[ C(RESULT_ACCESS) ] = 0,
> +			[ C(RESULT_MISS)   ] = 0,
> +		},
> +		[ C(OP_WRITE) ] = {
> +			[ C(RESULT_ACCESS) ] = -1,
> +			[ C(RESULT_MISS)   ] = -1,
> +		},
> +		[ C(OP_PREFETCH) ] = {
> +			[ C(RESULT_ACCESS) ] = -1,
> +			[ C(RESULT_MISS)   ] = -1,
> +		},
> +	},
> +	[ C(NODE) ] = {
> +		[ C(OP_READ) ] = {
> +			[ C(RESULT_ACCESS) ] = -1,
> +			[ C(RESULT_MISS)   ] = -1,
> +		},
> +		[ C(OP_WRITE) ] = {
> +			[ C(RESULT_ACCESS) ] = -1,
> +			[ C(RESULT_MISS)   ] = -1,
> +		},
> +		[ C(OP_PREFETCH) ] = {
> +			[ C(RESULT_ACCESS) ] = -1,
> +			[ C(RESULT_MISS)   ] = -1,
> +		},
> +	},
> +};
> +
> +#undef C
> +
> +static struct power_pmu generic_compat_pmu = {
> +	.name			= "GENERIC_COMPAT",
> +	.n_counter		= MAX_PMU_COUNTERS,
> +	.add_fields		= ISA207_ADD_FIELDS,
> +	.test_adder		= ISA207_TEST_ADDER,
> +	.compute_mmcr		= isa207_compute_mmcr,
> +	.get_constraint		= isa207_get_constraint,
> +	.disable_pmc		= isa207_disable_pmc,
> +	.flags			= PPMU_HAS_SIER | PPMU_ARCH_207S,
> +	.n_generic		= ARRAY_SIZE(compat_generic_events),
> +	.generic_events		= compat_generic_events,
> +	.cache_events		= &generic_compat_cache_events,
> +	.attr_groups		= generic_compat_pmu_attr_groups,
> +};
> +
> +int init_generic_compat_pmu(void)
> +{
> +	int rc = 0;
> +
> +	rc = register_power_pmu(&generic_compat_pmu);
> +	if (rc)
> +		return rc;
> +
> +	/* Tell userspace that EBB is supported */
> +	cur_cpu_spec->cpu_user_features2 |= PPC_FEATURE2_EBB;
> +
> +	return 0;
> +}
> diff --git a/arch/powerpc/perf/internal.h b/arch/powerpc/perf/internal.h
> index e54d524d4283..185a40d1adff 100644
> --- a/arch/powerpc/perf/internal.h
> +++ b/arch/powerpc/perf/internal.h
> @@ -14,3 +14,4 @@ extern int init_power6_pmu(void);
>   extern int init_power7_pmu(void);
>   extern int init_power8_pmu(void);
>   extern int init_power9_pmu(void);
> +extern int init_generic_compat_pmu(void);

Don't use 'extern' keyword.

Christophe

