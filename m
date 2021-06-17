Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3650A3AB1CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 12:59:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5JwZ6CMJz3c29
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 20:59:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VN/uroVr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VN/uroVr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5Jw416DBz2yxq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 20:59:15 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HAXkRj098823; Thu, 17 Jun 2021 06:59:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=JVjR4yZAFLRkYtEoFiaeybGEa8lEUFvNOrR4dYyLGa0=;
 b=VN/uroVrVcFOIaH0jpIq1gygTdVNQPVpssFMxSc8tBYkH/lU88gHnExLFXyunic8k1D+
 yP3K9bRjBBoZLViOt/Igh4lsEEw2IPyyyN2I1a5s7VDa6jNdoenkmrQp/lGTffL01i4q
 N8EPFEc4VuervMtWvuYWQP7zlceW1oIFae9UyWkmtD4s4cw5WqVX9hTXqwtyJbLrErml
 AH/nmIvUNvoXdSAcleWVDN0+ElG2VWY90cG/1BUnA+WXMtsYH2wFYuXvTLzMcoh917Hy
 ILVycfDoQ1CE5UsjtK+2FWTS1vKb1ceaN5wSEyR6FGQ0AaeZWvlFPLUcBM8s98MLtKVU GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3984fc9cb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 06:59:08 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HAY2g3099731;
 Thu, 17 Jun 2021 06:59:08 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3984fc9ca8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 06:59:07 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HAx5NW016921;
 Thu, 17 Jun 2021 10:59:05 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 394m6h9fgb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 10:59:05 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15HAvvcE34603382
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 10:57:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 114E611C052;
 Thu, 17 Jun 2021 10:59:03 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2305511C04C;
 Thu, 17 Jun 2021 10:59:02 +0000 (GMT)
Received: from [9.102.31.110] (unknown [9.102.31.110])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 10:59:01 +0000 (GMT)
Subject: Re: [RFC PATCH 8/8] powerpc/papr_scm: Use FORM2 associativity details
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-9-aneesh.kumar@linux.ibm.com> <YMgkyfc4g+na5GJZ@yekko>
 <87czsnoejl.fsf@linux.ibm.com> <YMhKEJ9WSlapuSE6@yekko>
 <87a6nrobf6.fsf@linux.ibm.com> <YMr92K2gaidDHeqC@yekko>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <f88ac56a-646b-7c9b-1d01-5db38dc2a789@linux.ibm.com>
Date: Thu, 17 Jun 2021 16:29:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMr92K2gaidDHeqC@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VNzF_OtJHaBvdY6Qy2ho3T5Dl1ZHxPfk
X-Proofpoint-ORIG-GUID: rVEA5wgDRmvlGpc9c0Pp0UCtc7YZdV7o
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_05:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=991 spamscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170070
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

On 6/17/21 1:16 PM, David Gibson wrote:
> On Tue, Jun 15, 2021 at 12:35:17PM +0530, Aneesh Kumar K.V wrote:
>> David Gibson <david@gibson.dropbear.id.au> writes:
>>
>>> On Tue, Jun 15, 2021 at 11:27:50AM +0530, Aneesh Kumar K.V wrote:
>>>> David Gibson <david@gibson.dropbear.id.au> writes:

...

>>> It's weird to me that you'd want to consider them in different nodes
>>> for those different purposes.
>>
>>
>>     --------------------------------------
>>    |                            NUMA node0 |
>>    |    ProcA -----> MEMA                  |
>>    |     |                                 |
>>    |	|                                 |
>>    |	-------------------> PMEMB        |
>>    |                                       |
>>     ---------------------------------------
>>
>>     ---------------------------------------
>>    |                            NUMA node1 |
>>    |                                       |
>>    |    ProcB -------> MEMC                |
>>    |	|                                 |
>>    |	-------------------> PMEMD        |
>>    |                                       |
>>    |                                       |
>>     ---------------------------------------
>>   
>>
>> For a topology like the above application running of ProcA wants to find out
>> persistent memory mount local to its NUMA node. Hence when using it as
>> pmem fsdax mount or devdax device we want PMEMB to have associativity
>> of NUMA node0 and PMEMD to have associativity of NUMA node 1. But when
>> we want to use it as memory using dax kmem driver, we want both PMEMB
>> and PMEMD to appear as memory only NUMA node at a distance that is
>> derived based on the latency of the media.
> 
> I'm still not understanding why the latency we care about is different
> in the two cases.  Can you give an example of when this would result
> in different actual node assignments for the two different cases?
> 

In the above example in order allow use of PMEMB and PMEMD as memory 
only NUMA nodes
we need platform to represent them in its own domainID. Let's assume that
platform assigned id 40 and 41 and hence both PMEMB and PMEMD will have 
associativity array like below

{ 4, 6, 0}  -> PROCA/MEMA
{ 4, 6, 40} -> PMEMB
{ 4, 6, 41} -> PMEMD
{ 4, 6, 1} ->  PROCB/MEMB

When we want to use this device PMEMB and PMEMD as fsdax/devdax devices, 
we essentially look for the first nearest online node. Which means both 
PMEMB and PMEMD will appear as devices attached to node0. That is not 
ideal for for many applications.

using secondary domainID index as explained here helps to associate
each PMEM device to the right group. On a non virtualized config or hard 
partitioned config such a device tree representation can be looked at as 
a hint to identify which socket the actual device is connected to.

-aneesh
