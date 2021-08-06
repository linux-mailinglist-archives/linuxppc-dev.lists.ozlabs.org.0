Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1EB3E2E4D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 18:24:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gh9mX2wPpz3dGd
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 02:24:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RO65AJkb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RO65AJkb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gh9m01QZSz2xKY
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Aug 2021 02:24:15 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176G4Jmr164340; Fri, 6 Aug 2021 12:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=V4v+LQhdXQFpElTsoS+fJAnDFryAxvB1DZwUmTzjna8=;
 b=RO65AJkbzIzq7mEBePLZdvXtHmojSHcEcs6eQ4W78VQhdeyAypKxBdQwtVV7dVAWIla4
 2qcv48B01fYPypw3yk6j16sqOhddceeUBbA+TwtklDeWUnlFNgY4Ai7fPVuDrqA77jdX
 SiUFn8sLU7Q3yu4BUbnyE5WSM7BeBSuGKglnBPIcedysakEw/MNCVZjk3ssOyzCvFGXG
 L6ablHFJa7AHUx7ASFAP7Rlt7rTwMp1FuicL2q5P5c8Ar4RaFCKVN3Dir1v3842W8G2J
 wM9+UbUBsrmk43wqenQjFnDwWd6jnquJimD6jn26Itl/fTzyipWdYo/kCLymm+Bf5QM/ rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a885ae1x6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 12:24:07 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 176GDm5Q022450;
 Fri, 6 Aug 2021 12:24:06 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a885ae1wa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 12:24:06 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 176GHodm020974;
 Fri, 6 Aug 2021 16:24:04 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3a4x595f25-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 16:24:04 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 176GO1xU57475362
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Aug 2021 16:24:02 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E00DEA405B;
 Fri,  6 Aug 2021 16:24:01 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F9A3A4054;
 Fri,  6 Aug 2021 16:24:00 +0000 (GMT)
Received: from [9.85.86.68] (unknown [9.85.86.68])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Aug 2021 16:24:00 +0000 (GMT)
Subject: Re: [PATCH v6 6/6] powerpc/pseries: Consolidate form1 distance
 initialization into a helper
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210727100311.310969-1-aneesh.kumar@linux.ibm.com>
 <20210727100311.310969-7-aneesh.kumar@linux.ibm.com> <YQzbCxwfEdE3CQZw@yekko>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <5caa933f-bf2e-6df6-40a9-9dd161711224@linux.ibm.com>
Date: Fri, 6 Aug 2021 21:53:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQzbCxwfEdE3CQZw@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XadllRlKY0aiWsldcHwqCvr3zXmsuITE
X-Proofpoint-ORIG-GUID: NU05-IqFN4H8Zg8OrrZU7sAUr18rjYIh
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-06_05:2021-08-06,
 2021-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108060110
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

On 8/6/21 12:17 PM, David Gibson wrote:
> On Tue, Jul 27, 2021 at 03:33:11PM +0530, Aneesh Kumar K.V wrote:
>> Currently, we duplicate parsing code for ibm,associativity and
>> ibm,associativity-lookup-arrays in the kernel. The associativity array provided
>> by these device tree properties are very similar and hence can use
>> a helper to parse the node id and numa distance details.
> 
> Oh... sorry.. comments on the earlier patch were from before I read
> and saw you adjusted things here.
> 
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/mm/numa.c | 83 ++++++++++++++++++++++++++----------------
>>   1 file changed, 51 insertions(+), 32 deletions(-)
>>
>> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>> index fffb3c40f595..7506251e17f2 100644
>> --- a/arch/powerpc/mm/numa.c
>> +++ b/arch/powerpc/mm/numa.c
>> @@ -171,19 +171,19 @@ static void unmap_cpu_from_node(unsigned long cpu)
>>   }
>>   #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
>>   
>> -/*
>> - * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
>> - * info is found.
>> - */
>> -static int associativity_to_nid(const __be32 *associativity)
>> +static int __associativity_to_nid(const __be32 *associativity,
>> +				  int max_array_sz)
>>   {
>>   	int nid = NUMA_NO_NODE;
>> +	/*
>> +	 * primary_domain_index is 1 based array index.
>> +	 */
>> +	int index = primary_domain_index  - 1;
>>   
>> -	if (!numa_enabled)
>> +	if (!numa_enabled || index >= max_array_sz)
>>   		goto out;
> 
> You don't need a goto, you can just return NUMA_NO_NODE.

updated

> 
>>   
>> -	if (of_read_number(associativity, 1) >= primary_domain_index)
>> -		nid = of_read_number(&associativity[primary_domain_index], 1);
>> +	nid = of_read_number(&associativity[index], 1);
>>   
>>   	/* POWER4 LPAR uses 0xffff as invalid node */
>>   	if (nid == 0xffff || nid >= nr_node_ids)
>> @@ -191,6 +191,17 @@ static int associativity_to_nid(const __be32 *associativity)
>>   out:
>>   	return nid;
>>   }
>> +/*
>> + * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
>> + * info is found.
>> + */
>> +static int associativity_to_nid(const __be32 *associativity)
>> +{
>> +	int array_sz = of_read_number(associativity, 1);
>> +
>> +	/* Skip the first element in the associativity array */
>> +	return __associativity_to_nid((associativity + 1), array_sz);
>> +}
>>   
>>   static int __cpu_form2_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
>>   {
>> @@ -295,24 +306,41 @@ int of_node_to_nid(struct device_node *device)
>>   }
>>   EXPORT_SYMBOL(of_node_to_nid);
>>   
>> -static void __initialize_form1_numa_distance(const __be32 *associativity)
>> +static void ___initialize_form1_numa_distance(const __be32 *associativity,
>> +					     int max_array_sz)
>>   {
>>   	int i, nid;
>>   
>>   	if (affinity_form != FORM1_AFFINITY)
>>   		return;
>>   
>> -	nid = associativity_to_nid(associativity);
>> +	nid = __associativity_to_nid(associativity, max_array_sz);
>>   	if (nid != NUMA_NO_NODE) {
>>   		for (i = 0; i < distance_ref_points_depth; i++) {
>>   			const __be32 *entry;
>> +			int index = be32_to_cpu(distance_ref_points[i]) - 1;
>> +
>> +			/*
>> +			 * broken hierarchy, return with broken distance table
> 
> WARN_ON, maybe?


updated

> 
>> +			 */
>> +			if (index >= max_array_sz)
>> +				return;
>>   
>> -			entry = &associativity[be32_to_cpu(distance_ref_points[i])];
>> +			entry = &associativity[index];
>>   			distance_lookup_table[nid][i] = of_read_number(entry, 1);
>>   		}
>>   	}
>>   }
>>   
>> +static void __initialize_form1_numa_distance(const __be32 *associativity)
> 
> Do you actually use this in-between wrapper?

