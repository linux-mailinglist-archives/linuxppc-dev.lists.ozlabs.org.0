Return-Path: <linuxppc-dev+bounces-2984-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4DD9C0834
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 14:55:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkkB30VZ2z3bmc;
	Fri,  8 Nov 2024 00:55:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730987755;
	cv=none; b=kSZvMq5hnMq9VXoYHXhlElr6yuxvJZkovMAOK3SwLjJTaQ7Qk5+ntdYqgahdTeAlwcoT53Wcug1cg8Na1r+E4HGbPy9K1Ixnso7N4YgkraKz5lnOwMiJjoze4yzwUdfT6ELBkQhL4LCMVQKzqnwdM3tojQqnRRVrYPTgosh1dn9rxlSvDC01KygQidIuSwnEq1HQTAyE6fvHAQGNbu1Bq1Uu0SF85cLrEMYkpS7XF+Ss66yFD8A9siYIPNggITRteprJsceIL3vDuORExa2LRSH7i7azMAvigBiKal2cxRe3InxahiKcq7L99/KmROhHBy/oBWTJIr7wXJr9KWkYcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730987755; c=relaxed/relaxed;
	bh=AfVkOCNkzy8Xe5LLBs5q+PEPVRpCXtlV66Yu1ebketg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dK8Bmmq49qh+uOwDidKn3OWO4aI7TPdmSeO+xwWbWAhdfgAJMMu9s1YFeR8Vme/A6wiwXdtmLe6vybJTeB99DbC1z5jYbgQOKxeoQb1pHFBScL/uj/5Rg4m9WaD9HSfc6W3bLWLi1mADFQdCF2lLYaXiHs+rkwEEHhHlO+eFjXIAId/mt19W8kE2MEfjcgqPcFjM8+O54IfMFv9HwI3imcDVlS6ez55TjKYqNP3MNVsXQIq0o+ltDnB8B0Rr8WyJ7aVJQEIXOVJKBxVbkc0eRHWl7xvB+/iFqBzDG8bJzEb5KlvOtfiZVsZSrIrlydR1tMkThr/JjFoIvDqewn7OAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IhmrwnQM; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IhmrwnQM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkkB170dYz3bmQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 00:55:53 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7Dm2df001097;
	Thu, 7 Nov 2024 13:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=AfVkOC
	Nkzy8Xe5LLBs5q+PEPVRpCXtlV66Yu1ebketg=; b=IhmrwnQM0fiYybgA7w+rT4
	CMtqsdTGW0fyTs91CpCvMTbi/3ncV+GDUp0avp5yyp19+RayPulTh7mBKxjYoj+y
	9ppnMf6sUE6DAFsgxG2SAq+d1MsSrXsgF7zaR1Ba+6mhsAJPYMhHF4uaSWBQHAWE
	2EZX7c/vgHURo5AcxmDSWHIS7NQ/skuCtD1sBbfJV2V9Pmn6YE//bQXylth76sho
	VLYQk/OOBkXr/46MV8o6d/JIHnPkvD9Jzcw9IxFzONmphFnIBUjH5utYjGTAnggh
	7HgenBYea4SqG/3kgGIWX/cq4MX5N3nrjDBvxyfoXI7uK6SJftwKbtfl+/2pqAYA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42rwag8fyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 13:55:44 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7DJdgJ008436;
	Thu, 7 Nov 2024 13:55:43 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42nywm6s3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 13:55:43 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A7DtgET59179386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Nov 2024 13:55:42 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 685705805A;
	Thu,  7 Nov 2024 13:55:42 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D20FB58056;
	Thu,  7 Nov 2024 13:55:40 +0000 (GMT)
Received: from [9.61.254.137] (unknown [9.61.254.137])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Nov 2024 13:55:40 +0000 (GMT)
Message-ID: <60e7ee58-25fc-4b66-88f9-f6c33164351a@linux.vnet.ibm.com>
Date: Thu, 7 Nov 2024 19:25:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] powerpc/fadump: allocate memory for additional
 parameters early
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Hari Bathini <hbathini@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20241107055817.489795-1-sourabhjain@linux.ibm.com>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
In-Reply-To: <20241107055817.489795-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: c96nyDsYKfPRrHHj83XnIZ5JHh0EqtPU
X-Proofpoint-ORIG-GUID: c96nyDsYKfPRrHHj83XnIZ5JHh0EqtPU
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411070106
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Applied the below patch to 6.12.0-rc6-next20241106 and issue is not 
seen. Results look good to me.

[root@ltcden8-lp5 ~]# uname -r
6.12.0-rc6-next-20241106-00002-gf374fbb4ee1a
[root@ltcden8-lp5 ~]#

Please add below tag.

Tested-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>

