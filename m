Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9623A76D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 07:58:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3yKy3sd1z3btB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 15:58:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y2khVMCD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Y2khVMCD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3yKS2JBWz2yxS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 15:58:03 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15F5YKQJ085228; Tue, 15 Jun 2021 01:57:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=07tTVPoE4sfLRHIhLI4Los8eIFmg3F1zZiWEuudYp5U=;
 b=Y2khVMCDDXcl2LNDkJ2MD0fQapBBODmupMOpTSzDN+5I7fdTH0RjL0yDvnuLcxC6//4l
 8kv3jfbo2a4qmaH2AEoEYYheuwW5cT2KgcOGenILiR1U1Kym0gjDbQEkC68LeIt3hbro
 L8EELZ7WAiXlo9f3+exHYtgw78NhCPU7vjZ0EOmp2HNUerY5NIZ4V6iVPpEoRa8fXduZ
 Q9LqzXO3jd72t8dlASK85m6CY3woWkt8nEtduvnwQMj+KRygkgudydAW7KXVSpizlOB1
 okrwT1Dl5fJNFp/aTRO1zQA12OpnVGVEzrSy8ochVsZULUikhkAFob8QMFwQSS7UOb5u tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 396ng99kc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 01:57:56 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15F5YKUt085249;
 Tue, 15 Jun 2021 01:57:55 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 396ng99kc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 01:57:55 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15F5vtFZ013576;
 Tue, 15 Jun 2021 05:57:55 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 394mj9d997-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 05:57:55 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15F5vsA736962744
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 05:57:54 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73AF0136059;
 Tue, 15 Jun 2021 05:57:54 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E331013604F;
 Tue, 15 Jun 2021 05:57:52 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.54.82])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jun 2021 05:57:52 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC PATCH 8/8] powerpc/papr_scm: Use FORM2 associativity details
In-Reply-To: <YMgkyfc4g+na5GJZ@yekko>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-9-aneesh.kumar@linux.ibm.com>
 <YMgkyfc4g+na5GJZ@yekko>
Date: Tue, 15 Jun 2021 11:27:50 +0530
Message-ID: <87czsnoejl.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NDZfzD_75IisM63xnVm-td3lcqfhNeNr
X-Proofpoint-ORIG-GUID: qjkObLNgRrNaZ2-5vHUekT17dBSt-ZYR
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_03:2021-06-14,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150032
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

