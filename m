Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A044B352B94
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 16:43:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBjTZ1bYJz3c2K
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 01:43:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ttyrok5W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ttyrok5W; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBjT557dqz2xgM
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Apr 2021 01:42:49 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 132EXWqs014244; Fri, 2 Apr 2021 10:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=kuSh451reBC+Vmw+lAXCaH5Usc3SO984tg2uvtjHgHU=;
 b=Ttyrok5WrH/MwharxEYtaT9ea4Mci8cxfTjgRyHyQ42GEo9TGvwGbeXD0DhxO+uzA8+4
 OcW218P+uEDf5g2G38ZAYfJRF83T+2T0RX+kLBCrVwnsna3MrDfvPCa2lA/aWo1pnPBJ
 8hrLKOwH50vBNrzNNpWivDOhhgk9FEhdsnhVujVT0zmMq0PJtthiEoHx/4qnieAmdNVn
 wG+hy220/Li/ZIiuvfMDZeCx75Yo7Wy8iwD2OukAbQwM9VOP/IYUpFSc4bH50ik0e+60
 lHRZ2Snq3BFpTfr38jW8Vmo+BGLacD2vcKp//+3ViImLcKPUavKginzA2X/i64av3q7h OQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37njjaamma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Apr 2021 10:42:41 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 132EW4fk024445;
 Fri, 2 Apr 2021 14:42:39 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 37n28r0qrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Apr 2021 14:42:39 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 132EgaHD35914132
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 Apr 2021 14:42:36 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 333F2A4060;
 Fri,  2 Apr 2021 14:42:36 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D45E3A4054;
 Fri,  2 Apr 2021 14:42:35 +0000 (GMT)
Received: from pomme.local (unknown [9.145.26.212])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  2 Apr 2021 14:42:35 +0000 (GMT)
Subject: Re: [PATCH v2] pseries: prevent free CPU ids to be reused on another
 node
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <20210325093512.57856-1-ldufour@linux.ibm.com>
 <87a6qgbyk6.fsf@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <d06106d3-76e6-f5da-e3b4-db13c6bfee96@linux.ibm.com>
Date: Fri, 2 Apr 2021 16:42:35 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <87a6qgbyk6.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Q7Rl2jezJD4NgGJDMfYuEUIyxtnZUYQ2
X-Proofpoint-ORIG-GUID: Q7Rl2jezJD4NgGJDMfYuEUIyxtnZUYQ2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-02_08:2021-04-01,
 2021-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103310000
 definitions=main-2104020109
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
Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>, cheloha@linux.ibm.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks Nathan for reviewing this.

Le 02/04/2021 à 15:34, Nathan Lynch a écrit :
> Hi Laurent,
> 
> Laurent Dufour <ldufour@linux.ibm.com> writes:
>> When a CPU is hot added, the CPU ids are taken from the available mask from
>> the lower possible set. If that set of values was previously used for CPU
>> attached to a different node, this seems to application like if these CPUs
>> have migrated from a node to another one which is not expected in real
>> life.
> 
> This seems like a problem that could affect other architectures or
> platforms? I guess as long as arch code is responsible for placing new
> CPUs in cpu_present_mask, that code will have the responsibility of
> ensuring CPU IDs' NUMA assignments remain stable.

