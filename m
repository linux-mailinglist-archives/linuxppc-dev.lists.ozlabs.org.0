Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D6A74F406
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 17:47:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lIjrzu+u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0lcc5MzGz3c1n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 01:47:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lIjrzu+u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0lbj5gM8z30g1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 01:46:41 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36BFgCT5029476;
	Tue, 11 Jul 2023 15:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/qhqwF30d6k2BCAwsofqQx15bwd6kNY0EhDNEqxlBfc=;
 b=lIjrzu+uudO/zH/SZCnMB08p9xa/ms6NX/fC3g3pfeOzFfozj+judb1q9h2dz0fPXCxu
 54OXVx64ZIhgUHNOWxl6neVqSQ5GbFaagencxbazdp87vNOJNjHoyj9s98hkAa5Bjzqj
 G9dgSlzsDBnosbsEPHye9CTBoBsSiHFcZFf70n8BwS1Thk3gmOe6GNm/sxFM30JeBoW1
 coQpC/dsUAxHspcdmTy/JEiDgm8SDJCnwOdflcJxqs/36G15gZFIAQ3rpxpFnKSvnTI9
 knpcuaAzC6t6ky1K6l8jZEoiHve++QNe7xO+tsJ4t2cZYtCg+3AvU36GbR+IcpP5VTqi Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rs9y1r6gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 15:46:26 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36BFgJx3029879;
	Tue, 11 Jul 2023 15:46:25 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rs9y1r6db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 15:46:25 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36B9Iv1S031161;
	Tue, 11 Jul 2023 15:46:22 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3rpye59v11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 15:46:21 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36BFkJ7H54001970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jul 2023 15:46:19 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FF512004D;
	Tue, 11 Jul 2023 15:46:19 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D94620040;
	Tue, 11 Jul 2023 15:46:16 +0000 (GMT)
Received: from [9.43.86.43] (unknown [9.43.86.43])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Jul 2023 15:46:16 +0000 (GMT)
Message-ID: <e5a1a650-f4e6-e66e-f352-8b1490819991@linux.ibm.com>
Date: Tue, 11 Jul 2023 21:16:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 5/7] powerpc/book3s64/memhotplug: Enable memmap on
 memory for radix
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
 <20230711044834.72809-6-aneesh.kumar@linux.ibm.com>
 <98285185-170f-10fb-67a7-09e35ab47650@redhat.com>
 <006e24f1-1261-1018-4125-02dd354da519@linux.ibm.com>
 <f5c4970b-f829-2750-ad60-d0fe04ec93c9@redhat.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <f5c4970b-f829-2750-ad60-d0fe04ec93c9@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: A_O_COuI35zTXrXpRNfv3quKvrH-nXCG
X-Proofpoint-ORIG-GUID: 5grsPnzlxC64_nv6MM-y4f5IE00i-SHi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_08,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307110139
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

