Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F8F361102
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 19:21:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLmMn44HKz3dYq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 03:21:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r35MkgmN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=r35MkgmN; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLmLH5t5Cz3cl3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 03:19:51 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FH5RIP128933; Thu, 15 Apr 2021 13:19:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=QDlxbZdWjg5qiCSLrUR3FdZGotVBs3OlInzHhSQD7Us=;
 b=r35MkgmN1W0aS+XtCNCN/ZB7lPEpKW+9la5LKnsQp6suqA3qpQBxevgvCjA4Wx5atnEk
 0fylL2eZTX5Ub9DgO8Lq/GWzqAi2neCn52rxw9Y8rihhSgRVpqRHKds/0zyH6pprTZLl
 kDYZ1BYQdqQEIBSYNRJD2oGemA2xnkvrBqTpW4O+qiZ4qXFzjLtZHjiHckEY4YjIyQpJ
 51i2KE0ouM7/mphQLAGrp+VRyWtRYmT7nWdag88eavLFPUj8jTzTTZIzzarS2QdRmQ40
 P7D2T9F9YGU2nhom3oLzg3E0H6VpuE4kz02wWoIZhHkfFSiaWc1HKDQxw26GCcBfZ9yK dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x88jc9vw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 13:19:30 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13FH5guI129774;
 Thu, 15 Apr 2021 13:19:30 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x88jc9vm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 13:19:30 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13FHCMxr022982;
 Thu, 15 Apr 2021 17:19:29 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 37u3nads8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 17:19:29 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13FHJS1o35651852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 17:19:28 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7F46AE05F;
 Thu, 15 Apr 2021 17:19:28 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B360AE064;
 Thu, 15 Apr 2021 17:19:27 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.57.176])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 15 Apr 2021 17:19:27 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id C04702E2E70; Thu, 15 Apr 2021 22:49:21 +0530 (IST)
Date: Thu, 15 Apr 2021 22:49:21 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] powerpc/smp: Cache CPU to chip lookup
Message-ID: <20210415171921.GB16351@in.ibm.com>
References: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
 <20210415120934.232271-4-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415120934.232271-4-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TbnrNfkAgTbcIK5Z5DwtTm7a4Mlh6ODQ
X-Proofpoint-ORIG-GUID: FOuInheKsXQERF1O9MD1KxQxf5G0qrY0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_06:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104150106
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, qemu-ppc@nongnu.org,
 Cedric Le Goater <clg@kaod.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Ingo Molnar <mingo@kernel.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 15, 2021 at 05:39:34PM +0530, Srikar Dronamraju wrote:
> On systems with large CPUs per node, even with the filtered matching of
> related CPUs, there can be large number of calls to cpu_to_chip_id for
> the same CPU. For example with 4096 vCPU, 1 node QEMU configuration,
> with 4 threads per core, system could be see upto 1024 calls to
> cpu_to_chip_id() for the same CPU. On a given system, cpu_to_chip_id()
> for a given CPU would always return the same. Hence cache the result in
> a lookup table for use in subsequent calls.
> 
> Since all CPUs sharing the same core will belong to the same chip, the
> lookup_table has an entry for one CPU per core.  chip_id_lookup_table is
> not being freed and would be used on subsequent CPU online post CPU
> offline.
> 
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: qemu-ppc@nongnu.org
> Cc: Cedric Le Goater <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> Reported-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/smp.h |  1 +
>  arch/powerpc/kernel/prom.c     | 19 +++++++++++++++----
>  arch/powerpc/kernel/smp.c      | 21 +++++++++++++++++++--
>  3 files changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
> index 47081a9e13ca..03b3d010cbab 100644
> --- a/arch/powerpc/include/asm/smp.h
> +++ b/arch/powerpc/include/asm/smp.h
> @@ -31,6 +31,7 @@ extern u32 *cpu_to_phys_id;
>  extern bool coregroup_enabled;
> 
>  extern int cpu_to_chip_id(int cpu);
> +extern int *chip_id_lookup_table;
> 
>  #ifdef CONFIG_SMP
> 
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 9a4797d1d40d..6d2e4a5bc471 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -65,6 +65,8 @@
>  #define DBG(fmt...)
>  #endif
> 
> +int *chip_id_lookup_table;
> +
>  #ifdef CONFIG_PPC64
>  int __initdata iommu_is_off;
>  int __initdata iommu_force_on;
> @@ -914,13 +916,22 @@ EXPORT_SYMBOL(of_get_ibm_chip_id);
>  int cpu_to_chip_id(int cpu)
>  {
>  	struct device_node *np;
> +	int ret = -1, idx;
> +
> +	idx = cpu / threads_per_core;
> +	if (chip_id_lookup_table && chip_id_lookup_table[idx] != -1)

The value -1 is ambiguous since we won't be able to determine if
it is because we haven't yet made a of_get_ibm_chip_id() call
or if of_get_ibm_chip_id() call was made and it returned a -1.

Thus, perhaps we can initialize chip_id_lookup_table[idx] with a
different unique negative value. How about S32_MIN ? and check
chip_id_lookup_table[idx] is different here ?


> +		return chip_id_lookup_table[idx];
> 
>  	np = of_get_cpu_node(cpu, NULL);
> -	if (!np)
> -		return -1;
> +	if (np) {
> +		ret = of_get_ibm_chip_id(np);
> +		of_node_put(np);
> +
> +		if (chip_id_lookup_table)
> +			chip_id_lookup_table[idx] = ret;
> +	}
> 
> -	of_node_put(np);
> -	return of_get_ibm_chip_id(np);
> +	return ret;
>  }
>  EXPORT_SYMBOL(cpu_to_chip_id);
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 5c7ce1d50631..50520fbea424 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1073,6 +1073,20 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  				cpu_smallcore_mask(boot_cpuid));
>  	}
> 
> +	if (cpu_to_chip_id(boot_cpuid) != -1) {
> +		int idx = num_possible_cpus() / threads_per_core;
> +
> +		/*
> +		 * All threads of a core will all belong to the same core,
> +		 * chip_id_lookup_table will have one entry per core.
> +		 * Assumption: if boot_cpuid doesn't have a chip-id, then no
> +		 * other CPUs, will also not have chip-id.
> +		 */
> +		chip_id_lookup_table = kcalloc(idx, sizeof(int), GFP_KERNEL);
> +		if (chip_id_lookup_table)
> +			memset(chip_id_lookup_table, -1, sizeof(int) * idx);
> +	}
> +
>  	if (smp_ops && smp_ops->probe)
>  		smp_ops->probe();
>  }
> @@ -1468,8 +1482,8 @@ static void add_cpu_to_masks(int cpu)
>  {
>  	struct cpumask *(*submask_fn)(int) = cpu_sibling_mask;
>  	int first_thread = cpu_first_thread_sibling(cpu);
> -	int chip_id = cpu_to_chip_id(cpu);
>  	cpumask_var_t mask;
> +	int chip_id = -1;
>  	bool ret;
>  	int i;
> 
> @@ -1492,7 +1506,10 @@ static void add_cpu_to_masks(int cpu)
>  	if (has_coregroup_support())
>  		update_coregroup_mask(cpu, &mask);
> 
> -	if (chip_id == -1 || !ret) {
> +	if (chip_id_lookup_table && ret)
> +		chip_id = cpu_to_chip_id(cpu);
> +
> +	if (chip_id == -1) {
>  		cpumask_copy(per_cpu(cpu_core_map, cpu), cpu_cpu_mask(cpu));
>  		goto out;
>  	}
> -- 
> 2.25.1
> 
