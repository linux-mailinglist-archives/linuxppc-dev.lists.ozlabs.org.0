Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BFA1DD490
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 19:38:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ScK44vnHzDqYV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 03:38:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=pc@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Sbst3yRkzDqs8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 03:17:53 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04LH1tud108476; Thu, 21 May 2020 13:17:51 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 315nypym62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 May 2020 13:17:35 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04LH2ShV111011;
 Thu, 21 May 2020 13:17:35 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 315nypym5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 May 2020 13:17:35 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04LHErqj029765;
 Thu, 21 May 2020 17:17:34 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 314wxpcxgx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 May 2020 17:17:34 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04LHHXCq54133088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 May 2020 17:17:33 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7ECE528058;
 Thu, 21 May 2020 17:17:33 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0C9B28059;
 Thu, 21 May 2020 17:17:32 +0000 (GMT)
Received: from oc3272150783.ibm.com (unknown [9.65.245.76])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 21 May 2020 17:17:32 +0000 (GMT)
Date: Thu, 21 May 2020 12:17:27 -0500
From: "Paul A. Clarke" <pc@us.ibm.com>
To: Alistair Popple <alistair@popple.id.au>
Subject: Re: [PATCH v3 6/7] powerpc/dt_cpu_ftrs: Add MMA feature
Message-ID: <20200521171727.GA1998@oc3272150783.ibm.com>
References: <20200521014341.29095-1-alistair@popple.id.au>
 <20200521014341.29095-7-alistair@popple.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521014341.29095-7-alistair@popple.id.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-21_10:2020-05-21,
 2020-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 cotscore=-2147483648 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005210118
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
Cc: aneesh.kumar@linux.ibm.com, mikey@neuling.org,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 21, 2020 at 11:43:40AM +1000, Alistair Popple wrote:
> Matrix multiple assist (MMA) is a new feature added to ISAv3.1 and

s/Matrix multiple assist/Matrix-Multiply Assist/

> POWER10. Support on powernv can be selected via a firmware CPU device
> tree feature which enables it via a PCR bit.
> 
> Signed-off-by: Alistair Popple <alistair@popple.id.au>
> ---
>  arch/powerpc/include/asm/reg.h    |  3 ++-
>  arch/powerpc/kernel/dt_cpu_ftrs.c | 17 ++++++++++++++++-
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index dd20af367b57..88e6c78100d9 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -481,7 +481,8 @@
>  #define   PCR_VEC_DIS	(__MASK(63-0))	/* Vec. disable (bit NA since POWER8) */
>  #define   PCR_VSX_DIS	(__MASK(63-1))	/* VSX disable (bit NA since POWER8) */
>  #define   PCR_TM_DIS	(__MASK(63-2))	/* Trans. memory disable (POWER8) */
> -#define   PCR_HIGH_BITS	(PCR_VEC_DIS | PCR_VSX_DIS | PCR_TM_DIS)
> +#define   PCR_MMA_DIS	(__MASK(63-3)) /* Matrix-Multiply Accelerator */

s/Accelerator/Assist/

PC

> +#define   PCR_HIGH_BITS	(PCR_MMA_DIS | PCR_VEC_DIS | PCR_VSX_DIS | PCR_TM_DIS)
>  /*
>   * These bits are used in the function kvmppc_set_arch_compat() to specify and
>   * determine both the compatibility level which we want to emulate and the
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
> index 93c340906aad..0a41fce34165 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -75,6 +75,7 @@ static struct {
>  	u64	lpcr_clear;
>  	u64	hfscr;
>  	u64	fscr;
> +	u64	pcr;
>  } system_registers;
> 
>  static void (*init_pmu_registers)(void);
> @@ -102,7 +103,7 @@ static void __restore_cpu_cpufeatures(void)
>  	if (hv_mode) {
>  		mtspr(SPRN_LPID, 0);
>  		mtspr(SPRN_HFSCR, system_registers.hfscr);
> -		mtspr(SPRN_PCR, PCR_MASK);
> +		mtspr(SPRN_PCR, system_registers.pcr);
>  	}
>  	mtspr(SPRN_FSCR, system_registers.fscr);
> 
> @@ -555,6 +556,18 @@ static int __init feat_enable_large_ci(struct dt_cpu_feature *f)
>  	return 1;
>  }
> 
> +static int __init feat_enable_mma(struct dt_cpu_feature *f)
> +{
> +	u64 pcr;
> +
> +	feat_enable(f);
> +	pcr = mfspr(SPRN_PCR);
> +	pcr &= ~PCR_MMA_DIS;
> +	mtspr(SPRN_PCR, pcr);
> +
> +	return 1;
> +}
> +
>  struct dt_cpu_feature_match {
>  	const char *name;
>  	int (*enable)(struct dt_cpu_feature *f);
> @@ -629,6 +642,7 @@ static struct dt_cpu_feature_match __initdata
>  	{"vector-binary16", feat_enable, 0},
>  	{"wait-v3", feat_enable, 0},
>  	{"prefix-instructions", feat_enable, 0},
> +	{"matrix-multiply-assist", feat_enable_mma, 0},
>  };
> 
>  static bool __initdata using_dt_cpu_ftrs;
> @@ -779,6 +793,7 @@ static void __init cpufeatures_setup_finished(void)
>  	system_registers.lpcr = mfspr(SPRN_LPCR);
>  	system_registers.hfscr = mfspr(SPRN_HFSCR);
>  	system_registers.fscr = mfspr(SPRN_FSCR);
> +	system_registers.pcr = mfspr(SPRN_PCR);
> 
>  	pr_info("final cpu/mmu features = 0x%016lx 0x%08x\n",
>  		cur_cpu_spec->cpu_features, cur_cpu_spec->mmu_features);
> -- 
> 2.20.1
> 
