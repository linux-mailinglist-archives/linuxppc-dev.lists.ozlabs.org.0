Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A86481A7869
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 12:31:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491hc63lZQzDqWl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 20:31:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491hY34cZ2zDqFH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 20:28:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 491hY26ND2z8sxV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 20:28:54 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 491hY24m57z9sSG; Tue, 14 Apr 2020 20:28:54 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 491hY21KSXz9sSy
 for <linuxppc-dev@ozlabs.org>; Tue, 14 Apr 2020 20:28:53 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03EA43cp067568; Tue, 14 Apr 2020 06:28:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30cx1k4n47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 06:28:47 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03EA4ZCw069519;
 Tue, 14 Apr 2020 06:28:47 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30cx1k4n3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 06:28:47 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03EAQ8l2030289;
 Tue, 14 Apr 2020 10:28:45 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 30b5h67snk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 10:28:45 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03EASjds42664336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Apr 2020 10:28:45 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75C8BB2065;
 Tue, 14 Apr 2020 10:28:45 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6269B205F;
 Tue, 14 Apr 2020 10:28:44 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.109.81])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 14 Apr 2020 10:28:44 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 1843B2E30FB; Tue, 14 Apr 2020 12:46:24 +0530 (IST)
Date: Tue, 14 Apr 2020 12:46:24 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Pratik Rajesh Sampat <psampat@linux.ibm.com>
Subject: Re: [PATCH v6 1/3] powerpc/powernv: Introduce interface for
 self-restore support
Message-ID: <20200414071623.GE24277@in.ibm.com>
References: <20200326071034.12838-1-psampat@linux.ibm.com>
 <20200326071034.12838-2-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326071034.12838-2-psampat@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_02:2020-04-13,
 2020-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004140078
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
Reply-To: ego@linux.vnet.ibm.com
Cc: ego@linux.vnet.ibm.com, pratik.r.sampat@gmail.com, linuxram@us.ibm.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, oohall@gmail.com,
 skiboot@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 26, 2020 at 12:40:32PM +0530, Pratik Rajesh Sampat wrote:
> Introduces an interface that helps determine support for the
> self-restore API. The commit is isomorphic to the original interface of
> declaring SPRs to self-restore.
> 
> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>

This patch looks good to me.

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

