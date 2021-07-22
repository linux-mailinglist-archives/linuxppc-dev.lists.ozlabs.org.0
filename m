Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B933D1EA7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jul 2021 09:08:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVk7d0S6pz3bgT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jul 2021 17:08:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YJEoPaMQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YJEoPaMQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVk760Y4Zz2yWv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jul 2021 17:08:01 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16M734im081763; Thu, 22 Jul 2021 03:07:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=qwPaUBWc42gZBK3GytCn9fJ83nN2OfyaAbIPtklJ3cI=;
 b=YJEoPaMQGNog2qidyd17G3lZUyEw89UWQnvcYCV1lVtFnzmM1dnu/TAxmiDpJL7Gtn/E
 wlpL0DTjVBx6/t1OUwuXqFpvPRpYUxXpN/vPFbG65iAWmIn/PxB8PDYbNZ3HWE5XyWLy
 HM5YU0HDLnKSAIDHcKHXq3XYjDFQ7wF/8ZPU34iaFsSE8K5FECQUOuO+OhbOP9mjHYiU
 +hU58v8a0wJ13JaVSguULN6FFo+bEP2RdRDkKWEwWhRaQXYRQZ7Gg6o1yu0y6FQYeMmf
 EDWEufPQP4tWqwpX5u0/56xsqfMoLstuuMVykGtCY79QbNkxmX2rPcGhzFXCBbw53zxM 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39y2hga6pu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 03:07:53 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16M73bf3083608;
 Thu, 22 Jul 2021 03:07:53 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39y2hga6pg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 03:07:53 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16M73euC029505;
 Thu, 22 Jul 2021 07:07:52 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 39vuk7a24t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 07:07:52 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16M77pBb30343648
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jul 2021 07:07:51 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BA11C605B;
 Thu, 22 Jul 2021 07:07:51 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45E1FC6057;
 Thu, 22 Jul 2021 07:07:49 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.40.113])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 22 Jul 2021 07:07:48 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v5 4/6] powerpc/pseries: Consolidate different NUMA
 distance update code paths
In-Reply-To: <YPjMkQ5W1fSQdzNe@yekko>
References: <20210628151117.545935-1-aneesh.kumar@linux.ibm.com>
 <20210628151117.545935-5-aneesh.kumar@linux.ibm.com>
 <YPjMkQ5W1fSQdzNe@yekko>
