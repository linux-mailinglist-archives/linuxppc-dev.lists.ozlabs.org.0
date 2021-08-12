Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CEF3E9D09
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 05:37:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlXSG525nz3bmm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 13:37:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jwu+Qrbh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jwu+Qrbh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlXRS2gRmz2yNG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 13:36:35 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17C3Y1YY033107; Wed, 11 Aug 2021 23:36:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=L4a3VFcAeDArUKfuwq22defiazqkGdMWb3L5rXVLASo=;
 b=jwu+QrbhoAKQ6BK95m0PLllrxKIeqZEarw+ncre88XAFlojrQHRnWcwmnexGFjbzKT8J
 sOUgJ/uATEguIKWL94afTiWbUrpYOBGt9KZa+FZXoF8ztkkjb1jXiZdokU5dORXsEX6r
 LZ0EgRli5IGNz8PsjIGE9f1sfKGUYTIOAjDetmUz6pfeDUMKOI2CWGvSd6A4pzSS3v9Y
 5sFQNKFCUZwggnu5Se8DlEFEahis1h68LQy6Zx1UccHxnD+yLL/zZ774L/b9HMfVKmpD
 oV5IJA53JsefXNWPDaxLLWwpZC//2Hhdn8L8uJr71CK0ZF5Gza5ze0nvAlnn8ngTFNbR 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3acm6e1ae9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 23:36:26 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17C3YLSM036975;
 Wed, 11 Aug 2021 23:36:26 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3acm6e1adv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 23:36:26 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17C3Qr6V020096;
 Thu, 12 Aug 2021 03:36:24 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3abaq4bt4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Aug 2021 03:36:24 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17C3aMlY30146994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Aug 2021 03:36:22 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E04AC4C04E;
 Thu, 12 Aug 2021 03:36:21 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D4494C05E;
 Thu, 12 Aug 2021 03:36:20 +0000 (GMT)
Received: from [9.199.50.186] (unknown [9.199.50.186])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 12 Aug 2021 03:36:20 +0000 (GMT)
Subject: Re: [PATCH v7 5/6] powerpc/pseries: Add support for FORM2
 associativity
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210809052434.53978-1-aneesh.kumar@linux.ibm.com>
 <20210809052434.53978-6-aneesh.kumar@linux.ibm.com> <YRHsXDPaEZyLGLl+@yekko>
 <87a6loaagz.fsf@linux.ibm.com> <YRR8Z0EhlXgEKtY8@yekko>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <a5f351e5-41a0-f50f-078a-dddae3d3be09@linux.ibm.com>
Date: Thu, 12 Aug 2021 09:06:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRR8Z0EhlXgEKtY8@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TbxEjSyzYu_svvFKS_2nvGP7e7oMSvgJ
X-Proofpoint-GUID: MMZ9omtY5LTjwTHQ2Gwafk9lhiELwOk1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-12_01:2021-08-11,
 2021-08-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=928 malwarescore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108120021
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

On 8/12/21 7:11 AM, David Gibson wrote:
> On Wed, Aug 11, 2021 at 09:39:32AM +0530, Aneesh Kumar K.V wrote:
>> David Gibson <david@gibson.dropbear.id.au> writes:
>>
>>> On Mon, Aug 09, 2021 at 10:54:33AM +0530, Aneesh Kumar K.V wrote:
>>>> PAPR interface currently supports two different ways of communicating resource
>>>> grouping details to the OS. These are referred to as Form 0 and Form 1
>>>> associativity grouping. Form 0 is the older format and is now considered
>>>> deprecated. This patch adds another resource grouping named FORM2.
>>>>
>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>
>>> LGTM, with the exception of some minor nits noted below.
>> ...
>>
>>> +
>>>> +	for (i = 0; i < max_numa_index; i++)
>>>> +		/* +1 skip the max_numa_index in the property */
>>>> +		numa_id_index_table[i] = of_read_number(&numa_lookup_index[i + 1], 1);
>>>> +
>>>> +
>>>> +	if (numa_dist_table_length != max_numa_index * max_numa_index) {
>>>> +
>>>
>>> Stray extra whitespace line here.
>>>
>>>> +		WARN(1, "Wrong NUMA distance information\n");
>>>> +		/* consider everybody else just remote. */
>>>> +		for (i = 0;  i < max_numa_index; i++) {
>>>> +			for (j = 0; j < max_numa_index; j++) {
>>>> +				int nodeA = numa_id_index_table[i];
>>>> +				int nodeB = numa_id_index_table[j];
>>>> +
>>>> +				if (nodeA == nodeB)
>>>> +					numa_distance_table[nodeA][nodeB] = LOCAL_DISTANCE;
>>>> +				else
>>>> +					numa_distance_table[nodeA][nodeB] = REMOTE_DISTANCE;
>>>> +			}
>>>> +		}
>>>
>>> I don't think it's necessarily a problem, but something to consider is
>>> that this fallback will initialize distance for *all* node IDs,
>>> whereas the normal path will only initialize it for nodes that are in
>>> the index table.  Since some later error checks key off whether
>>> certain fields in the distance table are initialized, is that the
>>> outcome you want?
>>>
>>
>> With the device tree details not correct, one of the possible way to
>> make progress is to consider everybody remote. With new node hotplug
>> support we used to check whether the distance table entry is
>> initialized. With the updated spec, we expect all possible numa node
>> distance to be available during boot.
> 
> Sure.  But my main point here is that the fallback behaviour in this
> clause is different from the fallback behaviour if the table is there
> and parseable, but incomplete - which is also not expected.
> 

With FORM2 fallback with bad device tree details is to consider 
everybody REMOTE. With Form1, we leave the distance table not populated 
as it was with the current kernel versions.

-aneesh