> ---
>  arch/powerpc/platforms/powernv/idle.c | 200 +++++++++++++++++++-------
>  1 file changed, 152 insertions(+), 48 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index 78599bca66c2..858ceb86394d 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -32,10 +32,67 @@
>  #define P9_STOP_SPR_MSR 2000
>  #define P9_STOP_SPR_PSSCR      855
> 
> +/*
> + * Type of support for each SPR
> + * FIRMWARE_RESTORE: firmware restoration supported: calls self-restore OPAL API
> + */
> +#define UNSUPPORTED           0x0
> +#define FIRMWARE_RESTORE      0x1
> +
>  static u32 supported_cpuidle_states;
>  struct pnv_idle_states_t *pnv_idle_states;
>  int nr_pnv_idle_states;
> 
> +struct preferred_sprs {
> +	u64 spr;
> +	u32 supported_mode;
> +};
> +
> +/*
> + * Supported mode: Default support. Can be overwritten during system
> + *		   initialization
> + */
> +struct preferred_sprs preferred_sprs[] = {
> +	{
> +		.spr = SPRN_HSPRG0,
> +		.supported_mode = FIRMWARE_RESTORE,
> +	},
> +	{
> +		.spr = SPRN_LPCR,
> +		.supported_mode = FIRMWARE_RESTORE,
> +	},
> +	{
> +		.spr = SPRN_HMEER,
> +		.supported_mode = FIRMWARE_RESTORE,
> +	},
> +	{
> +		.spr = SPRN_HID0,
> +		.supported_mode = FIRMWARE_RESTORE,
> +	},
> +	{
> +		.spr = P9_STOP_SPR_MSR,
> +		.supported_mode = FIRMWARE_RESTORE,
> +	},
> +	{
> +		.spr = P9_STOP_SPR_PSSCR,
> +		.supported_mode = FIRMWARE_RESTORE,
> +	},
> +	{
> +		.spr = SPRN_HID1,
> +		.supported_mode = FIRMWARE_RESTORE,
> +	},
> +	{
> +		.spr = SPRN_HID4,
> +		.supported_mode = FIRMWARE_RESTORE,
> +	},
> +	{
> +		.spr = SPRN_HID5,
> +		.supported_mode = FIRMWARE_RESTORE,
> +	}
> +};
> +
> +const int nr_preferred_sprs = ARRAY_SIZE(preferred_sprs);
> +
>  /*
>   * The default stop state that will be used by ppc_md.power_save
>   * function on platforms that support stop instruction.
> @@ -61,78 +118,125 @@ static bool deepest_stop_found;
> 
>  static unsigned long power7_offline_type;
> 
> -static int pnv_save_sprs_for_deep_states(void)
> +static int pnv_self_restore_sprs(u64 pir, int cpu, u64 spr)
>  {
> -	int cpu;
> +	u64 reg_val;
>  	int rc;
> 
> -	/*
> -	 * hid0, hid1, hid4, hid5, hmeer and lpcr values are symmetric across
> -	 * all cpus at boot. Get these reg values of current cpu and use the
> -	 * same across all cpus.
> -	 */
> -	uint64_t lpcr_val	= mfspr(SPRN_LPCR);
> -	uint64_t hid0_val	= mfspr(SPRN_HID0);
> -	uint64_t hid1_val	= mfspr(SPRN_HID1);
> -	uint64_t hid4_val	= mfspr(SPRN_HID4);
> -	uint64_t hid5_val	= mfspr(SPRN_HID5);
> -	uint64_t hmeer_val	= mfspr(SPRN_HMEER);
> -	uint64_t msr_val = MSR_IDLE;
> -	uint64_t psscr_val = pnv_deepest_stop_psscr_val;
> -
> -	for_each_present_cpu(cpu) {
> -		uint64_t pir = get_hard_smp_processor_id(cpu);
> -		uint64_t hsprg0_val = (uint64_t)paca_ptrs[cpu];
> -
> -		rc = opal_slw_set_reg(pir, SPRN_HSPRG0, hsprg0_val);
> +	switch (spr) {
> +	case SPRN_HSPRG0:
> +		reg_val = (uint64_t)paca_ptrs[cpu];
> +		rc = opal_slw_set_reg(pir, SPRN_HSPRG0, reg_val);
>  		if (rc != 0)
>  			return rc;
> -
> -		rc = opal_slw_set_reg(pir, SPRN_LPCR, lpcr_val);
> +		break;
> +	case SPRN_LPCR:
> +		reg_val = mfspr(SPRN_LPCR);
> +		rc = opal_slw_set_reg(pir, SPRN_LPCR, reg_val);
>  		if (rc != 0)
>  			return rc;
> -
> +		break;
> +	case P9_STOP_SPR_MSR:
> +		reg_val = MSR_IDLE;
>  		if (cpu_has_feature(CPU_FTR_ARCH_300)) {
> -			rc = opal_slw_set_reg(pir, P9_STOP_SPR_MSR, msr_val);
> +			rc = opal_slw_set_reg(pir, P9_STOP_SPR_MSR, reg_val);
>  			if (rc)
>  				return rc;
> -
> -			rc = opal_slw_set_reg(pir,
> -					      P9_STOP_SPR_PSSCR, psscr_val);
> -
> +		}
> +		break;
> +	case P9_STOP_SPR_PSSCR:
> +		reg_val = pnv_deepest_stop_psscr_val;
> +		if (cpu_has_feature(CPU_FTR_ARCH_300)) {
> +			rc = opal_slw_set_reg(pir, P9_STOP_SPR_PSSCR, reg_val);
>  			if (rc)
>  				return rc;
>  		}
> -
> -		/* HIDs are per core registers */
> +		break;
> +	case SPRN_HMEER:
> +		reg_val = mfspr(SPRN_HMEER);
>  		if (cpu_thread_in_core(cpu) == 0) {
> -
> -			rc = opal_slw_set_reg(pir, SPRN_HMEER, hmeer_val);
> -			if (rc != 0)
> +			rc = opal_slw_set_reg(pir, SPRN_HMEER, reg_val);
> +			if (rc)
>  				return rc;
> -
> -			rc = opal_slw_set_reg(pir, SPRN_HID0, hid0_val);
> -			if (rc != 0)
> +		}
> +		break;
> +	case SPRN_HID0:
> +		reg_val = mfspr(SPRN_HID0);
> +		if (cpu_thread_in_core(cpu) == 0) {
> +			rc = opal_slw_set_reg(pir, SPRN_HID0, reg_val);
> +			if (rc)
>  				return rc;
> +		}
> +		break;
> +	case SPRN_HID1:
> +		reg_val = mfspr(SPRN_HID1);
> +		if (!cpu_has_feature(CPU_FTR_ARCH_300) &&
> +		    cpu_thread_in_core(cpu) == 0) {
> +			rc = opal_slw_set_reg(pir, SPRN_HID1, reg_val);
> +			if (rc)
> +				return rc;
> +		}
> +		break;
> +	case SPRN_HID4:
> +		reg_val = mfspr(SPRN_HID4);
> +		if (!cpu_has_feature(CPU_FTR_ARCH_300) &&
> +		    cpu_thread_in_core(cpu) == 0) {
> +			rc = opal_slw_set_reg(pir, SPRN_HID4, reg_val);
> +			if (rc)
> +				return rc;
> +		}
> +		break;
> +	case SPRN_HID5:
> +		reg_val = mfspr(SPRN_HID5);
> +		if (!cpu_has_feature(CPU_FTR_ARCH_300) &&
> +		    cpu_thread_in_core(cpu) == 0) {
> +			rc = opal_slw_set_reg(pir, SPRN_HID5, reg_val);
> +			if (rc)
> +				return rc;
> +		}
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> 
> -			/* Only p8 needs to set extra HID regiters */
> -			if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
> -
> -				rc = opal_slw_set_reg(pir, SPRN_HID1, hid1_val);
> -				if (rc != 0)
> -					return rc;
> -
> -				rc = opal_slw_set_reg(pir, SPRN_HID4, hid4_val);
> -				if (rc != 0)
> -					return rc;
> +static int pnv_self_save_restore_sprs(void)
> +{
> +	int rc, index, cpu;
> +	u64 pir;
> +	struct preferred_sprs curr_spr;
> 
> -				rc = opal_slw_set_reg(pir, SPRN_HID5, hid5_val);
> +	for_each_present_cpu(cpu) {
> +		pir = get_hard_smp_processor_id(cpu);
> +		for (index = 0; index < nr_preferred_sprs; index++) {
> +			curr_spr = preferred_sprs[index];
> +			/* HIDs are per core register */
> +			if (cpu_thread_in_core(cpu) != 0 &&
> +			    (curr_spr.spr == SPRN_HMEER ||
> +			     curr_spr.spr == SPRN_HID0  ||
> +			     curr_spr.spr == SPRN_HID1  ||
> +			     curr_spr.spr == SPRN_HID4  ||
> +			     curr_spr.spr == SPRN_HID5))
> +				continue;
> +			if (curr_spr.supported_mode & FIRMWARE_RESTORE) {
> +				rc = pnv_self_restore_sprs(pir, cpu,
> +							   curr_spr.spr);
>  				if (rc != 0)
>  					return rc;
>  			}
>  		}
>  	}
> +	return 0;
> +}
> 
> +static int pnv_save_sprs_for_deep_states(void)
> +{
> +	int rc;
> +
> +	rc = pnv_self_save_restore_sprs();
> +	if (rc != 0)
> +		return rc;
>  	return 0;
>  }
> 
> -- 
> 2.17.1
> 
