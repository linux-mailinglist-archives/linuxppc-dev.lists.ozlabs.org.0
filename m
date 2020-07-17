Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6285B2236EC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 10:21:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7PGd2sVLzDr1g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 18:21:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7PDV1wqbzDq98
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 18:19:37 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06H82K1J064964; Fri, 17 Jul 2020 04:19:34 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32792y1tf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 04:19:33 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06H8GDN9020653;
 Fri, 17 Jul 2020 08:19:33 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 327529u90j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 08:19:33 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06H8JVbO16384538
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 08:19:31 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36D162805A;
 Fri, 17 Jul 2020 08:19:31 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C5102805C;
 Fri, 17 Jul 2020 08:19:30 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.61.65])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jul 2020 08:19:30 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 981362E3026; Fri, 17 Jul 2020 13:49:26 +0530 (IST)
Date: Fri, 17 Jul 2020 13:49:26 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 09/11] Powerpc/smp: Create coregroup domain
Message-ID: <20200717081926.GD32531@in.ibm.com>
References: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
 <20200714043624.5648-10-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714043624.5648-10-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-17_04:2020-07-16,
 2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007170059
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

On Tue, Jul 14, 2020 at 10:06:22AM +0530, Srikar Dronamraju wrote:
> Add percpu coregroup maps and masks to create coregroup domain.
> If a coregroup doesn't exist, the coregroup domain will be degenerated
> in favour of SMT/CACHE domain.
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
>  arch/powerpc/include/asm/topology.h | 10 ++++++++
>  arch/powerpc/kernel/smp.c           | 37 +++++++++++++++++++++++++++++
>  arch/powerpc/mm/numa.c              |  5 ++++
>  3 files changed, 52 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index 2db7ba789720..34812c35018e 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -98,6 +98,7 @@ extern int stop_topology_update(void);
>  extern int prrn_is_enabled(void);
>  extern int find_and_online_cpu_nid(int cpu);
>  extern int timed_topology_update(int nsecs);
> +extern int cpu_to_coregroup_id(int cpu);
>  #else
>  static inline int start_topology_update(void)
>  {
> @@ -120,6 +121,15 @@ static inline int timed_topology_update(int nsecs)
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
> index ef19eeccd21e..bb25c13bbb79 100644
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
>  	return cpu_core_mask(cpu);
> @@ -879,6 +896,7 @@ static struct sched_domain_topology_level powerpc_topology[] = {
>  	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
>  #endif
>  	{ cpu_bigcore_mask, SD_INIT_NAME(BIGCORE) },
> +	{ cpu_mc_mask, SD_INIT_NAME(MC) },
>  	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
>  	{ NULL, },
>  };
> @@ -933,6 +951,10 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  					GFP_KERNEL, node);
>  		zalloc_cpumask_var_node(&per_cpu(cpu_core_map, cpu),
>  					GFP_KERNEL, node);
> +		if (has_coregroup_support())
> +			zalloc_cpumask_var_node(&per_cpu(cpu_coregroup_map, cpu),
> +						GFP_KERNEL, node);
> +
>  #ifdef CONFIG_NEED_MULTIPLE_NODES
>  		/*
>  		 * numa_node_id() works after this.
> @@ -950,6 +972,11 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  	cpumask_set_cpu(boot_cpuid, cpu_l2_cache_mask(boot_cpuid));
>  	cpumask_set_cpu(boot_cpuid, cpu_core_mask(boot_cpuid));
> 
> +	if (has_coregroup_support())
> +		cpumask_set_cpu(boot_cpuid, cpu_coregroup_mask(boot_cpuid));
> +	else
> +		powerpc_topology[mc_idx].mask = cpu_bigcore_mask;
> +

The else part could be moved to the common function where we are
modifying the other attributes of the topology array.


>  	init_big_cores();
>  	if (has_big_cores) {
>  		cpumask_set_cpu(boot_cpuid,
> @@ -1241,6 +1268,8 @@ static void remove_cpu_from_masks(int cpu)
>  		set_cpus_unrelated(cpu, i, cpu_sibling_mask);
>  		if (has_big_cores)
>  			set_cpus_unrelated(cpu, i, cpu_smallcore_mask);
> +		if (has_coregroup_support())
> +			set_cpus_unrelated(cpu, i, cpu_coregroup_mask);
>  	}
>  }
>  #endif
> @@ -1301,6 +1330,14 @@ static void add_cpu_to_masks(int cpu)
>  	add_cpu_to_smallcore_masks(cpu);
>  	update_mask_by_l2(cpu, cpu_l2_cache_mask);
> 
> +	if (has_coregroup_support()) {
> +		cpumask_set_cpu(cpu, cpu_coregroup_mask(cpu));
> +		for_each_cpu(i, cpu_online_mask) {
> +			if (cpu_to_coregroup_id(cpu) == cpu_to_coregroup_id(i))
> +				set_cpus_related(cpu, i, cpu_coregroup_mask);
> +		}
> +	}
> +
>  	if (pkg_id == -1) {
>  		struct cpumask *(*mask)(int) = cpu_sibling_mask;
> 
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index a43eab455be4..d9ab9da85eab 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -1695,6 +1695,11 @@ static const struct proc_ops topology_proc_ops = {
>  	.proc_release	= single_release,
>  };
> 
> +int cpu_to_coregroup_id(int cpu)
> +{
> +	return cpu_to_core_id(cpu);
> +}


So, if has_coregroup_support() returns true, then since the core_group
identification is currently done through the core-id, the
coregroup_mask is going to be the same as the
cpu_core_mask/cpu_cpu_mask. Thus, we will be degenerating the DIE
domain. Right ? Instead we could have kept the core-group to be a
single bigcore by default, so that those domains can get degenerated
preserving the legacy SMT, DIE, NUMA hierarchy.




> +
>  static int topology_update_init(void)
>  {
>  	start_topology_update();
> -- 
> 2.17.1
> 
