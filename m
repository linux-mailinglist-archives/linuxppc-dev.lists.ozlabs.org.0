Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1843D4F95A7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 14:26:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZctj0Hdnz3bbn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 22:26:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HgBEsa6s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HgBEsa6s; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZcsw0hN8z2xgJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 22:25:54 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2389Dkd6030920; 
 Fri, 8 Apr 2022 12:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=8+dQLvwd1bGaCWREWy5GVy+CqU8oP390+lVLIVoFTQw=;
 b=HgBEsa6sRvDSrr5Y2BoZUhppiqc8A2RWGWAdDvgmZvCS/gLGo3DpvJksc9R1aRtyS67F
 f4uPt6adBgwE2aD/5Jd3+bmRfP1Yw27ooD4GoljMPffm3VMKUfUbMBzYtcpHyIMxIehM
 h/o+vQirEdcCWl/0AkAw5umA0FR5K6Ffu+wzWwgkkk3IS6lXbqQpAwC66MD6oijJYn2V
 sC1+s85t54XgyldD/46lFHvLpT4dzUdD8wd6ggq+UwfIgvpcftubE2Uj7OR4bm25pXO+
 NyxqvEEJUayfo64e9s3zCnqCS6CnfbxLgcoD/+ysyACGOU9Cg6jYlL50L8QUGFcXmuuf AA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fad2gs3ty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 12:25:43 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 238CDbjO022675;
 Fri, 8 Apr 2022 12:25:41 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3f6e493rxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 12:25:41 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 238CPdoq43909562
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Apr 2022 12:25:39 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CC6852050;
 Fri,  8 Apr 2022 12:25:39 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.40.195.195])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id DEBDB5204E;
 Fri,  8 Apr 2022 12:25:37 +0000 (GMT)
Date: Fri, 8 Apr 2022 17:55:37 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH] powerpc/numa: Handle partially initialized numa nodes
Message-ID: <20220408122537.GD568950@linux.vnet.ibm.com>
References: <20220330135123.1868197-1-srikar@linux.vnet.ibm.com>
 <Yk29dMa3H8bk0yST@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <Yk29dMa3H8bk0yST@localhost.localdomain>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3tQ-Xa00FGMTzel42n_o_zAoS_uhTegc
X-Proofpoint-GUID: 3tQ-Xa00FGMTzel42n_o_zAoS_uhTegc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_04,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204080062
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
Cc: Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>, linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Oscar Salvador <osalvador@suse.de> [2022-04-06 18:19:00]:

