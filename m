Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFEA22F885
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 20:55:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFps34VLdzDrFd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 04:55:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFppr4lCqzDr3T
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 04:53:08 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06RIWsZk178491; Mon, 27 Jul 2020 14:52:58 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32hs1c6enq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 14:52:57 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06RIX2wT179663;
 Mon, 27 Jul 2020 14:52:57 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32hs1c6en6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 14:52:57 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06RIoa0B022493;
 Mon, 27 Jul 2020 18:52:56 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 32gcy40ak8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 18:52:56 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06RIqstZ64356780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 18:52:54 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB2E46E04C;
 Mon, 27 Jul 2020 18:52:54 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E93876E04E;
 Mon, 27 Jul 2020 18:52:53 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.73.118])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 27 Jul 2020 18:52:53 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 42F622E33AC; Tue, 28 Jul 2020 00:22:49 +0530 (IST)
Date: Tue, 28 Jul 2020 00:22:49 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 09/10] Powerpc/smp: Create coregroup domain
Message-ID: <20200727185249.GA26602@in.ibm.com>
References: <20200727053230.19753-1-srikar@linux.vnet.ibm.com>
 <20200727053230.19753-10-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200727053230.19753-10-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_13:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270125
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
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Jordan Niethe <jniethe5@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Srikar,

On Mon, Jul 27, 2020 at 11:02:29AM +0530, Srikar Dronamraju wrote:
> Add percpu coregroup maps and masks to create coregroup domain.
> If a coregroup doesn't exist, the coregroup domain will be degenerated
> in favour of SMT/CACHE domain.
> 
> Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
> Cc: LKML <linux-kernel@vger.kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Anton Blanchard <anton@ozlabs.org>
> Cc: Oliver O'Halloran <oohall@gmail.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Michael Neuling <mikey@neuling.org>
> Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: Jordan Niethe <jniethe5@gmail.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

This version looks good to me.

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>


