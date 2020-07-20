Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E0922574E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 08:05:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9B6d628CzDqMN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 16:05:45 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9B4x06kgzDqSF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 16:04:16 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06K646Ej061986; Mon, 20 Jul 2020 02:04:12 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32bwmkg3uf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 02:04:11 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06K60AR4003914;
 Mon, 20 Jul 2020 06:02:54 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 32brq7t98h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 06:02:54 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06K62o8B63897906
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 06:02:50 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB8F4A4053;
 Mon, 20 Jul 2020 06:02:49 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1230CA4040;
 Mon, 20 Jul 2020 06:02:48 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 20 Jul 2020 06:02:47 +0000 (GMT)
Date: Mon, 20 Jul 2020 11:32:47 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 09/11] Powerpc/smp: Create coregroup domain
Message-ID: <20200720060247.GB21103@linux.vnet.ibm.com>
References: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
 <20200714043624.5648-10-srikar@linux.vnet.ibm.com>
 <20200717081926.GD32531@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200717081926.GD32531@in.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_01:2020-07-17,
 2020-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

* Gautham R Shenoy <ego@linux.vnet.ibm.com> [2020-07-17 13:49:26]:

> On Tue, Jul 14, 2020 at 10:06:22AM +0530, Srikar Dronamraju wrote:
> > Add percpu coregroup maps and masks to create coregroup domain.
> > If a coregroup doesn't exist, the coregroup domain will be degenerated
> > in favour of SMT/CACHE domain.
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
> >  arch/powerpc/include/asm/topology.h | 10 ++++++++
> >  arch/powerpc/kernel/smp.c           | 37 +++++++++++++++++++++++++++++
> >  arch/powerpc/mm/numa.c              |  5 ++++
> >  3 files changed, 52 insertions(+)
> > 
> > @@ -950,6 +972,11 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
> >  	cpumask_set_cpu(boot_cpuid, cpu_l2_cache_mask(boot_cpuid));
> >  	cpumask_set_cpu(boot_cpuid, cpu_core_mask(boot_cpuid));
> > 
> > +	if (has_coregroup_support())
> > +		cpumask_set_cpu(boot_cpuid, cpu_coregroup_mask(boot_cpuid));
> > +	else
> > +		powerpc_topology[mc_idx].mask = cpu_bigcore_mask;
> > +
> 
> The else part could be moved to the common function where we are
> modifying the other attributes of the topology array.
> 

My intent is to make all the changes to the topology attributes in
smp_prepare_cpus. It makes more sense to change the attributes immediately
after we define / detect a particular topology change.

The only thing that is left out currently is shared_cache,
We should be able to detect shared_cache also around this time. Just that it
needs more cleanups. Once we do update the topology attributes even for
shared_cache here itself. 

> >  	init_big_cores();
> >  	if (has_big_cores) {
> >  		cpumask_set_cpu(boot_cpuid,
> > @@ -1241,6 +1268,8 @@ static void remove_cpu_from_masks(int cpu)
> >  		set_cpus_unrelated(cpu, i, cpu_sibling_mask);
> >  		if (has_big_cores)
> >  			set_cpus_unrelated(cpu, i, cpu_smallcore_mask);
> > +		if (has_coregroup_support())
> > +			set_cpus_unrelated(cpu, i, cpu_coregroup_mask);
> >  	}
> >  }
> >  #endif
> > @@ -1301,6 +1330,14 @@ static void add_cpu_to_masks(int cpu)
> >  	add_cpu_to_smallcore_masks(cpu);
> >  	update_mask_by_l2(cpu, cpu_l2_cache_mask);
> > 
> > +	if (has_coregroup_support()) {
> > +		cpumask_set_cpu(cpu, cpu_coregroup_mask(cpu));
> > +		for_each_cpu(i, cpu_online_mask) {
> > +			if (cpu_to_coregroup_id(cpu) == cpu_to_coregroup_id(i))
> > +				set_cpus_related(cpu, i, cpu_coregroup_mask);
> > +		}
> > +	}
> > +
> >  	if (pkg_id == -1) {
> >  		struct cpumask *(*mask)(int) = cpu_sibling_mask;
> > 
> > diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> > index a43eab455be4..d9ab9da85eab 100644
> > --- a/arch/powerpc/mm/numa.c
> > +++ b/arch/powerpc/mm/numa.c
> > @@ -1695,6 +1695,11 @@ static const struct proc_ops topology_proc_ops = {
> >  	.proc_release	= single_release,
> >  };
> > 
> > +int cpu_to_coregroup_id(int cpu)
> > +{
> > +	return cpu_to_core_id(cpu);
> > +}
> 
> 
> So, if has_coregroup_support() returns true, then since the core_group
> identification is currently done through the core-id, the
> coregroup_mask is going to be the same as the
> cpu_core_mask/cpu_cpu_mask. Thus, we will be degenerating the DIE
> domain. Right ? Instead we could have kept the core-group to be a
> single bigcore by default, so that those domains can get degenerated
> preserving the legacy SMT, DIE, NUMA hierarchy.
> 
> 

I think you have confused between cpu_core_mask and cpu_to_core_id.
cpu_to_core_id() returns a unique id for every SMT8 thread group.
If coregroup_support is true and the system doesn't support coregroup, then
We would not be degenerating the DIE but degenerating new MC domain only.
This is because the MC domain and the previous domain (SHARED_CACHE/BIGCORE/ 
SMT) would match the MC domain.

-- 
Thanks and Regards
Srikar Dronamraju
