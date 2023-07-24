Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F5D75FA24
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 16:48:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wn6bbfwN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8jgy3FK1z30PN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 00:47:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wn6bbfwN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8jg50bk2z2y9d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:47:12 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36OEXMQv028872;
	Mon, 24 Jul 2023 14:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=eTXk1J0vipd6SqUI2ZYzKF9ijbYic+GajvGi6LXJ7xI=;
 b=Wn6bbfwNvZQRNbpZWcj1+9JiQGWq7UfrXyOiJhNLCuX7cmkaQ37UxW9HOdbnVB4s1eBd
 npl2uRt9zYLwEs/8oA5BYhdmBMlGaQj+MefIDnEegm/qXWzTf6AqnSJTJ8uLJsrWMfg9
 6xgzI9LCEua+Obdb/b3vHykhBzez02lyg3I+IV5VqNPzPPGfSDqI6PXmSKm4XPCFHFMs
 kDfcNXHEXBfCx6coXWGWNhdgYHdHhaN5WO2EZJJMK4mFxwIKiXrpaP9V/ju4QHuftLNn
 /USq4f7MnRgZK+JQY526zRKWxcl+GAwctlLVaP3z6XHehXMvk7f6V55LPXVYSSxy0jEM Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s1u5v0hcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 14:46:57 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36OEXR6V029441;
	Mon, 24 Jul 2023 14:46:56 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s1u5v0hc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 14:46:56 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36ODmQR0002079;
	Mon, 24 Jul 2023 14:46:55 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0temkwra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 14:46:55 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36OEkrOu62062860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jul 2023 14:46:53 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 807AB20040;
	Mon, 24 Jul 2023 14:46:53 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 25C3020043;
	Mon, 24 Jul 2023 14:46:51 +0000 (GMT)
Received: from [9.43.110.108] (unknown [9.43.110.108])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Jul 2023 14:46:50 +0000 (GMT)
Message-ID: <abd47d75-092f-ba61-d865-168cbf65c842@linux.ibm.com>
Date: Mon, 24 Jul 2023 20:16:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 5/6] powerpc/book3s64/memhotplug: Enable memmap on
 memory for radix
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
References: <20230718024409.95742-1-aneesh.kumar@linux.ibm.com>
 <20230718024409.95742-6-aneesh.kumar@linux.ibm.com>
 <7d3a0d68-1d65-a34a-c6c7-80234face7ce@redhat.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <7d3a0d68-1d65-a34a-c6c7-80234face7ce@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FghKakX9wuC0FCOBaC66HYn4ouYfZxUk
X-Proofpoint-GUID: fqfhW2grfdMvRhJ_MuOmCiSxFCCekp2C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_11,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307240129
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