Date: Thu, 22 Jul 2021 12:37:46 +0530
Message-ID: <87zgueu8ql.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8DyY8er0oZw3iXlEj5YtD7hHUD-ztKMP
X-Proofpoint-GUID: O5dSjozarbKFa9QhjQtP_1cdp9jn3ZFW
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-22_03:2021-07-22,
 2021-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107220043
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Mon, Jun 28, 2021 at 08:41:15PM +0530, Aneesh Kumar K.V wrote:
>> The associativity details of the newly added resourced are collected from
>> the hypervisor via "ibm,configure-connector" rtas call. Update the numa
>> distance details of the newly added numa node after the above call.
>> 
>> Instead of updating NUMA distance every time we lookup a node id
>> from the associativity property, add helpers that can be used
>> during boot which does this only once. Also remove the distance
>> update from node id lookup helpers.
>> 
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  arch/powerpc/mm/numa.c                        | 173 +++++++++++++-----
>>  arch/powerpc/platforms/pseries/hotplug-cpu.c  |   2 +
>>  .../platforms/pseries/hotplug-memory.c        |   2 +
>>  arch/powerpc/platforms/pseries/pseries.h      |   1 +
>>  4 files changed, 132 insertions(+), 46 deletions(-)
>> 
>> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>> index 0ec16999beef..7b142f79d600 100644
>> --- a/arch/powerpc/mm/numa.c
>> +++ b/arch/powerpc/mm/numa.c
>> @@ -208,22 +208,6 @@ int __node_distance(int a, int b)
>>  }
>>  EXPORT_SYMBOL(__node_distance);
>>  
>> -static void initialize_distance_lookup_table(int nid,
>> -		const __be32 *associativity)
>> -{
>> -	int i;
>> -
>> -	if (affinity_form != FORM1_AFFINITY)
>> -		return;
>> -
>> -	for (i = 0; i < max_associativity_domain_index; i++) {
>> -		const __be32 *entry;
>> -
>> -		entry = &associativity[be32_to_cpu(distance_ref_points[i]) - 1];
>> -		distance_lookup_table[nid][i] = of_read_number(entry, 1);
>> -	}
>> -}
>> -
>>  /*
>>   * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
>>   * info is found.
>> @@ -241,15 +225,6 @@ static int associativity_to_nid(const __be32 *associativity)
>>  	/* POWER4 LPAR uses 0xffff as invalid node */
>>  	if (nid == 0xffff || nid >= nr_node_ids)
>>  		nid = NUMA_NO_NODE;
>> -
>> -	if (nid > 0 &&
>> -		of_read_number(associativity, 1) >= max_associativity_domain_index) {
>> -		/*
>> -		 * Skip the length field and send start of associativity array
>> -		 */
>> -		initialize_distance_lookup_table(nid, associativity + 1);
>> -	}
>> -
>>  out:
>>  	return nid;
>>  }
>> @@ -287,6 +262,49 @@ int of_node_to_nid(struct device_node *device)
>>  }
>>  EXPORT_SYMBOL(of_node_to_nid);
>>  
>> +static void __initialize_form1_numa_distance(const __be32 *associativity)
>> +{
>> +	int i, nid;
>> +
>> +	if (affinity_form != FORM1_AFFINITY)
>
> Since this shouldn't be called on a !form1 system, this could be a WARN_ON().

The way we call functions currently, instead of doing

if (affinity_form == FORM1_AFFINITY)
    __initialize_form1_numa_distance()

We avoid doing the if check in multiple places. For example
parse_numa_properties will fetch the associativity array to find the
details of online node and set it online. We use the same code path to
initialize distance.

		if (__vphn_get_associativity(i, vphn_assoc) == 0) {
			nid = associativity_to_nid(vphn_assoc);
			__initialize_form1_numa_distance(vphn_assoc);
		} else {

			cpu = of_get_cpu_node(i, NULL);
			BUG_ON(!cpu);

			associativity = of_get_associativity(cpu);
			if (associativity) {
				nid = associativity_to_nid(associativity);
				__initialize_form1_numa_distance(associativity);
			}

We avoid the the if (affinity_form == FORM1_AFFINITY) check there by
moving the check inside __initialize_form1_numa_distance().


>
>> +		return;
>> +
>> +	if (of_read_number(associativity, 1) >= primary_domain_index) {
>> +		nid = of_read_number(&associativity[primary_domain_index], 1);
>
> This computes the nid from the assoc array independently of
> associativity_to_nid, which doesn't seem like a good idea.  Wouldn't
> it be better to call assocaitivity_to_nid(), then make the next bit
> conditional on nid !== NUMA_NO_NODE?

@@ -302,9 +302,8 @@ static void __initialize_form1_numa_distance(const __be32 *associativity)
 	if (affinity_form != FORM1_AFFINITY)
 		return;
 
-	if (of_read_number(associativity, 1) >= primary_domain_index) {
-		nid = of_read_number(&associativity[primary_domain_index], 1);
-
+	nid = associativity_to_nid(associativity);
+	if (nid != NUMA_NO_NODE) {
 		for (i = 0; i < distance_ref_points_depth; i++) {
 			const __be32 *entry;
 

>
>> +
>> +		for (i = 0; i < max_associativity_domain_index; i++) {
>> +			const __be32 *entry;
>> +
>> +			entry = &associativity[be32_to_cpu(distance_ref_points[i])];
>> +			distance_lookup_table[nid][i] = of_read_number(entry, 1);
>> +		}
>> +	}
>> +}
>> +
>> +static void initialize_form1_numa_distance(struct device_node *node)
>> +{
>> +	const __be32 *associativity;
>> +
>> +	associativity = of_get_associativity(node);
>> +	if (!associativity)
>> +		return;
>> +
>> +	__initialize_form1_numa_distance(associativity);
>> +}
>> +
>> +/*
>> + * Used to update distance information w.r.t newly added node.
>> + */
>> +void update_numa_distance(struct device_node *node)
>> +{
>> +	if (affinity_form == FORM0_AFFINITY)
>> +		return;
>> +	else if (affinity_form == FORM1_AFFINITY) {
>> +		initialize_form1_numa_distance(node);
>> +		return;
>> +	}
>> +}
>> +
>>  static int __init find_primary_domain_index(void)
>>  {
>>  	int index;
>> @@ -433,6 +451,48 @@ static int of_get_assoc_arrays(struct assoc_arrays *aa)
>>  	return 0;
>>  }
>>  
>> +static int get_nid_and_numa_distance(struct drmem_lmb *lmb)
>> +{
>> +	struct assoc_arrays aa = { .arrays = NULL };
>> +	int default_nid = NUMA_NO_NODE;
>> +	int nid = default_nid;
>> +	int rc, index;
>> +
>> +	if ((primary_domain_index < 0) || !numa_enabled)
>
> Under what circumstances could you get primary_domain_index < 0?

IIUC that is to handle failure to parse device tree.
ea9f5b702fe0215188fba2eda117419e4ae90a67

>
>> +		return default_nid;
>> +
>> +	rc = of_get_assoc_arrays(&aa);
>> +	if (rc)
>> +		return default_nid;
>> +
>> +	if (primary_domain_index <= aa.array_sz &&
>> +	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_arrays) {
>> +		index = lmb->aa_index * aa.array_sz + primary_domain_index - 1;
>
> Does anywhere verify that primary_domain_index <= aa.array_sz?

That is the first part of the check?

>
>> +		nid = of_read_number(&aa.arrays[index], 1);
>> +
>> +		if (nid == 0xffff || nid >= nr_node_ids)
>> +			nid = default_nid;
>> +		if (nid > 0 && affinity_form == FORM1_AFFINITY) {
>> +			int i;
>> +			const __be32 *associativity;
>> +
>> +			index = lmb->aa_index * aa.array_sz;
>> +			associativity = &aa.arrays[index];
>> +			/*
>> +			 * lookup array associativity entries have different format
>> +			 * There is no length of the array as the first element.
>
> The difference it very small, and this is not a hot path.  Couldn't
> you reduce a chunk of code by prepending aa.array_sz, then re-using
> __initialize_form1_numa_distance.  Or even making
> __initialize_form1_numa_distance() take the length as a parameter.

The changes are small but confusing w.r.t how we look at the
associativity-lookup-arrays. The way we interpret associativity array
and associativity lookup array using primary_domain_index is different.
Hence the '-1' in the node lookup here. 

	index = lmb->aa_index * aa.array_sz + primary_domain_index - 1;
	nid = of_read_number(&aa.arrays[index], 1);


>
>> +			 */
>> +			for (i = 0; i < max_associativity_domain_index; i++) {
>> +				const __be32 *entry;
>> +
>> +				entry = &associativity[be32_to_cpu(distance_ref_points[i]) - 1];
>
> Does anywhere verify that distance_ref_points[i] <= aa.array_size for
> every i?

We do check for 

	if (primary_domain_index <= aa.array_sz &&

>
>> +				distance_lookup_table[nid][i] = of_read_number(entry, 1);
>> +			}
>> +		}
>> +	}
>> +	return nid;
>> +}
>> +
>>  /*
>>   * This is like of_node_to_nid_single() for memory represented in the
>>   * ibm,dynamic-reconfiguration-memory node.
>> @@ -458,21 +518,14 @@ int of_drconf_to_nid_single(struct drmem_lmb *lmb)
>>  
>>  		if (nid == 0xffff || nid >= nr_node_ids)
>>  			nid = default_nid;
>> -
>> -		if (nid > 0) {
>> -			index = lmb->aa_index * aa.array_sz;
>> -			initialize_distance_lookup_table(nid,
>> -							&aa.arrays[index]);
>> -		}
>>  	}
>> -
>>  	return nid;
>>  }
>>  
>>  #ifdef CONFIG_PPC_SPLPAR
>> -static int vphn_get_nid(long lcpu)
>> +
>> +static int __vphn_get_associativity(long lcpu, __be32 *associativity)
>>  {
>> -	__be32 associativity[VPHN_ASSOC_BUFSIZE] = {0};
>>  	long rc, hwid;
>>  
>>  	/*
>> @@ -492,10 +545,22 @@ static int vphn_get_nid(long lcpu)
>>  
>>  		rc = hcall_vphn(hwid, VPHN_FLAG_VCPU, associativity);
>>  		if (rc == H_SUCCESS)
>> -			return associativity_to_nid(associativity);
>> +			return 0;
>>  	}
>>  
>> +	return -1;
>> +}
>> +
>> +static int vphn_get_nid(long lcpu)
>> +{
>> +	__be32 associativity[VPHN_ASSOC_BUFSIZE] = {0};
>> +
>> +
>> +	if (!__vphn_get_associativity(lcpu, associativity))
>> +		return associativity_to_nid(associativity);
>> +
>>  	return NUMA_NO_NODE;
>> +
>>  }
>>  #else
>>  static int vphn_get_nid(long unused)
>> @@ -692,7 +757,7 @@ static int __init numa_setup_drmem_lmb(struct drmem_lmb *lmb,
>>  			size = read_n_cells(n_mem_size_cells, usm);
>>  		}
>>  
>> -		nid = of_drconf_to_nid_single(lmb);
>> +		nid = get_nid_and_numa_distance(lmb);
>>  		fake_numa_create_new_node(((base + size) >> PAGE_SHIFT),
>>  					  &nid);
>>  		node_set_online(nid);
>> @@ -709,6 +774,7 @@ static int __init parse_numa_properties(void)
>>  	struct device_node *memory;
>>  	int default_nid = 0;
>>  	unsigned long i;
>> +	const __be32 *associativity;
>>  
>>  	if (numa_enabled == 0) {
>>  		printk(KERN_WARNING "NUMA disabled by user\n");
>> @@ -734,18 +800,30 @@ static int __init parse_numa_properties(void)
>>  	 * each node to be onlined must have NODE_DATA etc backing it.
>>  	 */
>>  	for_each_present_cpu(i) {
>> +		__be32 vphn_assoc[VPHN_ASSOC_BUFSIZE];
>>  		struct device_node *cpu;
>> -		int nid = vphn_get_nid(i);
>> +		int nid = NUMA_NO_NODE;
>>  
>> -		/*
>> -		 * Don't fall back to default_nid yet -- we will plug
>> -		 * cpus into nodes once the memory scan has discovered
>> -		 * the topology.
>> -		 */
>> -		if (nid == NUMA_NO_NODE) {
>> +		memset(vphn_assoc, 0, VPHN_ASSOC_BUFSIZE * sizeof(__be32));
>
> What's the memset() for?  AFAICT you only look at vphn_assoc in the
> branch where __vphn_get_associativity() succeeds.

That was done to match the existing code. We do use a zero filled array
when making that hcall in this code path. I don't see us doing that
everywhere. But didn't want to change that behaviour in this patch.

-static int vphn_get_nid(long lcpu)
+
+static int __vphn_get_associativity(long lcpu, __be32 *associativity)
 {
 -	__be32 associativity[VPHN_ASSOC_BUFSIZE] = {0};
  	long rc, hwid;

>
>> +
>> +		if (__vphn_get_associativity(i, vphn_assoc) == 0) {
>> +			nid = associativity_to_nid(vphn_assoc);
>> +			__initialize_form1_numa_distance(vphn_assoc);
>> +		} else {
>> +
>> +			/*
>> +			 * Don't fall back to default_nid yet -- we will plug
>> +			 * cpus into nodes once the memory scan has discovered
>> +			 * the topology.
>> +			 */
>>  			cpu = of_get_cpu_node(i, NULL);
>>  			BUG_ON(!cpu);
>> -			nid = of_node_to_nid_single(cpu);
>> +
>> +			associativity = of_get_associativity(cpu);
>> +			if (associativity) {
>> +				nid = associativity_to_nid(associativity);
>> +				__initialize_form1_numa_distance(associativity);
>> +			}
>>  			of_node_put(cpu);
>>  		}
>>  
>> @@ -781,8 +859,11 @@ static int __init parse_numa_properties(void)
>>  		 * have associativity properties.  If none, then
>>  		 * everything goes to default_nid.
>>  		 */
>> -		nid = of_node_to_nid_single(memory);
>> -		if (nid < 0)
>> +		associativity = of_get_associativity(memory);
>> +		if (associativity) {
>> +			nid = associativity_to_nid(associativity);
>> +			__initialize_form1_numa_distance(associativity);
>> +		} else
>>  			nid = default_nid;
>>  
>>  		fake_numa_create_new_node(((start + size) >> PAGE_SHIFT), &nid);
>> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> index 7e970f81d8ff..778b6ab35f0d 100644
>> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> @@ -498,6 +498,8 @@ static ssize_t dlpar_cpu_add(u32 drc_index)
>>  		return saved_rc;
>>  	}
>>  
>> +	update_numa_distance(dn);
>> +
>>  	rc = dlpar_online_cpu(dn);
>>  	if (rc) {
>>  		saved_rc = rc;
>> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
>> index 36f66556a7c6..40d350f31a34 100644
>> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
>> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
>> @@ -180,6 +180,8 @@ static int update_lmb_associativity_index(struct drmem_lmb *lmb)
>>  		return -ENODEV;
>>  	}
>>  
>> +	update_numa_distance(lmb_node);
>> +
>>  	dr_node = of_find_node_by_path("/ibm,dynamic-reconfiguration-memory");
>>  	if (!dr_node) {
>>  		dlpar_free_cc_nodes(lmb_node);
>> diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
>> index 1f051a786fb3..663a0859cf13 100644
>> --- a/arch/powerpc/platforms/pseries/pseries.h
>> +++ b/arch/powerpc/platforms/pseries/pseries.h
>> @@ -113,4 +113,5 @@ extern u32 pseries_security_flavor;
>>  void pseries_setup_security_mitigations(void);
>>  void pseries_lpar_read_hblkrm_characteristics(void);
>>  
>> +void update_numa_distance(struct device_node *node);
>>  #endif /* _PSERIES_PSERIES_H */
>
> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson
