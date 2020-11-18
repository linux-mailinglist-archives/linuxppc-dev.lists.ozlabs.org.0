Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 720102B7568
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 05:38:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbVRj34z6zDqdx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 15:38:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbVPq08y6zDqNb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 15:36:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=M5s/CFkO; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CbVPp4FpJz9sRR;
 Wed, 18 Nov 2020 15:36:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1605674190;
 bh=bx8j/pWgfkmrCeNv9VkCrFWqScxw26Yxr77QaBaeeb4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=M5s/CFkOPpva6edQuiPWxXJ/o7W7ZqqGNYIgGFGtJz7XIGScDoT7Lqm2q8iirR5mP
 zHhCbk5Iev28StnlpK0PiapMOeHwx6uEPxAwcevitf6n6VbX2mU/jNZBF8mvfS6KQD
 8OrrTKaMURIZfij6ocoEFCvQtuCXsTcZV5oTd5+fZFGmmTJWljt2lpG81sWpqJqSCA
 w53XAGhD7EDk/sjMjBxiYvDnBgOocK2/dHS2+WHNuaTLeJjs7K4nj/NlknY6q6+WHG
 DtAI1TZRson4Q2ctEuI3aZTdJJbSYZzBBwro0qt8aqFju5mNcLB6RZHBzTls0Ju42b
 bw8Xm8vxob/fQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/4] powerpc/perf: Fix to update l2l3 events and generic
 event codes for power10
In-Reply-To: <1605069189-2740-4-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1605069189-2740-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1605069189-2740-4-git-send-email-atrajeev@linux.vnet.ibm.com>
Date: Wed, 18 Nov 2020 15:36:30 +1100
Message-ID: <875z632sdt.fsf@mpe.ellerman.id.au>
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
Cc: mikey@neuling.org, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
> Fix the event code for events: branch-instructions (to PM_BR_FIN),
> branch-misses (to PM_BR_MPRED_FIN) and cache-misses (to
> PM_LD_DEMAND_MISS_L1_FIN) for power10 PMU. Update the
> list of generic events with this modified event code.

That should be one patch.

> Export l2l3 events (PM_L2_ST_MISS and PM_L2_ST) and LLC-prefetches
> (PM_L3_PF_MISS_L3) via sysfs, and also add these to cache_events.

That should be another patch.

> To maintain the current event code work with DD1, rename
> existing array of generic_events, cache_events and pmu_attr_groups
> with suffix _dd1. Update the power10 pmu init code to pick the
> dd1 list while registering the power PMU, based on the pvr
> (Processor Version Register) value.

And that should be a third patch.

cheers

