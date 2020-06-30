Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D8620ED89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 07:27:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wtCv1Xf3zDqZF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 15:27:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wtBD0WGczDqYq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 15:26:11 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05U5ACNJ098788
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 01:26:09 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31xmxfnjjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 01:26:08 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05U5Q1vO144270
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 01:26:08 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31xmxfnjj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 01:26:08 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05U5PsaH024027;
 Tue, 30 Jun 2020 05:26:08 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 31wwr8ts6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 05:26:08 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05U5Q7qK43254152
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jun 2020 05:26:07 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E474AC05B;
 Tue, 30 Jun 2020 05:26:07 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5E28AC059;
 Tue, 30 Jun 2020 05:26:05 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.48.28])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 30 Jun 2020 05:26:05 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/3] powerpc/mm: Enable radix GTSE only if supported.
In-Reply-To: <20200626131000.5207-2-bharata@linux.ibm.com>
References: <20200626131000.5207-1-bharata@linux.ibm.com>
 <20200626131000.5207-2-bharata@linux.ibm.com>
Date: Tue, 30 Jun 2020 10:56:03 +0530
Message-ID: <87a70lgm50.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-29_21:2020-06-29,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006300033
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
Cc: npiggin@gmail.com, Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bharata B Rao <bharata@linux.ibm.com> writes:

> Make GTSE an MMU feature and enable it by default for radix.
> However for guest, conditionally enable it if hypervisor supports
> it via OV5 vector. Let prom_init ask for radix GTSE only if the
> support exists.
>
> Having GTSE as an MMU feature will make it easy to enable radix
> without GTSE. Currently radix assumes GTSE is enabled by default.
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/mmu.h    |  4 ++++
>  arch/powerpc/kernel/dt_cpu_ftrs.c |  1 +
>  arch/powerpc/kernel/prom_init.c   | 13 ++++++++-----
>  arch/powerpc/mm/init_64.c         |  5 ++++-
>  4 files changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
> index f4ac25d4df05..884d51995934 100644
> --- a/arch/powerpc/include/asm/mmu.h
> +++ b/arch/powerpc/include/asm/mmu.h
> @@ -28,6 +28,9 @@
>   * Individual features below.
>   */
>  
> +/* Guest Translation Shootdown Enable */
> +#define MMU_FTR_GTSE			ASM_CONST(0x00001000)
> +
>  /*
>   * Support for 68 bit VA space. We added that from ISA 2.05
>   */
> @@ -173,6 +176,7 @@ enum {
>  #endif
>  #ifdef CONFIG_PPC_RADIX_MMU
>  		MMU_FTR_TYPE_RADIX |
> +		MMU_FTR_GTSE |
>  #ifdef CONFIG_PPC_KUAP
>  		MMU_FTR_RADIX_KUAP |
>  #endif /* CONFIG_PPC_KUAP */
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
> index a0edeb391e3e..ac650c233cd9 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -336,6 +336,7 @@ static int __init feat_enable_mmu_radix(struct dt_cpu_feature *f)
>  #ifdef CONFIG_PPC_RADIX_MMU
>  	cur_cpu_spec->mmu_features |= MMU_FTR_TYPE_RADIX;
>  	cur_cpu_spec->mmu_features |= MMU_FTRS_HASH_BASE;
> +	cur_cpu_spec->mmu_features |= MMU_FTR_GTSE;
>  	cur_cpu_spec->cpu_user_features |= PPC_FEATURE_HAS_MMU;
>  
>  	return 1;
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index 90c604d00b7d..cbc605cfdec0 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -1336,12 +1336,15 @@ static void __init prom_check_platform_support(void)
>  		}
>  	}
>  
> -	if (supported.radix_mmu && supported.radix_gtse &&
> -	    IS_ENABLED(CONFIG_PPC_RADIX_MMU)) {
> -		/* Radix preferred - but we require GTSE for now */
> -		prom_debug("Asking for radix with GTSE\n");
> +	if (supported.radix_mmu && IS_ENABLED(CONFIG_PPC_RADIX_MMU)) {
> +		/* Radix preferred - Check if GTSE is also supported */
> +		prom_debug("Asking for radix\n");
>  		ibm_architecture_vec.vec5.mmu = OV5_FEAT(OV5_MMU_RADIX);
> -		ibm_architecture_vec.vec5.radix_ext = OV5_FEAT(OV5_RADIX_GTSE);
> +		if (supported.radix_gtse)
> +			ibm_architecture_vec.vec5.radix_ext =
> +					OV5_FEAT(OV5_RADIX_GTSE);
> +		else
> +			prom_debug("Radix GTSE isn't supported\n");
>  	} else if (supported.hash_mmu) {
>  		/* Default to hash mmu (if we can) */
>  		prom_debug("Asking for hash\n");
> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
> index bc73abf0bc25..152aa0200cef 100644
> --- a/arch/powerpc/mm/init_64.c
> +++ b/arch/powerpc/mm/init_64.c
> @@ -407,12 +407,15 @@ static void __init early_check_vec5(void)
>  		if (!(vec5[OV5_INDX(OV5_RADIX_GTSE)] &
>  						OV5_FEAT(OV5_RADIX_GTSE))) {
>  			pr_warn("WARNING: Hypervisor doesn't support RADIX with GTSE\n");
> -		}
> +			cur_cpu_spec->mmu_features &= ~MMU_FTR_GTSE;
> +		} else
> +			cur_cpu_spec->mmu_features |= MMU_FTR_GTSE;
>  		/* Do radix anyway - the hypervisor said we had to */
>  		cur_cpu_spec->mmu_features |= MMU_FTR_TYPE_RADIX;
>  	} else if (mmu_supported == OV5_FEAT(OV5_MMU_HASH)) {
>  		/* Hypervisor only supports hash - disable radix */
>  		cur_cpu_spec->mmu_features &= ~MMU_FTR_TYPE_RADIX;
> +		cur_cpu_spec->mmu_features &= ~MMU_FTR_GTSE;
>  	}
>  }
>  
> -- 
> 2.21.3
