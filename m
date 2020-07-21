Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E583822789B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 08:08:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9p772LF2zDqb1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 16:08:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9p2K3BpdzDqjn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 16:04:09 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06L63PK1125312; Tue, 21 Jul 2020 02:04:04 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32dmfk0qe4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 02:04:04 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06L5nMRk029912;
 Tue, 21 Jul 2020 06:04:03 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 32brq8g2k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 06:04:03 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06L642r448890338
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jul 2020 06:04:02 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B9F2124054;
 Tue, 21 Jul 2020 06:04:02 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 002B3124052;
 Tue, 21 Jul 2020 06:03:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.85.6])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jul 2020 06:03:59 +0000 (GMT)
Subject: Re: [v3 14/15] powerpc/perf: Add extended regs support for power10
 platform
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au,
 acme@kernel.org, jolsa@kernel.org
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1594996707-3727-15-git-send-email-atrajeev@linux.vnet.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <a1cc4c09-7116-0a7f-8f88-3a1697b82a24@linux.ibm.com>
Date: Tue, 21 Jul 2020 11:33:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1594996707-3727-15-git-send-email-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_02:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007210043
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, maddy@linux.vnet.ibm.com,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, svaidyan@in.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/17/20 8:08 PM, Athira Rajeev wrote:
> Include capability flag `PERF_PMU_CAP_EXTENDED_REGS` for power10
> and expose MMCR3, SIER2, SIER3 registers as part of extended regs.
> Also introduce `PERF_REG_PMU_MASK_31` to define extended mask
> value at runtime for power10
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> [Fix build failure on PPC32 platform]
> Suggested-by: Ryan Grimm <grimm@linux.ibm.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  arch/powerpc/include/uapi/asm/perf_regs.h |  6 ++++++
>  arch/powerpc/perf/perf_regs.c             | 12 +++++++++++-
>  arch/powerpc/perf/power10-pmu.c           |  6 ++++++
>  3 files changed, 23 insertions(+), 1 deletion(-)
> 


Reviewed-by: Kajol Jain <kjain@linux.ibm.com>

Thanks,
Kajol Jain

> diff --git a/arch/powerpc/include/uapi/asm/perf_regs.h b/arch/powerpc/include/uapi/asm/perf_regs.h
> index 225c64c..bdf5f10 100644
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
> @@ -60,6 +63,9 @@ enum perf_event_powerpc_regs {
>  
>  /* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300 */
>  #define PERF_REG_PMU_MASK_300   (((1ULL << (PERF_REG_POWERPC_MMCR2 + 1)) - 1) - PERF_REG_PMU_MASK)
> +/* PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_31 */
> +#define PERF_REG_PMU_MASK_31   (((1ULL << (PERF_REG_POWERPC_SIER3 + 1)) - 1) - PERF_REG_PMU_MASK)
>  
>  #define PERF_REG_MAX_ISA_300   (PERF_REG_POWERPC_MMCR2 + 1)
> +#define PERF_REG_MAX_ISA_31    (PERF_REG_POWERPC_SIER3 + 1)
>  #endif /* _UAPI_ASM_POWERPC_PERF_REGS_H */
> diff --git a/arch/powerpc/perf/perf_regs.c b/arch/powerpc/perf/perf_regs.c
> index b0cf68f..11b90d5 100644
> --- a/arch/powerpc/perf/perf_regs.c
> +++ b/arch/powerpc/perf/perf_regs.c
> @@ -81,6 +81,14 @@ static u64 get_ext_regs_value(int idx)
>  		return mfspr(SPRN_MMCR1);
>  	case PERF_REG_POWERPC_MMCR2:
>  		return mfspr(SPRN_MMCR2);
> +#ifdef CONFIG_PPC64
> +	case PERF_REG_POWERPC_MMCR3:
> +		return mfspr(SPRN_MMCR3);
> +	case PERF_REG_POWERPC_SIER2:
> +		return mfspr(SPRN_SIER2);
> +	case PERF_REG_POWERPC_SIER3:
> +		return mfspr(SPRN_SIER3);
> +#endif
>  	default: return 0;
>  	}
>  }
> @@ -89,7 +97,9 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
>  {
>  	u64 PERF_REG_EXTENDED_MAX;
>  
> -	if (cpu_has_feature(CPU_FTR_ARCH_300))
> +	if (cpu_has_feature(CPU_FTR_ARCH_31))
> +		PERF_REG_EXTENDED_MAX = PERF_REG_MAX_ISA_31;
> +	else if (cpu_has_feature(CPU_FTR_ARCH_300))
>  		PERF_REG_EXTENDED_MAX = PERF_REG_MAX_ISA_300;
>  
>  	if (idx == PERF_REG_POWERPC_SIER &&
> diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
> index b02aabb..f066ed9 100644
> --- a/arch/powerpc/perf/power10-pmu.c
> +++ b/arch/powerpc/perf/power10-pmu.c
> @@ -87,6 +87,8 @@
>  #define POWER10_MMCRA_IFM3		0x00000000C0000000UL
>  #define POWER10_MMCRA_BHRB_MASK		0x00000000C0000000UL
>  
> +extern u64 PERF_REG_EXTENDED_MASK;
> +
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
> +	PERF_REG_EXTENDED_MASK = PERF_REG_PMU_MASK_31;
> +
>  	rc = register_power_pmu(&power10_pmu);
>  	if (rc)
>  		return rc;
> 
