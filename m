Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 755E07498F7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 12:05:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mtrXAAOC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxXGH2ltBz3brX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 20:05:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mtrXAAOC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxXFP1znkz306p
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 20:04:41 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3669nXtB031026;
	Thu, 6 Jul 2023 10:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hk8wmmW3ZzjhGioo4OrBZG6EgbCEDsVkdCNNa0rdVR0=;
 b=mtrXAAOC2Y+MhNdXESWyD0a+zI96Y4RU7MrtowlGKAmEK+hU867qWWTx/6K/vtvOHc0v
 91dzBXaciTU+3cImhlB+iUH19vXJxVYF84ZadYoLCuG6a+V8PjDxdwr4Zr3UJpsd5hGg
 AHYqH4YJsSNmonRxDf6qm/0ylXivSN2aIZJNGATk5RV+W3YNM0RyrxV663vk1barHfxi
 tsKKB863S3IgZXXL2MvF2wf30eLni6ye6v8fCus4DfOvKFUz20g839NTAdpdZ1r9MNLs
 LYfQ0LGIGCBlUg0qls5TNGh7j26OpUiVxAXU8g9TeEaWauf0o5Mvz9Eu7JOejp+uUplm oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rnuat09p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 10:04:26 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3669oQh8032535;
	Thu, 6 Jul 2023 10:04:24 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rnuat09kj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 10:04:24 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3664Iaq8027517;
	Thu, 6 Jul 2023 10:04:19 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3rjbs4tcsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 10:04:19 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 366A4HOk19268280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jul 2023 10:04:17 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E6E372004D;
	Thu,  6 Jul 2023 10:04:16 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB22C20040;
	Thu,  6 Jul 2023 10:04:14 +0000 (GMT)
Received: from [9.109.212.144] (unknown [9.109.212.144])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Jul 2023 10:04:14 +0000 (GMT)
Message-ID: <8763c269-90da-4754-85a2-ef32d2540362@linux.ibm.com>
Date: Thu, 6 Jul 2023 15:34:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/5] mm/hotplug: Simplify the handling of
 MHP_MEMMAP_ON_MEMORY flag
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
References: <20230706085041.826340-1-aneesh.kumar@linux.ibm.com>
 <20230706085041.826340-4-aneesh.kumar@linux.ibm.com>
 <0efcd10b-dff8-d011-e192-5feaedc2ee2d@redhat.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <0efcd10b-dff8-d011-e192-5feaedc2ee2d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5vd0HVowQYO414bbl9-rhjZrkdoMSmSi
X-Proofpoint-ORIG-GUID: QVy0-bQlv0KaJQ-PIDUO6ToCjyZ9Eke1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_06,2023-07-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307060089
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

On 7/6/23 2:54 PM, David Hildenbrand wrote:
> On 06.07.23 10:50, Aneesh Kumar K.V wrote:
>> Instead of checking for memmap on memory feature enablement within the
>> functions checking for alignment, use the kernel parameter to control the
>> memory hotplug flags. The generic kernel now enables memmap on memory
>> feature if the hotplug flag request for the same.
>>
>> The ACPI code now can pass the flag unconditionally because the kernel will
>> fallback to not using the feature if the alignment rules are not met.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   drivers/acpi/acpi_memhotplug.c |  3 +--
>>   include/linux/memory_hotplug.h | 14 ++++++++++++++
>>   mm/memory_hotplug.c            | 35 +++++++++++-----------------------
>>   3 files changed, 26 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/acpi/acpi_memhotplug.c b/drivers/acpi/acpi_memhotplug.c
>> index 24f662d8bd39..4d0096fc4cc2 100644
>> --- a/drivers/acpi/acpi_memhotplug.c
>> +++ b/drivers/acpi/acpi_memhotplug.c
>> @@ -211,8 +211,7 @@ static int acpi_memory_enable_device(struct acpi_memory_device *mem_device)
>>           if (!info->length)
>>               continue;
>>   -        if (mhp_supports_memmap_on_memory(info->length))
>> -            mhp_flags |= MHP_MEMMAP_ON_MEMORY;
>> +        mhp_flags |= get_memmap_on_memory_flags();
>>           result = __add_memory(mgid, info->start_addr, info->length,
>>                         mhp_flags);
>>   diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
>> index a769f44b8368..af7017122506 100644
>> --- a/include/linux/memory_hotplug.h
>> +++ b/include/linux/memory_hotplug.h
>> @@ -358,4 +358,18 @@ bool mhp_supports_memmap_on_memory(unsigned long size);
>>   bool __mhp_supports_memmap_on_memory(unsigned long size);
>>   #endif /* CONFIG_MEMORY_HOTPLUG */
>>   +#ifdef CONFIG_MHP_MEMMAP_ON_MEMORY
>> +extern bool memmap_on_memory;
>> +static inline unsigned long get_memmap_on_memory_flags(void)
>> +{
>> +    if (memmap_on_memory)
>> +        return MHP_MEMMAP_ON_MEMORY;
>> +    return 0;
>> +}
>> +#else
>> +static inline unsigned long get_memmap_on_memory_flags(void)
>> +{
>> +    return 0;
>> +}
>> +#endif
> 
> That's kind-of ugly TBH.
> 
> 
> Why do we need this change?
> 

I was trying to avoid rest of the kernel doing 

if (mhp_supports_memmap_on_memory(info->length))
         mhp_flags |= MHP_MEMMAP_ON_MEMORY;

I was also following pattern similar to 

static inline gfp_t alloc_hugepage_khugepaged_gfpmask(void)
{
	return khugepaged_defrag() ? GFP_TRANSHUGE : GFP_TRANSHUGE_LIGHT;
}


Overall goal of the patch is to handle the fallback of not using altmap/memmap in memory 
inside add_memory_resource and the callsites only express the desire to use memmap on memory
if possible/enabled. 

-aneesh
