Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E746204F0E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 12:32:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rjKH5Q9szDqJ1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 20:32:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rjHM71jPzDq9L
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 20:31:11 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05NA3nTX164878
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 06:31:09 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31ufgj13cv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 06:31:08 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05NA4YTr168358
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 06:31:08 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31ufgj13ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 06:31:08 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05NATc7p026468;
 Tue, 23 Jun 2020 10:31:07 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 31t35btrg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 10:31:07 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05NAV63L58458420
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jun 2020 10:31:06 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23618BE054;
 Tue, 23 Jun 2020 10:31:06 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 988D9BE053;
 Tue, 23 Jun 2020 10:31:04 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.71.222])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 23 Jun 2020 10:31:04 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v1 1/3] powerpc/mm/radix: Create separate mappings for
 hot-plugged memory
In-Reply-To: <20200623073017.1951-2-bharata@linux.ibm.com>
References: <20200623073017.1951-1-bharata@linux.ibm.com>
 <20200623073017.1951-2-bharata@linux.ibm.com>
Date: Tue, 23 Jun 2020 16:01:02 +0530
Message-ID: <87v9ji2hw9.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-23_05:2020-06-23,
 2020-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 adultscore=0 cotscore=-2147483648 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006230079
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
> unplug. Hence, during radix init, identify the hot-plugged memory region
> and create separate mappings for each LMB so that they don't get mapped
> with 1G mappings. The identification of hot-plugged memory has become
> possible after the commit b6eca183e23e ("powerpc/kernel: Enables memory
> hot-remove after reboot on pseries guests").
>
> To create separate mappings for every LMB in the hot-plugged
> region, we need lmb-size for which we use memory_block_size_bytes().
> Since this is early init time code, the machine type isn't probed yet
> and hence memory_block_size_bytes() would return the default LMB size
> as 16MB. Hence we end up issuing more number of mapping requests
> than earlier.

Considering we can split 1G pages correctly, we can avoid doing this?



>
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 8acb96de0e48..ffccfe00ca2a 100644
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
> @@ -320,6 +321,8 @@ static void __init radix_init_pgtable(void)
>  {
>  	unsigned long rts_field;
>  	struct memblock_region *reg;
> +	phys_addr_t addr;
> +	u64 lmb_size = memory_block_size_bytes();
>  
>  	/* We don't support slb for radix */
>  	mmu_slb_size = 0;
> @@ -338,9 +341,15 @@ static void __init radix_init_pgtable(void)
>  			continue;
>  		}
>  
> -		WARN_ON(create_physical_mapping(reg->base,
> -						reg->base + reg->size,
> -						-1, PAGE_KERNEL));
> +		if (memblock_is_hotpluggable(reg)) {
> +			for (addr = reg->base; addr < (reg->base + reg->size);
> +			     addr += lmb_size)
> +				WARN_ON(create_physical_mapping(addr,
> +					addr + lmb_size, -1, PAGE_KERNEL));
> +		} else
> +			WARN_ON(create_physical_mapping(reg->base,
> +							reg->base + reg->size,
> +							-1, PAGE_KERNEL));
>  	}
>  
>  	/* Find out how many PID bits are supported */
> -- 
> 2.21.3
