Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CE63CD045
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 11:13:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GSx3V0XBJz3bTL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 19:13:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jYgac5mS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jYgac5mS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GSx314rtvz2yMg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jul 2021 19:13:17 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J93CZC016660; Mon, 19 Jul 2021 05:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=B7aayJ/EZJm+/twI+gZ8WtaZYHDvNpoK35UM7JsYGW4=;
 b=jYgac5mSNaj06O3Su8rTTiII1rDv/v9/lq916YGutf35ZnGMs553h2XkDilwklCaSFC+
 z9W/6bzU2zgng6ESoWr9kIx5s6FeznSuPcIcaSj3Wk9e6HDsRvvc2FxCMjsJxz8V/BE2
 LT7lSiApoDQqtcrhWsaB4vN+UHanEvJXi6e1p7PBT1xCH/X9GcVSZlYJRa/78tPxjQCE
 mJ76g3vF1A6WiC84QC0BQWoka7xDNDonqaxFv4eQ+GTBM8hBDSpM7AMNazZUhyKHMmAt
 ByiQxOHu9pq2G48c6HrSm83FD60OeH51Ujfhyrow4gmQav7wujaQrSAle40nF6rVbThC fA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39w5hr1x60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 05:13:12 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16J9D2Tc031982;
 Mon, 19 Jul 2021 09:13:10 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 39upu88mfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 09:13:09 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16J9D7Gg26214688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 09:13:07 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39A0CAE059;
 Mon, 19 Jul 2021 09:13:07 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5ECFAE045;
 Mon, 19 Jul 2021 09:13:06 +0000 (GMT)
Received: from pomme.local (unknown [9.145.1.33])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 19 Jul 2021 09:13:06 +0000 (GMT)
Subject: Re: [PATCH v5] pseries: prevent free CPU ids to be reused on another
 node
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org
References: <20210429174908.16613-1-ldufour@linux.ibm.com>
Message-ID: <f2d7a3f4-6d3f-b06b-2b66-9fa988c92998@linux.ibm.com>
Date: Mon, 19 Jul 2021 11:13:04 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210429174908.16613-1-ldufour@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lnjOtmXweAQV8cMon31Bcafo0u5f8OHy
X-Proofpoint-ORIG-GUID: lnjOtmXweAQV8cMon31Bcafo0u5f8OHy
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_02:2021-07-16,
 2021-07-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 malwarescore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190050
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

Is there a way to get that patch in 5.14?

Thanks,
Laurent.