On 7/11/23 9:14 PM, David Hildenbrand wrote:
> On 11.07.23 17:40, Aneesh Kumar K V wrote:
>> On 7/11/23 8:56 PM, David Hildenbrand wrote:
>>> On 11.07.23 06:48, Aneesh Kumar K.V wrote:
>>>> Radix vmemmap mapping can map things correctly at the PMD level or PTE
>>>> level based on different device boundary checks. Hence we skip the
>>>> restrictions w.r.t vmemmap size to be multiple of PMD_SIZE. This also
>>>> makes the feature widely useful because to use PMD_SIZE vmemmap area we
>>>> require a memory block size of 2GiB
>>>>
>>>> We can also use MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY to that the feature
>>>> can work with a memory block size of 256MB. Using altmap.reserve feature
>>>> to align things correctly at pageblock granularity. We can end up
>>>> losing some pages in memory with this. For ex: with a 256MiB memory block
>>>> size, we require 4 pages to map vmemmap pages, In order to align things
>>>> correctly we end up adding a reserve of 28 pages. ie, for every 4096
>>>> pages 28 pages get reserved.
>>>>
>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>> ---
>>>>    arch/powerpc/Kconfig                          |  1 +
>>>>    arch/powerpc/include/asm/pgtable.h            | 28 +++++++++++++++++++
>>>>    .../platforms/pseries/hotplug-memory.c        |  3 +-
>>>>    mm/memory_hotplug.c                           |  2 ++
>>>>    4 files changed, 33 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>>> index 116d6add0bb0..f890907e5bbf 100644
>>>> --- a/arch/powerpc/Kconfig
>>>> +++ b/arch/powerpc/Kconfig
>>>> @@ -157,6 +157,7 @@ config PPC
>>>>        select ARCH_HAS_UBSAN_SANITIZE_ALL
>>>>        select ARCH_HAVE_NMI_SAFE_CMPXCHG
>>>>        select ARCH_KEEP_MEMBLOCK
>>>> +    select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE    if PPC_RADIX_MMU
>>>>        select ARCH_MIGHT_HAVE_PC_PARPORT
>>>>        select ARCH_MIGHT_HAVE_PC_SERIO
>>>>        select ARCH_OPTIONAL_KERNEL_RWX        if ARCH_HAS_STRICT_KERNEL_RWX
>>>> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
>>>> index 68817ea7f994..8e6c92dde6ad 100644
>>>> --- a/arch/powerpc/include/asm/pgtable.h
>>>> +++ b/arch/powerpc/include/asm/pgtable.h
>>>> @@ -169,6 +169,34 @@ static inline bool is_ioremap_addr(const void *x)
>>>>    int __meminit vmemmap_populated(unsigned long vmemmap_addr, int vmemmap_map_size);
>>>>    bool altmap_cross_boundary(struct vmem_altmap *altmap, unsigned long start,
>>>>                   unsigned long page_size);
>>>> +/*
>>>> + * mm/memory_hotplug.c:mhp_supports_memmap_on_memory goes into details
>>>> + * some of the restrictions. We don't check for PMD_SIZE because our
>>>> + * vmemmap allocation code can fallback correctly. The pageblock
>>>> + * alignment requirement is met using altmap->reserve blocks.
>>>> + */
>>>> +#define arch_supports_memmap_on_memory arch_supports_memmap_on_memory
>>>> +static inline bool arch_supports_memmap_on_memory(unsigned long size)
>>>> +{
>>>> +    unsigned long nr_pages = size >> PAGE_SHIFT;
>>>> +    unsigned long vmemmap_size = nr_pages * sizeof(struct page);
>>>> +
>>>> +    if (!radix_enabled())
>>>> +        return false;
>>>> +
>>>> +#ifdef CONFIG_PPC_4K_PAGES
>>>> +    return IS_ALIGNED(vmemmap_size, PMD_SIZE);
>>>> +#else
>>>> +    /*
>>>> +     * Make sure the vmemmap allocation is fully contianed
>>>> +     * so that we always allocate vmemmap memory from altmap area.
>>>> +     * The pageblock alignment requirement is met by using
>>>> +     * reserve blocks in altmap.
>>>> +     */
>>>> +    return IS_ALIGNED(vmemmap_size,  PAGE_SIZE);
>>>
>>> Can we move that check into common code as well?
>>>
>>> If our (original) vmemmap size would not fit into a single page, we would be in trouble on any architecture. Did not check if it would be an issue for arm64 as well in case we would allow eventually wasting memory.
>>>
>>
>>
>> For x86 and arm we already do IS_ALIGNED(vmemmap_size, PMD_SIZE); in arch_supports_memmap_on_memory(). That should imply PAGE_SIZE alignment.
>> If arm64 allow the usage of altmap.reserve, I would expect the arch_supports_memmap_on_memory to have the PAGE_SIZE check.
>>
>> Adding the PAGE_SIZE check in  mhp_supports_memmap_on_memory() makes it redundant check for x86 and arm currently?
> 
> IMHO not an issue. The common code check is a bit weaker and the arch check a bit stronger.
> 
>>

ok will update

>> modified   mm/memory_hotplug.c
>> @@ -1293,6 +1293,13 @@ static bool mhp_supports_memmap_on_memory(unsigned long size)
>>        */
>>       if (!mhp_memmap_on_memory() || size != memory_block_size_bytes())
>>           return false;
>> +
>> +    /*
>> +     * Make sure the vmemmap allocation is fully contianed
> 
> s/contianed/contained/
> 
>> +     * so that we always allocate vmemmap memory from altmap area.
> 
> In theory, it's not only the vmemmap size, but also the vmemmap start (that it doesn't start somewhere in between a page, crossing a page). I suspect the start is always guaranteed to be aligned (of the vmemmap size is aligned), correct?
> 

That is correct.

>> +     */
>> +    if (!IS_ALIGNED(vmemmap_size,  PAGE_SIZE))
>> +        return false;
>>        /*
>>         * Without page reservation remaining pages should be pageblock aligned.
>>         */
>>


-aneesh
> 