On 07/11/24 11:28 am, Sourabh Jain wrote:
> From: Hari Bathini <hbathini@linux.ibm.com>
>
> Memory for passing additional parameters to fadump capture kernel
> is allocated during subsys_initcall level, using memblock. But
> as slab is already available by this time, allocation happens via
> the buddy allocator. This may work for radix MMU but is likely to
> fail in most cases for hash MMU as hash MMU needs this memory in
> the first memory block for it to be accessible in real mode in the
> capture kernel (second boot). So, allocate memory for additional
> parameters area as soon as MMU mode is obvious.
>
> Fixes: 683eab94da75 ("powerpc/fadump: setup additional parameters for dump capture kernel")
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
> Closes: https://lore.kernel.org/lkml/a70e4064-a040-447b-8556-1fd02f19383d@linux.vnet.ibm.com/T/#u
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>
> Changelog:
>
> Since v1: https://lore.kernel.org/all/20241104083528.99520-1-sourabhjain@linux.ibm.com/
>    - Drop extern keyword from fadump_setup_param_area function declaration
>    - Don't use __va() while resetting param memory area
>
> ---
>   arch/powerpc/include/asm/fadump.h |  2 ++
>   arch/powerpc/kernel/fadump.c      | 15 ++++++++++-----
>   arch/powerpc/kernel/prom.c        |  3 +++
>   3 files changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/fadump.h b/arch/powerpc/include/asm/fadump.h
> index ef40c9b6972a..7b3473e05273 100644
> --- a/arch/powerpc/include/asm/fadump.h
> +++ b/arch/powerpc/include/asm/fadump.h
> @@ -19,6 +19,7 @@ extern int is_fadump_active(void);
>   extern int should_fadump_crash(void);
>   extern void crash_fadump(struct pt_regs *, const char *);
>   extern void fadump_cleanup(void);
> +void fadump_setup_param_area(void);
>   extern void fadump_append_bootargs(void);
>
>   #else	/* CONFIG_FA_DUMP */
> @@ -26,6 +27,7 @@ static inline int is_fadump_active(void) { return 0; }
>   static inline int should_fadump_crash(void) { return 0; }
>   static inline void crash_fadump(struct pt_regs *regs, const char *str) { }
>   static inline void fadump_cleanup(void) { }
> +static inline void fadump_setup_param_area(void) { }
>   static inline void fadump_append_bootargs(void) { }
>   #endif /* !CONFIG_FA_DUMP */
>
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index a612e7513a4f..3a2863307863 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -1586,6 +1586,12 @@ static void __init fadump_init_files(void)
>   		return;
>   	}
>
> +	if (fw_dump.param_area) {
> +		rc = sysfs_create_file(fadump_kobj, &bootargs_append_attr.attr);
> +		if (rc)
> +			pr_err("unable to create bootargs_append sysfs file (%d)\n", rc);
> +	}
> +
>   	debugfs_create_file("fadump_region", 0444, arch_debugfs_dir, NULL,
>   			    &fadump_region_fops);
>
> @@ -1740,7 +1746,7 @@ static void __init fadump_process(void)
>    * Reserve memory to store additional parameters to be passed
>    * for fadump/capture kernel.
>    */
> -static void __init fadump_setup_param_area(void)
> +void __init fadump_setup_param_area(void)
>   {
>   	phys_addr_t range_start, range_end;
>
> @@ -1748,7 +1754,7 @@ static void __init fadump_setup_param_area(void)
>   		return;
>
>   	/* This memory can't be used by PFW or bootloader as it is shared across kernels */
> -	if (radix_enabled()) {
> +	if (early_radix_enabled()) {
>   		/*
>   		 * Anywhere in the upper half should be good enough as all memory
>   		 * is accessible in real mode.
> @@ -1776,12 +1782,12 @@ static void __init fadump_setup_param_area(void)
>   						       COMMAND_LINE_SIZE,
>   						       range_start,
>   						       range_end);
> -	if (!fw_dump.param_area || sysfs_create_file(fadump_kobj, &bootargs_append_attr.attr)) {
> +	if (!fw_dump.param_area) {
>   		pr_warn("WARNING: Could not setup area to pass additional parameters!\n");
>   		return;
>   	}
>
> -	memset(phys_to_virt(fw_dump.param_area), 0, COMMAND_LINE_SIZE);
> +	memset((void *)fw_dump.param_area, 0, COMMAND_LINE_SIZE);
>   }
>
>   /*
> @@ -1807,7 +1813,6 @@ int __init setup_fadump(void)
>   	}
>   	/* Initialize the kernel dump memory structure and register with f/w */
>   	else if (fw_dump.reserve_dump_area_size) {
> -		fadump_setup_param_area();
>   		fw_dump.ops->fadump_init_mem_struct(&fw_dump);
>   		register_fadump();
>   	}
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 0be07ed407c7..47db1b1aef25 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -908,6 +908,9 @@ void __init early_init_devtree(void *params)
>
>   	mmu_early_init_devtree();
>
> +	/* Setup param area for passing additional parameters to fadump capture kernel. */
> +	fadump_setup_param_area();
> +
>   #ifdef CONFIG_PPC_POWERNV
>   	/* Scan and build the list of machine check recoverable ranges */
>   	of_scan_flat_dt(early_init_dt_scan_recoverable_ranges, NULL);

