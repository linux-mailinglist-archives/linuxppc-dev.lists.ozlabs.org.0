Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC14D1C5360
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 12:37:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Gbkh4j1BzDq83
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 20:37:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GbcZ0Sb8zDqFs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 20:31:41 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 045A3UFm084062; Tue, 5 May 2020 06:31:32 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30s2g2r1da-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 06:31:31 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 045AUDvl011177;
 Tue, 5 May 2020 10:31:30 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 30s0g5ara0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 10:31:29 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 045AVRnq39125240
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 May 2020 10:31:27 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 708E511C05B;
 Tue,  5 May 2020 10:31:27 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9407311C04A;
 Tue,  5 May 2020 10:31:17 +0000 (GMT)
Received: from [9.199.55.23] (unknown [9.199.55.23])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  5 May 2020 10:31:16 +0000 (GMT)
Subject: Re: [PATCH 2/2] powerpc/perf: Add support for outputting extended
 regs in perf intr_regs
To: Anju T Sudhakar <anju@linux.vnet.ibm.com>
References: <20200429060415.25930-1-anju@linux.vnet.ibm.com>
 <20200429060415.25930-3-anju@linux.vnet.ibm.com>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <3d8b3e54-8294-c5c1-f1ad-33e64a738ea7@linux.ibm.com>
Date: Tue, 5 May 2020 16:01:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429060415.25930-3-anju@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-05_06:2020-05-04,
 2020-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005050076
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, maddy@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org, acme@kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Anju,

Minor neats...

>   /*
> diff --git a/arch/powerpc/include/uapi/asm/perf_regs.h b/arch/powerpc/include/uapi/asm/perf_regs.h
> index f599064dd8dc..604b831378fe 100644
> --- a/arch/powerpc/include/uapi/asm/perf_regs.h
> +++ b/arch/powerpc/include/uapi/asm/perf_regs.h
> @@ -48,6 +48,17 @@ enum perf_event_powerpc_regs {
>   	PERF_REG_POWERPC_DSISR,
>   	PERF_REG_POWERPC_SIER,
>   	PERF_REG_POWERPC_MMCRA,
> -	PERF_REG_POWERPC_MAX,
> +	/* Extended registers */
> +	PERF_REG_POWERPC_MMCR0,
> +	PERF_REG_POWERPC_MMCR1,
> +	PERF_REG_POWERPC_MMCR2,
> +	PERF_REG_EXTENDED_MAX,
> +	/* Max regs without the extended regs */
> +	PERF_REG_POWERPC_MAX = PERF_REG_POWERPC_MMCRA + 1,
>   };
> +
> +#define PERF_REG_PMU_MASK	((1ULL << PERF_REG_POWERPC_MAX) - 1)

Would it make sense to reuse PERF_REG_MASK? Userspace code already uses
that name for the same expression.

> +#define PERF_REG_EXTENDED_MASK  (((1ULL << (PERF_REG_EXTENDED_MAX))	\
> +			- 1) - PERF_REG_PMU_MASK)

You don't need parenthesis in (PERF_REG_EXTENDED_MAX). Also, better to
keep that `- 1)` in first line.

