Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C141DA970
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 06:48:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RgJ71hqfzDqR7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 14:48:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RgGC5FhSzDqQK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 14:47:14 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04K4XDgm128752; Wed, 20 May 2020 00:47:12 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 313x63pv80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 00:47:12 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04K4kK5h012399;
 Wed, 20 May 2020 04:47:09 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 313xas2wfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 04:47:09 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04K4l7gt62718200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 May 2020 04:47:07 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E06BAE053;
 Wed, 20 May 2020 04:47:07 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DDACAE057;
 Wed, 20 May 2020 04:47:05 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.81.93])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 20 May 2020 04:47:04 +0000 (GMT)
Subject: Re: [PATCH V2] powerpc/perf: Add support for outputting extended regs
 in perf intr_regs
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <1589868937-1537-1-git-send-email-atrajeev@linux.vnet.ibm.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <f37cc550-fce4-4ee6-9a56-c797ade17ad3@linux.ibm.com>
Date: Wed, 20 May 2020 10:17:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1589868937-1537-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-19_11:2020-05-19,
 2020-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 cotscore=-2147483648 malwarescore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005200037
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
Cc: ravi.bangoria@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org, acme@kernel.org, anju@linux.vnet.ibm.com,
 jolsa@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/19/20 11:45 AM, Athira Rajeev wrote:
> From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
>
> Add support for perf extended register capability in powerpc.
> The capability flag PERF_PMU_CAP_EXTENDED_REGS, is used to indicate the
> PMU which support extended registers. The generic code define the mask
> of extended registers as 0 for non supported architectures.
>
> Patch adds extended regs support for power9 platform by
> exposing MMCR0, MMCR1 and MMCR2 registers.
>
> REG_RESERVED mask needs update to include extended regs.
> `PERF_REG_EXTENDED_MASK`, contains mask value of the supported registers,
> is defined at runtime in the kernel based on platform since the supported
> registers may differ from one processor version to another and hence the
> MASK value.
>
> Perf tools side uses extended mask to display the platform
> supported register names (with -I? option) to the user and also
> send this mask to the kernel to capture the extended registers
> in each sample. Hence decide the mask value based on the processor
> version.
>
> with patch
> ----------
>
> available registers: r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11
> r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26
> r27 r28 r29 r30 r31 nip msr orig_r3 ctr link xer ccr softe
> trap dar dsisr sier mmcra mmcr0 mmcr1 mmcr2
>
> PERF_RECORD_SAMPLE(IP, 0x1): 4784/4784: 0 period: 1 addr: 0
> ... intr regs: mask 0xffffffffffff ABI 64-bit
> .... r0    0xc00000000012b77c
> .... r1    0xc000003fe5e03930
> .... r2    0xc000000001b0e000
> .... r3    0xc000003fdcddf800
> .... r4    0xc000003fc7880000
> .... r5    0x9c422724be
> .... r6    0xc000003fe5e03908
> .... r7    0xffffff63bddc8706
> .... r8    0x9e4
> .... r9    0x0
> .... r10   0x1
> .... r11   0x0
> .... r12   0xc0000000001299c0
> .... r13   0xc000003ffffc4800
> .... r14   0x0
> .... r15   0x7fffdd8b8b00
> .... r16   0x0
> .... r17   0x7fffdd8be6b8
> .... r18   0x7e7076607730
> .... r19   0x2f
> .... r20   0xc00000001fc26c68
> .... r21   0xc0002041e4227e00
> .... r22   0xc00000002018fb60
> .... r23   0x1
> .... r24   0xc000003ffec4d900
> .... r25   0x80000000
> .... r26   0x0
> .... r27   0x1
> .... r28   0x1
> .... r29   0xc000000001be1260
> .... r30   0x6008010
> .... r31   0xc000003ffebb7218
> .... nip   0xc00000000012b910
> .... msr   0x9000000000009033
> .... orig_r3 0xc00000000012b86c
> .... ctr   0xc0000000001299c0
> .... link  0xc00000000012b77c
> .... xer   0x0
> .... ccr   0x28002222
> .... softe 0x1
> .... trap  0xf00
> .... dar   0x0
> .... dsisr 0x80000000000
> .... sier  0x0
> .... mmcra 0x80000000000
> .... mmcr0 0x82008090
> .... mmcr1 0x1e000000
> .... mmcr2 0x0
>   ... thread: perf:4784
>
> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
> [Defined PERF_REG_EXTENDED_MASK at run time to add support for different platforms ]
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> Changes from v1 -> v2
>
> - PERF_REG_EXTENDED_MASK` is defined at runtime in the kernel
> based on platform. This will give flexibility in using extended
> regs for all processor versions where the supported registers may differ.
> - removed PERF_REG_EXTENDED_MASK from the perf tools side. Based on the
> processor version(from PVR value), tool side will return the appropriate
> extended mask
> - Since tool changes can handle without a "PERF_REG_EXTENDED_MASK" macro,
> dropped patch to set NO_AUXTRACE.
> - Addressed review comments from Ravi Bangoria for V1
>
> ---
>
>   arch/powerpc/include/asm/perf_event_server.h    |  8 ++++
>   arch/powerpc/include/uapi/asm/perf_regs.h       | 14 ++++++-
>   arch/powerpc/perf/core-book3s.c                 |  1 +
>   arch/powerpc/perf/perf_regs.c                   | 34 ++++++++++++++--
>   arch/powerpc/perf/power9-pmu.c                  |  6 +++
>   tools/arch/powerpc/include/uapi/asm/perf_regs.h | 14 ++++++-
>   tools/perf/arch/powerpc/include/perf_regs.h     |  5 ++-
>   tools/perf/arch/powerpc/util/perf_regs.c        | 54 +++++++++++++++++++++++++
>   8 files changed, 130 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
> index 3e9703f..1458e1a 100644
> --- a/arch/powerpc/include/asm/perf_event_server.h
> +++ b/arch/powerpc/include/asm/perf_event_server.h
> @@ -15,6 +15,9 @@
>   #define MAX_EVENT_ALTERNATIVES	8
>   #define MAX_LIMITED_HWCOUNTERS	2
>
> +extern u64 mask_var;
> +#define PERF_REG_EXTENDED_MASK          mask_var
> +
>   struct perf_event;
>
>   /*
> @@ -55,6 +58,11 @@ struct power_pmu {
>   	int 		*blacklist_ev;
>   	/* BHRB entries in the PMU */
>   	int		bhrb_nr;
> +	/*
> +	 * set this flag with `PERF_PMU_CAP_EXTENDED_REGS` if
> +	 * the pmu supports extended perf regs capability
> +	 */
> +	int		capabilities;
>   };
>
>   /*
> diff --git a/arch/powerpc/include/uapi/asm/perf_regs.h b/arch/powerpc/include/uapi/asm/perf_regs.h
> index f599064..485b1d5 100644
> --- a/arch/powerpc/include/uapi/asm/perf_regs.h
> +++ b/arch/powerpc/include/uapi/asm/perf_regs.h
> @@ -48,6 +48,18 @@ enum perf_event_powerpc_regs {
>   	PERF_REG_POWERPC_DSISR,
>   	PERF_REG_POWERPC_SIER,
>   	PERF_REG_POWERPC_MMCRA,
> -	PERF_REG_POWERPC_MAX,
> +	/* Extended registers */
> +	PERF_REG_POWERPC_MMCR0,
> +	PERF_REG_POWERPC_MMCR1,
> +	PERF_REG_POWERPC_MMCR2,
> +	/* Max regs without the extended regs */
> +	PERF_REG_POWERPC_MAX = PERF_REG_POWERPC_MMCRA + 1,
>   };
> +
> +#define PERF_REG_PMU_MASK	((1ULL << PERF_REG_POWERPC_MAX) - 1)
> +
> +/* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300 */
> +#define PERF_REG_PMU_MASK_300   (((1ULL << (PERF_REG_POWERPC_MMCR2 + 1)) - 1) \
> +				- PERF_REG_PMU_MASK)
> +
>   #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 3dcfecf..f56b778 100644
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
> index a213a0a..f1dbbc5 100644
> --- a/arch/powerpc/perf/perf_regs.c
> +++ b/arch/powerpc/perf/perf_regs.c
> @@ -13,9 +13,11 @@
>   #include <asm/ptrace.h>
>   #include <asm/perf_regs.h>
>
> +u64 mask_var;
> +
>   #define PT_REGS_OFFSET(id, r) [id] = offsetof(struct pt_regs, r)
>
> -#define REG_RESERVED (~((1ULL << PERF_REG_POWERPC_MAX) - 1))
> +#define REG_RESERVED (~(PERF_REG_EXTENDED_MASK | PERF_REG_PMU_MASK))
>
>   static unsigned int pt_regs_offset[PERF_REG_POWERPC_MAX] = {
>   	PT_REGS_OFFSET(PERF_REG_POWERPC_R0,  gpr[0]),
> @@ -69,10 +71,26 @@
>   	PT_REGS_OFFSET(PERF_REG_POWERPC_MMCRA, dsisr),
>   };
>
> +/* Function to return the extended register values */
> +static u64 get_ext_regs_value(int idx)
> +{
> +	switch (idx) {
> +	case PERF_REG_POWERPC_MMCR0:
> +			return mfspr(SPRN_MMCR0);
> +	case PERF_REG_POWERPC_MMCR1:
> +			return mfspr(SPRN_MMCR1);
> +	case PERF_REG_POWERPC_MMCR2:
> +			return mfspr(SPRN_MMCR2);
> +	default: return 0;
> +	}
> +}
> +
>   u64 perf_reg_value(struct pt_regs *regs, int idx)
>   {
> -	if (WARN_ON_ONCE(idx >= PERF_REG_POWERPC_MAX))
> -		return 0;
> +	u64 PERF_REG_EXTENDED_MAX;
> +
> +	if (cpu_has_feature(CPU_FTR_ARCH_300))
> +		PERF_REG_EXTENDED_MAX = PERF_REG_POWERPC_MMCR2 + 1;
>
>   	if (idx == PERF_REG_POWERPC_SIER &&
>   	   (IS_ENABLED(CONFIG_FSL_EMB_PERF_EVENT) ||
> @@ -85,6 +103,16 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
>   	    IS_ENABLED(CONFIG_PPC32)))
>   		return 0;
>
> +	if (idx >= PERF_REG_POWERPC_MAX && idx < PERF_REG_EXTENDED_MAX)
> +		return get_ext_regs_value(idx);
> +
> +	/*
> +	 * If the idx is referring to value beyond the
> +	 * supported registers, return 0 with a warning
> +	 */
> +	if (WARN_ON_ONCE(idx >= PERF_REG_EXTENDED_MAX))
> +		return 0;
> +
>   	return regs_get_register(regs, pt_regs_offset[idx]);
>   }
>
> diff --git a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c
> index 08c3ef7..4525090 100644
> --- a/arch/powerpc/perf/power9-pmu.c
> +++ b/arch/powerpc/perf/power9-pmu.c
> @@ -90,6 +90,8 @@ enum {
>   #define POWER9_MMCRA_IFM3		0x00000000C0000000UL
>   #define POWER9_MMCRA_BHRB_MASK		0x00000000C0000000UL
>
> +extern u64 mask_var;
> +
>   /* Nasty Power9 specific hack */
>   #define PVR_POWER9_CUMULUS		0x00002000
>
> @@ -434,6 +436,7 @@ static void power9_config_bhrb(u64 pmu_bhrb_filter)
>   	.cache_events		= &power9_cache_events,
>   	.attr_groups		= power9_pmu_attr_groups,
>   	.bhrb_nr		= 32,
> +	.capabilities           = PERF_PMU_CAP_EXTENDED_REGS,
>   };
>
>   int init_power9_pmu(void)
> @@ -457,6 +460,9 @@ int init_power9_pmu(void)
>   		}
>   	}
>
> +	/* Set the PERF_REG_EXTENDED_MASK here */
> +	mask_var = PERF_REG_PMU_MASK_300;
> +
>   	rc = register_power_pmu(&power9_pmu);
>   	if (rc)
>   		return rc;
> diff --git a/tools/arch/powerpc/include/uapi/asm/perf_regs.h b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
> index f599064..485b1d5 100644
> --- a/tools/arch/powerpc/include/uapi/asm/perf_regs.h
> +++ b/tools/arch/powerpc/include/uapi/asm/perf_regs.h
> @@ -48,6 +48,18 @@ enum perf_event_powerpc_regs {
>   	PERF_REG_POWERPC_DSISR,
>   	PERF_REG_POWERPC_SIER,
>   	PERF_REG_POWERPC_MMCRA,
> -	PERF_REG_POWERPC_MAX,
> +	/* Extended registers */
> +	PERF_REG_POWERPC_MMCR0,
> +	PERF_REG_POWERPC_MMCR1,
> +	PERF_REG_POWERPC_MMCR2,
> +	/* Max regs without the extended regs */
> +	PERF_REG_POWERPC_MAX = PERF_REG_POWERPC_MMCRA + 1,
>   };
> +
> +#define PERF_REG_PMU_MASK	((1ULL << PERF_REG_POWERPC_MAX) - 1)
> +
> +/* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300 */
> +#define PERF_REG_PMU_MASK_300   (((1ULL << (PERF_REG_POWERPC_MMCR2 + 1)) - 1) \
> +				- PERF_REG_PMU_MASK)
> +
>   #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
> diff --git a/tools/perf/arch/powerpc/include/perf_regs.h b/tools/perf/arch/powerpc/include/perf_regs.h
> index e18a355..46ed00d 100644
> --- a/tools/perf/arch/powerpc/include/perf_regs.h
> +++ b/tools/perf/arch/powerpc/include/perf_regs.h
> @@ -64,7 +64,10 @@
>   	[PERF_REG_POWERPC_DAR] = "dar",
>   	[PERF_REG_POWERPC_DSISR] = "dsisr",
>   	[PERF_REG_POWERPC_SIER] = "sier",
> -	[PERF_REG_POWERPC_MMCRA] = "mmcra"
> +	[PERF_REG_POWERPC_MMCRA] = "mmcra",
> +	[PERF_REG_POWERPC_MMCR0] = "mmcr0",
> +	[PERF_REG_POWERPC_MMCR1] = "mmcr1",
> +	[PERF_REG_POWERPC_MMCR2] = "mmcr2",
>   };
>
>   static inline const char *perf_reg_name(int id)
> diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/arch/powerpc/util/perf_regs.c
> index 0a52429..b78f81f 100644
> --- a/tools/perf/arch/powerpc/util/perf_regs.c
> +++ b/tools/perf/arch/powerpc/util/perf_regs.c
> @@ -6,9 +6,15 @@
>
>   #include "../../../util/perf_regs.h"
>   #include "../../../util/debug.h"
> +#include "../../../util/event.h"
> +#include "../../../util/header.h"
> +#include "../../../perf-sys.h"
>
> +#include <api/fs/fs.h>
>   #include <linux/kernel.h>
>
> +#define PVR_POWER9		0x004E
> +
>   const struct sample_reg sample_reg_masks[] = {
>   	SMPL_REG(r0, PERF_REG_POWERPC_R0),
>   	SMPL_REG(r1, PERF_REG_POWERPC_R1),
> @@ -55,6 +61,9 @@
>   	SMPL_REG(dsisr, PERF_REG_POWERPC_DSISR),
>   	SMPL_REG(sier, PERF_REG_POWERPC_SIER),
>   	SMPL_REG(mmcra, PERF_REG_POWERPC_MMCRA),
> +	SMPL_REG(mmcr0, PERF_REG_POWERPC_MMCR0),
> +	SMPL_REG(mmcr1, PERF_REG_POWERPC_MMCR1),
> +	SMPL_REG(mmcr2, PERF_REG_POWERPC_MMCR2),
>   	SMPL_REG_END
>   };
>
> @@ -163,3 +172,48 @@ int arch_sdt_arg_parse_op(char *old_op, char **new_op)
>
>   	return SDT_ARG_VALID;
>   }
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
> +	 */
> +	get_cpuid(buffer, sizeof(buffer));
> +	ret = sscanf(buffer, "%u,", &version);
> +
> +	if (ret != 1) {
> +		pr_debug("Failed to get the processor version, unable to output extended registers\n");
> +		return PERF_REGS_MASK;
> +	}
> +
> +	if (version == PVR_POWER9)
> +		extended_mask = PERF_REG_PMU_MASK_300;

Can you add an else part to return with PERF_REGS_MASK.
That can avoid one sys_open for previous platforms.

Maddy
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
> +}