Actually, x86 is already handling this issue in the arch code specific code, see
8f54969dc8d6 ("x86/acpi: Introduce persistent storage for cpuid <-> apicid 
mapping"). I didn't check for other architectures but as CPU id allocation is in 
the arch part, I believe this is up to each arch to deal with this issue.

Making the CPU id allocation common to all arch is outside the scope of this patch.

> [...]
> 
>> The effect of this patch can be seen by removing and adding CPUs using the
>> Qemu monitor. In the following case, the first CPU from the node 2 is
>> removed, then the first one from the node 1 is removed too. Later, the
>> first CPU of the node 2 is added back. Without that patch, the kernel will
>> numbered these CPUs using the first CPU ids available which are the ones
>> freed when removing the second CPU of the node 0. This leads to the CPU ids
>> 16-23 to move from the node 1 to the node 2. With the patch applied, the
>> CPU ids 32-39 are used since they are the lowest free ones which have not
>> been used on another node.
>>
>> At boot time:
>> [root@vm40 ~]# numactl -H | grep cpus
>> node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
>> node 1 cpus: 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
>> node 2 cpus: 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47
>>
>> Vanilla kernel, after the CPU hot unplug/plug operations:
>> [root@vm40 ~]# numactl -H | grep cpus
>> node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
>> node 1 cpus: 24 25 26 27 28 29 30 31
>> node 2 cpus: 16 17 18 19 20 21 22 23 40 41 42 43 44 45 46 47
>>
>> Patched kernel, after the CPU hot unplug/plug operations:
>> [root@vm40 ~]# numactl -H | grep cpus
>> node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
>> node 1 cpus: 24 25 26 27 28 29 30 31
>> node 2 cpus: 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47
> 
> Good demonstration of the problem. CPUs 16-23 "move" from node 1 to
> node 2.

Thanks

> 
> 
>> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> index 12cbffd3c2e3..48c7943b25b0 100644
>> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> @@ -39,6 +39,8 @@
>>   /* This version can't take the spinlock, because it never returns */
>>   static int rtas_stop_self_token = RTAS_UNKNOWN_SERVICE;
>>   
>> +static cpumask_var_t node_recorded_ids_map[MAX_NUMNODES];
> 
> I guess this should have documentation that it must be
> accessed/manipulated with cpu_add_remove_lock held?

I'll add a comment before the declaration to make this clear.

> 
>> +
>>   static void rtas_stop_self(void)
>>   {
>>   	static struct rtas_args args;
>> @@ -151,29 +153,61 @@ static void pseries_cpu_die(unsigned int cpu)
>>    */
>>   static int pseries_add_processor(struct device_node *np)
>>   {
>> -	unsigned int cpu;
>> +	unsigned int cpu, node;
>>   	cpumask_var_t candidate_mask, tmp;
>> -	int err = -ENOSPC, len, nthreads, i;
>> +	int err = -ENOSPC, len, nthreads, i, nid;
> 
>  From eight local vars to ten, and the two new variables' names are
> "node" and "nid". More distinctive names would help readers.

I agree that's confusing, I'll do some cleanup.

> 
> 
>>   	const __be32 *intserv;
>> +	bool force_reusing = false;
>>   
>>   	intserv = of_get_property(np, "ibm,ppc-interrupt-server#s", &len);
>>   	if (!intserv)
>>   		return 0;
>>   
>> -	zalloc_cpumask_var(&candidate_mask, GFP_KERNEL);
>> -	zalloc_cpumask_var(&tmp, GFP_KERNEL);
>> +	alloc_cpumask_var(&candidate_mask, GFP_KERNEL);
>> +	alloc_cpumask_var(&tmp, GFP_KERNEL);
>> +
>> +	/*
>> +	 * Fetch from the DT nodes read by dlpar_configure_connector() the NUMA
>> +	 * node id the added CPU belongs to.
>> +	 */
>> +	nid = of_node_to_nid(np);
>> +	if (nid < 0 || !node_possible(nid))
>> +		nid = first_online_node;
>>   
>>   	nthreads = len / sizeof(u32);
>> -	for (i = 0; i < nthreads; i++)
>> -		cpumask_set_cpu(i, tmp);
>>   
>>   	cpu_maps_update_begin();
>>   
>>   	BUG_ON(!cpumask_subset(cpu_present_mask, cpu_possible_mask));
>>   
>> +again:
>> +	cpumask_clear(candidate_mask);
>> +	cpumask_clear(tmp);
>> +	for (i = 0; i < nthreads; i++)
>> +		cpumask_set_cpu(i, tmp);
>> +
>>   	/* Get a bitmap of unoccupied slots. */
>>   	cpumask_xor(candidate_mask, cpu_possible_mask, cpu_present_mask);
>> +
>> +	/*
>> +	 * Remove free ids previously assigned on the other nodes. We can walk
>> +	 * only online nodes because once a node became online it is not turned
>> +	 * offlined back.
>> +	 */
>> +	if (!force_reusing)
>> +		for_each_online_node(node) {
>> +			if (node == nid) /* Keep our node's recorded ids */
>> +				continue;
>> +			cpumask_andnot(candidate_mask, candidate_mask,
>> +				       node_recorded_ids_map[node]);
>> +		}
>> +
>>   	if (cpumask_empty(candidate_mask)) {
>> +		if (!force_reusing) {
>> +			force_reusing = true;
>> +			goto again;
>> +		}
>> +
> 
> Hmm I'd encourage you to work toward a solution that doesn't involve
> adding backwards jumps and a bool flag to this code.
> 
> The function already mixes concerns and this change makes it a bit more
> difficult to follow. I'd suggest that you first factor out into a
> separate function the parts that allocate a suitable range from
> cpu_possible_mask, and only then introduce the behavior change
> constraining the results.

Fair enough, I'll try to factor some part of the code and avoid a backward jumps.

> 
>>   		/* If we get here, it most likely means that NR_CPUS is
>>   		 * less than the partition's max processors setting.
>>   		 */
>> @@ -191,12 +225,36 @@ static int pseries_add_processor(struct device_node *np)
>>   			cpumask_shift_left(tmp, tmp, nthreads);
>>   
>>   	if (cpumask_empty(tmp)) {
>> +		if (!force_reusing) {
>> +			force_reusing = true;
>> +			goto again;
>> +		}
>>   		printk(KERN_ERR "Unable to find space in cpu_present_mask for"
>>   		       " processor %pOFn with %d thread(s)\n", np,
>>   		       nthreads);
>>   		goto out_unlock;
>>   	}
>>   
>> +	/* Record the newly used CPU ids for the associate node. */
>> +	cpumask_or(node_recorded_ids_map[nid], node_recorded_ids_map[nid], tmp);
>> +
>> +	/*
>> +	 * If we force reusing the id, remove these ids from any node which was
>> +	 * previously using it.
>> +	 */
>> +	if (force_reusing) {
>> +		cpu = cpumask_first(tmp);
>> +		pr_warn("Reusing free CPU ids %d-%d from another node\n",
>> +			cpu, cpu + nthreads - 1);
>> +
>> +		for_each_online_node(node) {
>> +			if (node == nid)
>> +				continue;
>> +			cpumask_andnot(node_recorded_ids_map[node],
>> +				       node_recorded_ids_map[node], tmp);
>> +		}
>> +	}
>> +
> 
> I don't know, should we not fail the request instead of doing the
> ABI-breaking thing the code in this change is trying to prevent? I don't
> think a warning in the kernel log is going to help any application that
> would be affected by this.

That's a really good question. One should argue that the most important is to 
satisfy the CPU add operation, assuming that only few are interested in the CPU 
numbering, while others would prefer the CPU adding to fail (which may prevent 
adding CPUs on another nodes if the whole operation is aborted as soon as a CPU 
add is failing).

I was conservative here, but if failing the operation is the best option, then 
this will make that code simpler, removing the backward jump.

Who is deciding?

> 
> 
>>   	for_each_cpu(cpu, tmp) {
>>   		BUG_ON(cpu_present(cpu));
>>   		set_cpu_present(cpu, true);
>> @@ -889,6 +947,7 @@ static struct notifier_block pseries_smp_nb = {
>>   static int __init pseries_cpu_hotplug_init(void)
>>   {
>>   	int qcss_tok;
>> +	unsigned int node;
>>   
>>   #ifdef CONFIG_ARCH_CPU_PROBE_RELEASE
>>   	ppc_md.cpu_probe = dlpar_cpu_probe;
>> @@ -910,8 +969,18 @@ static int __init pseries_cpu_hotplug_init(void)
>>   	smp_ops->cpu_die = pseries_cpu_die;
>>   
>>   	/* Processors can be added/removed only on LPAR */
>> -	if (firmware_has_feature(FW_FEATURE_LPAR))
>> +	if (firmware_has_feature(FW_FEATURE_LPAR)) {
>> +		for_each_node(node) {
>> +			alloc_bootmem_cpumask_var(&node_recorded_ids_map[node]);
>> +
>> +			/* Record ids of CPU added at boot time */
>> +			cpumask_or(node_recorded_ids_map[node],
>> +				   node_recorded_ids_map[node],
>> +				   node_to_cpumask_map[node]);
>> +		}
>> +
>>   		of_reconfig_notifier_register(&pseries_smp_nb);
>> +	}
> 
> This looks OK.
> 

