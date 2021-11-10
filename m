Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C7744BFEE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 12:10:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hq2G05j4Tz3bhg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 22:10:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VVuR6+q8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VVuR6+q8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hq2FH58L0z2xXD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 22:10:11 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AAAFm6I006138
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 11:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=d8Mi6CinP8LOxGiOBeibZsk8lMntLgoefBTIzrUQIyo=;
 b=VVuR6+q8P43Rwe+R60VJa8JTMWf9LjX2LOvId9V+QTpv1Z6urHcdO2RkgOk+mdqkmuL1
 oS03v02P43GiTF6QcdXSdxlAn7YxpLqFvEQaiJbKvfWqcw9HWw3cUCcMM3rf7mI7UFZJ
 Pm3csRgi3CjiKIVJqPWuFdUL+qVWrcnFa7topqFgSjJ7kImWkxPSdlhHD3CLUU210EeZ
 9vAnOSlJuUBeLWoHzm87SgXg1zkMR1Jnh88A10CP4gSb0/LpUCopPty7BT6aHYYft3Gt
 ubpc4eajbKo+oZ5f2TPTOOFXiPigfqlEErFJHxfiZe5XO13OWGIiPAEgp+GIZCkAe5O8 iA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c8c648yfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 11:10:08 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AAB5bHB019951
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 11:10:07 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c8c648yfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 11:10:07 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AAB8rm4018526;
 Wed, 10 Nov 2021 11:10:07 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 3c5hbchyg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 11:10:07 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AABA5gm22020458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 11:10:06 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1DF6AE2C1;
 Wed, 10 Nov 2021 11:02:48 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2DC0AE2A0;
 Wed, 10 Nov 2021 11:02:47 +0000 (GMT)
