Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E4475FA8C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 17:18:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l7RCfWmm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8kLk0zvbz309c
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 01:18:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l7RCfWmm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8kKs5HLDz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 01:17:20 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36OFDJmI025396;
	Mon, 24 Jul 2023 15:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=PmSY40gwClOnFxOOcPWa6mmgb3gs782HGu85yMJrSk0=;
 b=l7RCfWmmOkhJQHEOlVjCuxvSqrUlyn+XCAKn9dG7WbJTKrGyWJd37t3nQOdOXMjKEGEV
 qZLg5kp9dVwllQ2KMyLEvX/p37BCvLhgetS0xBOoIWLMzR34FpFsei/16sbAO6ia3vpm
 1leE0idfu+0On2Yx6DB75h1Y5UdooKcAaIkj5PitgmpnmBQe0QQc5XsSWj/7UJ8amNQK
 YH/LnsC0ajZsvmS3FYGn80dQ9Hk/1AQTPrS/5hMegjNkySmdPTOzXF+b6jJHBay3sYka
 wtknNVFd+vmjUR/ZUCmjtfsSIwYgHh1zgFfxieVpDLYOkZIcpzDOMk5FvceSqtAv4lAE HA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s1ty1s8p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 15:17:02 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36OF5lcP001957;
	Mon, 24 Jul 2023 15:17:02 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s1ty1s8nk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 15:17:02 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36OEqJif001851;
	Mon, 24 Jul 2023 15:17:01 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0unj3p2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 15:17:01 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36OFGxWM51249504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jul 2023 15:16:59 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE5F720043;
	Mon, 24 Jul 2023 15:16:59 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CAC12004E;
	Mon, 24 Jul 2023 15:16:57 +0000 (GMT)
Received: from [9.43.110.108] (unknown [9.43.110.108])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Jul 2023 15:16:57 +0000 (GMT)
Message-ID: <bbd774bb-10b9-30b1-c82b-27d01d304f8d@linux.ibm.com>
Date: Mon, 24 Jul 2023 20:46:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 4/6] mm/hotplug: Allow pageblock alignment via altmap
 reservation
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
References: <20230718024409.95742-1-aneesh.kumar@linux.ibm.com>
 <20230718024409.95742-5-aneesh.kumar@linux.ibm.com>
 <f9597236-866d-17cd-d549-938ea80eacbe@redhat.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <f9597236-866d-17cd-d549-938ea80eacbe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7qrIPEqI5ohucePMb9s6FfJgVh5ifMCY
X-Proofpoint-ORIG-GUID: XQr3HbeQV7bG-SBNB8K1zjjLG3yfob8y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_11,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307240134
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

On 7/24/23 8:03 PM, David Hildenbrand wrote:
> On 18.07.23 04:44, Aneesh Kumar K.V wrote:
>> Add a new kconfig option that can be selected if we want to allow
> 
> That description seems outdated.
> 


Will update

>> pageblock alignment by reserving pages in the vmemmap altmap area.
>> This implies we will be reserving some pages for every memoryblock
>> This also allows the memmap on memory feature to be widely useful
>> with different memory block size values.
> 
> Can you add some more meat to the description, and especially, in
> which cases this might be desired and in which cases it might be
> completely undesired?
> 
> 
> Let's assume we hotplug a 1 GiB DIMM on arm64/64k. With 512 MiB pageblocks,
> we'd waste 50% of the hotplugged memory.
> 
> Also, see below on the case where we could end up with 100% wasted memory,
> which we want to block compeltely.
> 
> 
> Also, I wonder if we can avoid talking about "page reservation" or "altmap reservation",
> that's rather an implementation detail.
> 
> For example, I'd call this patch
> 
> "mm/hotplug: Support memmap_on_memory when memmap is not aligned to pageblocks"
> 
> 

Ok will update

