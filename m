Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A91D229174
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 08:58:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBRBv3MNYzDqnT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 16:58:47 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBR8n45bmzDqDB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 16:56:57 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06M61omV160858; Wed, 22 Jul 2020 02:56:49 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1vrftdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 02:56:49 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06M6tgg1120457;
 Wed, 22 Jul 2020 02:56:49 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1vrftdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 02:56:48 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06M6p4pH019269;
 Wed, 22 Jul 2020 06:56:48 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 32brq99rj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 06:56:48 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06M6uktE64160134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 06:56:46 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 212097805C;
 Wed, 22 Jul 2020 06:56:46 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4382B7805F;
 Wed, 22 Jul 2020 06:56:45 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.82.72])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 22 Jul 2020 06:56:45 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 76D7B2E340E; Wed, 22 Jul 2020 12:26:40 +0530 (IST)
Date: Wed, 22 Jul 2020 12:26:40 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 06/10] powerpc/smp: Generalize 2nd sched domain
Message-ID: <20200722065640.GE31038@in.ibm.com>
References: <20200721113814.32284-1-srikar@linux.vnet.ibm.com>
 <20200721113814.32284-7-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721113814.32284-7-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_02:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220040
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

Hello Srikar,

On Tue, Jul 21, 2020 at 05:08:10PM +0530, Srikar Dronamraju wrote:
> Currently "CACHE" domain happens to be the 2nd sched domain as per
> powerpc_topology. This domain will collapse if cpumask of l2-cache is
> same as SMT domain. However we could generalize this domain such that it
> could mean either be a "CACHE" domain or a "BIGCORE" domain.
> 
> While setting up the "CACHE" domain, check if shared_cache is already
> set.
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
> powerpc/smp: Generalize 2nd sched domain
> 	Moved shared_cache topology fixup to fixup_topology (Gautham)
>

Just one comment below.

>  arch/powerpc/kernel/smp.c | 49 ++++++++++++++++++++++++++++-----------
>  1 file changed, 35 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 57468877499a..933ebdf97432 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -85,6 +85,14 @@ EXPORT_PER_CPU_SYMBOL(cpu_l2_cache_map);
>  EXPORT_PER_CPU_SYMBOL(cpu_core_map);
>  EXPORT_SYMBOL_GPL(has_big_cores);
> 
> +enum {
> +#ifdef CONFIG_SCHED_SMT
> +	smt_idx,
> +#endif
> +	bigcore_idx,
> +	die_idx,
> +};
> +


[..snip..]

> @@ -1339,14 +1345,20 @@ void start_secondary(void *unused)
>  	/* Update topology CPU masks */
>  	add_cpu_to_masks(cpu);
> 
> -	if (has_big_cores)
> -		sibling_mask = cpu_smallcore_mask;
>  	/*
>  	 * Check for any shared caches. Note that this must be done on a
>  	 * per-core basis because one core in the pair might be disabled.
>  	 */
> -	if (!cpumask_equal(cpu_l2_cache_mask(cpu), sibling_mask(cpu)))
> -		shared_caches = true;
> +	if (!shared_caches) {
> +		struct cpumask *(*sibling_mask)(int) = cpu_sibling_mask;
> +		struct cpumask *mask = cpu_l2_cache_mask(cpu);
> +
> +		if (has_big_cores)
> +			sibling_mask = cpu_smallcore_mask;
> +
> +		if (cpumask_weight(mask) > cpumask_weight(sibling_mask(cpu)))
> +			shared_caches = true;

At the risk of repeating my comment to the v1 version of the patch, we
have shared caches only l2_cache_mask(cpu) is a strict superset of
sibling_mask(cpu).

"cpumask_weight(mask) > cpumask_weight(sibling_mask(cpu))" does not
capture this.

Could we please use

      if (!cpumask_equal(sibling_mask(cpu), mask) &&
      	  cpumask_subset(sibling_mask(cpu), mask) {
      }

?


> +	}
> 
>  	set_numa_node(numa_cpu_lookup_table[cpu]);
>  	set_numa_mem(local_memory_node(numa_cpu_lookup_table[cpu]));
> @@ -1374,10 +1386,19 @@ int setup_profiling_timer(unsigned int multiplier)
> 
>  static void fixup_topology(void)
>  {
> +	if (shared_caches) {
> +		pr_info("Using shared cache scheduler topology\n");
> +		powerpc_topology[bigcore_idx].mask = shared_cache_mask;
> +#ifdef CONFIG_SCHED_DEBUG
> +		powerpc_topology[bigcore_idx].name = "CACHE";
> +#endif
> +		powerpc_topology[bigcore_idx].sd_flags = powerpc_shared_cache_flags;
> +	}
> +
>  #ifdef CONFIG_SCHED_SMT
>  	if (has_big_cores) {
>  		pr_info("Big cores detected but using small core scheduling\n");
> -		powerpc_topology[0].mask = smallcore_smt_mask;
> +		powerpc_topology[smt_idx].mask = smallcore_smt_mask;
>  	}
>  #endif


Otherwise the patch looks good to me.

--
Thanks and Regards
gautham.