Received: from localhost (unknown [9.211.133.79])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 10 Nov 2021 11:02:47 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/64s: Get LPID bit width from device tree
In-Reply-To: <20211110080004.2148773-1-npiggin@gmail.com>
References: <20211110080004.2148773-1-npiggin@gmail.com>
Date: Wed, 10 Nov 2021 08:02:45 -0300
Message-ID: <87ilx0p92i.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vj5cb6APSy938UNFX1_TAEF44WaU8iv3
X-Proofpoint-ORIG-GUID: F-EmS_Ruk1O-WDYaAB2_K8d_LyQHnokV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-10_03,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111100058
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Allow the LPID bit width and partition table size to be set at runtime
> from the device tree.
>
> Move the PID bit width detection into the same place.
>
> KVM does not support using different sizes yet, this is mainly required
> to get the PTCR register values correct.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/include/asm/book3s/64/mmu.h |  9 +++--
>  arch/powerpc/mm/book3s64/pgtable.c       |  5 ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 13 +------
>  arch/powerpc/mm/init_64.c                | 47 +++++++++++++++++++++++-
>  4 files changed, 52 insertions(+), 22 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> index c02f42d1031e..8c500dd6fee4 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> @@ -62,6 +62,9 @@ extern struct patb_entry *partition_tb;
>  #define PRTS_MASK	0x1f		/* process table size field */
>  #define PRTB_MASK	0x0ffffffffffff000UL
>  
> +/* Number of supported LPID bits */
> +extern unsigned int mmu_lpid_bits;
> +
>  /* Number of supported PID bits */
>  extern unsigned int mmu_pid_bits;
>  
> @@ -76,10 +79,8 @@ extern unsigned long __ro_after_init radix_mem_block_size;
>  #define PRTB_SIZE_SHIFT	(mmu_pid_bits + 4)
>  #define PRTB_ENTRIES	(1ul << mmu_pid_bits)
>  
> -/*
> - * Power9 currently only support 64K partition table size.
> - */
> -#define PATB_SIZE_SHIFT	16
> +#define PATB_SIZE_SHIFT	(mmu_lpid_bits + 4)
> +#define PATB_ENTRIES	(1ul << mmu_lpid_bits)
>  
>  typedef unsigned long mm_context_id_t;
>  struct spinlock;
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index 9e16c7b1a6c5..13d1fbddecb9 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -207,17 +207,12 @@ void __init mmu_partition_table_init(void)
>  	unsigned long patb_size = 1UL << PATB_SIZE_SHIFT;
>  	unsigned long ptcr;
>  
> -	BUILD_BUG_ON_MSG((PATB_SIZE_SHIFT > 36), "Partition table size too large.");
>  	/* Initialize the Partition Table with no entries */
>  	partition_tb = memblock_alloc(patb_size, patb_size);
>  	if (!partition_tb)
>  		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
>  		      __func__, patb_size, patb_size);
>  
> -	/*
> -	 * update partition table control register,
> -	 * 64 K size.
> -	 */
>  	ptcr = __pa(partition_tb) | (PATB_SIZE_SHIFT - 12);
>  	set_ptcr_when_no_uv(ptcr);
>  	powernv_set_nmmu_ptcr(ptcr);
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index ae20add7954a..1c855434f8dc 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -33,7 +33,6 @@
>  
>  #include <trace/events/thp.h>
>  
> -unsigned int mmu_pid_bits;
>  unsigned int mmu_base_pid;
>  unsigned long radix_mem_block_size __ro_after_init;
>  
> @@ -357,18 +356,13 @@ static void __init radix_init_pgtable(void)
>  						-1, PAGE_KERNEL));
>  	}
>  
> -	/* Find out how many PID bits are supported */
>  	if (!cpu_has_feature(CPU_FTR_HVMODE) &&
>  			cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG)) {
>  		/*
>  		 * Older versions of KVM on these machines perfer if the
>  		 * guest only uses the low 19 PID bits.
>  		 */
> -		if (!mmu_pid_bits)
> -			mmu_pid_bits = 19;
> -	} else {
> -		if (!mmu_pid_bits)
> -			mmu_pid_bits = 20;
> +		mmu_pid_bits = 19;
>  	}
>  	mmu_base_pid = 1;
>  
> @@ -449,11 +443,6 @@ static int __init radix_dt_scan_page_sizes(unsigned long node,
>  	if (type == NULL || strcmp(type, "cpu") != 0)
>  		return 0;
>  
> -	/* Find MMU PID size */
> -	prop = of_get_flat_dt_prop(node, "ibm,mmu-pid-bits", &size);
> -	if (prop && size == 4)
> -		mmu_pid_bits = be32_to_cpup(prop);
> -
>  	/* Grab page size encodings */
>  	prop = of_get_flat_dt_prop(node, "ibm,processor-radix-AP-encodings", &size);
>  	if (!prop)
> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
> index 386be136026e..04f45fcb1222 100644
> --- a/arch/powerpc/mm/init_64.c
> +++ b/arch/powerpc/mm/init_64.c
> @@ -370,6 +370,9 @@ void register_page_bootmem_memmap(unsigned long section_nr,
>  #endif /* CONFIG_SPARSEMEM_VMEMMAP */
>  
>  #ifdef CONFIG_PPC_BOOK3S_64
> +unsigned int mmu_lpid_bits;
> +unsigned int mmu_pid_bits;
> +
>  static bool disable_radix = !IS_ENABLED(CONFIG_PPC_RADIX_MMU_DEFAULT);
>  
>  static int __init parse_disable_radix(char *p)
> @@ -437,19 +440,61 @@ static void __init early_check_vec5(void)
>  	}
>  }
>  
> +static int __init dt_scan_mmu_pid_width(unsigned long node,
> +					   const char *uname, int depth,
> +					   void *data)
> +{
> +	int size = 0;
> +	const __be32 *prop;
> +	const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
> +
> +	/* We are scanning "cpu" nodes only */
> +	if (type == NULL || strcmp(type, "cpu") != 0)
> +		return 0;
> +
> +	/* Find MMU LPID, PID register size */
> +	prop = of_get_flat_dt_prop(node, "ibm,mmu-lpid-bits", &size);
> +	if (prop && size == 4)
> +		mmu_lpid_bits = be32_to_cpup(prop);
> +
> +	prop = of_get_flat_dt_prop(node, "ibm,mmu-pid-bits", &size);
> +	if (prop && size == 4)
> +		mmu_pid_bits = be32_to_cpup(prop);
> +
> +	if (!mmu_pid_bits && !mmu_lpid_bits)
> +		return 0;
> +
> +	return 1;
> +}
> +
>  void __init mmu_early_init_devtree(void)
>  {
> +	int rc;
> +	bool hvmode = !!(mfmsr() & MSR_HV);
> +
>  	/* Disable radix mode based on kernel command line. */
>  	if (disable_radix)
>  		cur_cpu_spec->mmu_features &= ~MMU_FTR_TYPE_RADIX;
>  
> +	rc = of_scan_flat_dt(dt_scan_mmu_pid_width, NULL);
> +	if (hvmode && !mmu_lpid_bits) {
> +		if (early_cpu_has_feature(CPU_FTR_ARCH_207S))
> +			mmu_lpid_bits = 12; /* POWER8-10 */
> +		else
> +			mmu_lpid_bits = 10; /* POWER7 */
> +	}
> +	if (!mmu_pid_bits) {
> +		if (early_cpu_has_feature(CPU_FTR_ARCH_300))
> +			mmu_pid_bits = 20; /* POWER9-10 */
> +	}
> +
>  	/*
>  	 * Check /chosen/ibm,architecture-vec-5 if running as a guest.
>  	 * When running bare-metal, we can use radix if we like
>  	 * even though the ibm,architecture-vec-5 property created by
>  	 * skiboot doesn't have the necessary bits set.
>  	 */
> -	if (!(mfmsr() & MSR_HV))
> +	if (!hvmode)
>  		early_check_vec5();
>  
>  	if (early_radix_enabled()) {
