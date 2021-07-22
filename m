Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 636C63D1EAB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jul 2021 09:10:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVk9Z1wKXz3bg3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jul 2021 17:10:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C/fxPCyQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=C/fxPCyQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVk8z27yPz2yNk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jul 2021 17:09:39 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16M74bTl058144; Thu, 22 Jul 2021 03:09:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=Sk9WY5pUCdCbiZa8tQJ+856k+RqUIPmmAx88POrBnMM=;
 b=C/fxPCyQjHwbI00X+MwJUcxU53UOb0tsCLrL8gPqSS1d/6OgXG2CFC7ACJY0QG9rxFPF
 MgM0vZKcPqcqI+G1u6juTYOCgeMKxemeEMbHG72KnmfzOXklr0Pl8CxiPcuIQK7YtkJ2
 je/I6hORYgJDDCAi+gVyn+CilcUdC7LDpb+tc7a+IjpCnaCWKaul3qJJEJScVHhT5e5Y
 rAXyZO2TrdmqpmHkt+E95/HDckezO1uW5w3ORVscjx6wtKEBliZ1NRBDtlAwXdK1ufru
 lSbsVrZazVHDr2RtXBWVQR07wVomX9iAgw/vnXQ2VWwBYrc/LDkJBd2WvwezsIE8yZND Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39y3g6rs8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 03:09:32 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16M74fI1058650;
 Thu, 22 Jul 2021 03:09:32 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39y3g6rs8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 03:09:32 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16M72CiU004035;
 Thu, 22 Jul 2021 07:09:31 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 39upucw7pq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 07:09:31 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16M79VOc37355806
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jul 2021 07:09:31 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59839112066;
 Thu, 22 Jul 2021 07:09:31 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8577D112065;
 Thu, 22 Jul 2021 07:09:29 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.40.113])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 22 Jul 2021 07:09:29 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v5 5/6] powerpc/pseries: Add a helper for form1 cpu
 distance
In-Reply-To: <YPjM/5/KdKs4MNj1@yekko>
References: <20210628151117.545935-1-aneesh.kumar@linux.ibm.com>
 <20210628151117.545935-6-aneesh.kumar@linux.ibm.com>
 <YPjM/5/KdKs4MNj1@yekko>
Date: Thu, 22 Jul 2021 12:39:27 +0530
Message-ID: <87wnpiu8ns.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8GTohrOCN-pf0e_ff-gsTIZD9yg6YFx6
X-Proofpoint-ORIG-GUID: rBCUXVLFeGFdv5ku-LSty4kr51H6Ijx_
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-22_03:2021-07-22,
 2021-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

> On Mon, Jun 28, 2021 at 08:41:16PM +0530, Aneesh Kumar K.V wrote:
>> This helper is only used with the dispatch trace log collection.
>> A later patch will add Form2 affinity support and this change helps
>> in keeping that simpler. Also add a comment explaining we don't expect
>> the code to be called with FORM0
>> 
>> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>
> What makes it a "relative_distance" rather than just a "distance"?

I added that to indicate that the function is not returning the actual
distance but a number indicative of 'near', 'far' etc. (it actually returns
1, 2 etc).

>
>> ---
>>  arch/powerpc/include/asm/topology.h   |  4 ++--
>>  arch/powerpc/mm/numa.c                | 10 +++++++++-
>>  arch/powerpc/platforms/pseries/lpar.c |  4 ++--
>>  3 files changed, 13 insertions(+), 5 deletions(-)
>> 
>> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
>> index e4db64c0e184..ac8b5ed79832 100644
>> --- a/arch/powerpc/include/asm/topology.h
>> +++ b/arch/powerpc/include/asm/topology.h
>> @@ -36,7 +36,7 @@ static inline int pcibus_to_node(struct pci_bus *bus)
>>  				 cpu_all_mask :				\
>>  				 cpumask_of_node(pcibus_to_node(bus)))
>>  
>> -extern int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc);
>> +int cpu_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc);
>>  extern int __node_distance(int, int);
>>  #define node_distance(a, b) __node_distance(a, b)
>>  
>> @@ -83,7 +83,7 @@ static inline void sysfs_remove_device_from_node(struct device *dev,
>>  
>>  static inline void update_numa_cpu_lookup_table(unsigned int cpu, int node) {}
>>  
>> -static inline int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
>> +static inline int cpu_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
>>  {
>>  	return 0;
>>  }
>> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>> index 7b142f79d600..c6293037a103 100644
>> --- a/arch/powerpc/mm/numa.c
>> +++ b/arch/powerpc/mm/numa.c
>> @@ -166,7 +166,7 @@ static void unmap_cpu_from_node(unsigned long cpu)
>>  }
>>  #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
>>  
>> -int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
>> +static int __cpu_form1_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
>>  {
>>  	int dist = 0;
>>  
>> @@ -182,6 +182,14 @@ int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
>>  	return dist;
>>  }
>>  
>> +int cpu_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
>> +{
>> +	/* We should not get called with FORM0 */
>> +	VM_WARN_ON(affinity_form == FORM0_AFFINITY);
>> +
>> +	return __cpu_form1_relative_distance(cpu1_assoc, cpu2_assoc);
>> +}
>> +
>>  /* must hold reference to node during call */
>>  static const __be32 *of_get_associativity(struct device_node *dev)
>>  {
>> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
>> index dab356e3ff87..afefbdfe768d 100644
>> --- a/arch/powerpc/platforms/pseries/lpar.c
>> +++ b/arch/powerpc/platforms/pseries/lpar.c
>> @@ -261,7 +261,7 @@ static int cpu_relative_dispatch_distance(int last_disp_cpu, int cur_disp_cpu)
>>  	if (!last_disp_cpu_assoc || !cur_disp_cpu_assoc)
>>  		return -EIO;
>>  
>> -	return cpu_distance(last_disp_cpu_assoc, cur_disp_cpu_assoc);
>> +	return cpu_relative_distance(last_disp_cpu_assoc, cur_disp_cpu_assoc);
>>  }
>>  
>>  static int cpu_home_node_dispatch_distance(int disp_cpu)
>> @@ -281,7 +281,7 @@ static int cpu_home_node_dispatch_distance(int disp_cpu)
>>  	if (!disp_cpu_assoc || !vcpu_assoc)
>>  		return -EIO;
>>  
>> -	return cpu_distance(disp_cpu_assoc, vcpu_assoc);
>> +	return cpu_relative_distance(disp_cpu_assoc, vcpu_assoc);
>>  }
>>  
>>  static void update_vcpu_disp_stat(int disp_cpu)
>
> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson
