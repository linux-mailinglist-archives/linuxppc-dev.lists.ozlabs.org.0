Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6640E4212BE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 17:34:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNPsB20W7z2yns
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 02:34:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gl32+U8r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNPrS14qrz2xsW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 02:33:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gl32+U8r; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4HNPrS0Z1Yz4xbV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 02:33:44 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4HNPrS0DWSz4xbQ; Tue,  5 Oct 2021 02:33:44 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gl32+U8r; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4HNPrR4ldPz4xLs;
 Tue,  5 Oct 2021 02:33:43 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194F5MVN024037; 
 Mon, 4 Oct 2021 11:33:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=aJqlE+8/C4VMY+Ry3x+jxYihFtrj+7/Dw+o9EM68K6I=;
 b=gl32+U8r0A+9AIJ6AboIzsPMNNkcFmEr7da9k0ti5g9Kg1fTJrM/S5bC04KcY9yfNxJm
 Fq/tHG6XpP+QIIuloKl71LfgkDVKx/bNDa9iHtdB1VcGR4Gu9/z9MhGx057w1rulTuC1
 qK9pz0oMV3BV5R+jh+HiENORV5UpjNARpz2qg6267Sri0R4cDlFQb+UA/yVYIohtnMpd
 tcI/4+ro1Nsurwpn8ZaeFaqjQlwEjVRlwM8ZuFytA6TNK6LPVmV89FheYfiq/eIymAnb
 ZSG1VNDdxqPoGH2k6AClF5c0Nzjl8bnrfna92wEzsCeBGjgY9wUlJ8tex6uXa5+Oilzx sg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bg3xq0n6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 11:33:37 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 194FMVfU013528;
 Mon, 4 Oct 2021 15:32:28 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3bef2agvr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 15:32:28 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 194FWPt75177890
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Oct 2021 15:32:25 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5681FAE051;
 Mon,  4 Oct 2021 15:32:25 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C3B9AE04D;
 Mon,  4 Oct 2021 15:32:23 +0000 (GMT)
Received: from [9.43.47.122] (unknown [9.43.47.122])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 Oct 2021 15:32:22 +0000 (GMT)
Message-ID: <e67acb9b-dd8e-767a-b57b-f12b3b0fd44d@linux.ibm.com>
Date: Mon, 4 Oct 2021 21:02:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/3] fixup mmu_features immediately after getting cpu pa
 features.
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, mpe@ellerman.id.au
References: <20211004151142.256251-1-sourabhjain@linux.ibm.com>
 <20211004151142.256251-2-sourabhjain@linux.ibm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20211004151142.256251-2-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iwoamFN3_IxYtEa3cZaRJXXC9rqQHkzm
X-Proofpoint-ORIG-GUID: iwoamFN3_IxYtEa3cZaRJXXC9rqQHkzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1011
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110040106
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
Cc: linuxppc-dev@ozlabs.org, mahesh@linux.vnet.ibm.com,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Abdul haleem <abdhalee@linux.vnet.ibm.com>, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/4/21 20:41, Sourabh Jain wrote:
> From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> 
> On system with radix support available, early_radix_enabled() starts
> returning true for a small window (until mmu_early_init_devtree() is
> called) even when radix mode disabled on kernel command line. This causes
> ppc64_bolted_size() to return ULONG_MAX in HPT mode instead of supported
> segment size, during boot cpu paca allocation.
> 
> With kernel command line = "... disable_radix":
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
>   arch/powerpc/kernel/prom.c               | 1 +
>   arch/powerpc/mm/init_64.c                | 5 ++++-
>   4 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> index c02f42d1031e..69a89fa1330d 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> @@ -197,6 +197,7 @@ extern int mmu_vmemmap_psize;
>   extern int mmu_io_psize;
>   
>   /* MMU initialization */
> +void mmu_cpu_feature_fixup(void);
>   void mmu_early_init_devtree(void);
>   void hash__early_init_devtree(void);
>   void radix__early_init_devtree(void);
> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
> index 8abe8e42e045..c8eafd401fe9 100644
> --- a/arch/powerpc/include/asm/mmu.h
> +++ b/arch/powerpc/include/asm/mmu.h
> @@ -401,6 +401,7 @@ extern void early_init_mmu(void);
>   extern void early_init_mmu_secondary(void);
>   extern void setup_initial_memory_limit(phys_addr_t first_memblock_base,
>   				       phys_addr_t first_memblock_size);
> +static inline void mmu_cpu_feature_fixup(void) { }
>   static inline void mmu_early_init_devtree(void) { }
>   
>   static inline void pkey_early_init_devtree(void) {}
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 2e67588f6f6e..1727a3abe6c1 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -380,6 +380,7 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
>   		check_cpu_pa_features(node);
>   	}
>   
> +	mmu_cpu_feature_fixup();

can you do that call inside check_cpu_pa_features? or is it because we 
have the same issue with baremetal platforms?

Can we also rename this to indicate we are sanitizing the feature flag 
based on kernel command line.  Something like

/* Update cpu features based on kernel command line */
update_cpu_features();

>   	identical_pvr_fixup(node);
>   	init_mmu_slb_size(node);
>   
> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
> index 386be136026e..9ed452605a2c 100644
> --- a/arch/powerpc/mm/init_64.c
> +++ b/arch/powerpc/mm/init_64.c
> @@ -437,12 +437,15 @@ static void __init early_check_vec5(void)
>   	}
>   }
>   
> -void __init mmu_early_init_devtree(void)
> +void __init mmu_cpu_feature_fixup(void)
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
> 

