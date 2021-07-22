Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 024863D1D4B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jul 2021 07:18:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVghl68Rlz3bgg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jul 2021 15:18:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OdYmXrev;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OdYmXrev; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVghD4dGtz2yNY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jul 2021 15:18:03 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16M54jDU088366; Thu, 22 Jul 2021 01:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ihAMO38jIU0iCnwfDolqS3OPp3/y1qNLM4I2wMECphI=;
 b=OdYmXrevpx0g+eB8pjmisp6aHoYEXtv6glaeBEhR3+KUDHQ33Eygq32/E3aV9aICXvRY
 gaDHAxzW+XnB5V9WkjSk7rKS0+kYkmzKWlW1T2b9iFE/llcJeul7w114hUzGZPuwrmz+
 ZZ0+fSCZykUj3rfAKtGtQbdu4EdQYm9WQ1+AnbTj11zSG/MiG+MmRcOkhE/tPuuAYuDg
 Ej8XhZgxhGnarAHYJcaIjBCrd3l8HGiDQzC7ENEDAbGQGedzjcVLoLRjmcx2vwst2Jhk
 hhSOtiPjb+0w62kqWDv5/maIik3H1hC7xZkuH7c3AwhCCROR1cuQaSAOFitA0+ObRT3m nA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39y1fs95ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 01:17:57 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16M58NCd112296;
 Thu, 22 Jul 2021 01:17:57 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39y1fs95ed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 01:17:57 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16M5EDvu028288;
 Thu, 22 Jul 2021 05:17:55 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 39xhx48dum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 05:17:55 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16M5FRPb20250936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jul 2021 05:15:27 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD1E4AE055;
 Thu, 22 Jul 2021 05:17:52 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C96C5AE045;
 Thu, 22 Jul 2021 05:17:50 +0000 (GMT)
Received: from [9.199.40.113] (unknown [9.199.40.113])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Jul 2021 05:17:50 +0000 (GMT)
Subject: Re: [PATCH v5 1/6] powerpc/pseries: rename min_common_depth to
 primary_domain_index
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210628151117.545935-1-aneesh.kumar@linux.ibm.com>
 <20210628151117.545935-2-aneesh.kumar@linux.ibm.com> <YPjQ85wtr165BOMa@yekko>
 <YPjZvgRr2WSdcX/W@yekko>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <30f70122-e8e0-e823-c585-bc79ba2e8152@linux.ibm.com>
Date: Thu, 22 Jul 2021 10:47:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPjZvgRr2WSdcX/W@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6C5zMfzRYOi5aFVUsRpYZkHrYAQeFEn2
X-Proofpoint-ORIG-GUID: XCGFxMk5VO3W_04zrFqL4AqUZ6jFQ8fX
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-22_01:2021-07-22,
 2021-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 clxscore=1011 impostorscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107220029
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