> ---
> Changelog v3 ->v4:
> 	if coregroup_support doesn't exist, update MC mask to the next
> 	smaller domain mask.
> 
> Changelog v2 -> v3:
> 	Add optimization for mask updation under coregroup_support
> 
> Changelog v1 -> v2:
> 	Moved coregroup topology fixup to fixup_topology (Gautham)
> 
>  arch/powerpc/include/asm/topology.h | 10 +++++++
>  arch/powerpc/kernel/smp.c           | 44 +++++++++++++++++++++++++++++
>  arch/powerpc/mm/numa.c              |  5 ++++
>  3 files changed, 59 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index f0b6300e7dd3..6609174918ab 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -88,12 +88,22 @@ static inline int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
> 
>  #if defined(CONFIG_NUMA) && defined(CONFIG_PPC_SPLPAR)
>  extern int find_and_online_cpu_nid(int cpu);
> +extern int cpu_to_coregroup_id(int cpu);
>  #else
>  static inline int find_and_online_cpu_nid(int cpu)
>  {
>  	return 0;
>  }
> 
> +static inline int cpu_to_coregroup_id(int cpu)
> +{
> +#ifdef CONFIG_SMP
> +	return cpu_to_core_id(cpu);
> +#else
> +	return 0;
> +#endif
> +}
> +
>  #endif /* CONFIG_NUMA && CONFIG_PPC_SPLPAR */
> 
>  #include <asm-generic/topology.h>
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index dab96a1203ec..95f0bf72e283 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -80,6 +80,7 @@ DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
>  DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
>  DEFINE_PER_CPU(cpumask_var_t, cpu_l2_cache_map);
>  DEFINE_PER_CPU(cpumask_var_t, cpu_core_map);
> +DEFINE_PER_CPU(cpumask_var_t, cpu_coregroup_map);
> 
>  EXPORT_PER_CPU_SYMBOL(cpu_sibling_map);
>  EXPORT_PER_CPU_SYMBOL(cpu_l2_cache_map);
> @@ -91,6 +92,7 @@ enum {
>  	smt_idx,
>  #endif
>  	bigcore_idx,
> +	mc_idx,
>  	die_idx,
>  };
> 
> @@ -869,6 +871,21 @@ static const struct cpumask *smallcore_smt_mask(int cpu)
>  }
>  #endif
> 
> +static struct cpumask *cpu_coregroup_mask(int cpu)
> +{
> +	return per_cpu(cpu_coregroup_map, cpu);
> +}
> +
> +static bool has_coregroup_support(void)
> +{
> +	return coregroup_enabled;
> +}
> +
> +static const struct cpumask *cpu_mc_mask(int cpu)
> +{
> +	return cpu_coregroup_mask(cpu);
> +}
> +
>  static const struct cpumask *cpu_bigcore_mask(int cpu)
>  {
>  	return per_cpu(cpu_sibling_map, cpu);
> @@ -879,6 +896,7 @@ static struct sched_domain_topology_level powerpc_topology[] = {
>  	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
>  #endif
>  	{ cpu_bigcore_mask, SD_INIT_NAME(BIGCORE) },
> +	{ cpu_mc_mask, SD_INIT_NAME(MC) },
>  	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
>  	{ NULL, },
>  };
> @@ -925,6 +943,10 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  					GFP_KERNEL, cpu_to_node(cpu));
>  		zalloc_cpumask_var_node(&per_cpu(cpu_core_map, cpu),
>  					GFP_KERNEL, cpu_to_node(cpu));
> +		if (has_coregroup_support())
> +			zalloc_cpumask_var_node(&per_cpu(cpu_coregroup_map, cpu),
> +						GFP_KERNEL, cpu_to_node(cpu));
> +
>  #ifdef CONFIG_NEED_MULTIPLE_NODES
>  		/*
>  		 * numa_node_id() works after this.
> @@ -942,6 +964,9 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  	cpumask_set_cpu(boot_cpuid, cpu_l2_cache_mask(boot_cpuid));
>  	cpumask_set_cpu(boot_cpuid, cpu_core_mask(boot_cpuid));
> 
> +	if (has_coregroup_support())
> +		cpumask_set_cpu(boot_cpuid, cpu_coregroup_mask(boot_cpuid));
> +
>  	init_big_cores();
>  	if (has_big_cores) {
>  		cpumask_set_cpu(boot_cpuid,
> @@ -1233,6 +1258,8 @@ static void remove_cpu_from_masks(int cpu)
>  		set_cpus_unrelated(cpu, i, cpu_sibling_mask);
>  		if (has_big_cores)
>  			set_cpus_unrelated(cpu, i, cpu_smallcore_mask);
> +		if (has_coregroup_support())
> +			set_cpus_unrelated(cpu, i, cpu_coregroup_mask);
>  	}
>  }
>  #endif
> @@ -1293,6 +1320,20 @@ static void add_cpu_to_masks(int cpu)
>  	add_cpu_to_smallcore_masks(cpu);
>  	update_mask_by_l2(cpu, cpu_l2_cache_mask);
> 
> +	if (has_coregroup_support()) {
> +		int coregroup_id = cpu_to_coregroup_id(cpu);
> +
> +		cpumask_set_cpu(cpu, cpu_coregroup_mask(cpu));
> +		for_each_cpu_and(i, cpu_online_mask, cpu_cpu_mask(cpu)) {
> +			int fcpu = cpu_first_thread_sibling(i);
> +
> +			if (fcpu == first_thread)
> +				set_cpus_related(cpu, i, cpu_coregroup_mask);
> +			else if (coregroup_id == cpu_to_coregroup_id(i))
> +				set_cpus_related(cpu, i, cpu_coregroup_mask);
> +		}
> +	}
> +
>  	if (pkg_id == -1) {
>  		struct cpumask *(*mask)(int) = cpu_sibling_mask;
> 
> @@ -1398,6 +1439,9 @@ static void fixup_topology(void)
>  		powerpc_topology[bigcore_idx].name = "CACHE";
>  #endif
>  	}
> +
> +	if (!has_coregroup_support())
> +		powerpc_topology[mc_idx].mask = powerpc_topology[bigcore_idx].mask;
>  }
> 
>  void __init smp_cpus_done(unsigned int max_cpus)
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 51cb672f113b..0d57779e7942 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -1216,6 +1216,11 @@ int find_and_online_cpu_nid(int cpu)
>  	return new_nid;
>  }
> 
> +int cpu_to_coregroup_id(int cpu)
> +{
> +	return cpu_to_core_id(cpu);
> +}
> +
>  static int topology_update_init(void)
>  {
>  	topology_inited = 1;
> -- 
> 2.17.1
> 
