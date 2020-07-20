Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 202EE225784
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 08:22:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9BTP40VDzDqNB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 16:22:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9BQP0v0NzDqHj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 16:19:24 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06K63lVX110603; Mon, 20 Jul 2020 02:19:20 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32bwk6rd28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 02:19:20 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06K6EaBk009157;
 Mon, 20 Jul 2020 06:19:18 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 32brq828vy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 06:19:18 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06K6JDdS2884092
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 06:19:13 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9015342045;
 Mon, 20 Jul 2020 06:19:13 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2CCE4203F;
 Mon, 20 Jul 2020 06:19:11 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 20 Jul 2020 06:19:11 +0000 (GMT)
Date: Mon, 20 Jul 2020 11:49:11 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 06/11] powerpc/smp: Generalize 2nd sched domain
Message-ID: <20200720061911.GC21103@linux.vnet.ibm.com>
References: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
 <20200714043624.5648-7-srikar@linux.vnet.ibm.com>
 <20200717063755.GA32531@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200717063755.GA32531@in.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_01:2020-07-17,
 2020-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 bulkscore=0 adultscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007200045
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Michael Ellerman <michaele@au1.ibm.com>, Anton Blanchard <anton@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nick Piggin <npiggin@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Gautham R Shenoy <ego@linux.vnet.ibm.com> [2020-07-17 12:07:55]:

> On Tue, Jul 14, 2020 at 10:06:19AM +0530, Srikar Dronamraju wrote:
> > Currently "CACHE" domain happens to be the 2nd sched domain as per
> > powerpc_topology. This domain will collapse if cpumask of l2-cache is
> > same as SMT domain. However we could generalize this domain such that it
> > could mean either be a "CACHE" domain or a "BIGCORE" domain.
> > 
> > While setting up the "CACHE" domain, check if shared_cache is already
> > set.
> > 
> > Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
> > Cc: Michael Ellerman <michaele@au1.ibm.com>
> > Cc: Nick Piggin <npiggin@au1.ibm.com>
> > Cc: Oliver OHalloran <oliveroh@au1.ibm.com>
> > Cc: Nathan Lynch <nathanl@linux.ibm.com>
> > Cc: Michael Neuling <mikey@linux.ibm.com>
> > Cc: Anton Blanchard <anton@au1.ibm.com>
> > Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> > Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
> > Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> > ---
> > @@ -867,11 +869,16 @@ static const struct cpumask *smallcore_smt_mask(int cpu)
> >  }
> >  #endif
> > 
> > +static const struct cpumask *cpu_bigcore_mask(int cpu)
> > +{
> > +	return cpu_core_mask(cpu);
> 
> It should be cpu_smt_mask() if we want the redundant big-core to be
> degenerated in favour of the SMT level on P8, no? Because
> cpu_core_mask refers to all the CPUs that are in the same chip.
> 

Right, but it cant be cpu_smt_mask since cpu_smt_mask is only enabled in
CONFIG_SCHED_SMT. I was looking at using sibling_map, but we have to careful
for power9 / PowerNV mode. Guess that should be fine.

> > +}
> > +
> >  static struct sched_domain_topology_level powerpc_topology[] = {
> >  #ifdef CONFIG_SCHED_SMT
> >  	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
> >  #endif
> > -	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
> > +	{ cpu_bigcore_mask, SD_INIT_NAME(BIGCORE) },
> >  	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
> >  	{ NULL, },
> >  };
> > @@ -1319,7 +1326,6 @@ static void add_cpu_to_masks(int cpu)
> >  void start_secondary(void *unused)
> >  {
> >  	unsigned int cpu = smp_processor_id();
> > -	struct cpumask *(*sibling_mask)(int) = cpu_sibling_mask;
> > 
> >  	mmgrab(&init_mm);
> >  	current->active_mm = &init_mm;
> > @@ -1345,14 +1351,20 @@ void start_secondary(void *unused)
> >  	/* Update topology CPU masks */
> >  	add_cpu_to_masks(cpu);
> > 
> > -	if (has_big_cores)
> > -		sibling_mask = cpu_smallcore_mask;
> >  	/*
> >  	 * Check for any shared caches. Note that this must be done on a
> >  	 * per-core basis because one core in the pair might be disabled.
> >  	 */
> > -	if (!cpumask_equal(cpu_l2_cache_mask(cpu), sibling_mask(cpu)))
> > -		shared_caches = true;
> > +	if (!shared_caches) {
> > +		struct cpumask *(*sibling_mask)(int) = cpu_sibling_mask;
> > +		struct cpumask *mask = cpu_l2_cache_mask(cpu);
> > +
> > +		if (has_big_cores)
> > +			sibling_mask = cpu_smallcore_mask;
> > +
> > +		if (cpumask_weight(mask) > cpumask_weight(sibling_mask(cpu)))
> > +			shared_caches = true;
> 
> Shouldn't we use cpumask_subset() here ?

Wouldn't cpumask_subset should return 1 if both are same?
We dont want to have shared_caches set if both the masks are equal. 

>   			
> > +	}
> > 
> >  	set_numa_node(numa_cpu_lookup_table[cpu]);
> >  	set_numa_mem(local_memory_node(numa_cpu_lookup_table[cpu]));
> > @@ -1390,6 +1402,14 @@ void __init smp_cpus_done(unsigned int max_cpus)
> >  		smp_ops->bringup_done();
> > 
> >  	dump_numa_cpu_topology();
> > +	if (shared_caches) {
> > +		pr_info("Using shared cache scheduler topology\n");
> > +		powerpc_topology[bigcore_idx].mask = shared_cache_mask;
> > +#ifdef CONFIG_SCHED_DEBUG
> > +		powerpc_topology[bigcore_idx].name = "CACHE";
> > +#endif
> > +		powerpc_topology[bigcore_idx].sd_flags = powerpc_shared_cache_flags;
> > +	}
> 
> 
> I would much rather that we have all the topology-fixups done in one
> function.
> 
> fixup_topology(void) {
>      if (has_big_core)
>         powerpc_topology[smt_idx].mask = smallcore_smt_mask;
> 
>     if (shared_caches) {
>        const char *name = "CACHE";
>        powerpc_topology[bigcore_idx].mask = shared_cache_mask;
>        strlcpy(powerpc_topology[bigcore_idx].name, name,
>        				strlen(name));
>        powerpc_topology[bigcore_idx].sd_flags = powerpc_shared_cache_flags;
>     }
> 
>     /* Any other changes to the topology structure here */

We could do this.

> 
> And also as an optimization, get rid of degenerate structures here
> itself so that we don't pay additional penalty while building the
> sched-domains each time.
> 

Yes this is definitely in plan, but slightly later in time.

Thanks for the review and comments.

-- 
Thanks and Regards
Srikar Dronamraju
