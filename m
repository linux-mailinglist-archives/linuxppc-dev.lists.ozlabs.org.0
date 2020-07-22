Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A23DF229014
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 07:52:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBPjx0Z31zDqvh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 15:52:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBPdy5qkJzDqsZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 15:48:38 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06M5WOY3004944; Wed, 22 Jul 2020 01:48:28 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1vve1np-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 01:48:28 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06M5ZF1K012186;
 Wed, 22 Jul 2020 01:48:28 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1vve1ne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 01:48:28 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06M5k5Wb022676;
 Wed, 22 Jul 2020 05:48:27 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 32d5dq7g4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 05:48:27 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06M5mP5H48496980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 05:48:25 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E41B124054;
 Wed, 22 Jul 2020 05:48:25 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9A28124052;
 Wed, 22 Jul 2020 05:48:24 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.82.72])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 22 Jul 2020 05:48:24 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 101B02E3C48; Wed, 22 Jul 2020 11:18:20 +0530 (IST)
Date: Wed, 22 Jul 2020 11:18:19 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 02/10] powerpc/smp: Merge Power9 topology with Power
 topology
Message-ID: <20200722054819.GB31038@in.ibm.com>
References: <20200721113814.32284-1-srikar@linux.vnet.ibm.com>
 <20200721113814.32284-3-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721113814.32284-3-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_02:2020-07-21,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1011
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007220036
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
 Michael Ellerman <michaele@au1.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Jordan Niethe <jniethe5@gmail.com>, Anton Blanchard <anton@au1.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Nick Piggin <npiggin@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 21, 2020 at 05:08:06PM +0530, Srikar Dronamraju wrote:
> A new sched_domain_topology_level was added just for Power9. However the
> same can be achieved by merging powerpc_topology with power9_topology
> and makes the code more simpler especially when adding a new sched
> domain.
> 
> Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
> Cc: LKML <linux-kernel@vger.kernel.org>
> Cc: Michael Ellerman <michaele@au1.ibm.com>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: Nick Piggin <npiggin@au1.ibm.com>
> Cc: Oliver OHalloran <oliveroh@au1.ibm.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Michael Neuling <mikey@linux.ibm.com>
> Cc: Anton Blanchard <anton@au1.ibm.com>
> Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
> Cc: Jordan Niethe <jniethe5@gmail.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
> Changelog v1 -> v2:
> powerpc/smp: Merge Power9 topology with Power topology
> 	Replaced a reference to cpu_smt_mask with per_cpu(cpu_sibling_map, cpu)
> 	since cpu_smt_mask is only defined under CONFIG_SCHED_SMT
> 
>  arch/powerpc/kernel/smp.c | 33 ++++++++++-----------------------
>  1 file changed, 10 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 680c0edcc59d..0e0b118d9b6e 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1315,7 +1315,7 @@ int setup_profiling_timer(unsigned int multiplier)
>  }
> 
>  #ifdef CONFIG_SCHED_SMT
> -/* cpumask of CPUs with asymetric SMT dependancy */
> +/* cpumask of CPUs with asymmetric SMT dependency */
>  static int powerpc_smt_flags(void)
>  {
>  	int flags = SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
> @@ -1328,14 +1328,6 @@ static int powerpc_smt_flags(void)
>  }
>  #endif
> 
> -static struct sched_domain_topology_level powerpc_topology[] = {
> -#ifdef CONFIG_SCHED_SMT
> -	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
> -#endif
> -	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
> -	{ NULL, },
> -};
> -
>  /*
>   * P9 has a slightly odd architecture where pairs of cores share an L2 cache.
>   * This topology makes it *much* cheaper to migrate tasks between adjacent cores
> @@ -1353,7 +1345,13 @@ static int powerpc_shared_cache_flags(void)
>   */
>  static const struct cpumask *shared_cache_mask(int cpu)
>  {
> -	return cpu_l2_cache_mask(cpu);
> +	if (shared_caches)
> +		return cpu_l2_cache_mask(cpu);
> +
> +	if (has_big_cores)
> +		return cpu_smallcore_mask(cpu);
> +
> +	return per_cpu(cpu_sibling_map, cpu);
>  }


It might be helpful to enumerate the consequences of this change:

With this patch, on POWER7 and POWER8

   SMT and CACHE domains' cpumasks will both be
   per_cpu(cpu_sibling_map, cpu).

   On POWER7 SMT level flags has the following
   (SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES | SD_ASYM_PACKING)

   On POWER8 SMT level flags has the following
   (SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES).

   On both POWER7 and POWER8, CACHE level flags only has
   SD_SHARE_PKG_RESOURCES

   Thus, on both POWER7 and POWER8, since the SMT and CACHE cpumasks
   are the same and since CACHE has no additional flags which SMT does
   not, the parent domain CACHE will be degenerated.

   Hence we will have SMT --> DIE --> NUMA as before without the
   patch. So the patch introduces no behavioural change. Only change
   is an additional degeneration of the CACHE domain.

On POWER9 : Baremetal.
   SMT level cpumask = per_cpu(cpu_sibling_map, cpu)

   Since the caches are shared for a pair of two cores,
   CACHE level cpumask = cpu_l2_cache_mask(cpu)

   Thus, we will have SMT --> CACHE --> DIE --> NUMA as before.  No
   behavioural change.

On POWER9 : LPAR
   SMT level cpumask = cpu_smallcore_mask(cpu).

   Since the caches are shared,
   CACHE level cpumask = cpu_l2_cache_mask(cpu).

   Thus, we will have SMT --> CACHE --> DIE --> NUMA as before.  Again
   no change in behaviour.

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

--
Thanks and Regards
gautham.
