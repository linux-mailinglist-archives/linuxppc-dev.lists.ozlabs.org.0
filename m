Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A5D22E500
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 06:41:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFRwH6Q8tzF0Rt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 14:41:35 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFRtK02YgzDqlV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 14:39:52 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06R4WH5O091837; Mon, 27 Jul 2020 00:39:48 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32ggqrfyvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 00:39:48 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06R4YR6N000550;
 Mon, 27 Jul 2020 04:39:47 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 32gcq0t464-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 04:39:47 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06R4dloU36634960
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 04:39:47 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E689DAC066;
 Mon, 27 Jul 2020 04:39:46 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A6CBAC05E;
 Mon, 27 Jul 2020 04:39:46 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.36.45])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 27 Jul 2020 04:39:46 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 31DA62E2DCD; Mon, 27 Jul 2020 10:09:41 +0530 (IST)
Date: Mon, 27 Jul 2020 10:09:41 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 09/10] powerpc/smp: Create coregroup domain
Message-ID: <20200727043941.GA18303@in.ibm.com>
References: <20200723085116.4731-1-srikar@linux.vnet.ibm.com>
 <20200723085116.4731-10-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723085116.4731-10-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_02:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270028
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

On Thu, Jul 23, 2020 at 02:21:15PM +0530, Srikar Dronamraju wrote:
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
> ---
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
> index 7d8d44cbab11..1faedde3e406 100644
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

[..snip..]

> @@ -1384,6 +1425,9 @@ int setup_profiling_timer(unsigned int multiplier)
> 
>  static void fixup_topology(void)
>  {
> +	if (!has_coregroup_support())
> +		powerpc_topology[mc_idx].mask = cpu_bigcore_mask;
> +
>  	if (shared_caches) {
>  		pr_info("Using shared cache scheduler topology\n");
>  		powerpc_topology[bigcore_idx].mask = shared_cache_mask;


Suppose we consider a topology which does not have coregroup_support,
but has shared_caches. In that case, we would want our coregroup
domain to degenerate.

From the above code, after the fixup, our topology will look as
follows:

static struct sched_domain_topology_level powerpc_topology[] = {
  	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
 	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
	{ cpu_bigcore_mask, SD_INIT_NAME(MC) },
  	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
  	{ NULL, },

So, in this case, the core-group domain (identified by MC) will
degenerate only if cpu_bigcore_mask() and shared_cache_mask() return
the same value. This may work for existing platforms, because either
shared_caches don't exist, or when they do, cpu_bigcore_mask and
shared_cache_mask return the same set of CPUs. But this may or may not
continue to hold good in the future.

Furthermore, if that is always going to be the case that in the
presence of shared_caches the cpu_bigcore_mask() and
shared_cache_mask() will always be the same, then why even define two
separate masks and not just have only the cpu_bigcore_mask() ?

The correct way would be to set the powerpc_topology[mc_idx].mask to
powerpc_topology[bigcore_idx].mask *after* we have fixedup the
big_core level.
--
Thanks and Regards
gautham.

