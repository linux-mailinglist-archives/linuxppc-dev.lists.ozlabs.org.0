Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B825C378C86
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 15:01:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ff1R35s4Jz306Y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 23:01:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tCvMjw3P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tCvMjw3P; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ff1QT6ckDz2ym4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 23:01:20 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14ACY4lv035857; Mon, 10 May 2021 09:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=JKevJ24GbocfghegZ4JHnukiJZdjdLq2k563NxcWWeI=;
 b=tCvMjw3PSaPSTkw09rCM69rRXfzCUvA1LWRBdH7TOxcRJX7s0Z62yGPzMCjZFSXDkugs
 XRLX4A+9OdowwaxniXBOiE7/Ni/qO4YD1OX8BHVgJIbbqCE+3IOvRvDJNCVGrCIJ06pi
 Ir1e1PZmBLZMUcmH+MSAN5JOBbSRVGPpUfSD31ODwNxC5c79NCar/cxDqhLSFrIvp/kb
 7sHIeoo+ytaqxLDTZ7Eicwx5p+GDh7e/8V+05xS8IFBobe13LGedYW3b0SLx938oXQGJ
 daDXit8oB+FwqlypH9h2uQSqxQf98WQaCxM1lg7RETw8BfwtGDeFXZtP5j2KtqWohpcu jw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38f30bmgrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 09:01:10 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14ACimxU009453;
 Mon, 10 May 2021 13:01:05 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 38ef37ganr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 13:01:05 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14AD12Lj30671318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 May 2021 13:01:02 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FDF8A4054;
 Mon, 10 May 2021 13:01:02 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBA3FA4065;
 Mon, 10 May 2021 13:01:01 +0000 (GMT)
Received: from pomme.local (unknown [9.145.174.43])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 10 May 2021 13:01:01 +0000 (GMT)
Subject: Re: [PATCH] ppc64/numa: consider the max numa node for migratable LPAR
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
References: <20210429181901.17674-1-ldufour@linux.ibm.com>
 <20210510102107.GR2633526@linux.vnet.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <97b19b51-783c-ba64-bb21-5ebedeebc4f0@linux.ibm.com>
Date: Mon, 10 May 2021 15:01:01 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210510102107.GR2633526@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wKE8B6PLpZTCzA5MjXwJNq6MDO5xMmUf
X-Proofpoint-ORIG-GUID: wKE8B6PLpZTCzA5MjXwJNq6MDO5xMmUf
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-10_07:2021-05-10,
 2021-05-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105100090
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
Cc: nathanl@linux.ibm.com, linux-kernel@vger.kernel.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 10/05/2021 à 12:21, Srikar Dronamraju a écrit :
> * Laurent Dufour <ldufour@linux.ibm.com> [2021-04-29 20:19:01]:
> 
>> When a LPAR is migratable, we should consider the maximum possible NUMA
>> node instead the number of NUMA node from the actual system.
>>
>> The DT property 'ibm,current-associativity-domains' is defining the maximum
>> number of nodes the LPAR can see when running on that box. But if the LPAR
>> is being migrated on another box, it may seen up to the nodes defined by
>> 'ibm,max-associativity-domains'. So if a LPAR is migratable, that value
>> should be used.
>>
>> Unfortunately, there is no easy way to know if a LPAR is migratable or
>> not. The hypervisor is exporting the property 'ibm,migratable-partition' in
>> the case it set to migrate partition, but that would not mean that the
>> current partition is migratable.
>>
>> Without that patch, when a LPAR is started on a 2 nodes box and then
>> migrated to a 3 nodes box, the hypervisor may spread the LPAR's CPUs on the
>> 3rd node. In that case if a CPU from that 3rd node is added to the LPAR, it
>> will be wrongly assigned to the node because the kernel has been set to use
> 
> 
>> up to 2 nodes (the configuration of the departure node). With that patch
>> applies, the CPU is correctly added to the 3rd node.
> 
> You probably meant, "With this patch applied"
> 
> Also you may want to add a fixes tag:

I'll fix "that" and add the fixes tag.

>> Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>> ---
>>   arch/powerpc/mm/numa.c | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>> index f2bf98bdcea2..673fa6e47850 100644
>> --- a/arch/powerpc/mm/numa.c
>> +++ b/arch/powerpc/mm/numa.c
>> @@ -893,7 +893,7 @@ static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
>>   static void __init find_possible_nodes(void)
>>   {
>>   	struct device_node *rtas;
>> -	const __be32 *domains;
>> +	const __be32 *domains = NULL;
>>   	int prop_length, max_nodes;
>>   	u32 i;
>>
>> @@ -909,9 +909,14 @@ static void __init find_possible_nodes(void)
>>   	 * it doesn't exist, then fallback on ibm,max-associativity-domains.
>>   	 * Current denotes what the platform can support compared to max
>>   	 * which denotes what the Hypervisor can support.
>> +	 *
>> +	 * If the LPAR is migratable, new nodes might be activated after a LPM,
>> +	 * so we should consider the max number in that case.
>>   	 */
>> -	domains = of_get_property(rtas, "ibm,current-associativity-domains",
>> -					&prop_length);
>> +	if (!of_get_property(of_root, "ibm,migratable-partition", NULL))
>> +		domains = of_get_property(rtas,
>> +					  "ibm,current-associativity-domains",
>> +					  &prop_length);
>>   	if (!domains) {
>>   		domains = of_get_property(rtas, "ibm,max-associativity-domains",
>>   					&prop_length);
>> @@ -920,6 +925,9 @@ static void __init find_possible_nodes(void)
>>   	}
>>
>>   	max_nodes = of_read_number(&domains[min_common_depth], 1);
>> +	printk(KERN_INFO "Partition configured for %d NUMA nodes.\n",
>> +	       max_nodes);
>> +
> 
> Another nit:
> you may want to make this pr_info instead of printk

Sure !

>>   	for (i = 0; i < max_nodes; i++) {
>>   		if (!node_possible(i))
>>   			node_set(i, node_possible_map);
>> -- 
>> 2.31.1
>>
> 
> Otherwise looks good to me.
> 
> Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

Thanks Srikar, I'll add you review tag in the v2.


