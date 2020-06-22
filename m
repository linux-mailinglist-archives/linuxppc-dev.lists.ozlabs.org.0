Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 454F720372D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 14:48:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49r8ND5q0qzDqTQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 22:48:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49r8Km1tYQzDqJY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 22:46:18 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05MCgT60047649
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 08:46:16 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31t02g20dk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 08:46:16 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05MCX0LO017557
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 08:46:15 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31t02g20dc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 08:46:15 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05MCjevs015064;
 Mon, 22 Jun 2020 12:46:15 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 31t35bj2n6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 12:46:14 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05MCkBHh14483776
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Jun 2020 12:46:11 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47D52BE051;
 Mon, 22 Jun 2020 12:46:13 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB098BE04F;
 Mon, 22 Jun 2020 12:46:10 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.79.210.147])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 22 Jun 2020 12:46:10 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH v0 2/5] powerpc/mm/radix: Create separate mappings
 for hot-plugged memory
In-Reply-To: <20200406034925.22586-3-bharata@linux.ibm.com>
References: <20200406034925.22586-1-bharata@linux.ibm.com>
 <20200406034925.22586-3-bharata@linux.ibm.com>
Date: Mon, 22 Jun 2020 18:16:07 +0530
Message-ID: <87imfj46b4.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-22_07:2020-06-22,
 2020-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 phishscore=0 adultscore=0 clxscore=1015 cotscore=-2147483648 mlxscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006220094
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
Cc: leonardo@linux.ibm.com, aneesh.kumar@linux.vnet.ibm.com, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bharata B Rao <bharata@linux.ibm.com> writes:

> Memory that gets hot-plugged _during_ boot (and not the memory
> that gets plugged in after boot), is mapped with 1G mappings
> and will undergo splitting when it is unplugged. The splitting
> code has a few issues:
>
> 1. Recursive locking
> --------------------
> Memory unplug path takes cpu_hotplug_lock and calls stop_machine()
> for splitting the mappings. However stop_machine() takes
> cpu_hotplug_lock again causing deadlock.
>
> 2. BUG: sleeping function called from in_atomic() context
> ---------------------------------------------------------
> Memory unplug path (remove_pagetable) takes init_mm.page_table_lock
> spinlock and later calls stop_machine() which does wait_for_completion()
>
> 3. Bad unlock unbalance
> -----------------------
> Memory unplug path takes init_mm.page_table_lock spinlock and calls
> stop_machine(). The stop_machine thread function runs in a different
> thread context (migration thread) which tries to release and reaquire
> ptl. Releasing ptl from a different thread than which acquired it
> causes bad unlock unbalance.
>
> These problems can be avoided if we avoid mapping hot-plugged memory
> with 1G mapping, thereby removing the need for splitting them during
> unplug. During radix init, identify(*) the hot-plugged memory region
> and create separate mappings for each LMB so that they don't get mapped
> with 1G mappings.
>
> To create separate mappings for every LMB in the hot-plugged
> region, we need lmb-size. I am currently using memory_block_size_bytes()
> API to get the lmb-size. Since this is early init time code, the
> machine type isn't probed yet and hence memory_block_size_bytes()
> would return the default LMB size as 16MB. Hence we end up creating
> separate mappings at much lower granularity than what we can ideally
> do for pseries machine.
>
> (*) Identifying and differentiating hot-plugged memory from the
> boot time memory is now possible with PAPR extension to LMB flags.
> (Ref: https://lore.kernel.org/linuxppc-dev/f55a7b65a43cc9dc7b22385cf9960f8b11d5ce2e.camel@linux.ibm.com/T/#t)
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index dd1bea45325c..4a4fb30f6c3d 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -16,6 +16,7 @@
>  #include <linux/hugetlb.h>
>  #include <linux/string_helpers.h>
>  #include <linux/stop_machine.h>
> +#include <linux/memory.h>
>  
>  #include <asm/pgtable.h>
>  #include <asm/pgalloc.h>
> @@ -313,6 +314,8 @@ static void __init radix_init_pgtable(void)
>  {
>  	unsigned long rts_field;
>  	struct memblock_region *reg;
> +	phys_addr_t addr;
> +	u64 lmb_size = memory_block_size_bytes();
>  
>  	/* We don't support slb for radix */
>  	mmu_slb_size = 0;
> @@ -331,9 +334,15 @@ static void __init radix_init_pgtable(void)
>  			continue;
>  		}
>  
> -		WARN_ON(create_physical_mapping(reg->base,
> -						reg->base + reg->size,
> -						-1));
> +		if (memblock_is_hotpluggable(reg)) {
> +			for (addr = reg->base; addr < (reg->base + reg->size);
> +				addr += lmb_size)
> +				WARN_ON(create_physical_mapping(addr,
> +				addr + lmb_size, -1));

Is that indentation correct? 

> +		} else
> +			WARN_ON(create_physical_mapping(reg->base,
> +							reg->base + reg->size,
> +							-1));
>  	}
>  
>  	/* Find out how many PID bits are supported */
> -- 
> 2.21.0