> +
>   #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 3dcfecf858f3..f56b77800a7b 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2276,6 +2276,7 @@ int register_power_pmu(struct power_pmu *pmu)
>   
>   	power_pmu.attr_groups = ppmu->attr_groups;
>   
> +	power_pmu.capabilities |= (ppmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS);
>   #ifdef MSR_HV
>   	/*
>   	 * Use FCHV to ignore kernel events if MSR.HV is set.
> diff --git a/arch/powerpc/perf/perf_regs.c b/arch/powerpc/perf/perf_regs.c
> index a213a0aa5d25..57aa02568caf 100644
> --- a/arch/powerpc/perf/perf_regs.c
> +++ b/arch/powerpc/perf/perf_regs.c
> @@ -15,7 +15,8 @@
>   
>   #define PT_REGS_OFFSET(id, r) [id] = offsetof(struct pt_regs, r)
>   
> -#define REG_RESERVED (~((1ULL << PERF_REG_POWERPC_MAX) - 1))
> +#define REG_RESERVED (~(PERF_REG_EXTENDED_MASK) &	\
> +			(~((1ULL << PERF_REG_POWERPC_MAX) - 1)))

Can we reuse PERF_REG_PMU_MASK here and simplify it to:
   #define REG_RESERVED (~(PERF_REG_EXTENDED_MASK | PERF_REG_PMU_MASK))

>   
>   static unsigned int pt_regs_offset[PERF_REG_POWERPC_MAX] = {
>   	PT_REGS_OFFSET(PERF_REG_POWERPC_R0,  gpr[0]),
> @@ -69,10 +70,22 @@ static unsigned int pt_regs_offset[PERF_REG_POWERPC_MAX] = {
>   	PT_REGS_OFFSET(PERF_REG_POWERPC_MMCRA, dsisr),
>   };
>   
> +/* Function to return the extended register values */
> +static u64 get_ext_regs_value(int idx)
> +{
> +	switch (idx) {
> +	case PERF_REG_POWERPC_MMCR0:
> +				    return mfspr(SPRN_MMCR0);
> +	case PERF_REG_POWERPC_MMCR1:
> +				    return mfspr(SPRN_MMCR1);
> +	case PERF_REG_POWERPC_MMCR2:
> +				    return mfspr(SPRN_MMCR2);

Unnecessary tabs.

[...]

> diff --git a/tools/arch/powerpc/include/uapi/asm/perf_regs.h b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
> index f599064dd8dc..d66953294c73 100644
> --- a/tools/arch/powerpc/include/uapi/asm/perf_regs.h
> +++ b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
> @@ -48,6 +48,17 @@ enum perf_event_powerpc_regs {
>   	PERF_REG_POWERPC_DSISR,
>   	PERF_REG_POWERPC_SIER,
>   	PERF_REG_POWERPC_MMCRA,
> -	PERF_REG_POWERPC_MAX,
> +	/* Extended arch registers */
> +	PERF_REG_POWERPC_MMCR0,
> +	PERF_REG_POWERPC_MMCR1,
> +	PERF_REG_POWERPC_MMCR2,
> +	PERF_REG_EXTENDED_MAX,
> +	/* Max regs without extended arch regs */
> +	PERF_REG_POWERPC_MAX = PERF_REG_POWERPC_MMCRA + 1,
> +

Unnecesasy line.

>   };
> +#define PERF_REG_PMU_MASK	((1ULL << PERF_REG_POWERPC_MAX) - 1)
> +#define PERF_REG_EXTENDED_MASK  (((1ULL << (PERF_REG_EXTENDED_MAX))\
> +			- 1) - PERF_REG_PMU_MASK)
> +
>   #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
> diff --git a/tools/perf/arch/powerpc/include/perf_regs.h b/tools/perf/arch/powerpc/include/perf_regs.h
> index e18a3556f5e3..f7bbdb816f88 100644
> --- a/tools/perf/arch/powerpc/include/perf_regs.h
> +++ b/tools/perf/arch/powerpc/include/perf_regs.h
> @@ -64,7 +64,11 @@ static const char *reg_names[] = {
>   	[PERF_REG_POWERPC_DAR] = "dar",
>   	[PERF_REG_POWERPC_DSISR] = "dsisr",
>   	[PERF_REG_POWERPC_SIER] = "sier",
> -	[PERF_REG_POWERPC_MMCRA] = "mmcra"
> +	[PERF_REG_POWERPC_MMCRA] = "mmcra",
> +	[PERF_REG_POWERPC_MMCR0] = "mmcr0",
> +	[PERF_REG_POWERPC_MMCR1] = "mmcr1",
> +	[PERF_REG_POWERPC_MMCR2] = "mmcr2",
> +

Unnecesasy line.

Apart from those, for the series:
Reviewed-and-Tested-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