yes used in

static void initialize_form1_numa_distance(struct device_node *node)
{
	const __be32 *associativity;

	associativity = of_get_associativity(node);
	if (!associativity)
		return;

	__initialize_form1_numa_distance(associativity);
}



> 
>> +{
>> +	int array_sz;
>> +
>> +	array_sz = of_read_number(associativity, 1);
>> +	/* Skip the first element in the associativity array */
>> +	___initialize_form1_numa_distance(associativity + 1, array_sz);
>> +}
>> +
>>   static void initialize_form1_numa_distance(struct device_node *node)
>>   {
>>   	const __be32 *associativity;
>> @@ -586,27 +614,18 @@ static int get_nid_and_numa_distance(struct drmem_lmb *lmb)
>>   
>>   	if (primary_domain_index <= aa.array_sz &&
>>   	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_arrays) {
>> -		index = lmb->aa_index * aa.array_sz + primary_domain_index - 1;
>> -		nid = of_read_number(&aa.arrays[index], 1);
>> +		const __be32 *associativity;
>>   
>> -		if (nid == 0xffff || nid >= nr_node_ids)
>> -			nid = default_nid;
>> +		index = lmb->aa_index * aa.array_sz;
>> +		associativity = &aa.arrays[index];
>> +		nid = __associativity_to_nid(associativity, aa.array_sz);
>>   		if (nid > 0 && affinity_form == FORM1_AFFINITY) {
>> -			int i;
>> -			const __be32 *associativity;
>> -
>> -			index = lmb->aa_index * aa.array_sz;
>> -			associativity = &aa.arrays[index];
>>   			/*
>> -			 * lookup array associativity entries have different format
>> -			 * There is no length of the array as the first element.
>> +			 * lookup array associativity entries have
>> +			 * no length of the array as the first element.
>>   			 */
>> -			for (i = 0; i < distance_ref_points_depth; i++) {
>> -				const __be32 *entry;
>> -
>> -				entry = &associativity[be32_to_cpu(distance_ref_points[i]) - 1];
>> -				distance_lookup_table[nid][i] = of_read_number(entry, 1);
>> -			}
>> +			___initialize_form1_numa_distance(associativity,
>> +							  aa.array_sz);
> 
> Better, thanks.
> 
>>   		}
>>   	}
>>   	return nid;
>> @@ -632,11 +651,11 @@ int of_drconf_to_nid_single(struct drmem_lmb *lmb)
>>   
>>   	if (primary_domain_index <= aa.array_sz &&
>>   	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_arrays) {
>> -		index = lmb->aa_index * aa.array_sz + primary_domain_index - 1;
>> -		nid = of_read_number(&aa.arrays[index], 1);
>> +		const __be32 *associativity;
>>   
>> -		if (nid == 0xffff || nid >= nr_node_ids)
>> -			nid = default_nid;
>> +		index = lmb->aa_index * aa.array_sz;
>> +		associativity = &aa.arrays[index];
>> +		nid = __associativity_to_nid(associativity, aa.array_sz);
>>   	}
>>   	return nid;
>>   }
> 


-aneesh