> On Wed, Mar 30, 2022 at 07:21:23PM +0530, Srikar Dronamraju wrote:
> >  arch/powerpc/mm/numa.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> > index b9b7fefbb64b..13022d734951 100644
> > --- a/arch/powerpc/mm/numa.c
> > +++ b/arch/powerpc/mm/numa.c
> > @@ -1436,7 +1436,7 @@ int find_and_online_cpu_nid(int cpu)
> >  	if (new_nid < 0 || !node_possible(new_nid))
> >  		new_nid = first_online_node;
> >  
> > -	if (NODE_DATA(new_nid) == NULL) {
> > +	if (!node_online(new_nid)) {
> >  #ifdef CONFIG_MEMORY_HOTPLUG
> >  		/*
> >  		 * Need to ensure that NODE_DATA is initialized for a node from
> 
> Because of this fix, I wanted to check whether we might have any more fallouts due
> to ("mm: handle uninitialized numa nodes gracefully"), and it made me look closer
> as to why powerpc is the only platform that special cases try_online_node(),
> while all others rely on cpu_up()->try_online_node() to do the right thing.
> 
> So, I had a look.
> Let us rewind a bit:
> 
> The commit that sets find_and_online_cpu_nid() in dlpar_online_cpu was
> e67e02a544e9 ("powerpc/pseries: Fix cpu hotplug crash with memoryless nodes").
> 
> In there, it says that we have the following picture:
> 
> partition_sched_domains
>  arch_update_cpu_topology
>   numa_update_cpu_topology
>    find_and_online_cpu_nid
> 
> and by the time find_and_online_cpu_nid() gets called to online the node, it might be
> too late as we might have referenced some NODE_DATA() fields.
> Note that this happens at a much later stage in cpuhp.
> 
> Also note that at a much earlier stage, we do already have a try_online_node() in cpu_up(),
> which should allocate-and-online the node and prevent accessing garbage.
> But the problem is that, on powerpc, all possible cpus have the same node set at boot stage
> (see arch/powerpc/mm/numa.c:mem_topology_setup),
> so cpu_to_node() returns the same thing until it the mapping gets update (which happens in
> start_secondary()->set_numa_node()), and so, the try_online_node() from cpu_up() does not
> apply on the right node, because it still holds the not-up-to-date mapping node <-> cpu.
> 
> (e.g: in my test case, when onlining a CPU belongin to node1, cpu_up()->try_online_node()
>  tries to online node0, or whatever old mapping numa<->cpu is there).
> 
> So, we have something like:
> 
> dlpar_online_cpu
>  device_online
>   dev->bus->online
>    cpu_subsys_online
>     cpu_device_up
>      cpu_up
>       try_online_node (old mapping nid <-> cpu )
>       ...
>       ...
>       cphp_callbacks
>        sched_cpu_activate
>         cpuset_update_active_cpus
>          schedule_work(&cpuset_hotplug_work)
>           cpuset_hotplug_work
>            partition_sched_domains
>             arch_update_cpu_topology
>              numa_update_cpu_topology
>               find_and_online_cpu_nid (online new_nid)
> 
> 
> So, yeah, the real onlining in numa_update_cpu_topology()->find_and_online_cpu_nid()
> happens too late, that is why adding find_and_online_cpu_nid() back in dlpar_online_cpu()
> fixed the issue, but we should not need this special casing at all.
> 
> We do already know the numa<->cpu associativity in
> dlpar_online_cpu()->find_and_online_cpu_nid(), so we should just be able to
> update the numa<->cpu mapping, and let the try_online_node() do the right thing.
> 
> With this in mind, I came up with the following patch, where I carried out a battery
> of tests for CPU hotplug stuff and it worked as expected.
> But I am not familiar with all powerpc pitfalls, e.g: dedicated vs shared cpus etc, so
> I would like to hear from more familiar people.
> 
> The patch is:
> 
> From: Oscar Salvador <osalvador@suse.de>
> Date: Wed, 6 Apr 2022 14:39:15 +0200
> Subject: [PATCH] powerpc/numa: Associate numa node to its cpu earlier
> 
> powerpc is the only platform that do not rely on
> cpu_up()->try_online_node() to bring up a numa node,
> and special cases it, instead, deep in its own machinery:
> 
> dlpar_online_cpu
>  find_and_online_cpu_nid
>   try_online_node
> 
> This should not be needed, but the thing is that the try_online_node()
> from cpu_up() will not apply on the right node, because cpu_to_node()
> will return the old mapping numa<->cpu that gets set on boot stage
> for all possible cpus.
> 
> That can be seen easily if we try to print out the numa node passed
> to try_online_node() in cpu_up().
> 
> The thing is that the numa<->cpu mapping does not get updated till a much
> later stage in start_secondary:
> 
> start_secondary:
>  set_numa_node(numa_cpu_lookup_table[cpu])
> 
> But we do not really care, as we already now the
> CPU <-> NUMA associativity back in find_and_online_cpu_nid(),
> so let us make use of that and set the proper numa<->cpu mapping,
> so cpu_to_node() in cpu_up() returns the right node and
> try_online_node() can do its work.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>

Looks good to me.

Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>


> ---
>  arch/powerpc/include/asm/topology.h          |  8 ++-----
>  arch/powerpc/mm/numa.c                       | 31 +++++++---------------------
>  arch/powerpc/platforms/pseries/hotplug-cpu.c |  2 +-
>  3 files changed, 11 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index 36fcafb1fd6d..6ae1b2dce83e 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -111,14 +111,10 @@ static inline void unmap_cpu_from_node(unsigned long cpu) {}
>  #endif /* CONFIG_NUMA */
> 
>  #if defined(CONFIG_NUMA) && defined(CONFIG_PPC_SPLPAR)
> -extern int find_and_online_cpu_nid(int cpu);
> +extern void find_and_update_cpu_nid(int cpu);
>  extern int cpu_to_coregroup_id(int cpu);
>  #else
> -static inline int find_and_online_cpu_nid(int cpu)
> -{
> -	return 0;
> -}
> -
> +static inline void find_and_update_cpu_nid(int cpu) {}
>  static inline int cpu_to_coregroup_id(int cpu)
>  {
>  #ifdef CONFIG_SMP
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index b9b7fefbb64b..b5bc8b1a833d 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -1423,43 +1423,28 @@ static long vphn_get_associativity(unsigned long cpu,
>  	return rc;
>  }
> 
> -int find_and_online_cpu_nid(int cpu)
> +void find_and_update_cpu_nid(int cpu)
>  {
>  	__be32 associativity[VPHN_ASSOC_BUFSIZE] = {0};
>  	int new_nid;
> 
>  	/* Use associativity from first thread for all siblings */
>  	if (vphn_get_associativity(cpu, associativity))
> -		return cpu_to_node(cpu);
> +		return;
> 
> +	/* Do not have previous associativity, so find it now. */
>  	new_nid = associativity_to_nid(associativity);
> +
>  	if (new_nid < 0 || !node_possible(new_nid))
>  		new_nid = first_online_node;
> -
> -	if (NODE_DATA(new_nid) == NULL) {
> -#ifdef CONFIG_MEMORY_HOTPLUG
> -		/*
> -		 * Need to ensure that NODE_DATA is initialized for a node from
> -		 * available memory (see memblock_alloc_try_nid). If unable to
> -		 * init the node, then default to nearest node that has memory
> -		 * installed. Skip onlining a node if the subsystems are not
> -		 * yet initialized.
> -		 */
> -		if (!topology_inited || try_online_node(new_nid))
> -			new_nid = first_online_node;
> -#else
> -		/*
> -		 * Default to using the nearest node that has memory installed.
> -		 * Otherwise, it would be necessary to patch the kernel MM code
> -		 * to deal with more memoryless-node error conditions.
> +	else
> +		/* Associate node <-> cpu, so cpu_up() calls
> +		 * try_online_node() on the right node.
>  		 */
> -		new_nid = first_online_node;
> -#endif
> -	}
> +		set_cpu_numa_node(cpu, new_nid);
> 
>  	pr_debug("%s:%d cpu %d nid %d\n", __FUNCTION__, __LINE__,
>  		cpu, new_nid);
> -	return new_nid;
>  }
> 
>  int cpu_to_coregroup_id(int cpu)
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index b81fc846d99c..0f8cd8b06432 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -398,7 +398,7 @@ static int dlpar_online_cpu(struct device_node *dn)
>  			if (get_hard_smp_processor_id(cpu) != thread)
>  				continue;
>  			cpu_maps_update_done();
> -			find_and_online_cpu_nid(cpu);
> +			find_and_update_cpu_nid(cpu);
>  			rc = device_online(get_cpu_device(cpu));
>  			if (rc) {
>  				dlpar_offline_cpu(dn);
> --
> 2.16.4
> 
> -- 
> Oscar Salvador
> SUSE Labs