On 7/24/23 8:04 PM, David Hildenbrand wrote:
> On 18.07.23 04:44, Aneesh Kumar K.V wrote:
>> Radix vmemmap mapping can map things correctly at the PMD level or PTE
>> level based on different device boundary checks. Hence we skip the
>> restrictions w.r.t vmemmap size to be multiple of PMD_SIZE. This also
>> makes the feature widely useful because to use PMD_SIZE vmemmap area we
>> require a memory block size of 2GiB
>>
>> We can also use MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY to that the feature
>> can work with a memory block size of 256MB. Using altmap.reserve feature
>> to align things correctly at pageblock granularity. We can end up
>> losing some pages in memory with this. For ex: with a 256MiB memory block
>> size, we require 4 pages to map vmemmap pages, In order to align things
>> correctly we end up adding a reserve of 28 pages. ie, for every 4096
>> pages 28 pages get reserved.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/Kconfig                          |  1 +
>>   arch/powerpc/include/asm/pgtable.h            | 24 +++++++++++++++++++
>>   .../platforms/pseries/hotplug-memory.c        |  3 ++-
>>   mm/memory_hotplug.c                           |  2 ++
>>   4 files changed, 29 insertions(+), 1 deletion(-)
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
>> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
>> index 68817ea7f994..3d35371395a9 100644
>> --- a/arch/powerpc/include/asm/pgtable.h
>> +++ b/arch/powerpc/include/asm/pgtable.h
>> @@ -169,6 +169,30 @@ static inline bool is_ioremap_addr(const void *x)
>>   int __meminit vmemmap_populated(unsigned long vmemmap_addr, int vmemmap_map_size);
>>   bool altmap_cross_boundary(struct vmem_altmap *altmap, unsigned long start,
>>                  unsigned long page_size);
>> +/*
>> + * mm/memory_hotplug.c:mhp_supports_memmap_on_memory goes into details
>> + * some of the restrictions. We don't check for PMD_SIZE because our
>> + * vmemmap allocation code can fallback correctly. The pageblock
>> + * alignment requirement is met using altmap->reserve blocks.
>> + */
>> +#define arch_supports_memmap_on_memory arch_supports_memmap_on_memory
>> +static inline bool arch_supports_memmap_on_memory(unsigned long size)
>> +{
>> +    unsigned long nr_pages = size >> PAGE_SHIFT;
>> +    unsigned long vmemmap_size = nr_pages * sizeof(struct page);
>> +
>> +    if (!radix_enabled())
>> +        return false;
>> +
>> +    if (IS_ENABLED(CONFIG_PPC_4K_PAGES))
>> +        return IS_ALIGNED(vmemmap_size, PMD_SIZE);
> 
> Can you add a comment why we care about that in the 4K case only?


Sure. We keep the PMD_SIZE alignment for the same reason we have it for x86. With 4K page size and 2M hugepage size
things get properly aligned and we can make this feature useful even with this alignment restrictions. With 64K
page size and 2M hugepage size, having this alignment restrictions makes it more or less not useful to a large
number of memory blocksize we support. I will add that comment in here. 

> 
>> +    /*
>> +     * The pageblock alignment requirement is met by using
>> +     * reserve blocks in altmap.
>> +     */
> 
> Just drop that comment, that's handled by common code now.
> 

Ok. 

>> +    return true;
>> +}
>> +
>>   #endif /* CONFIG_PPC64 */
>>     #endif /* __ASSEMBLY__ */
>> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
>> index 9c62c2c3b3d0..1447509357a7 100644
>> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
>> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
>> @@ -617,6 +617,7 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
>>     static int dlpar_add_lmb(struct drmem_lmb *lmb)
>>   {
>> +    mhp_t mhp_flags = MHP_NONE | MHP_MEMMAP_ON_MEMORY;
>>       unsigned long block_sz;
>>       int nid, rc;
>>   @@ -637,7 +638,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>>           nid = first_online_node;
>>         /* Add the memory */
>> -    rc = __add_memory(nid, lmb->base_addr, block_sz, MHP_NONE);
>> +    rc = __add_memory(nid, lmb->base_addr, block_sz, mhp_flags);
>>       if (rc) {
>>           invalidate_lmb_associativity_index(lmb);
>>           return rc;
>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>> index c409f5ff6a59..6da063c80733 100644
>> --- a/mm/memory_hotplug.c
>> +++ b/mm/memory_hotplug.c
>> @@ -2174,6 +2174,8 @@ static int __ref try_remove_memory(u64 start, u64 size)
>>                * right thing if we used vmem_altmap when hot-adding
>>                * the range.
>>                */
>> +            mhp_altmap.base_pfn = PHYS_PFN(start);
>> +            mhp_altmap.free = PHYS_PFN(size) - nr_vmemmap_pages;
> 
> 
> That change does not belong into this patch.
> 


I kept that change with ppc64 enablement because only ppc64 arch got check against
those values in the free path. 

>>               mhp_altmap.alloc = nr_vmemmap_pages;
>>               altmap = &mhp_altmap;
>>           }
> 

-aneesh
