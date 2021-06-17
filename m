Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A343AB208
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 13:11:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5KBc14Flz3c2C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 21:11:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UNResX6Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UNResX6Y; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5KB63CgYz30Bc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 21:11:25 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HB5BvU074862; Thu, 17 Jun 2021 07:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=IpENFodm56vOhhNe0lTu7gJkQK1p0wQY0RG/G4Q7+y4=;
 b=UNResX6YVnhk/yaphy+SBncZM1ZlTYrLUq5rVg4wy4viHCERPYy2fPBToVWhApRK8t6/
 jk5dzJmEXEITJKR6gMZJLrpcU26oixSbvyLkF+tUbprGWXryO1tcZhHe8qquCAVsYMSm
 Ujk+03Fkk2m5kkeIx8PGT8c0wHpjumuZxaQojVYepKBUCHKheT4dME1uN281V6dD+428
 87vbsJkgXtSNcI8QWDqmeLQEquikiHEbLZATY0HJJBVKqp440ggURYW4qJ9QJauNPcaO
 HpDzRDN/SyBB8f85Gmc7kNdP9KgDNDmJ169OYZhD2WVbqpxZODDtXnVoDaOXqTK1ubl7 hA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398419amv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 07:11:19 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HB5LJg076135;
 Thu, 17 Jun 2021 07:11:19 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398419amuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 07:11:19 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HB232q008337;
 Thu, 17 Jun 2021 11:11:18 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 394mjat6eu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 11:11:18 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HBBHTO33292668
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 11:11:17 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8168C28066;
 Thu, 17 Jun 2021 11:11:17 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7FD12805C;
 Thu, 17 Jun 2021 11:11:15 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.102.31.110])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 11:11:15 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC PATCH 8/8] powerpc/papr_scm: Use FORM2 associativity details
In-Reply-To: <ae4a2ec4-cb34-313b-df08-126998815e47@gmail.com>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-9-aneesh.kumar@linux.ibm.com>
 <YMgkyfc4g+na5GJZ@yekko> <87czsnoejl.fsf@linux.ibm.com>
 <YMhKEJ9WSlapuSE6@yekko> <87a6nrobf6.fsf@linux.ibm.com>
 <YMr92K2gaidDHeqC@yekko> <ae4a2ec4-cb34-313b-df08-126998815e47@gmail.com>
