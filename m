Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B51AF74B519
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 18:26:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IsgXNF7l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QyJgp4SpNz3c5s
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 02:26:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IsgXNF7l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QyJfs3kRKz30fm
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jul 2023 02:25:56 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 367GH20C028671;
	Fri, 7 Jul 2023 16:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=bsP2nhRJPE8rAB1pFBmO8XVVOIJGgGoWqFIwszc9qjE=;
 b=IsgXNF7lXMDQvifsj5n/RQlZ1q6WtxHnmdd35gi5huJH9h+rbELFcOz1alkpj1Oc7QaF
 DqwhQGD0bFt9QQOgecsYQ+e34cnrxRzQYo+iS9c7u2kDPY0cBTYg44Xq2XnHlrd89QYS
 w7Z4veXIgluZj8vvjlohbc5WyVkQYxoB865JBCEYINmzXi5iEgyIkVedaW1Y6WEPm2Ig
 VA+iSfZ5H6ukemztY5SbfQYN8MPFd++ZuxXQ/JlnrCJyKKthSQNTaUc2K1XU8QuRIDlA
 NYWr6clM6j9Pvlx0A6WbOSDNe41wCm0GYWQ2ZUd9vJvaiPo0Bv38hGNfOGdYhsRiNWRv CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rpp3e07q9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jul 2023 16:25:43 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 367GKNIg006584;
	Fri, 7 Jul 2023 16:25:43 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rpp3e07pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jul 2023 16:25:43 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 367DcBiA013077;
	Fri, 7 Jul 2023 16:25:41 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3rjbs530tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jul 2023 16:25:41 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 367GPc6T44695916
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Jul 2023 16:25:38 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD7A620043;
	Fri,  7 Jul 2023 16:25:38 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC2E620040;
	Fri,  7 Jul 2023 16:25:35 +0000 (GMT)
Received: from [9.43.54.26] (unknown [9.43.54.26])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Jul 2023 16:25:35 +0000 (GMT)
Message-ID: <fd6e3506-ab92-c0ae-69f6-ffb7cd3cf0bb@linux.ibm.com>
Date: Fri, 7 Jul 2023 21:55:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/5] mm/hotplug: Embed vmem_altmap details in memory
 block
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
References: <20230706085041.826340-1-aneesh.kumar@linux.ibm.com>
 <20230706085041.826340-2-aneesh.kumar@linux.ibm.com>
 <72488b8a-8f1e-c652-ab48-47e38290441f@redhat.com>
 <996e226a-2835-5b53-2255-2005c6335f98@linux.ibm.com>
 <e975f02b-1d35-8f22-9f3a-dfe0209306a1@redhat.com>
 <9ca978e7-5c09-6d92-7983-03a731549b25@linux.ibm.com>
 <256bd2f0-1b77-26dc-6393-b26dd363912f@redhat.com>
 <1a35cb1c-5be5-3fba-d59f-132b36863312@linux.ibm.com>
 <87f1854d-5e91-2aaa-6c22-23be61529200@redhat.com>
 <eaeb0b15-0efb-039c-27d4-2ca84b5a2b5d@linux.ibm.com>
 <26e9bd4b-965a-4aaa-6ae9-b1600c7ef52d@redhat.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <26e9bd4b-965a-4aaa-6ae9-b1600c7ef52d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: p5KL0BspWJ3yfkGMANM9jgxiv7ajueSH
X-Proofpoint-GUID: o01l53Z5nhVN5y0dJE_AnZN-VVMSfRLF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_10,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307070149
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

