Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E952E4554A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 07:14:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvqHy5HZ9z3bj9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 17:14:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k/0OHTIm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvqH83jRVz2x9M
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 17:13:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k/0OHTIm; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4HvqH800X3z4xdQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 17:13:24 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4HvqH771rgz4xdN; Thu, 18 Nov 2021 17:13:23 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k/0OHTIm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4HvqH72d9Cz4xd4;
 Thu, 18 Nov 2021 17:13:22 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AI3wmKw023328; 
 Thu, 18 Nov 2021 06:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=kyyJHYK5Zq8qK2X3DnOsFiPouVwEUtFnsHld8M6JfmI=;
 b=k/0OHTIm9yKwelPnBMgk5PrNY5BZyKnh9KHerbh1/HEE8gwiVg4sMugKfrx1tQuivjvK
 Yq8jrXxoMhBFZvt5q31FYsXezLk9wGPDccQxXKpwECfudILhHvDqyzwwI+Iv6BZylaVr
 EXo2DPinZJOKPx/GvQ2mzEA+2o+ozQ39837x44SarwNOjwdknRYgo+BM4Do3ao4WFo73
 A8ljHD26symSLZzcA6+vj2mvXfJna+3TSaW/kM0JR4C/Hvv3e9Fe1kHEYAQ6WXoL7dCc
 0EReKSpIPZdwiHbG//OIxRSbilI9UjN5WJALJya7FGO4JMD44cU97T4ihZfL+keCc/xs 0w== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cdfddj4s2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 06:13:19 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AI678GO021558;
 Thu, 18 Nov 2021 06:13:18 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3ca50bheug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 06:13:14 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AI6CsKm64356832
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 06:12:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A573542041;
 Thu, 18 Nov 2021 06:12:54 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBF9842045;
 Thu, 18 Nov 2021 06:12:53 +0000 (GMT)
Received: from [9.43.40.88] (unknown [9.43.40.88])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Nov 2021 06:12:53 +0000 (GMT)
Message-ID: <e21ef199-1557-0bee-6da2-414e8efaf67c@linux.ibm.com>
Date: Thu, 18 Nov 2021 11:42:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RESEND PATCH v2 1/3] fixup mmu_features immediately after
 getting cpu pa features.
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20211018084434.217772-1-sourabhjain@linux.ibm.com>
 <20211018084434.217772-2-sourabhjain@linux.ibm.com>
In-Reply-To: <20211018084434.217772-2-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: h-D1fAe4dbsbNDxAm1wzESp7Y-sj58et
X-Proofpoint-ORIG-GUID: h-D1fAe4dbsbNDxAm1wzESp7Y-sj58et
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_02,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111180034
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi MPE,

Any comments or suggestion on list patch series?

Thanks,
Sourabh Jain

On 18/10/21 14:14, Sourabh Jain wrote:
> From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>
> On system with radix support available, early_radix_enabled() starts
> returning true for a small window (until mmu_early_init_devtree() is
> called) even when radix mode disabled on kernel command line. This causes
> ppc64_bolted_size() to return ULONG_MAX in HPT mode instead of supported
> segment size, during boot cpu paca allocation.
>
> Withi kernel command line = "... disable_radix":
>
> early_init_devtree:			  <- early_radix_enabled() = false
>    early_init_dt_scan_cpus:		  <- early_radix_enabled() = false
>        ...
>        check_cpu_pa_features:		  <- early_radix_enabled() = false
>        ...				^ <- early_radix_enabled() = TRUE
>        allocate_paca:			| <- early_radix_enabled() = TRUE
>            ...                           |
>            ppc64_bolted_size:		| <- early_radix_enabled() = TRUE
>                if (early_radix_enabled())| <- early_radix_enabled() = TRUE
>                    return ULONG_MAX;     |
>        ...                               |
>    ...					| <- early_radix_enabled() = TRUE
>    ...					| <- early_radix_enabled() = TRUE
>    mmu_early_init_devtree()              V
>    ...					  <- early_radix_enabled() = false
>
> So far we have not seen any issue because allocate_paca() takes minimum of
> ppc64_bolted_size and rma_size while allocating paca. However it is better
> to close this window by fixing up the mmu features as early as possible.
> This fixes early_radix_enabled() and ppc64_bolted_size() to return valid
> values in radix disable mode. This patch will help subsequent patch to
> depend on early_radix_enabled() check while detecting supported segment
> size in HPT mode.
>
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Reported-and-tested-by: Abdul haleem <abdhalee@linux.vnet.ibm.com>
> ---
>   arch/powerpc/include/asm/book3s/64/mmu.h | 1 +
>   arch/powerpc/include/asm/mmu.h           | 1 +
>   arch/powerpc/kernel/prom.c               | 2 ++
>   arch/powerpc/mm/init_64.c                | 5 ++++-
>   4 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> index c02f42d1031e..d60be5051d60 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> @@ -197,6 +197,7 @@ extern int mmu_vmemmap_psize;
>   extern int mmu_io_psize;
>   
>   /* MMU initialization */
> +void update_cpu_features(void);
>   void mmu_early_init_devtree(void);
>   void hash__early_init_devtree(void);
>   void radix__early_init_devtree(void);
> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
> index 8abe8e42e045..5eb494ea85d7 100644
> --- a/arch/powerpc/include/asm/mmu.h
> +++ b/arch/powerpc/include/asm/mmu.h
> @@ -401,6 +401,7 @@ extern void early_init_mmu(void);
>   extern void early_init_mmu_secondary(void);
>   extern void setup_initial_memory_limit(phys_addr_t first_memblock_base,
>   				       phys_addr_t first_memblock_size);
> +static inline void update_cpu_features(void) { }
>   static inline void mmu_early_init_devtree(void) { }
>   
>   static inline void pkey_early_init_devtree(void) {}
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 2e67588f6f6e..889c909e4ed4 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -380,6 +380,8 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
>   		check_cpu_pa_features(node);
>   	}
>   
> +	/* Update cpu features based on kernel command line */
> +	update_cpu_features();
>   	identical_pvr_fixup(node);
>   	init_mmu_slb_size(node);
>   
> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
> index 386be136026e..19680b42898f 100644
> --- a/arch/powerpc/mm/init_64.c
> +++ b/arch/powerpc/mm/init_64.c
> @@ -437,12 +437,15 @@ static void __init early_check_vec5(void)
>   	}
>   }
>   
> -void __init mmu_early_init_devtree(void)
> +void __init update_cpu_features(void)
>   {
>   	/* Disable radix mode based on kernel command line. */
>   	if (disable_radix)
>   		cur_cpu_spec->mmu_features &= ~MMU_FTR_TYPE_RADIX;
> +}
>   
> +void __init mmu_early_init_devtree(void)
> +{
>   	/*
>   	 * Check /chosen/ibm,architecture-vec-5 if running as a guest.
>   	 * When running bare-metal, we can use radix if we like
