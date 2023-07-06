Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A214749867
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 11:29:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=svxwvTSD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxWSQ0NVJz3bpK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 19:29:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=svxwvTSD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxWRY3hRDz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 19:28:25 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3669PUT0031568;
	Thu, 6 Jul 2023 09:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=2HiI83sStMzU/mbSDseRiOxdSo21jkJOe9DPTFeuTvM=;
 b=svxwvTSDVWCyhMbYHATvgc4F9LCLQR5Rv9qtyLl5S3IwKXyLTT//3PCdv0d2M9U9UMdd
 SwzAx9gqve4HvLJcNgAH+mwCwWdBUo5QDI0aFRHNZu4L3ElXCPvv0ihdMuUlLNnBKhaZ
 uP/oWr0pomH8/Tt+OuIBvpkx1fVFmCuNrzoAIr/JlZTdCcZ2kDqmuchAJVfp+xR0nbCl
 WyuiMKZBon9GT31UDaO7KvOT4XqYPPdgi5cr/IL+XfX1ps9XH9vebm8GCuwICt4u6wxI
 n8usvkIqGo4sgwJFUHMyRZiHoRRL4JgfYxeDtGO8T98K9Hl2yYgPSQVwIG4SrdmHtRMy qg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rntyhr27n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 09:28:08 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3669PdRv031941;
	Thu, 6 Jul 2023 09:28:08 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rntyhr271-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 09:28:08 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3664rIpA030553;
	Thu, 6 Jul 2023 09:28:06 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3rjbs4tcf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 09:28:03 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3669S1Yt20710090
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jul 2023 09:28:01 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7069820043;
	Thu,  6 Jul 2023 09:28:01 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 793F820040;
	Thu,  6 Jul 2023 09:27:59 +0000 (GMT)
Received: from [9.109.212.144] (unknown [9.109.212.144])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Jul 2023 09:27:59 +0000 (GMT)
Message-ID: <ac214d68-63f7-16f1-465d-baa5c2a0a7fa@linux.ibm.com>
Date: Thu, 6 Jul 2023 14:57:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 5/5] powerpc/book3s64/memhotplug: Enable memmap on
 memory for radix
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
References: <20230706085041.826340-1-aneesh.kumar@linux.ibm.com>
 <20230706085041.826340-6-aneesh.kumar@linux.ibm.com>
 <eba60083-641f-4d68-398e-60d06ce226e7@redhat.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <eba60083-641f-4d68-398e-60d06ce226e7@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ea6FjPOsEAX4zHigbNGh3qGibPBdJ2RV
X-Proofpoint-GUID: xB1hF367QWpnAYVnWkDMB66SXaS9lDL4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_05,2023-07-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060080
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

On 7/6/23 2:37 PM, David Hildenbrand wrote:
> On 06.07.23 10:50, Aneesh Kumar K.V wrote:
>> Radix vmemmap mapping can map things correctly at the PMD level or PTE
>> level based on different device boundary checks. We also use altmap.reserve
>> feature to align things correctly at pageblock granularity. We can end up
>> loosing some pages in memory with this. For ex: with 256MB memory block
>> size, we require 4 pages to map vmemmap pages, In order to align things
>> correctly we end up adding a reserve of 28 pages. ie, for every 4096 pages
>> 28 pages get reserved.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/Kconfig                          |  1 +
>>   arch/powerpc/mm/book3s64/radix_pgtable.c      | 28 +++++++++++++++++++
>>   .../platforms/pseries/hotplug-memory.c        |  4 ++-
>>   3 files changed, 32 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 116d6add0bb0..f890907e5bbf 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -157,6 +157,7 @@ config PPC
>>       select ARCH_HAS_UBSAN_SANITIZE_ALL
>>       select ARCH_HAVE_NMI_SAFE_CMPXCHG
>>       select ARCH_KEEP_MEMBLOCK
>> +    select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE    if PPC_RADIX_MMU
>>       select ARCH_MIGHT_HAVE_PC_PARPORT
>>       select ARCH_MIGHT_HAVE_PC_SERIO
>>       select ARCH_OPTIONAL_KERNEL_RWX        if ARCH_HAS_STRICT_KERNEL_RWX
>> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
>> index a62729f70f2a..c0bd60b5fb64 100644
>> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
>> @@ -1678,3 +1678,31 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
>>         return 1;
>>   }
>> +
>> +/*
>> + * mm/memory_hotplug.c:mhp_supports_memmap_on_memory goes into details
>> + * some of the restrictions. We don't check for PMD_SIZE because our
>> + * vmemmap allocation code can fallback correctly. The pageblock
> 
> x86 also has the fallback IIRC; the concern is rather that you end up with a PTE-mapped vmemmap, which is slower at runtime than a PMD-mapped vmemmap.


The memory block size is dependent on a config option at the hypervisor for power and we can have values ranging from 16MB - 512MB
With these different memory block sizes I was thinking relaxing these checks makes the feature more useful. Also with page size
of 64K using a 2M vmemmap requires larger memory block size. 

> 
>> + * alignment requirement is met using altmap->reserve blocks.
>> + */
>> +bool mhp_supports_memmap_on_memory(unsigned long size)
>> +{
>> +    if (!radix_enabled())
>> +        return false;
>> +    /*
>> +     * The pageblock alignment requirement is met by using
>> +     * reserve blocks in altmap.
>> +     */
>> +    return size == memory_block_size_bytes();
>> +}
> 
> I really dislike such arch overrides.
> 
> I think the flow should be something like that, having a generic:
> 
> bool mhp_supports_memmap_on_memory(unsigned long size)
> {
>     ...
>     return arch_mhp_supports_memmap_on_memory(size)) &&
>            size == memory_block_size_bytes() &&
>            ...
> }
> 

Sure we can do that. But for ppc64 we also want to skip the PMD_SIZE and pageblock
alignment restrictions. 

> where we'll also keep the pageblock check here.

For ppc64, I converted that pageblock rule as a reserve blocks allocation with altmap.
I am not sure whether we want to do that outside ppc64? 

> 
> And a ppc specific
> 
> bool arch_mhp_supports_memmap_on_memory(unsigned long size)
> {
>     /*
>          * Don't check for the vmemmap covering PMD_SIZE, we accept that
>          * we might get a PTE-mapped vmemmap.
>          */
>     return radix_enabled();
> }
> 
> We can then move the PMD_SIZE check into arch specific code (x86-aarch64).
> 

sure. will rework the changes accordingly. 

-aneesh