On 7/7/23 9:12 PM, David Hildenbrand wrote:
> On 07.07.23 15:30, Aneesh Kumar K V wrote:
>> On 7/7/23 5:47 PM, David Hildenbrand wrote:
>>> On 06.07.23 18:06, Aneesh Kumar K V wrote:
>>>> On 7/6/23 6:29 PM, David Hildenbrand wrote:
>>>>> On 06.07.23 14:32, Aneesh Kumar K V wrote:
>>>>>> On 7/6/23 4:44 PM, David Hildenbrand wrote:
>>>>>>> On 06.07.23 11:36, Aneesh Kumar K V wrote:
>>>>>>>> On 7/6/23 2:48 PM, David Hildenbrand wrote:
>>>>>>>>> On 06.07.23 10:50, Aneesh Kumar K.V wrote:
>>>>>>>>>> With memmap on memory, some architecture needs more details w.r.t altmap
>>>>>>>>>> such as base_pfn, end_pfn, etc to unmap vmemmap memory.
>>>>>>>>>
>>>>>>>>> Can you elaborate why ppc64 needs that and x86-64 + aarch64 don't?
>>>>>>>>>
>>>>>>>>> IOW, why can't ppc64 simply allocate the vmemmap from the start of the memblock (-> base_pfn) and use the stored number of vmemmap pages to calculate the end_pfn?
>>>>>>>>>
>>>>>>>>> To rephrase: if the vmemmap is not at the beginning and doesn't cover full apgeblocks, memory onlining/offlining would be broken.
>>>>>>>>>
>>>>>>>>> [...]
>>>>>>>>
>>>>>>>>
>>>>>>>> With ppc64 and 64K pagesize and different memory block sizes, we can end up allocating vmemmap backing memory from outside altmap because
>>>>>>>> a single page vmemmap can cover 1024 pages (64 *1024/sizeof(struct page)). and that can point to pages outside the dev_pagemap range.
>>>>>>>> So on free we  check
>>>>>>>
>>>>>>> So you end up with a mixture of altmap and ordinarily-allocated vmemmap pages? That sound wrong (and is counter-intuitive to the feature in general, where we *don't* want to allocate the vmemmap from outside the altmap).
>>>>>>>
>>>>>>> (64 * 1024) / sizeof(struct page) -> 1024 pages
>>>>>>>
>>>>>>> 1024 pages * 64k = 64 MiB.
>>>>>>>
>>>>>>> What's the memory block size on these systems? If it's >= 64 MiB the vmemmap of a single memory block fits into a single page and we should be fine.
>>>>>>>
>>>>>>> Smells like you want to disable the feature on a 64k system.
>>>>>>>
>>>>>>
>>>>>> But that part of vmemmap_free is common for both dax,dax kmem and the new memmap on memory feature. ie, ppc64 vmemmap_free have checks which require
>>>>>> a full altmap structure with all the details in. So for memmap on memmory to work on ppc64 we do require similar altmap struct. Hence the idea
>>>>>> of adding vmemmap_altmap to  struct memory_block
>>>>>
>>>>> I'd suggest making sure that for the memmap_on_memory case your really *always* allocate from the altmap (that's what the feature is about after all), and otherwise block the feature (i.e., arch_mhp_supports_... should reject it).
>>>>>
>>>>
>>>> Sure. How about?
>>>>
>>>> bool mhp_supports_memmap_on_memory(unsigned long size)
>>>> {
>>>>
>>>>      unsigned long nr_pages = size >> PAGE_SHIFT;
>>>>      unsigned long vmemmap_size = nr_pages * sizeof(struct page);
>>>>
>>>>      if (!radix_enabled())
>>>>          return false;
>>>>      /*
>>>>       * memmap on memory only supported with memory block size add/remove
>>>>       */
>>>>      if (size != memory_block_size_bytes())
>>>>          return false;
>>>>      /*
>>>>       * Also make sure the vmemmap allocation is fully contianed
>>>>       * so that we always allocate vmemmap memory from altmap area.
>>>>       */
>>>>      if (!IS_ALIGNED(vmemmap_size,  PAGE_SIZE))
>>>>          return false;
>>>>      /*
>>>>       * The pageblock alignment requirement is met by using
>>>>       * reserve blocks in altmap.
>>>>       */
>>>>      return true;
>>>> }
>>>
>>> Better, but the PAGE_SIZE that could be added to common code as well.
>>>
>>> ... but, the pageblock check in common code implies a PAGE_SIZE check, so why do we need any other check besides the radix_enabled() check for arm64 and just keep all the other checks in common code as they are?
>>>
>>> If your vmemmap does not cover full pageblocks (which implies full pages), the feature cannot be used *unless* we'd waste altmap space in the vmemmap to cover one pageblock.
>>>
>>> Wasting hotplugged memory certainly sounds wrong?
>>>
>>>
>>> So I appreciate if you could explain why the pageblock check should not be had for ppc64?
>>>
>>
>> If we want things to be aligned to pageblock (2M) we will have to use 2M vmemmap space and that implies a memory block of 2G with 64K page size. That requirements makes the feature not useful at all
>> on power. The compromise i came to was what i mentioned in the commit message for enabling the feature on ppc64.
> 
> As we'll always handle a 2M pageblock, you'll end up wasting memory.
> 
> Assume a 64MiB memory block:
> 
> With 64k: 1024 pages -> 64k vmemmap, almost 2 MiB wasted. ~3.1 %
> With 4k: 16384 pages -> 1 MiB vmemmap, 1 MiB wasted. ~1.5%
> 
> It gets worse with smaller memory block sizes.
> 
> 
>>
>> We  use altmap.reserve feature to align things correctly at pageblock granularity. We can end up loosing some pages in memory with this. For ex: with 256MB memory block
>> size, we require 4 pages to map vmemmap pages, In order to align things correctly we end up adding a reserve of 28 pages. ie, for every 4096 pages
>> 28 pages get reserved.
> 
> 
> You can simply align-up the nr_vmemmap_pages up to pageblocks in the memory hotplug code (e.g., depending on a config/arch knob whether wasting memory is supported).
> 
> Because the pageblock granularity is a memory onlining/offlining limitation and should be checked+handled exactly there.

