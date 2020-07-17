Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 490C0223315
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 07:50:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7KwR0MXYzDqsJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 15:50:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7Kpt6Lk6zDrGn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 15:45:42 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06H5dcFY106874; Fri, 17 Jul 2020 01:45:33 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32b61jr46k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 01:45:33 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06H5drxT004555;
 Fri, 17 Jul 2020 05:45:32 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 32752a22tk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 05:45:32 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06H5jUZR47514050
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 05:45:30 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DB26124054;
 Fri, 17 Jul 2020 05:45:30 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3A77124052;
 Fri, 17 Jul 2020 05:45:29 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.61.65])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jul 2020 05:45:29 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 840492E3026; Fri, 17 Jul 2020 11:15:25 +0530 (IST)
Date: Fri, 17 Jul 2020 11:15:25 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 03/11] powerpc/smp: Move powerpc_topology above
Message-ID: <20200717054525.GC25851@in.ibm.com>
References: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
 <20200714043624.5648-4-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714043624.5648-4-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-17_03:2020-07-16,
 2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

On Tue, Jul 14, 2020 at 10:06:16AM +0530, Srikar Dronamraju wrote:
> Just moving the powerpc_topology description above.
> This will help in using functions in this file and avoid declarations.
> 
> No other functional changes
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

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

> ---
>  arch/powerpc/kernel/smp.c | 116 +++++++++++++++++++-------------------
>  1 file changed, 58 insertions(+), 58 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 069ea4b21c6d..24529f6134aa 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -818,6 +818,64 @@ static int init_cpu_l1_cache_map(int cpu)
>  	return err;
>  }
> 
> +static bool shared_caches;
> +
> +#ifdef CONFIG_SCHED_SMT
> +/* cpumask of CPUs with asymmetric SMT dependency */
> +static int powerpc_smt_flags(void)
> +{
> +	int flags = SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
> +
> +	if (cpu_has_feature(CPU_FTR_ASYM_SMT)) {
> +		printk_once(KERN_INFO "Enabling Asymmetric SMT scheduling\n");
> +		flags |= SD_ASYM_PACKING;
> +	}
> +	return flags;
> +}
> +#endif
> +
> +/*
> + * P9 has a slightly odd architecture where pairs of cores share an L2 cache.
> + * This topology makes it *much* cheaper to migrate tasks between adjacent cores
> + * since the migrated task remains cache hot. We want to take advantage of this
> + * at the scheduler level so an extra topology level is required.
> + */
> +static int powerpc_shared_cache_flags(void)
> +{
> +	return SD_SHARE_PKG_RESOURCES;
> +}
> +
> +/*
> + * We can't just pass cpu_l2_cache_mask() directly because
> + * returns a non-const pointer and the compiler barfs on that.
> + */
> +static const struct cpumask *shared_cache_mask(int cpu)
> +{
> +	if (shared_caches)
> +		return cpu_l2_cache_mask(cpu);
> +
> +	if (has_big_cores)
> +		return cpu_smallcore_mask(cpu);
> +
> +	return cpu_smt_mask(cpu);
> +}
> +
> +#ifdef CONFIG_SCHED_SMT
> +static const struct cpumask *smallcore_smt_mask(int cpu)
> +{
> +	return cpu_smallcore_mask(cpu);
> +}
> +#endif
> +
> +static struct sched_domain_topology_level powerpc_topology[] = {
> +#ifdef CONFIG_SCHED_SMT
> +	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
> +#endif
> +	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
> +	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
> +	{ NULL, },
> +};
> +
>  static int init_big_cores(void)
>  {
>  	int cpu;
> @@ -1249,8 +1307,6 @@ static void add_cpu_to_masks(int cpu)
>  			set_cpus_related(cpu, i, cpu_core_mask);
>  }
> 
> -static bool shared_caches;
> -
>  /* Activate a secondary processor. */
>  void start_secondary(void *unused)
>  {
> @@ -1314,62 +1370,6 @@ int setup_profiling_timer(unsigned int multiplier)
>  	return 0;
>  }
> 
> -#ifdef CONFIG_SCHED_SMT
> -/* cpumask of CPUs with asymmetric SMT dependency */
> -static int powerpc_smt_flags(void)
> -{
> -	int flags = SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
> -
> -	if (cpu_has_feature(CPU_FTR_ASYM_SMT)) {
> -		printk_once(KERN_INFO "Enabling Asymmetric SMT scheduling\n");
> -		flags |= SD_ASYM_PACKING;
> -	}
> -	return flags;
> -}
> -#endif
> -
> -/*
> - * P9 has a slightly odd architecture where pairs of cores share an L2 cache.
> - * This topology makes it *much* cheaper to migrate tasks between adjacent cores
> - * since the migrated task remains cache hot. We want to take advantage of this
> - * at the scheduler level so an extra topology level is required.
> - */
> -static int powerpc_shared_cache_flags(void)
> -{
> -	return SD_SHARE_PKG_RESOURCES;
> -}
> -
> -/*
> - * We can't just pass cpu_l2_cache_mask() directly because
> - * returns a non-const pointer and the compiler barfs on that.
> - */
> -static const struct cpumask *shared_cache_mask(int cpu)
> -{
> -	if (shared_caches)
> -		return cpu_l2_cache_mask(cpu);
> -
> -	if (has_big_cores)
> -		return cpu_smallcore_mask(cpu);
> -
> -	return cpu_smt_mask(cpu);
> -}
> -
> -#ifdef CONFIG_SCHED_SMT
> -static const struct cpumask *smallcore_smt_mask(int cpu)
> -{
> -	return cpu_smallcore_mask(cpu);
> -}
> -#endif
> -
> -static struct sched_domain_topology_level powerpc_topology[] = {
> -#ifdef CONFIG_SCHED_SMT
> -	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
> -#endif
> -	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
> -	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
> -	{ NULL, },
> -};
> -
>  void __init smp_cpus_done(unsigned int max_cpus)
>  {
>  	/*
> -- 
> 2.17.1
> 