> On Mon, Jun 14, 2021 at 10:10:03PM +0530, Aneesh Kumar K.V wrote:
>> FORM2 introduce a concept of secondary domain which is identical to the
>> conceept of FORM1 primary domain. Use secondary domain as the numa node
>> when using persistent memory device. For DAX kmem use the logical domain
>> id introduced in FORM2. This new numa node
>> 
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  arch/powerpc/mm/numa.c                    | 28 +++++++++++++++++++++++
>>  arch/powerpc/platforms/pseries/papr_scm.c | 26 +++++++++++++--------
>>  arch/powerpc/platforms/pseries/pseries.h  |  1 +
>>  3 files changed, 45 insertions(+), 10 deletions(-)
>> 
>> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>> index 86cd2af014f7..b9ac6d02e944 100644
>> --- a/arch/powerpc/mm/numa.c
>> +++ b/arch/powerpc/mm/numa.c
>> @@ -265,6 +265,34 @@ static int associativity_to_nid(const __be32 *associativity)
>>  	return nid;
>>  }
>>  
>> +int get_primary_and_secondary_domain(struct device_node *node, int *primary, int *secondary)
>> +{
>> +	int secondary_index;
>> +	const __be32 *associativity;
>> +
>> +	if (!numa_enabled) {
>> +		*primary = NUMA_NO_NODE;
>> +		*secondary = NUMA_NO_NODE;
>> +		return 0;
>> +	}
>> +
>> +	associativity = of_get_associativity(node);
>> +	if (!associativity)
>> +		return -ENODEV;
>> +
>> +	if (of_read_number(associativity, 1) >= primary_domain_index) {
>> +		*primary = of_read_number(&associativity[primary_domain_index], 1);
>> +		secondary_index = of_read_number(&distance_ref_points[1], 1);
>
> Secondary ID is always the second reference point, but primary depends
> on the length of resources?  That seems very weird.

primary_domain_index is distance_ref_point[0]. With Form2 we would find
both primary and secondary domain ID same for all resources other than
persistent memory device. The usage w.r.t. persistent memory is
explained in patch 7.

With Form2 the primary domainID and secondary domainID are used to identify the NUMA nodes
the kernel should use when using persistent memory devices. Persistent memory devices
can also be used as regular memory using DAX KMEM driver and primary domainID indicates
the numa node number OS should use when using these devices as regular memory. Secondary
domainID is the numa node number that should be used when using this device as
persistent memory. In the later case, we are interested in the locality of the
device to an established numa node. In the above example, if the last row represents a
persistent memory device/resource, NUMA node number 40 will be used when using the device
as regular memory and NUMA node number 0 will be the device numa node when using it as
a persistent memory device.


>
>> +		*secondary = of_read_number(&associativity[secondary_index], 1);
>> +	}
>> +	if (*primary == 0xffff || *primary >= nr_node_ids)
>> +		*primary = NUMA_NO_NODE;
>> +
>> +	if (*secondary == 0xffff || *secondary >= nr_node_ids)
>> +		*secondary = NUMA_NO_NODE;
>> +	return 0;
>> +}
>> +
>>  /* Returns the nid associated with the given device tree node,
>>   * or -1 if not found.
>>   */
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>> index ef26fe40efb0..9bf2f1f3ddc5 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> @@ -18,6 +18,7 @@
>>  #include <asm/plpar_wrappers.h>
>>  #include <asm/papr_pdsm.h>
>>  #include <asm/mce.h>
>> +#include "pseries.h"
>>  
>>  #define BIND_ANY_ADDR (~0ul)
>>  
>> @@ -88,6 +89,8 @@ struct papr_scm_perf_stats {
>>  struct papr_scm_priv {
>>  	struct platform_device *pdev;
>>  	struct device_node *dn;
>> +	int numa_node;
>> +	int target_node;
>>  	uint32_t drc_index;
>>  	uint64_t blocks;
>>  	uint64_t block_size;
>> @@ -923,7 +926,6 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>>  	struct nd_mapping_desc mapping;
>>  	struct nd_region_desc ndr_desc;
>>  	unsigned long dimm_flags;
>> -	int target_nid, online_nid;
>>  	ssize_t stat_size;
>>  
>>  	p->bus_desc.ndctl = papr_scm_ndctl;
>> @@ -974,10 +976,8 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>>  	mapping.size = p->blocks * p->block_size; // XXX: potential overflow?
>>  
>>  	memset(&ndr_desc, 0, sizeof(ndr_desc));
>> -	target_nid = dev_to_node(&p->pdev->dev);
>> -	online_nid = numa_map_to_online_node(target_nid);
>> -	ndr_desc.numa_node = online_nid;
>> -	ndr_desc.target_node = target_nid;
>> +	ndr_desc.numa_node = p->numa_node;
>> +	ndr_desc.target_node = p->target_node;
>>  	ndr_desc.res = &p->res;
>>  	ndr_desc.of_node = p->dn;
>>  	ndr_desc.provider_data = p;
>> @@ -1001,9 +1001,6 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>>  				ndr_desc.res, p->dn);
>>  		goto err;
>>  	}
>> -	if (target_nid != online_nid)
>> -		dev_info(dev, "Region registered with target node %d and online node %d",
>> -			 target_nid, online_nid);
>>  
>>  	mutex_lock(&papr_ndr_lock);
>>  	list_add_tail(&p->region_list, &papr_nd_regions);
>> @@ -1096,7 +1093,7 @@ static int papr_scm_probe(struct platform_device *pdev)
>>  	struct papr_scm_priv *p;
>>  	const char *uuid_str;
>>  	u64 uuid[2];
>> -	int rc;
>> +	int rc, numa_node;
>>  
>>  	/* check we have all the required DT properties */
>>  	if (of_property_read_u32(dn, "ibm,my-drc-index", &drc_index)) {
>> @@ -1119,11 +1116,20 @@ static int papr_scm_probe(struct platform_device *pdev)
>>  		return -ENODEV;
>>  	}
>>  
>> -
>>  	p = kzalloc(sizeof(*p), GFP_KERNEL);
>>  	if (!p)
>>  		return -ENOMEM;
>>  
>> +	if (get_primary_and_secondary_domain(dn, &p->target_node, &numa_node)) {
>> +		dev_err(&pdev->dev, "%pOF: missing NUMA attributes!\n", dn);
>> +		rc = -ENODEV;
>> +		goto err;
>> +	}
>> +	p->numa_node = numa_map_to_online_node(numa_node);
>> +	if (numa_node != p->numa_node)
>> +		dev_info(&pdev->dev, "Region registered with online node %d and device tree node %d",
>> +			 p->numa_node, numa_node);
>> +
>>  	/* Initialize the dimm mutex */
>>  	mutex_init(&p->health_mutex);
>>  
>> diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
>> index 663a0859cf13..9c2a1fc9ded1 100644
>> --- a/arch/powerpc/platforms/pseries/pseries.h
>> +++ b/arch/powerpc/platforms/pseries/pseries.h
>> @@ -114,4 +114,5 @@ void pseries_setup_security_mitigations(void);
>>  void pseries_lpar_read_hblkrm_characteristics(void);
>>  
>>  void update_numa_distance(struct device_node *node);
>> +int get_primary_and_secondary_domain(struct device_node *node, int *primary, int *secondary);
>>  #endif /* _PSERIES_PSERIES_H */
>
> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson
