Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 123373AB19D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 12:47:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5JfC5LLlz3c2B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 20:47:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DVvIopE/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DVvIopE/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5Jdj6VwQz2ym5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 20:46:49 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HAbhb1122067; Thu, 17 Jun 2021 06:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=LMVqwbZGpB9yS65/47WmCCNs7qAFeS00Ot95N/L3DNQ=;
 b=DVvIopE/5hPk7u5HBOcyh1bisFiTu50iBcYuQZL3JaM1GgCIB8ucd2XL6uhdrRlWbFWo
 hzx+4pGlzYavmNX6H/NO4xPo/ZlFSxOLb8b30NHLy3l3uQHV/kPtyxq0TJ+4HOgMkr2Z
 iad2fVmPA2gDs8Pg7Nj4y0I+s/lzrbFXZR5UgPaByvQtyhUwVHExu54R/HjxD+2UfrC5
 Dzr/dRTCeyfdVYLFildwxwRK/gk4TX9OomgSsdWy+E1jiyjUCTEik+zW5nW7iT/llQ0y
 Z3nS3yQ7HAaxTz9wk3mArlgubz/wfRa0V3o8JY8ZUL/A1yP1juJ4VCpxT6HoAowFVZ11 Pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3982vrv5em-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 06:46:40 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HAftkL130014;
 Thu, 17 Jun 2021 06:46:39 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3982vrv5e3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 06:46:39 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HAgstb004110;
 Thu, 17 Jun 2021 10:46:38 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 394mj91f9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 10:46:37 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HAkZUG29753764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 10:46:35 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51FFA11C04A;
 Thu, 17 Jun 2021 10:46:35 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4551211C058;
 Thu, 17 Jun 2021 10:46:34 +0000 (GMT)
Received: from [9.102.31.110] (unknown [9.102.31.110])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 10:46:34 +0000 (GMT)
Subject: Re: [RFC PATCH 7/8] powerpc/pseries: Add support for FORM2
 associativity
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-8-aneesh.kumar@linux.ibm.com> <YMgkMg0i/6L1SOPd@yekko>
 <87fsxjofw5.fsf@linux.ibm.com> <YMhH7X9Tfq95gY6r@yekko>
 <877divo9sk.fsf@linux.ibm.com> <YMr+1+sjhCN/XHY3@yekko>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <52cc006d-047d-e9eb-046e-1f21453f55d9@linux.ibm.com>
Date: Thu, 17 Jun 2021 16:16:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMr+1+sjhCN/XHY3@yekko>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8lLn02biNZgcO-X56eDe7M0t0TFuGxc6
X-Proofpoint-GUID: 2VQ5YJRV1lvrwUmLBjXjkgT-HmAtxje2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_05:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 adultscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106170070
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

On 6/17/21 1:20 PM, David Gibson wrote:
> On Tue, Jun 15, 2021 at 01:10:27PM +0530, Aneesh Kumar K.V wrote:
>> David Gibson <david@gibson.dropbear.id.au> writes:


....

>>>> PAPR defines "most significant" as below
>>>>
>>>> When the “ibm,architecture-vec-5” property byte 5 bit 0 has the value of one, the “ibm,associativ-
>>>> ity-reference-points” property indicates boundaries between associativity domains presented by the
>>>> “ibm,associativity” property containing “near” and “far” resources. The
>>>> first such boundary in the list represents the 1 based ordinal in the
>>>> associativity lists of the most significant boundary, with subsequent
>>>> entries indicating progressively less significant boundaries
>>>
>>> No... that's not a definition.  Like your draft PAPR uses the term
>>> while entirely failing to define it.  From what I can tell about how
>>> it is used the "most significant" boundary corresponds to what Linux
>>> simply thinks of as the node id.  But intuitively, I'd think of that
>>> as the "least significant" boundary, since that's basically the
>>> smallest granularity at which we care about NUMA distances.
>>>
>>>
>>>> I would interpret it as the boundary where we start defining NUMA
>>>> nodes.
>>>
>>> That isn't any clearer to me.
>>
>> How about calling it least significant boundary then?
> 
> Heck, no.  My whole point here is that the meaning is unclear: my
> first guess at the meaning is different from whoever wrote that text.
> We need to come up with a way of describing it that's clearer.
> 
>> The “ibm,associativity-reference-points” property contains one or more list of numbers
>> (domainID index) that represents the 1 based ordinal in the associativity lists of the
>> least significant boundary, with subsequent entries indicating progressively higher
>> significant boundaries.
>>
>> ex:
>> { primary domainID index, secondary domainID index, tertiary domainID index.. }
>>
>> Linux kernel uses the domainID of the least significant boundary (aka primary domain)
>> as the NUMA node id. Linux kernel computes NUMA distance between two domains by
>> recursively comparing if they belong to the same higher-level domains. For mismatch
>> at every higher level of the resource group, the kernel doubles the NUMA distance between
>> the comparing domains.
>>
>

Any suggestion on how to reword the above section then? We could say
associativity-reference-points is list of domainID index representing 
increasing hierarchy of resource group. I am not sure that explains it 
any better?

....
>>>> For ex: With domainID 0, 4, 5 we could do a 5x5 matrix to represent the
>>>> numa distance. Instead ibm,numa-lookup-index-table allows us to present
>>>> the same in a 3x3 matrix  distance[index0][index1] is the  distance
>>>> between NUMA node 0 and 4 and distance[index0][index2] is the distance
>>>> between NUMA node 0 and 5
>>>
>>> Right, I get the purpose of it, and I realized I misphrashed my
>>> question.  My point is that in a Form2 world, the *only* thing the
>>> associativity array is used for is to deduce its position in
>>> lookup-index-table.  Once you have have that for each resource, you
>>> have everything you need, yes?
>>
>>
>> ibm,associativity is used find the domainID/NUMA node id of the
>> resource.
>>
>> ibm,lookup-index-table is used compute the distance information between
>> NUMA nodes using ibm,numa-distance-table.
> 
> I get that you need to use lookup-index-table to work out how to
> interpret numa-distance-table.  My point is that IIUC once you've done
> the lookup in lookup-index-table once for each associativity array
> value, the number you get out (which just a compacted version of the
> node id) should be all you need ever again.
> 

That is correct. We will continue to use the index to nodeid map during 
DLPAR, if such an operation adds a new numa node. update_numa_distance() 
shows the detail.

-aneesh
