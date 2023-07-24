Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 530F275FB66
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 18:03:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j9sD/xDe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8lM71fYCz30g5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 02:03:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j9sD/xDe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8lLC5JLgz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 02:02:43 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36OFlrXD010661;
	Mon, 24 Jul 2023 16:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=FKae4M25rat9dvVyISkmIm3wpE3aeb3pvq51ZIG02TA=;
 b=j9sD/xDeqY8meF/aAg2jXQIEkhSu6HR+p/A1T/hr3vkZYAgPWo5ti9YQIKL0eV5WoTSU
 Hh/1vysE/BnNlwK0O0PnAVdhXbe7F0LwA+ohpxfbDFJ5t/H8Cf9RN+9dZM+n1daoG5aa
 HQodz3n93oirDEqbohknfGqeLCnjTHn/bQaRDahip+DA8HSnJad9UJg70qW7HZ7aQVoX
 dMjnc70+UJ/WNQv51ShAMgEP8AE/FcB7KAv0RzB0IplDO5wCORlSo4bEKc7Z3bEkhtzL
 UXCLb0X/8UnfFhTP0eLhO7/GmSvucbuxLxsuIS/dRhgQlO9KkbAaEqp/5Jyzjy6ZJJWa QA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s1qwpfypr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 16:02:27 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36OFdKFP007647;
	Mon, 24 Jul 2023 16:02:26 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s1qwpfypd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 16:02:26 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36OFmafG002059;
	Mon, 24 Jul 2023 16:02:25 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0temme43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 16:02:25 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36OG2NOP56951072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jul 2023 16:02:23 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A12ED20043;
	Mon, 24 Jul 2023 16:02:23 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3046620049;
	Mon, 24 Jul 2023 16:02:21 +0000 (GMT)
Received: from [9.43.110.108] (unknown [9.43.110.108])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Jul 2023 16:02:20 +0000 (GMT)
Message-ID: <3f22b23a-701a-548b-9d84-8ecad695c313@linux.ibm.com>
Date: Mon, 24 Jul 2023 21:32:20 +0530
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
 <bbd774bb-10b9-30b1-c82b-27d01d304f8d@linux.ibm.com>
 <29eb32f0-fb0b-c8f9-ba23-8295147808ea@redhat.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <29eb32f0-fb0b-c8f9-ba23-8295147808ea@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rr6EOoenMWgBYkLziH3FEtZQgSLiie6z
X-Proofpoint-GUID: 0QnDwqvYWaQw4YP1-RpnR58RIvM2Ltsu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_12,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307240139
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

On 7/24/23 9:11 PM, David Hildenbrand wrote:
> On 24.07.23 17:16, Aneesh Kumar K V wrote:
> 
>>>
>>> /*
>>>   * In "forced" memmap_on_memory mode, we always align the vmemmap size up to cover
>>>   * full pageblocks. That way, we can add memory even if the vmemmap size is not properly
>>>   * aligned, however, we might waste memory.
>>>   */
>>
>> I am finding that confusing. We do want things to be pageblock_nr_pages aligned both ways.
>> With MEMMAP_ON_MEMORY_FORCE, we do that by allocating more space for memmap and
>> in the default case we do that by making sure only memory blocks of specific size supporting
>> that alignment can use MEMMAP_ON_MEMORY feature.
> 
> See the usage inm hp_supports_memmap_on_memory(), I guess that makes sense then.
> 
> But if you have any ideas on how to clarify that (terminology), I'm all ears!
> 


I updated the commit message 

mm/hotplug: Support memmap_on_memory when memmap is not aligned to pageblocks

Currently, memmap_on_memory feature is only supported with memory block
sizes that result in vmemmap pages covering full page blocks. This is
because memory onlining/offlining code requires applicable ranges to be
pageblock-aligned, for example, to set the migratetypes properly.

This patch helps to lift that restriction by reserving more pages than
required for vmemmap space. This helps to align the start addr to be
page block aligned with different memory block sizes. This implies the
kernel will be reserving some pages for every memoryblock. This also
allows the memmap on memory feature to be widely useful with different
memory block size values.

For ex: with 64K page size and 256MiB memory block size, we require 4
pages to map vmemmap pages, To align things correctly we end up adding a
reserve of 28 pages. ie, for every 4096 pages 28 pages get reserved.


Also while implementing your  suggestion to use memory_block_memmap_on_memory_size()
I am finding it not really useful because in mhp_supports_memmap_on_memory() we are checking
if remaining_size is pageblock_nr_pages aligned (dax_kmem may want to use that helper
later). Also I still think altmap.reserve is easier because of the start_pfn calculation.
(more on this below)



> [...]
> 
>>>> +    return arch_supports_memmap_on_memory(size);
>>>>    }
>>>>      /*
>>>> @@ -1311,7 +1391,11 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>>>>    {
>>>>        struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
>>>>        enum memblock_flags memblock_flags = MEMBLOCK_NONE;
>>>> -    struct vmem_altmap mhp_altmap = {};
>>>> +    struct vmem_altmap mhp_altmap = {
>>>> +        .base_pfn =  PHYS_PFN(res->start),
>>>> +        .end_pfn  =  PHYS_PFN(res->end),
>>>> +        .reserve  = memory_block_align_base(resource_size(res)),
>>>
>>> Can you remind me why we have to set reserve here at all?
>>>
>>> IOW, can't we simply set
>>>
>>> .free = memory_block_memmap_on_memory_size();
>>>
>>> end then pass
>>>
>>> mhp_altmap.alloc + mhp_altmap.free
>>>
>>> to create_memory_block_devices() instead?
>>>
>>
>> But with the dax usage of altmap, altmap->reserve is what we use to reserve things to get
>> the required alignment. One difference is where we allocate the struct page at. For this specific
>> case it should not matter.
>>
>> static unsigned long __meminit vmem_altmap_next_pfn(struct vmem_altmap *altmap)
>> {
>>     return altmap->base_pfn + altmap->reserve + altmap->alloc
>>         + altmap->align;
>> }
>>
>> And other is where we online a memory block
>>
>> We find the start pfn using mem->altmap->alloc + mem->altmap->reserve;
>>
>> Considering altmap->reserve is what dax pfn_dev use, is there a reason you want to use altmap->free for this?
> 
> "Reserve" is all about "reserving that much memory for driver usage".
> 
> We don't care about that. We simply want vmemmap allocations coming from the pageblock(s) we set aside. Where exactly, we don't care.
> 
>> I find it confusing to update free when we haven't allocated any altmap blocks yet.
> 
> "
> @reserve: pages mapped, but reserved for driver use (relative to @base)"
> @free: free pages set aside in the mapping for memmap storage
> @alloc: track pages consumed, private to vmemmap_populate()
> "
> 
> To me, that implies that we can ignore "reserve". We set @free to the aligned value and let the vmemmap get allocated from anything in there.
> 
> free + alloc should always sum up to our set-aside pageblock(s), no?
> 
>

The difference is 

 mhp_altmap.free = PHYS_PFN(size) - reserved blocks;

ie, with 256MiB memory block size with 64K pages, we need 4 memmap pages and we reserve 28 pages for aligment.

mhp_altmap.free = PHYS_PFN(size) - 28. 

So that 4 pages from which we are allocating the memmap pages are still counted in free page.

We could all make it work by doing

mhp_altmap.free = PHYS_PFN(size) -  (memory_block_memmap_on_memory_size() - memory_block_memmap_size())

But is that any better than what we have now? I understand the term "reserved for driver use" is confusing for this use case.
But it is really reserving things for required alignment. 

-aneesh