Le 29/04/2021 à 19:49, Laurent Dufour a écrit :
> When a CPU is hot added, the CPU ids are taken from the available mask from
> the lower possible set. If that set of values was previously used for CPU
> attached to a different node, this seems to application like if these CPUs
> have migrated from a node to another one which is not expected in real
> life.
> 
> To prevent this, it is needed to record the CPU ids used for each node and
> to not reuse them on another node. However, to prevent CPU hot plug to
> fail, in the case the CPU ids is starved on a node, the capability to reuse
> other nodes’ free CPU ids is kept. A warning is displayed in such a case
> to warn the user.
> 
> A new CPU bit mask (node_recorded_ids_map) is introduced for each possible
> node. It is populated with the CPU onlined at boot time, and then when a
> CPU is hot plug to a node. The bits in that mask remain when the CPU is hot
> unplugged, to remind this CPU ids have been used for this node.
> 
> If no id set was found, a retry is made without removing the ids used on
> the other nodes to try reusing them. This is the way ids have been
> allocated prior to this patch.
> 
> The effect of this patch can be seen by removing and adding CPUs using the
> Qemu monitor. In the following case, the first CPU from the node 2 is
> removed, then the first one from the node 1 is removed too. Later, the
> first CPU of the node 2 is added back. Without that patch, the kernel will
> numbered these CPUs using the first CPU ids available which are the ones
> freed when removing the second CPU of the node 0. This leads to the CPU ids
> 16-23 to move from the node 1 to the node 2. With the patch applied, the
> CPU ids 32-39 are used since they are the lowest free ones which have not
> been used on another node.
> 
> At boot time:
> [root@vm40 ~]# numactl -H | grep cpus
> node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
> node 1 cpus: 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
> node 2 cpus: 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47
> 
> Vanilla kernel, after the CPU hot unplug/plug operations:
> [root@vm40 ~]# numactl -H | grep cpus
> node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
> node 1 cpus: 24 25 26 27 28 29 30 31
> node 2 cpus: 16 17 18 19 20 21 22 23 40 41 42 43 44 45 46 47
> 
> Patched kernel, after the CPU hot unplug/plug operations:
> [root@vm40 ~]# numactl -H | grep cpus
> node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
> node 1 cpus: 24 25 26 27 28 29 30 31
> node 2 cpus: 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47
> 
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
> V5:
>   - Rework code structure
>   - Reintroduce the capability to reuse other node's ids.
> V4: addressing Nathan's comment
>   - Rename the local variable named 'nid' into 'assigned_node'
> V3: addressing Nathan's comments
>   - Remove the retry feature
>   - Reduce the number of local variables (removing 'i')
>   - Add comment about the cpu_add_remove_lock protecting the added CPU mask.
>   V2: (no functional changes)
>   - update the test's output in the commit's description
>   - node_recorded_ids_map should be static
> ---
>   arch/powerpc/platforms/pseries/hotplug-cpu.c | 171 ++++++++++++++-----
>   1 file changed, 132 insertions(+), 39 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index 7e970f81d8ff..e1f224320102 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -39,6 +39,12 @@
>   /* This version can't take the spinlock, because it never returns */
>   static int rtas_stop_self_token = RTAS_UNKNOWN_SERVICE;
>   
> +/*
> + * Record the CPU ids used on each nodes.
> + * Protected by cpu_add_remove_lock.
> + */
> +static cpumask_var_t node_recorded_ids_map[MAX_NUMNODES];
> +
>   static void rtas_stop_self(void)
>   {
>   	static struct rtas_args args;
> @@ -139,72 +145,148 @@ static void pseries_cpu_die(unsigned int cpu)
>   	paca_ptrs[cpu]->cpu_start = 0;
>   }
>   
> +/**
> + * find_cpu_id_range - found a linear ranger of @nthreads free CPU ids.
> + * @nthreads : the number of threads (cpu ids)
> + * @assigned_node : the node it belongs to or NUMA_NO_NODE if free ids from any
> + *                  node can be peek.
> + * @cpu_mask: the returned CPU mask.
> + *
> + * Returns 0 on success.
> + */
> +static int find_cpu_id_range(unsigned int nthreads, int assigned_node,
> +			     cpumask_var_t *cpu_mask)
> +{
> +	cpumask_var_t candidate_mask;
> +	unsigned int cpu, node;
> +	int rc = -ENOSPC;
> +
> +	if (!zalloc_cpumask_var(&candidate_mask, GFP_KERNEL))
> +		return -ENOMEM;
> +
> +	cpumask_clear(*cpu_mask);
> +	for (cpu = 0; cpu < nthreads; cpu++)
> +		cpumask_set_cpu(cpu, *cpu_mask);
> +
> +	BUG_ON(!cpumask_subset(cpu_present_mask, cpu_possible_mask));
> +
> +	/* Get a bitmap of unoccupied slots. */
> +	cpumask_xor(candidate_mask, cpu_possible_mask, cpu_present_mask);
> +
> +	if (assigned_node != NUMA_NO_NODE) {
> +		/*
> +		 * Remove free ids previously assigned on the other nodes. We
> +		 * can walk only online nodes because once a node became online
> +		 * it is not turned offlined back.
> +		 */
> +		for_each_online_node(node) {
> +			if (node == assigned_node)
> +				continue;
> +			cpumask_andnot(candidate_mask, candidate_mask,
> +				       node_recorded_ids_map[node]);
> +		}
> +	}
> +
> +	if (cpumask_empty(candidate_mask))
> +		goto out;
> +
> +	while (!cpumask_empty(*cpu_mask)) {
> +		if (cpumask_subset(*cpu_mask, candidate_mask))
> +			/* Found a range where we can insert the new cpu(s) */
> +			break;
> +		cpumask_shift_left(*cpu_mask, *cpu_mask, nthreads);
> +	}
> +
> +	if (!cpumask_empty(*cpu_mask))
> +		rc = 0;
> +
> +out:
> +	free_cpumask_var(candidate_mask);
> +	return rc;
> +}
> +
>   /*
>    * Update cpu_present_mask and paca(s) for a new cpu node.  The wrinkle
> - * here is that a cpu device node may represent up to two logical cpus
> + * here is that a cpu device node may represent multiple logical cpus
>    * in the SMT case.  We must honor the assumption in other code that
>    * the logical ids for sibling SMT threads x and y are adjacent, such
>    * that x^1 == y and y^1 == x.
>    */
>   static int pseries_add_processor(struct device_node *np)
>   {
> -	unsigned int cpu;
> -	cpumask_var_t candidate_mask, tmp;
> -	int err = -ENOSPC, len, nthreads, i;
> +	int len, nthreads, node, cpu, assigned_node;
> +	int rc = 0;
> +	cpumask_var_t cpu_mask;
>   	const __be32 *intserv;
>   
>   	intserv = of_get_property(np, "ibm,ppc-interrupt-server#s", &len);
>   	if (!intserv)
>   		return 0;
>   
> -	zalloc_cpumask_var(&candidate_mask, GFP_KERNEL);
> -	zalloc_cpumask_var(&tmp, GFP_KERNEL);
> -
>   	nthreads = len / sizeof(u32);
> -	for (i = 0; i < nthreads; i++)
> -		cpumask_set_cpu(i, tmp);
>   
> -	cpu_maps_update_begin();
> +	if (!alloc_cpumask_var(&cpu_mask, GFP_KERNEL))
> +		return -ENOMEM;
>   
> -	BUG_ON(!cpumask_subset(cpu_present_mask, cpu_possible_mask));
> +	/*
> +	 * Fetch from the DT nodes read by dlpar_configure_connector() the NUMA
> +	 * node id the added CPU belongs to.
> +	 */
> +	node = of_node_to_nid(np);
> +	if (node < 0 || !node_possible(node))
> +		node = first_online_node;
>   
> -	/* Get a bitmap of unoccupied slots. */
> -	cpumask_xor(candidate_mask, cpu_possible_mask, cpu_present_mask);
> -	if (cpumask_empty(candidate_mask)) {
> -		/* If we get here, it most likely means that NR_CPUS is
> -		 * less than the partition's max processors setting.
> +	BUG_ON(node == NUMA_NO_NODE);
> +	assigned_node = node;
> +
> +	cpu_maps_update_begin();
> +
> +	rc = find_cpu_id_range(nthreads, node, &cpu_mask);
> +	if (rc && nr_node_ids > 1) {
> +		/*
> +		 * Try again, considering the free CPU ids from the other node.
>   		 */
> -		printk(KERN_ERR "Cannot add cpu %pOF; this system configuration"
> -		       " supports %d logical cpus.\n", np,
> -		       num_possible_cpus());
> -		goto out_unlock;
> +		node = NUMA_NO_NODE;
> +		rc = find_cpu_id_range(nthreads, NUMA_NO_NODE, &cpu_mask);
>   	}
>   
> -	while (!cpumask_empty(tmp))
> -		if (cpumask_subset(tmp, candidate_mask))
> -			/* Found a range where we can insert the new cpu(s) */
> -			break;
> -		else
> -			cpumask_shift_left(tmp, tmp, nthreads);
> -
> -	if (cpumask_empty(tmp)) {
> -		printk(KERN_ERR "Unable to find space in cpu_present_mask for"
> -		       " processor %pOFn with %d thread(s)\n", np,
> -		       nthreads);
> -		goto out_unlock;
> +	if (rc) {
> +		pr_err("Cannot add cpu %pOF; this system configuration"
> +		       " supports %d logical cpus.\n", np, num_possible_cpus());
> +		goto out;
>   	}
>   
> -	for_each_cpu(cpu, tmp) {
> +	for_each_cpu(cpu, cpu_mask) {
>   		BUG_ON(cpu_present(cpu));
>   		set_cpu_present(cpu, true);
>   		set_hard_smp_processor_id(cpu, be32_to_cpu(*intserv++));
>   	}
> -	err = 0;
> -out_unlock:
> +
> +	/* Record the newly used CPU ids for the associate node. */
> +	cpumask_or(node_recorded_ids_map[assigned_node],
> +		   node_recorded_ids_map[assigned_node], cpu_mask);
> +
> +	/*
> +	 * If node is set to NUMA_NO_NODE, CPU ids have be reused from
> +	 * another node, remove them from its mask.
> +	 */
> +	if (node == NUMA_NO_NODE) {
> +		cpu = cpumask_first(cpu_mask);
> +		pr_warn("Reusing free CPU ids %d-%d from another node\n",
> +			cpu, cpu + nthreads - 1);
> +		for_each_online_node(node) {
> +			if (node == assigned_node)
> +				continue;
> +			cpumask_andnot(node_recorded_ids_map[node],
> +				       node_recorded_ids_map[node],
> +				       cpu_mask);
> +		}
> +	}
> +
> +out:
>   	cpu_maps_update_done();
> -	free_cpumask_var(candidate_mask);
> -	free_cpumask_var(tmp);
> -	return err;
> +	free_cpumask_var(cpu_mask);
> +	return rc;
>   }
>   
>   /*
> @@ -908,6 +990,7 @@ static struct notifier_block pseries_smp_nb = {
>   static int __init pseries_cpu_hotplug_init(void)
>   {
>   	int qcss_tok;
> +	unsigned int node;
>   
>   #ifdef CONFIG_ARCH_CPU_PROBE_RELEASE
>   	ppc_md.cpu_probe = dlpar_cpu_probe;
> @@ -929,8 +1012,18 @@ static int __init pseries_cpu_hotplug_init(void)
>   	smp_ops->cpu_die = pseries_cpu_die;
>   
>   	/* Processors can be added/removed only on LPAR */
> -	if (firmware_has_feature(FW_FEATURE_LPAR))
> +	if (firmware_has_feature(FW_FEATURE_LPAR)) {
> +		for_each_node(node) {
> +			alloc_bootmem_cpumask_var(&node_recorded_ids_map[node]);
> +
> +			/* Record ids of CPU added at boot time */
> +			cpumask_or(node_recorded_ids_map[node],
> +				   node_recorded_ids_map[node],
> +				   node_to_cpumask_map[node]);
> +		}
> +
>   		of_reconfig_notifier_register(&pseries_smp_nb);
> +	}
>   
>   	return 0;
>   }
> 

