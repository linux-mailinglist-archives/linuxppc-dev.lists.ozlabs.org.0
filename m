Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD192259C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 10:12:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9DxL0NHxzDqdV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 18:12:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9DvG239TzDqQY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 18:11:05 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06K82g93122134; Mon, 20 Jul 2020 04:11:01 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32bw8yus5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 04:11:00 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06K8Ax5h017113;
 Mon, 20 Jul 2020 08:10:59 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 32brq7jdx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 08:10:59 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06K8AsQe57082012
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 08:10:54 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8381CAE051;
 Mon, 20 Jul 2020 08:10:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7FE7AE05F;
 Mon, 20 Jul 2020 08:10:52 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 20 Jul 2020 08:10:52 +0000 (GMT)
Date: Mon, 20 Jul 2020 13:40:52 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 02/11] powerpc/smp: Merge Power9 topology with Power
 topology
Message-ID: <20200720081052.GF21103@linux.vnet.ibm.com>
References: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
 <20200714043624.5648-3-srikar@linux.vnet.ibm.com>
 <20200717054436.GB25851@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200717054436.GB25851@in.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_04:2020-07-17,
 2020-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007200056
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

* Gautham R Shenoy <ego@linux.vnet.ibm.com> [2020-07-17 11:14:36]:

> Hi Srikar,
> 
> On Tue, Jul 14, 2020 at 10:06:15AM +0530, Srikar Dronamraju wrote:
> > A new sched_domain_topology_level was added just for Power9. However the
> > same can be achieved by merging powerpc_topology with power9_topology
> > and makes the code more simpler especially when adding a new sched
> > domain.
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
> >  arch/powerpc/kernel/smp.c | 33 ++++++++++-----------------------
> >  1 file changed, 10 insertions(+), 23 deletions(-)
> > 
> > diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> > index 680c0edcc59d..069ea4b21c6d 100644
> > --- a/arch/powerpc/kernel/smp.c
> > +++ b/arch/powerpc/kernel/smp.c
> > @@ -1315,7 +1315,7 @@ int setup_profiling_timer(unsigned int multiplier)
> >  }
> > 
> >  #ifdef CONFIG_SCHED_SMT
> > -/* cpumask of CPUs with asymetric SMT dependancy */
> > +/* cpumask of CPUs with asymmetric SMT dependency */
> >  static int powerpc_smt_flags(void)
> >  {
> >  	int flags = SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
> > @@ -1328,14 +1328,6 @@ static int powerpc_smt_flags(void)
> >  }
> >  #endif
> > 
> > -static struct sched_domain_topology_level powerpc_topology[] = {
> > -#ifdef CONFIG_SCHED_SMT
> > -	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
> > -#endif
> > -	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
> > -	{ NULL, },
> > -};
> > -
> >  /*
> >   * P9 has a slightly odd architecture where pairs of cores share an L2 cache.
> >   * This topology makes it *much* cheaper to migrate tasks between adjacent cores
> > @@ -1353,7 +1345,13 @@ static int powerpc_shared_cache_flags(void)
> >   */
> >  static const struct cpumask *shared_cache_mask(int cpu)
> >  {
> > -	return cpu_l2_cache_mask(cpu);
> > +	if (shared_caches)
> > +		return cpu_l2_cache_mask(cpu);
> > +
> > +	if (has_big_cores)
> > +		return cpu_smallcore_mask(cpu);
> > +
> > +	return cpu_smt_mask(cpu);
> >  }
> > 
> >  #ifdef CONFIG_SCHED_SMT
> > @@ -1363,7 +1361,7 @@ static const struct cpumask *smallcore_smt_mask(int cpu)
> >  }
> >  #endif
> > 
> > -static struct sched_domain_topology_level power9_topology[] = {
> > +static struct sched_domain_topology_level powerpc_topology[] = {
> 
> 
> >  #ifdef CONFIG_SCHED_SMT
> >  	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
> >  #endif
> > @@ -1388,21 +1386,10 @@ void __init smp_cpus_done(unsigned int max_cpus)
> >  #ifdef CONFIG_SCHED_SMT
> >  	if (has_big_cores) {
> >  		pr_info("Big cores detected but using small core scheduling\n");
> I> -		power9_topology[0].mask = smallcore_smt_mask;
> >  		powerpc_topology[0].mask = smallcore_smt_mask;
> >  	}
> >  #endif
> > -	/*
> > -	 * If any CPU detects that it's sharing a cache with another CPU then
> > -	 * use the deeper topology that is aware of this sharing.
> > -	 */
> > -	if (shared_caches) {
> > -		pr_info("Using shared cache scheduler topology\n");
> > -		set_sched_topology(power9_topology);
> > -	} else {
> > -		pr_info("Using standard scheduler topology\n");
> > -		set_sched_topology(powerpc_topology);
> 
> 
> Ok, so we will go with the three level topology by default (SMT,
> CACHE, DIE) and will rely on the sched-domain creation code to
> degenerate CACHE domain in case SMT and CACHE have the same set of
> CPUs (POWER8 for eg).
> 

Right.

> From a cleanup perspective this is better, since we won't have to
> worry about defining multiple topology structures, but from a
> performance point of view, wouldn't we now pay an extra penalty of
> degenerating the CACHE domains on POWER8 kind of systems, each time
> when a CPU comes online ?
> 

So if we end up either adding a topology definition for each of the new
topologies we support or we have to take the extra penalty.

But going ahead

> Do we know how bad it is ? If the degeneration takes a few extra
> microseconds, that should be ok I suppose.
> 

It certainly will add to the penalty, I haven't captured per degeneration
statistics. However I ran an experiment where I run ppc64_cpu --smt=8 ,
followed by ppc64_cpu --smt=1 in a loop of 100 iterations.

On a Power8 System with 256 cpus 8 nodes.

Architecture:        ppc64le
Byte Order:          Little Endian
CPU(s):              256
On-line CPU(s) list: 0-255
Thread(s) per core:  8
Core(s) per socket:  4
Socket(s):           8
NUMA node(s):        8
Model:               2.1 (pvr 004b 0201)
Model name:          POWER8 (architected), altivec supported
Hypervisor vendor:   pHyp
Virtualization type: para
L1d cache:           64K
L1i cache:           32K
L2 cache:            512K
L3 cache:            8192K
NUMA node0 CPU(s):   0-31
NUMA node1 CPU(s):   32-63
NUMA node2 CPU(s):   64-95
NUMA node3 CPU(s):   96-127
NUMA node4 CPU(s):   128-159
NUMA node5 CPU(s):   160-191
NUMA node6 CPU(s):   192-223
NUMA node7 CPU(s):   224-255

ppc64_cpu --smt=1
    N           Min           Max        Median           Avg        Stddev
x 100         38.17         53.78         46.81       46.6766     2.8421603

x 100         41.34         58.24         48.35       47.9649     3.6866087

ppc64_cpu --smt=8
    N           Min           Max        Median           Avg        Stddev
x 100         57.43         75.88         60.61       61.0246      2.418685

x 100         58.21         79.24         62.59       63.3326     3.4094558

But once we cleanup, we could add ways to fixup topologies so that we
reverse the overhead.

-- 
Thanks and Regards
Srikar Dronamraju
