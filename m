Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A133AB2ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 13:46:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5Kyt3dcHz3bv2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 21:46:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gHLijvLD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gHLijvLD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5KyM0sJSz3bnT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 21:46:18 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HBXlwx179215; Thu, 17 Jun 2021 07:46:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=GjAO1pxgtCOJXPp6chNshriC7ZuGX2NjYg46hH7zcSM=;
 b=gHLijvLDv0dtO4jSr8jQmyEPTAgavkJw1QrE8rVFn2SWF2p+uaoEPN7l7po/0aCSL4/4
 CNsUXk/y720gEFuTEo88jQNXE2eTDMkTs2YwYgCDnx4CFi1vEIBzcTW0omFKGKlRV8Fl
 9ukNILh0FbGDqHMuFo05uS/m+jJ6SWnh5wH+mD2MyPUstXhfBt1ghpd09yN1OvYxqhNO
 62lKjIsHgCL3B5kpMLtoWG5oFsU3ot4kBFr+w8EZYZVnMfPFtVJ+Z9lwDKACqjmqlVxP
 Ewqpxt89UQqa7IA1235dqWep2h6OWQQl3sorx54LSNTKQAc8i8B9fC0bhlrDR4GtzJgY GA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398419bnm1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 07:46:12 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HBYbMV182319;
 Thu, 17 Jun 2021 07:46:11 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398419bnjv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 07:46:11 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HBasUi008214;
 Thu, 17 Jun 2021 11:46:09 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 394m6htnwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 11:46:09 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HBk7pB22282528
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 11:46:07 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00B3F11C04A;
 Thu, 17 Jun 2021 11:46:07 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDD5911C052;
 Thu, 17 Jun 2021 11:46:05 +0000 (GMT)
Received: from [9.102.31.110] (unknown [9.102.31.110])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 11:46:05 +0000 (GMT)
Subject: Re: [RFC PATCH 8/8] powerpc/papr_scm: Use FORM2 associativity details
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-9-aneesh.kumar@linux.ibm.com> <YMgkyfc4g+na5GJZ@yekko>
 <87czsnoejl.fsf@linux.ibm.com> <YMhKEJ9WSlapuSE6@yekko>
 <87a6nrobf6.fsf@linux.ibm.com> <YMr92K2gaidDHeqC@yekko>
 <ae4a2ec4-cb34-313b-df08-126998815e47@gmail.com>
 <87r1h0n3u6.fsf@linux.ibm.com>