On 7/22/21 8:06 AM, David Gibson wrote:
> On Thu, Jul 22, 2021 at 11:59:15AM +1000, David Gibson wrote:
>> On Mon, Jun 28, 2021 at 08:41:12PM +0530, Aneesh Kumar K.V wrote:
>>> No functional change in this patch.
>>
>> The new name does not match how you describe "primary domain index" in
>> the documentation from patch 6/6.  There it comes from the values in
>> associativity-reference-points, but here it simply comes from the
>> lengths of all the associativity properties.
> 
> No, sorry, I misread this code... misled by the old name, so it's a
> good thing you're changing it.
> 
> But.. I'm still not sure the new name is accurate, either...
> 
> [snip]
>>>   	if (form1_affinity) {
>>> -		depth = of_read_number(distance_ref_points, 1);
>>> +		index = of_read_number(distance_ref_points, 1);
> 
> AFACIT distance_ref_points hasn't been altered from the
> of_get_property() at this point, so isn't this setting depth / index
> to the number of entries in ref-points, rather than the value of the
> first entry (which is what primary domain index is supposed to be).
> 

ibm,associativity-reference-points property format is as below.

# lsprop  ibm,associativity-reference-points
ibm,associativity-reference-points
                  00000004 00000002

it doesn't have the number of elements as the first item.

For FORM1 1 element is the NUMA boundary index/primary_domain_index
For FORM0 2 element is the NUMA boundary index/primary_domain_index.


>>>   	} else {
>>>   		if (distance_ref_points_depth < 2) {
>>>   			printk(KERN_WARNING "NUMA: "
>>> @@ -334,7 +334,7 @@ static int __init find_min_common_depth(void)
>>>   			goto err;
>>>   		}
>>>   
>>> -		depth = of_read_number(&distance_ref_points[1], 1);
>>> +		index = of_read_number(&distance_ref_points[1], 1);
>>>   	}
>>>   
>>>   	/*
>>> @@ -348,7 +348,7 @@ static int __init find_min_common_depth(void)
>>>   	}
>>>   
>>>   	of_node_put(root);
>>> -	return depth;
>>> +	return index;
>>>   
>>>   err:
>>>   	of_node_put(root);
>>> @@ -437,16 +437,16 @@ int of_drconf_to_nid_single(struct drmem_lmb *lmb)
>>>   	int nid = default_nid;
>>>   	int rc, index;
>>>   
>>> -	if ((min_common_depth < 0) || !numa_enabled)
>>> +	if ((primary_domain_index < 0) || !numa_enabled)
>>>   		return default_nid;
>>>   
>>>   	rc = of_get_assoc_arrays(&aa);
>>>   	if (rc)
>>>   		return default_nid;
>>>   
>>> -	if (min_common_depth <= aa.array_sz &&
>>> +	if (primary_domain_index <= aa.array_sz &&
>>>   	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_arrays) {
>>> -		index = lmb->aa_index * aa.array_sz + min_common_depth - 1;
>>> +		index = lmb->aa_index * aa.array_sz + primary_domain_index - 1;
>>>   		nid = of_read_number(&aa.arrays[index], 1);
>>>   
>>>   		if (nid == 0xffff || nid >= nr_node_ids)
>>> @@ -708,18 +708,18 @@ static int __init parse_numa_properties(void)
>>>   		return -1;
>>>   	}
>>>   
>>> -	min_common_depth = find_min_common_depth();
>>> +	primary_domain_index = find_primary_domain_index();
>>>   
>>> -	if (min_common_depth < 0) {
>>> +	if (primary_domain_index < 0) {
>>>   		/*
>>> -		 * if we fail to parse min_common_depth from device tree
>>> +		 * if we fail to parse primary_domain_index from device tree
>>>   		 * mark the numa disabled, boot with numa disabled.
>>>   		 */
>>>   		numa_enabled = false;
>>> -		return min_common_depth;
>>> +		return primary_domain_index;
>>>   	}
>>>   
>>> -	dbg("NUMA associativity depth for CPU/Memory: %d\n", min_common_depth);
>>> +	dbg("NUMA associativity depth for CPU/Memory: %d\n", primary_domain_index);
>>>   
>>>   	/*
>>>   	 * Even though we connect cpus to numa domains later in SMP
>>> @@ -919,14 +919,14 @@ static void __init find_possible_nodes(void)
>>>   			goto out;
>>>   	}
>>>   
>>> -	max_nodes = of_read_number(&domains[min_common_depth], 1);
>>> +	max_nodes = of_read_number(&domains[primary_domain_index], 1);
>>>   	for (i = 0; i < max_nodes; i++) {
>>>   		if (!node_possible(i))
>>>   			node_set(i, node_possible_map);
>>>   	}
>>>   
>>>   	prop_length /= sizeof(int);
>>> -	if (prop_length > min_common_depth + 2)
>>> +	if (prop_length > primary_domain_index + 2)
>>>   		coregroup_enabled = 1;
>>>   
>>>   out:
>>> @@ -1259,7 +1259,7 @@ int cpu_to_coregroup_id(int cpu)
>>>   		goto out;
>>>   
>>>   	index = of_read_number(associativity, 1);
>>> -	if (index > min_common_depth + 1)
>>> +	if (index > primary_domain_index + 1)
>>>   		return of_read_number(&associativity[index - 1], 1);
>>>   
>>>   out:
>>
> 
> 
> 