Date: Thu, 17 Jun 2021 16:41:13 +0530
Message-ID: <87r1h0n3u6.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dz3rie_v4iXd4dAQP4Sh_Yzde1jwlqDL
X-Proofpoint-GUID: kVa5ES6gg5PLSqfGvPLz71Ym9fowwOrB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_05:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106170074
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

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> On 6/17/21 4:46 AM, David Gibson wrote:
>> On Tue, Jun 15, 2021 at 12:35:17PM +0530, Aneesh Kumar K.V wrote:
>>> David Gibson <david@gibson.dropbear.id.au> writes:
>>>
>>>> On Tue, Jun 15, 2021 at 11:27:50AM +0530, Aneesh Kumar K.V wrote:
>>>>> David Gibson <david@gibson.dropbear.id.au> writes:
>>>>>
>>>>>> On Mon, Jun 14, 2021 at 10:10:03PM +0530, Aneesh Kumar K.V wrote:
>>>>>>> FORM2 introduce a concept of secondary domain which is identical to the
>>>>>>> conceept of FORM1 primary domain. Use secondary domain as the numa node
>>>>>>> when using persistent memory device. For DAX kmem use the logical domain
>>>>>>> id introduced in FORM2. This new numa node
>>>>>>>
>>>>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>>>>> ---
>>>>>>>   arch/powerpc/mm/numa.c                    | 28 +++++++++++++++++++++++
>>>>>>>   arch/powerpc/platforms/pseries/papr_scm.c | 26 +++++++++++++--------
>>>>>>>   arch/powerpc/platforms/pseries/pseries.h  |  1 +
>>>>>>>   3 files changed, 45 insertions(+), 10 deletions(-)
>>>>>>>
>>>>>>> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>>>>>>> index 86cd2af014f7..b9ac6d02e944 100644
>>>>>>> --- a/arch/powerpc/mm/numa.c
>>>>>>> +++ b/arch/powerpc/mm/numa.c
>>>>>>> @@ -265,6 +265,34 @@ static int associativity_to_nid(const __be32 *associativity)
>>>>>>>   	return nid;
>>>>>>>   }
>>>>>>>   
>>>>>>> +int get_primary_and_secondary_domain(struct device_node *node, int *primary, int *secondary)
>>>>>>> +{
>>>>>>> +	int secondary_index;
>>>>>>> +	const __be32 *associativity;
>>>>>>> +
>>>>>>> +	if (!numa_enabled) {
>>>>>>> +		*primary = NUMA_NO_NODE;
>>>>>>> +		*secondary = NUMA_NO_NODE;
>>>>>>> +		return 0;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	associativity = of_get_associativity(node);
>>>>>>> +	if (!associativity)
>>>>>>> +		return -ENODEV;
>>>>>>> +
>>>>>>> +	if (of_read_number(associativity, 1) >= primary_domain_index) {
>>>>>>> +		*primary = of_read_number(&associativity[primary_domain_index], 1);
>>>>>>> +		secondary_index = of_read_number(&distance_ref_points[1], 1);
>>>>>>
>>>>>> Secondary ID is always the second reference point, but primary depends
>>>>>> on the length of resources?  That seems very weird.
>>>>>
>>>>> primary_domain_index is distance_ref_point[0]. With Form2 we would find
>>>>> both primary and secondary domain ID same for all resources other than
>>>>> persistent memory device. The usage w.r.t. persistent memory is
>>>>> explained in patch 7.
>>>>
>>>> Right, I misunderstood
>>>>
>>>>>
>>>>> With Form2 the primary domainID and secondary domainID are used to identify the NUMA nodes
>>>>> the kernel should use when using persistent memory devices.
>>>>
>>>> This seems kind of bogus.  With Form1, the primary/secondary ID are a
>>>> sort of heirarchy of distance (things with same primary ID are very
>>>> close, things with same secondary are kinda-close, etc.).  With Form2,
>>>> it's referring to their effective node for different purposes.
>>>>
>>>> Using the same terms for different meanings seems unnecessarily
>>>> confusing.
>>>
>>> They are essentially domainIDs. The interpretation of them are different
>>> between Form1 and Form2. Hence I kept referring to them as primary and
>>> secondary domainID. Any suggestion on what to name them with Form2?
>> 
>> My point is that reusing associativity-reference-points for something
>> with completely unrelated semantics seems like a very poor choice.
>
>
> I agree that this reuse can be confusing. I could argue that there is
> precedent for that in PAPR - FORM0 puts a different spin on the same
> property as well - but there is no need to keep following existing PAPR
> practices in new spec (and some might argue it's best not to).
>
> As far as QEMU goes, renaming this property to "numa-associativity-mode"
> (just an example) is a quick change to do since we separated FORM1 and FORM2
> code over there.
>
> Doing such a rename can also help with the issue of having to describe new
> FORM2 semantics using "least significant boundary" or "primary domain" or
> any FORM0|FORM1 related terminology.
>

It is not just changing the name, we will then have to explain the
meaning of ibm,associativity-reference-points with FORM2 right?

With FORM2 we want to represent the topology better

 --------------------------------------------------------------------------------
|                                                         domainID 20            |
|   ---------------------------------------                                      |
|  |                            NUMA node1 |                                     |
|  |                                       |            --------------------     |
|  |    ProcB -------> MEMC                |           |        NUMA node40 |    |
|  |	|                                  |           |                    |    |
|  |	---------------------------------- |-------->  |  PMEMD             |    |
|  |                                       |            --------------------     |
|  |                                       |                                     |
|   ---------------------------------------                                      |
 --------------------------------------------------------------------------------

ibm,associativity:
        { 20, 1, 40}  -> PMEMD
        { 20, 1, 1}  -> PROCB/MEMC

is the suggested FORM2 representation.

-aneesh