Message-ID: <1115fa70-d021-b764-6dad-fc0a04271062@linux.ibm.com>
Date: Thu, 17 Jun 2021 17:16:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87r1h0n3u6.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WcNzHEfjAUiFRxKwl2wgxB9_EyGCdRYO
X-Proofpoint-GUID: lHQwwL4WhUCPZQR3CAtneg5ZOjCEUqQz
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_05:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106170076
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/17/21 4:41 PM, Aneesh Kumar K.V wrote:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> 
>> On 6/17/21 4:46 AM, David Gibson wrote:
>>> On Tue, Jun 15, 2021 at 12:35:17PM +0530, Aneesh Kumar K.V wrote:
>>>> David Gibson <david@gibson.dropbear.id.au> writes:
>>>>
>>>>> On Tue, Jun 15, 2021 at 11:27:50AM +0530, Aneesh Kumar K.V wrote:
>>>>>> David Gibson <david@gibson.dropbear.id.au> writes:
>>>>>>
>>>>>>> On Mon, Jun 14, 2021 at 10:10:03PM +0530, Aneesh Kumar K.V wrote:
>>>>>>>> FORM2 introduce a concept of secondary domain which is identical to the
>>>>>>>> conceept of FORM1 primary domain. Use secondary domain as the numa node
>>>>>>>> when using persistent memory device. For DAX kmem use the logical domain
>>>>>>>> id introduced in FORM2. This new numa node
>>>>>>>>
>>>>>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>>>>>> ---
>>>>>>>>    arch/powerpc/mm/numa.c                    | 28 +++++++++++++++++++++++
>>>>>>>>    arch/powerpc/platforms/pseries/papr_scm.c | 26 +++++++++++++--------
>>>>>>>>    arch/powerpc/platforms/pseries/pseries.h  |  1 +
>>>>>>>>    3 files changed, 45 insertions(+), 10 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>>>>>>>> index 86cd2af014f7..b9ac6d02e944 100644
>>>>>>>> --- a/arch/powerpc/mm/numa.c
>>>>>>>> +++ b/arch/powerpc/mm/numa.c
>>>>>>>> @@ -265,6 +265,34 @@ static int associativity_to_nid(const __be32 *associativity)
>>>>>>>>    	return nid;
>>>>>>>>    }
>>>>>>>>    
>>>>>>>> +int get_primary_and_secondary_domain(struct device_node *node, int *primary, int *secondary)
>>>>>>>> +{
>>>>>>>> +	int secondary_index;
>>>>>>>> +	const __be32 *associativity;
>>>>>>>> +
>>>>>>>> +	if (!numa_enabled) {
>>>>>>>> +		*primary = NUMA_NO_NODE;
>>>>>>>> +		*secondary = NUMA_NO_NODE;
>>>>>>>> +		return 0;
>>>>>>>> +	}
>>>>>>>> +
>>>>>>>> +	associativity = of_get_associativity(node);
>>>>>>>> +	if (!associativity)
>>>>>>>> +		return -ENODEV;
>>>>>>>> +
>>>>>>>> +	if (of_read_number(associativity, 1) >= primary_domain_index) {
>>>>>>>> +		*primary = of_read_number(&associativity[primary_domain_index], 1);
>>>>>>>> +		secondary_index = of_read_number(&distance_ref_points[1], 1);
>>>>>>>
>>>>>>> Secondary ID is always the second reference point, but primary depends
>>>>>>> on the length of resources?  That seems very weird.
>>>>>>
>>>>>> primary_domain_index is distance_ref_point[0]. With Form2 we would find
>>>>>> both primary and secondary domain ID same for all resources other than
>>>>>> persistent memory device. The usage w.r.t. persistent memory is
>>>>>> explained in patch 7.
>>>>>
>>>>> Right, I misunderstood
>>>>>
>>>>>>
>>>>>> With Form2 the primary domainID and secondary domainID are used to identify the NUMA nodes
>>>>>> the kernel should use when using persistent memory devices.
>>>>>
>>>>> This seems kind of bogus.  With Form1, the primary/secondary ID are a
>>>>> sort of heirarchy of distance (things with same primary ID are very
>>>>> close, things with same secondary are kinda-close, etc.).  With Form2,
>>>>> it's referring to their effective node for different purposes.
>>>>>
>>>>> Using the same terms for different meanings seems unnecessarily
>>>>> confusing.
>>>>
>>>> They are essentially domainIDs. The interpretation of them are different
>>>> between Form1 and Form2. Hence I kept referring to them as primary and
>>>> secondary domainID. Any suggestion on what to name them with Form2?
>>>
>>> My point is that reusing associativity-reference-points for something
>>> with completely unrelated semantics seems like a very poor choice.
>>
>>
>> I agree that this reuse can be confusing. I could argue that there is
>> precedent for that in PAPR - FORM0 puts a different spin on the same
>> property as well - but there is no need to keep following existing PAPR
>> practices in new spec (and some might argue it's best not to).
>>
>> As far as QEMU goes, renaming this property to "numa-associativity-mode"
>> (just an example) is a quick change to do since we separated FORM1 and FORM2
>> code over there.
>>
>> Doing such a rename can also help with the issue of having to describe new
>> FORM2 semantics using "least significant boundary" or "primary domain" or
>> any FORM0|FORM1 related terminology.
>>
> 
> It is not just changing the name, we will then have to explain the
> meaning of ibm,associativity-reference-points with FORM2 right?
> 
> With FORM2 we want to represent the topology better
> 
>   --------------------------------------------------------------------------------
> |                                                         domainID 20            |
> |   ---------------------------------------                                      |
> |  |                            NUMA node1 |                                     |
> |  |                                       |            --------------------     |
> |  |    ProcB -------> MEMC                |           |        NUMA node40 |    |
> |  |	|                                  |           |                    |    |
> |  |	---------------------------------- |-------->  |  PMEMD             |    |
> |  |                                       |            --------------------     |
> |  |                                       |                                     |
> |   ---------------------------------------                                      |
>   --------------------------------------------------------------------------------
> 
> ibm,associativity:
>          { 20, 1, 40}  -> PMEMD
>          { 20, 1, 1}  -> PROCB/MEMC
> 
> is the suggested FORM2 representation.
> 
>

We can simplify this as below too

ibm,associativity:
         { 20, 1, 40}  -> PMEMD
         { 20, 1 }  -> PROCB/MEMC

-aneesh