That is what the changes in the patches are doing. A rewritten patch showing this exact details is below. If arch want's to avoid
wasting pages due to this aligment they can add the page aligment restrictions in 

static inline bool arch_supports_memmap_on_memory(unsigned long size)
{
	unsigned long nr_vmemmap_pages = size / PAGE_SIZE;
	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
	unsigned long remaining_size = size - vmemmap_size;

	return IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
		IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));
}


modified   mm/memory_hotplug.c
@@ -1285,6 +1285,16 @@ bool mhp_supports_memmap_on_memory(unsigned long size)
 	       IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));
 }
 
+unsigned long memory_block_align_base(unsigned long size)
+{
+	unsigned long align;
+	unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
+	unsigned long vmemmap_size = (nr_vmemmap_pages * sizeof(struct page)) >> PAGE_SHIFT;
+
+	align = pageblock_align(vmemmap_size) -  vmemmap_size;
+	return align;
+}
+
 /*
  * NOTE: The caller must call lock_device_hotplug() to serialize hotplug
  * and online/offline operations (triggered e.g. by sysfs).
@@ -1295,7 +1305,11 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 {
 	struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
 	enum memblock_flags memblock_flags = MEMBLOCK_NONE;
-	struct vmem_altmap mhp_altmap = {};
+	struct vmem_altmap mhp_altmap = {
+		.base_pfn =  PHYS_PFN(res->start),
+		.end_pfn  =  PHYS_PFN(res->end),
+		.reserve  = memory_block_align_base(resource_size(res)),
+	};
 	struct memory_group *group = NULL;
 	u64 start, size;
 	bool new_node = false;
@@ -1340,8 +1354,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 	 */
 	if (mhp_flags & MHP_MEMMAP_ON_MEMORY) {
 		if (mhp_supports_memmap_on_memory(size)) {
-			mhp_altmap.free = PHYS_PFN(size);
-			mhp_altmap.base_pfn = PHYS_PFN(start);
+			mhp_altmap.free = PHYS_PFN(size) - mhp_altmap.reserve;
 			params.altmap = &mhp_altmap;
 		}
 		/* fallback to not using altmap  */
@@ -1353,7 +1366,7 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		goto error;
 
 	/* create memory block devices after memory was added */
-	ret = create_memory_block_devices(start, size, mhp_altmap.alloc,
+	ret = create_memory_block_devices(start, size, mhp_altmap.alloc + mhp_altmap.reserve,
 					  group);
 	if (ret) {
 		arch_remove_memory(start, size, NULL);
@@ -2253,3 +2266,14 @@ int offline_and_remove_memory(u64 start, u64 size)
 }
 EXPORT_SYMBOL_GPL(offline_and_remove_memory);
 #endif /* CONFIG_MEMORY_HOTREMOVE */
+
+static int __init memory_hotplug_init(void)
+{
+	if (mhp_memmap_on_memory()) {
+		pr_info("Memory hotplug will reserve %ld pages in each memory block\n",
+			memory_block_align_base(memory_block_size_bytes()));
+
+	}
+	return 0;
+}
+module_init(memory_hotplug_init);