> diff --git a/arch/powerpc/perf/power10-events-list.h b/arch/powerpc/perf/power10-events-list.h
> index 60c1b81..9e0b3c9 100644
> --- a/arch/powerpc/perf/power10-events-list.h
> +++ b/arch/powerpc/perf/power10-events-list.h
> @@ -15,6 +15,9 @@
>  EVENT(PM_RUN_INST_CMPL,				0x500fa);
>  EVENT(PM_BR_CMPL,                               0x4d05e);
>  EVENT(PM_BR_MPRED_CMPL,                         0x400f6);
> +EVENT(PM_BR_FIN,				0x2f04a);
> +EVENT(PM_BR_MPRED_FIN,				0x35884);
> +EVENT(PM_LD_DEMAND_MISS_L1_FIN,			0x400f0);
>  
>  /* All L1 D cache load references counted at finish, gated by reject */
>  EVENT(PM_LD_REF_L1,				0x100fc);
> @@ -36,6 +39,12 @@
>  EVENT(PM_DATA_FROM_L3,				0x01340000001c040);
>  /* Demand LD - L3 Miss (not L2 hit and not L3 hit) */
>  EVENT(PM_DATA_FROM_L3MISS,			0x300fe);
> +/* All successful D-side store dispatches for this thread */
> +EVENT(PM_L2_ST,					0x010000046080);
> +/* All successful D-side store dispatches for this thread that were L2 Miss */
> +EVENT(PM_L2_ST_MISS,				0x26880);
> +/* Total HW L3 prefetches(Load+store) */
> +EVENT(PM_L3_PF_MISS_L3,				0x100000016080);
>  /* Data PTEG reload */
>  EVENT(PM_DTLB_MISS,				0x300fc);
>  /* ITLB Reloaded */
> diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
> index cf44fb7..86665ad 100644
> --- a/arch/powerpc/perf/power10-pmu.c
> +++ b/arch/powerpc/perf/power10-pmu.c
> @@ -114,6 +114,9 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
>  GENERIC_EVENT_ATTR(cache-misses,		PM_LD_MISS_L1);
>  GENERIC_EVENT_ATTR(mem-loads,			MEM_LOADS);
>  GENERIC_EVENT_ATTR(mem-stores,			MEM_STORES);
> +GENERIC_EVENT_ATTR(branch-instructions,         PM_BR_FIN);
> +GENERIC_EVENT_ATTR(branch-misses,               PM_BR_MPRED_FIN);
> +GENERIC_EVENT_ATTR(cache-misses,		PM_LD_DEMAND_MISS_L1_FIN);
>  
>  CACHE_EVENT_ATTR(L1-dcache-load-misses,		PM_LD_MISS_L1);
>  CACHE_EVENT_ATTR(L1-dcache-loads,		PM_LD_REF_L1);
> @@ -124,12 +127,15 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
>  CACHE_EVENT_ATTR(L1-icache-prefetches,		PM_IC_PREF_REQ);
>  CACHE_EVENT_ATTR(LLC-load-misses,		PM_DATA_FROM_L3MISS);
>  CACHE_EVENT_ATTR(LLC-loads,			PM_DATA_FROM_L3);
> +CACHE_EVENT_ATTR(LLC-prefetches,		PM_L3_PF_MISS_L3);
> +CACHE_EVENT_ATTR(LLC-store-misses,		PM_L2_ST_MISS);
> +CACHE_EVENT_ATTR(LLC-stores,			PM_L2_ST);
>  CACHE_EVENT_ATTR(branch-load-misses,		PM_BR_MPRED_CMPL);
>  CACHE_EVENT_ATTR(branch-loads,			PM_BR_CMPL);
>  CACHE_EVENT_ATTR(dTLB-load-misses,		PM_DTLB_MISS);
>  CACHE_EVENT_ATTR(iTLB-load-misses,		PM_ITLB_MISS);
>  
> -static struct attribute *power10_events_attr[] = {
> +static struct attribute *power10_events_attr_dd1[] = {
>  	GENERIC_EVENT_PTR(PM_RUN_CYC),
>  	GENERIC_EVENT_PTR(PM_RUN_INST_CMPL),
>  	GENERIC_EVENT_PTR(PM_BR_CMPL),
> @@ -154,11 +160,44 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
>  	NULL
>  };
>  
> +static struct attribute *power10_events_attr[] = {
> +	GENERIC_EVENT_PTR(PM_RUN_CYC),
> +	GENERIC_EVENT_PTR(PM_RUN_INST_CMPL),
> +	GENERIC_EVENT_PTR(PM_BR_FIN),
> +	GENERIC_EVENT_PTR(PM_BR_MPRED_FIN),
> +	GENERIC_EVENT_PTR(PM_LD_REF_L1),
> +	GENERIC_EVENT_PTR(PM_LD_DEMAND_MISS_L1_FIN),
> +	GENERIC_EVENT_PTR(MEM_LOADS),
> +	GENERIC_EVENT_PTR(MEM_STORES),
> +	CACHE_EVENT_PTR(PM_LD_MISS_L1),
> +	CACHE_EVENT_PTR(PM_LD_REF_L1),
> +	CACHE_EVENT_PTR(PM_LD_PREFETCH_CACHE_LINE_MISS),
> +	CACHE_EVENT_PTR(PM_ST_MISS_L1),
> +	CACHE_EVENT_PTR(PM_L1_ICACHE_MISS),
> +	CACHE_EVENT_PTR(PM_INST_FROM_L1),
> +	CACHE_EVENT_PTR(PM_IC_PREF_REQ),
> +	CACHE_EVENT_PTR(PM_DATA_FROM_L3MISS),
> +	CACHE_EVENT_PTR(PM_DATA_FROM_L3),
> +	CACHE_EVENT_PTR(PM_L3_PF_MISS_L3),
> +	CACHE_EVENT_PTR(PM_L2_ST_MISS),
> +	CACHE_EVENT_PTR(PM_L2_ST),
> +	CACHE_EVENT_PTR(PM_BR_MPRED_CMPL),
> +	CACHE_EVENT_PTR(PM_BR_CMPL),
> +	CACHE_EVENT_PTR(PM_DTLB_MISS),
> +	CACHE_EVENT_PTR(PM_ITLB_MISS),
> +	NULL
> +};
> +
>  static struct attribute_group power10_pmu_events_group = {
>  	.name = "events",
>  	.attrs = power10_events_attr,
>  };
>  
> +static struct attribute_group power10_pmu_events_group_dd1 = {
> +	.name = "events",
> +	.attrs = power10_events_attr_dd1,
> +};
> +
>  PMU_FORMAT_ATTR(event,          "config:0-59");
>  PMU_FORMAT_ATTR(pmcxsel,        "config:0-7");
>  PMU_FORMAT_ATTR(mark,           "config:8");
> @@ -211,7 +250,13 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
>  	NULL,
>  };
>  
> -static int power10_generic_events[] = {
> +static const struct attribute_group *power10_pmu_attr_groups_dd1[] = {
> +	&power10_pmu_format_group,
> +	&power10_pmu_events_group_dd1,
> +	NULL,
> +};
> +
> +static int power10_generic_events_dd1[] = {
>  	[PERF_COUNT_HW_CPU_CYCLES] =			PM_RUN_CYC,
>  	[PERF_COUNT_HW_INSTRUCTIONS] =			PM_RUN_INST_CMPL,
>  	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] =		PM_BR_CMPL,
> @@ -220,6 +265,15 @@ static int power10_get_alternatives(u64 event, unsigned int flags, u64 alt[])
>  	[PERF_COUNT_HW_CACHE_MISSES] =			PM_LD_MISS_L1,
>  };
>  
> +static int power10_generic_events[] = {
> +	[PERF_COUNT_HW_CPU_CYCLES] =			PM_RUN_CYC,
> +	[PERF_COUNT_HW_INSTRUCTIONS] =			PM_RUN_INST_CMPL,
> +	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] =		PM_BR_FIN,
> +	[PERF_COUNT_HW_BRANCH_MISSES] =			PM_BR_MPRED_FIN,
> +	[PERF_COUNT_HW_CACHE_REFERENCES] =		PM_LD_REF_L1,
> +	[PERF_COUNT_HW_CACHE_MISSES] =			PM_LD_DEMAND_MISS_L1_FIN,
> +};
> +
>  static u64 power10_bhrb_filter_map(u64 branch_sample_type)
>  {
>  	u64 pmu_bhrb_filter = 0;
> @@ -311,6 +365,107 @@ static void power10_config_bhrb(u64 pmu_bhrb_filter)
>  			[C(RESULT_MISS)] = PM_DATA_FROM_L3MISS,
>  		},
>  		[C(OP_WRITE)] = {
> +			[C(RESULT_ACCESS)] = PM_L2_ST,
> +			[C(RESULT_MISS)] = PM_L2_ST_MISS,
> +		},
> +		[C(OP_PREFETCH)] = {
> +			[C(RESULT_ACCESS)] = PM_L3_PF_MISS_L3,
> +			[C(RESULT_MISS)] = 0,
> +		},
> +	},
> +	 [C(DTLB)] = {
> +		[C(OP_READ)] = {
> +			[C(RESULT_ACCESS)] = 0,
> +			[C(RESULT_MISS)] = PM_DTLB_MISS,
> +		},
> +		[C(OP_WRITE)] = {
> +			[C(RESULT_ACCESS)] = -1,
> +			[C(RESULT_MISS)] = -1,
> +		},
> +		[C(OP_PREFETCH)] = {
> +			[C(RESULT_ACCESS)] = -1,
> +			[C(RESULT_MISS)] = -1,
> +		},
> +	},
> +	[C(ITLB)] = {
> +		[C(OP_READ)] = {
> +			[C(RESULT_ACCESS)] = 0,
> +			[C(RESULT_MISS)] = PM_ITLB_MISS,
> +		},
> +		[C(OP_WRITE)] = {
> +			[C(RESULT_ACCESS)] = -1,
> +			[C(RESULT_MISS)] = -1,
> +		},
> +		[C(OP_PREFETCH)] = {
> +			[C(RESULT_ACCESS)] = -1,
> +			[C(RESULT_MISS)] = -1,
> +		},
> +	},
> +	[C(BPU)] = {
> +		[C(OP_READ)] = {
> +			[C(RESULT_ACCESS)] = PM_BR_CMPL,
> +			[C(RESULT_MISS)] = PM_BR_MPRED_CMPL,
> +		},
> +		[C(OP_WRITE)] = {
> +			[C(RESULT_ACCESS)] = -1,
> +			[C(RESULT_MISS)] = -1,
> +		},
> +		[C(OP_PREFETCH)] = {
> +			[C(RESULT_ACCESS)] = -1,
> +			[C(RESULT_MISS)] = -1,
> +		},
> +	},
> +	[C(NODE)] = {
> +		[C(OP_READ)] = {
> +			[C(RESULT_ACCESS)] = -1,
> +			[C(RESULT_MISS)] = -1,
> +		},
> +		[C(OP_WRITE)] = {
> +			[C(RESULT_ACCESS)] = -1,
> +			[C(RESULT_MISS)] = -1,
> +		},
> +		[C(OP_PREFETCH)] = {
> +			[C(RESULT_ACCESS)] = -1,
> +			[C(RESULT_MISS)] = -1,
> +		},
> +	},
> +};
> +
> +static u64 power10_cache_events_dd1[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
> +	[C(L1D)] = {
> +		[C(OP_READ)] = {
> +			[C(RESULT_ACCESS)] = PM_LD_REF_L1,
> +			[C(RESULT_MISS)] = PM_LD_MISS_L1,
> +		},
> +		[C(OP_WRITE)] = {
> +			[C(RESULT_ACCESS)] = 0,
> +			[C(RESULT_MISS)] = PM_ST_MISS_L1,
> +		},
> +		[C(OP_PREFETCH)] = {
> +			[C(RESULT_ACCESS)] = PM_LD_PREFETCH_CACHE_LINE_MISS,
> +			[C(RESULT_MISS)] = 0,
> +		},
> +	},
> +	[C(L1I)] = {
> +		[C(OP_READ)] = {
> +			[C(RESULT_ACCESS)] = PM_INST_FROM_L1,
> +			[C(RESULT_MISS)] = PM_L1_ICACHE_MISS,
> +		},
> +		[C(OP_WRITE)] = {
> +			[C(RESULT_ACCESS)] = PM_INST_FROM_L1MISS,
> +			[C(RESULT_MISS)] = -1,
> +		},
> +		[C(OP_PREFETCH)] = {
> +			[C(RESULT_ACCESS)] = PM_IC_PREF_REQ,
> +			[C(RESULT_MISS)] = 0,
> +		},
> +	},
> +	[C(LL)] = {
> +		[C(OP_READ)] = {
> +			[C(RESULT_ACCESS)] = PM_DATA_FROM_L3,
> +			[C(RESULT_MISS)] = PM_DATA_FROM_L3MISS,
> +		},
> +		[C(OP_WRITE)] = {
>  			[C(RESULT_ACCESS)] = -1,
>  			[C(RESULT_MISS)] = -1,
>  		},
> @@ -407,6 +562,7 @@ static void power10_config_bhrb(u64 pmu_bhrb_filter)
>  int init_power10_pmu(void)
>  {
>  	int rc;
> +	unsigned int pvr = mfspr(SPRN_PVR);
>  
>  	/* Comes from cpu_specs[] */
>  	if (!cur_cpu_spec->oprofile_cpu_type ||
> @@ -416,6 +572,12 @@ int init_power10_pmu(void)
>  	/* Set the PERF_REG_EXTENDED_MASK here */
>  	PERF_REG_EXTENDED_MASK = PERF_REG_PMU_MASK_31;
>  
> +	if ((PVR_MAJ(pvr) == 1)) {
> +		power10_pmu.generic_events = power10_generic_events_dd1;
> +		power10_pmu.attr_groups = power10_pmu_attr_groups_dd1;
> +		power10_pmu.cache_events = &power10_cache_events_dd1;
> +	}
> +
>  	rc = register_power_pmu(&power10_pmu);
>  	if (rc)
>  		return rc;
> -- 
> 1.8.3.1
