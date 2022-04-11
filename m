Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F3F4FB696
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 10:59:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcN7q4gXYz2yfZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 18:59:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kT6FdqCO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kT6FdqCO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcN750PrPz2xWg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 18:58:24 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23B7Bu06005959; 
 Mon, 11 Apr 2022 08:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : content-type : in-reply-to
 : mime-version; s=pp1; bh=Sh4ProLqdUO6KdTRPfLnIRtU0OE9sHmn3EZtxlgOFcE=;
 b=kT6FdqCOoVthObne5m9V2Fig41yg0mPQZLkMkeHnfPrSUmFwxyI1a/p9dkHztwxkas35
 QWrFdL8qF/HokaZFA1KBI3tP5FhJfPma30LVmZbBpzLWgvAleWN9RgHy1STXI4bC6kFf
 kXBxT3wk8RCQdrGRI4gnBohpRXVp1iGC5X//aM5o45vpJ4VhOrui8E7DgmSVFsVXYRLe
 KwZALeADbqTjqaIS3WaoRmCq+0W00XPlRvpncRb2S3cBINMhK4hgnl6fhKJBI59h2SbO
 K1LMYByPX6jp/NeamaPhAhvr3hpdpuXT7qaFsIZBENTHF6d/sQ+iFvzdBoKneDtG/Iui Pg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fcfqp1xdm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 08:58:14 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23B8w1kp000941;
 Mon, 11 Apr 2022 08:58:12 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3fb1s8j6eq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 08:58:12 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23B8jhNQ48300444
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 08:45:43 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFD69A404D;
 Mon, 11 Apr 2022 08:58:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A307A405E;
 Mon, 11 Apr 2022 08:58:08 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.40.195.195])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 11 Apr 2022 08:58:08 +0000 (GMT)
Date: Mon, 11 Apr 2022 14:28:08 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH] powerpc/numa: Associate numa node to its cpu earlier
Message-ID: <20220411085808.GH568950@linux.vnet.ibm.com>
References: <20220411074934.4632-1-osalvador@suse.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20220411074934.4632-1-osalvador@suse.de>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TJf2HUrhuhphRva9ryOG2drSScOn9aUG
X-Proofpoint-ORIG-GUID: TJf2HUrhuhphRva9ryOG2drSScOn9aUG
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-11_02,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204110045
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
Cc: linux-mm@kvack.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Michal Hocko <mhocko@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Oscar Salvador <osalvador@suse.de> [2022-04-11 09:49:34]:

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
> Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Tested-by: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
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

Given that my patch got accepted into powerpc tree
https://git.kernel.org/powerpc/c/e4ff77598a109bd36789ad5e80aba66fc53d0ffb
is now part of Linus tree, this line may need a slight tweak.

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