> 
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   mm/memory_hotplug.c | 109 ++++++++++++++++++++++++++++++++++++++------
>>   1 file changed, 96 insertions(+), 13 deletions(-)
>>
>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>> index 5921c81fcb70..c409f5ff6a59 100644
>> --- a/mm/memory_hotplug.c
>> +++ b/mm/memory_hotplug.c
>> @@ -41,17 +41,85 @@
>>   #include "internal.h"
>>   #include "shuffle.h"
>>   +enum {
>> +    MEMMAP_ON_MEMORY_DISABLE = 0,
>> +    MEMMAP_ON_MEMORY_ENABLE,
>> +    MEMMAP_ON_MEMORY_FORCE,
>> +};
>> +
>> +static int memmap_mode __read_mostly = MEMMAP_ON_MEMORY_DISABLE;
>> +
>> +static inline unsigned long memory_block_align_base(unsigned long size)
>> +{
> 
> Can we start with something like this instead?
> 
> memory_block_memmap_size() might be reasonable to put into the previous patch.
> 
> 
> static inline unsigned long memory_block_memmap_size(void)
> {
>     return PHYS_PFN(memory_block_size_bytes()) * sizeof(struct page);
> }
> 
> /*
>  * In "forced" memmap_on_memory mode, we always align the vmemmap size up to cover
>  * full pageblocks. That way, we can add memory even if the vmemmap size is not properly
>  * aligned, however, we might waste memory.
>  */

I am finding that confusing. We do want things to be pageblock_nr_pages aligned both ways. 
With MEMMAP_ON_MEMORY_FORCE, we do that by allocating more space for memmap and
in the default case we do that by making sure only memory blocks of specific size supporting
that alignment can use MEMMAP_ON_MEMORY feature. 

> static inline unsigned long memory_block_memmap_on_memory_size(void)
> {
>     unsigned long size = memory_block_memmap_size();
> 
>     if (memmap_mode != MEMMAP_ON_MEMORY_FORCE)
>         return size;
>     return ALIGN(size, PFN_PHYS(pageblock_nr_pages));
> }
>     
> 
> 
>> +    if (memmap_mode == MEMMAP_ON_MEMORY_FORCE) {
>> +        unsigned long align;
>> +        unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
>> +        unsigned long vmemmap_size;
>> +
>> +        vmemmap_size = DIV_ROUND_UP(nr_vmemmap_pages * sizeof(struct page), PAGE_SIZE);
>> +        align = pageblock_align(vmemmap_size) - vmemmap_size;
>> +        return align;
>> +    } else
>> +        return 0;
>> +}
>> +
>>   #ifdef CONFIG_MHP_MEMMAP_ON_MEMORY
>>   /*
>>    * memory_hotplug.memmap_on_memory parameter
>>    */
>> -static bool memmap_on_memory __ro_after_init;
>> -module_param(memmap_on_memory, bool, 0444);
>> -MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug");
>> +static int set_memmap_mode(const char *val, const struct kernel_param *kp)
>> +{
>> +    int ret, mode;
>> +    bool enabled;
>> +
>> +    if (sysfs_streq(val, "force") ||  sysfs_streq(val, "FORCE")) {
>> +        mode =  MEMMAP_ON_MEMORY_FORCE;
>> +        goto matched;
>> +    }
>> +
>> +    ret = kstrtobool(val, &enabled);
>> +    if (ret < 0)
>> +        return ret;
>> +    if (enabled)
>> +        mode =  MEMMAP_ON_MEMORY_ENABLE;
>> +    else
>> +        mode =  MEMMAP_ON_MEMORY_DISABLE;
>> +
>> +matched:
>> +    *((int *)kp->arg) =  mode;
>> +    if (mode == MEMMAP_ON_MEMORY_FORCE) {
>> +        pr_info("Memory hotplug will reserve %ld pages in each memory block\n",
>> +            memory_block_align_base(memory_block_size_bytes()));
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int get_memmap_mode(char *buffer, const struct kernel_param *kp)
>> +{
>> +    if (*((int *)kp->arg) == MEMMAP_ON_MEMORY_FORCE)
>> +        return sprintf(buffer,  "force\n");
>> +    if (*((int *)kp->arg) == MEMMAP_ON_MEMORY_ENABLE)
>> +        return sprintf(buffer,  "y\n");
>> +
>> +    return sprintf(buffer,  "n\n");
> 
> param_get_bool() uses uppercase Y / N. Maybe just return the uppercase variants here as well.
> 
>> +}
>> +
>> +static const struct kernel_param_ops memmap_mode_ops = {
>> +    .set = set_memmap_mode,
>> +    .get = get_memmap_mode,
>> +};
>> +module_param_cb(memmap_on_memory, &memmap_mode_ops, &memmap_mode, 0444);
>> +MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug\n"
>> +    "With value \"force\" it could result in memory wastage due to memmap size limitations \n"
>> +    "For example, if the memmap for a memory block requires 1 MiB, but the pageblock \n"
>> +    "size is 2 MiB, 1 MiB of hotplugged memory will be wasted. Note that there are \n"
>> +    "still cases where the feature cannot be enforced: for example, if the memmap is \n"
>> +    "smaller than a single page, or if the architecture does not support the forced \n"
>> +    "mode in all configurations. (y/n/force)");
> 
> That's a bit mouthful. Can we simplify and put the full doc into
> 
> Documentation/admin-guide/mm/memory-hotplug.rst
> 
> ?


Will update

> 
>>     static inline bool mhp_memmap_on_memory(void)
>>   {
>> -    return memmap_on_memory;
>> +    return !!memmap_mode;
> 
> Maybe better  "memmap_mode != MEMMAP_ON_MEMORY_DISABLE"
> 

Will update

>>   }
>>   #else
>>   static inline bool mhp_memmap_on_memory(void)
>> @@ -1264,7 +1332,6 @@ static inline bool arch_supports_memmap_on_memory(unsigned long size)
>>     static bool mhp_supports_memmap_on_memory(unsigned long size)
>>   {
>> -
>>       unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
>>       unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
>>       unsigned long remaining_size = size - vmemmap_size;
>> @@ -1295,10 +1362,23 @@ static bool mhp_supports_memmap_on_memory(unsigned long size)
>>        *       altmap as an alternative source of memory, and we do not exactly
>>        *       populate a single PMD.
>>        */
>> -    return mhp_memmap_on_memory() &&
>> -           size == memory_block_size_bytes() &&
>> -           IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT)) &&
>> -           arch_supports_memmap_on_memory(size);
>> +    if (!mhp_memmap_on_memory() || size != memory_block_size_bytes())
>> +        return false;
>> +
>> +    /*
>> +     * Make sure the vmemmap allocation is fully contained
>> +     * so that we always allocate vmemmap memory from altmap area.
>> +     */
>> +    if (!IS_ALIGNED(vmemmap_size,  PAGE_SIZE))
>> +        return false;
>> +     /*
>> +      * Without page reservation remaining pages should be pageblock aligned.
>> +      */
>> +    if (memmap_mode != MEMMAP_ON_MEMORY_FORCE &&
>> +        !IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT)))
>> +        return false;
> 
> With our new helper, this becomes the following:
> 
> memmap_on_memory_size = memory_block_memmap_on_memory_size();
> 
> if (!IS_ALIGNED(memmap_on_memory_size, PFN_PHYS(pageblock_nr_pages))
>     /* We're not allowed to waste any memory for the memmap. */
>     return false;
> 
> if (memmap_on_memory_size == memory_block_size_bytes())
>     /* No effective hotplugged memory doesn't make sense. */
>     return false;   
> 

Wil update

>> +    return arch_supports_memmap_on_memory(size);
>>   }
>>     /*
>> @@ -1311,7 +1391,11 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>>   {
>>       struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
>>       enum memblock_flags memblock_flags = MEMBLOCK_NONE;
>> -    struct vmem_altmap mhp_altmap = {};
>> +    struct vmem_altmap mhp_altmap = {
>> +        .base_pfn =  PHYS_PFN(res->start),
>> +        .end_pfn  =  PHYS_PFN(res->end),
>> +        .reserve  = memory_block_align_base(resource_size(res)),
> 
> Can you remind me why we have to set reserve here at all?
> 
> IOW, can't we simply set
> 
> .free = memory_block_memmap_on_memory_size();
> 
> end then pass
> 
> mhp_altmap.alloc + mhp_altmap.free
> 
> to create_memory_block_devices() instead?
> 

But with the dax usage of altmap, altmap->reserve is what we use to reserve things to get
the required alignment. One difference is where we allocate the struct page at. For this specific
case it should not matter. 

static unsigned long __meminit vmem_altmap_next_pfn(struct vmem_altmap *altmap)
{
	return altmap->base_pfn + altmap->reserve + altmap->alloc
		+ altmap->align;
}

And other is where we online a memory block

We find the start pfn using mem->altmap->alloc + mem->altmap->reserve;  

Considering altmap->reserve is what dax pfn_dev use, is there a reason you want to use altmap->free for this? 
I find it confusing to update free when we haven't allocated any altmap blocks yet.

-aneesh

