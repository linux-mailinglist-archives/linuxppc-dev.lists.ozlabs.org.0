Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 118D51D9E42
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 19:53:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RNmB1g1lzDqg9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 03:53:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=pc@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RNkB14tBzDqXl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 03:52:01 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04JHVOJ6157176; Tue, 19 May 2020 13:51:59 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31293vayrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 13:51:59 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04JHX2pQ162450;
 Tue, 19 May 2020 13:51:58 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31293vayr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 13:51:58 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04JHjiFl015954;
 Tue, 19 May 2020 17:51:58 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 313x16xrh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 17:51:57 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04JHptOt9961822
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 May 2020 17:51:55 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 380EF6A057;
 Tue, 19 May 2020 17:51:56 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 746336A04F;
 Tue, 19 May 2020 17:51:55 +0000 (GMT)
Received: from oc3272150783.ibm.com (unknown [9.160.42.118])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 19 May 2020 17:51:55 +0000 (GMT)
Date: Tue, 19 May 2020 12:51:53 -0500
From: "Paul A. Clarke" <pc@us.ibm.com>
To: Alistair Popple <alistair@popple.id.au>
Subject: Re: [PATCH v2 6/7] powerpc/dt_cpu_ftrs: Add MMA feature
Message-ID: <20200519175153.GE24922@oc3272150783.ibm.com>
References: <20200519003157.31946-1-alistair@popple.id.au>
 <20200519003157.31946-7-alistair@popple.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519003157.31946-7-alistair@popple.id.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-19_06:2020-05-19,
 2020-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 cotscore=-2147483648 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005190146
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

On Tue, May 19, 2020 at 10:31:56AM +1000, Alistair Popple wrote:
> Matrix multiple accumulate (MMA) is a new feature added to ISAv3.1 and

Conclusion is that this should be "Matrix-Multiply Assist", but then there
are a couple more below...

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
> index 1931b1142599..c446863a40cf 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -479,7 +479,8 @@
>  #define   PCR_VEC_DIS	(__MASK(63-0))	/* Vec. disable (bit NA since POWER8) */
>  #define   PCR_VSX_DIS	(__MASK(63-1))	/* VSX disable (bit NA since POWER8) */
>  #define   PCR_TM_DIS	(__MASK(63-2))	/* Trans. memory disable (POWER8) */
> -#define   PCR_HIGH_BITS	(PCR_VEC_DIS | PCR_VSX_DIS | PCR_TM_DIS)
> +#define   PCR_MMA_DIS	(__MASK(63-3)) /* Matrix-Multiply Accelerator */

also here.

> +#define   PCR_HIGH_BITS	(PCR_MMA_DIS | PCR_VEC_DIS | PCR_VSX_DIS | PCR_TM_DIS)
>  /*
>   * These bits are used in the function kvmppc_set_arch_compat() to specify and
>   * determine both the compatibility level which we want to emulate and the
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
> index 93c340906aad..e7540ee5cad8 100644
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
> +	{"matrix-multiply-accumulate", feat_enable_mma, 0},

and presumably here as well.

>  };

PC
