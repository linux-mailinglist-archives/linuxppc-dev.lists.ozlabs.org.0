Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F3C74F470
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 18:08:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J9NqpYCC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0m4t21dTz3ccG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 02:08:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J9NqpYCC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0m411rPVz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 02:07:45 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36BFqA2L009235;
	Tue, 11 Jul 2023 16:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+De1sU6FqlwNdyLLvwyoRsxxyXaDI5H9wM2G/9fAHM0=;
 b=J9NqpYCC8Dz6aWsewAHHHk3QMDwtguU7cB2NvvlQgXAFz5UKRTHe6Sv6YYxM4sDM2d/X
 bO4Q7slOeRJLdTaaFq4XVLhLytpADSsXp8EyYbLuUB21Hh2CadZ8xP9ogpCBTMtASOmS
 LpwTyYak82ezRnKyY0Wg+ctxS9K2WRL5+bjAoKkM7mlWCtcMSsepUfMf+z+rj0HhBQgn
 UR43iNHwqA9YbSWFA25OerNSgZyIwD7sBksmQnfzYwojpyQ6zSThc7ymHrA3ADP8Mcoe
 2qa0eirf06kJKB5GhKPSVm+sMYF3JHTO0RU8NUV6G9oNnou/NktJB+8SquQHC2m5+VhZ Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rsa3m0fwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 16:07:27 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36BFqck2010246;
	Tue, 11 Jul 2023 16:07:26 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rsa3m0fmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 16:07:25 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36BBJQ9u002438;
	Tue, 11 Jul 2023 16:07:14 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3rpye51dby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 16:07:14 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36BG7B3q41222864
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jul 2023 16:07:11 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE7B420040;
	Tue, 11 Jul 2023 16:07:11 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B4E5920043;
	Tue, 11 Jul 2023 16:07:08 +0000 (GMT)
Received: from [9.43.86.43] (unknown [9.43.86.43])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Jul 2023 16:07:08 +0000 (GMT)
Message-ID: <176cee16-f926-ab3b-92fe-98bebf79d43d@linux.ibm.com>
Date: Tue, 11 Jul 2023 21:37:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 3/7] mm/hotplug: Allow architecture to override memmap
 on memory support check
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
 <20230711044834.72809-4-aneesh.kumar@linux.ibm.com>
 <6f6764f6-4b5a-dfa8-c409-ba4f2828891f@redhat.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <6f6764f6-4b5a-dfa8-c409-ba4f2828891f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jZ2kgdmqQipp5edIYDqms1H1mlpO6OKU
X-Proofpoint-ORIG-GUID: kOkwRnZsUR067zkXIwHaGQBY_OLq856B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_08,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307110144
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/11/23 4:06 PM, David Hildenbrand wrote:
> On 11.07.23 06:48, Aneesh Kumar K.V wrote:
>> Some architectures would want different restrictions. Hence add an
>> architecture-specific override.
>>
>> Both the PMD_SIZE check and pageblock alignment check are moved there.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   mm/memory_hotplug.c | 17 ++++++++++++-----
>>   1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>> index 1b19462f4e72..07c99b0cc371 100644
>> --- a/mm/memory_hotplug.c
>> +++ b/mm/memory_hotplug.c
>> @@ -1247,12 +1247,20 @@ static int online_memory_block(struct memory_block *mem, void *arg)
>>       return device_online(&mem->dev);
>>   }
>>   -static bool mhp_supports_memmap_on_memory(unsigned long size)
>> +#ifndef arch_supports_memmap_on_memory
> 
> Can we make that a __weak function instead?


We can. It is confusing because we do have these two patterns within the kernel where we use 

#ifndef x
#endif 

vs

__weak x 

What is the recommended way to override ? I have mostly been using #ifndef for most of the arch overrides till now.


> 
>> +static inline bool arch_supports_memmap_on_memory(unsigned long size)
>>   {
>> -    unsigned long nr_vmemmap_pages = size / PAGE_SIZE;
>> +    unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
>>       unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
>>       unsigned long remaining_size = size - vmemmap_size;
>>   +    return IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
>> +        IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));
> 
> You're moving that check back to mhp_supports_memmap_on_memory() in the following patch, where it actually belongs. So this check should stay in mhp_supports_memmap_on_memory(). Might be reasonable to factor out the vmemmap_size calculation.
> 
> 
> Also, let's a comment
> 
> /*
>  * As default, we want the vmemmap to span a complete PMD such that we
>  * can map the vmemmap using a single PMD if supported by the
>  * architecture.
>  */
> return IS_ALIGNED(vmemmap_size, PMD_SIZE);
> 
>> +}
>> +#endif
>> +
>> +static bool mhp_supports_memmap_on_memory(unsigned long size)
>> +{
>>       /*
>>        * Besides having arch support and the feature enabled at runtime, we
>>        * need a few more assumptions to hold true:
>> @@ -1280,9 +1288,8 @@ static bool mhp_supports_memmap_on_memory(unsigned long size)
>>        *       populate a single PMD.
>>        */
>>       return mhp_memmap_on_memory() &&
>> -           size == memory_block_size_bytes() &&
>> -           IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
>> -           IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));
>> +        size == memory_block_size_bytes() &&
> 
> If you keep the properly aligned indentation, this will not be detected as a change by git.
> 
>> +        arch_supports_memmap_on_memory(size);
>>   }
>>     /*
> 

Will update the code based on the above feedback.

-aneesh
