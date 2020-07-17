Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F7922333F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 08:03:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7LBp6r4RzDqvj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 16:02:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7L8c6QvZzDrKj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 16:01:04 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06H5WVD2124793; Fri, 17 Jul 2020 02:00:57 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32aq0ya7gf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 02:00:57 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06H602Ar008787;
 Fri, 17 Jul 2020 06:00:57 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 327529t7j7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 06:00:57 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06H60rGT58524108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 06:00:53 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA1D178066;
 Fri, 17 Jul 2020 06:00:53 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 370637805E;
 Fri, 17 Jul 2020 06:00:46 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.61.65])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jul 2020 06:00:46 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id F13142E3225; Fri, 17 Jul 2020 11:30:11 +0530 (IST)
Date: Fri, 17 Jul 2020 11:30:11 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 05/11] powerpc/smp: Dont assume l2-cache to be superset
 of sibling
Message-ID: <20200717060011.GE25851@in.ibm.com>
References: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
 <20200714043624.5648-6-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714043624.5648-6-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-17_03:2020-07-16,
 2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007170038
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
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Michael Ellerman <michaele@au1.ibm.com>, Anton Blanchard <anton@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nick Piggin <npiggin@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Srikar,

On Tue, Jul 14, 2020 at 10:06:18AM +0530, Srikar Dronamraju wrote:
> Current code assumes that cpumask of cpus sharing a l2-cache mask will
> always be a superset of cpu_sibling_mask.
> 
> Lets stop that assumption.
> 
> Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
> Cc: Michael Ellerman <michaele@au1.ibm.com>
> Cc: Nick Piggin <npiggin@au1.ibm.com>
> Cc: Oliver OHalloran <oliveroh@au1.ibm.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Michael Neuling <mikey@linux.ibm.com>
> Cc: Anton Blanchard <anton@au1.ibm.com>
> Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/smp.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 7d430fc536cc..875f57e41355 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1198,6 +1198,7 @@ static bool update_mask_by_l2(int cpu, struct cpumask *(*mask_fn)(int))
>  	struct device_node *l2_cache, *np;
>  	int i;
> 
> +	cpumask_set_cpu(cpu, mask_fn(cpu));

It would be good to comment why do we need to do set the CPU in the
l2-mask if we don't have a l2cache domain.

>  	l2_cache = cpu_to_l2cache(cpu);
>  	if (!l2_cache)
>  		return false;
> @@ -1284,29 +1285,30 @@ static void add_cpu_to_masks(int cpu)
>  	 * add it to it's own thread sibling mask.
>  	 */
>  	cpumask_set_cpu(cpu, cpu_sibling_mask(cpu));
> +	cpumask_set_cpu(cpu, cpu_core_mask(cpu));
> 
>  	for (i = first_thread; i < first_thread + threads_per_core; i++)
>  		if (cpu_online(i))
>  			set_cpus_related(i, cpu, cpu_sibling_mask);
> 
>  	add_cpu_to_smallcore_masks(cpu);
> -	/*
> -	 * Copy the thread sibling mask into the cache sibling mask
> -	 * and mark any CPUs that share an L2 with this CPU.
> -	 */
> -	for_each_cpu(i, cpu_sibling_mask(cpu))
> -		set_cpus_related(cpu, i, cpu_l2_cache_mask);
>  	update_mask_by_l2(cpu, cpu_l2_cache_mask);
> 
> -	/*
> -	 * Copy the cache sibling mask into core sibling mask and mark
> -	 * any CPUs on the same chip as this CPU.
> -	 */
> -	for_each_cpu(i, cpu_l2_cache_mask(cpu))
> -		set_cpus_related(cpu, i, cpu_core_mask);
> +	if (pkg_id == -1) {
> +		struct cpumask *(*mask)(int) = cpu_sibling_mask;
> +
> +		/*
> +		 * Copy the sibling mask into core sibling mask and
> +		 * mark any CPUs on the same chip as this CPU.
> +		 */
> +		if (shared_caches)
> +			mask = cpu_l2_cache_mask;
> +


Now that we decoupling the containment relationship between
sibling_mask and l2-cache mask, should we set all the CPUs that are
both in cpu_sibling_mask(cpu) as well as cpu_l2_mask(cpu) in
cpu_core_mask ? 

> +		for_each_cpu(i, mask(cpu))
> +			set_cpus_related(cpu, i, cpu_core_mask);
> 
> -	if (pkg_id == -1)
>  		return;
> +	}
> 
>  	for_each_cpu(i, cpu_online_mask)
>  		if (get_physical_package_id(i) == pkg_id)
> -- 
> 2.17.1
> 
--
Thanks and Regards
gautham.
