Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0C5CC865
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Oct 2019 08:15:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46lc1858PKzDqPg
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Oct 2019 16:15:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46lbzX0cQQzDqd1
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Oct 2019 16:13:58 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9567Jpd031278; Sat, 5 Oct 2019 02:13:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ved793y8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Oct 2019 02:13:31 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x9567Pp2031518;
 Sat, 5 Oct 2019 02:13:30 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ved793y8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Oct 2019 02:13:30 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x95657TO024875;
 Sat, 5 Oct 2019 06:13:29 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 2vejt698cf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Oct 2019 06:13:29 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x956DSbs51315166
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 5 Oct 2019 06:13:29 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD205124053;
 Sat,  5 Oct 2019 06:13:28 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59B40124052;
 Sat,  5 Oct 2019 06:13:24 +0000 (GMT)
Received: from [9.199.36.126] (unknown [9.199.36.126])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat,  5 Oct 2019 06:13:23 +0000 (GMT)
Subject: Re: [PATCH v5 01/10] mm/memunmap: Use the correct start and end pfn
 when removing pages from zone
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>
References: <20191001144011.3801-1-david@redhat.com>
 <20191001144011.3801-2-david@redhat.com>
 <933f9cd8-9a32-8566-bd97-7e475a009275@redhat.com>
 <09b61ab1-6099-d825-8e04-fbfb43abe4d2@redhat.com>
 <cb6807a4-93c8-3964-bd65-e7087a0c7bf1@linux.ibm.com>
 <6e71cd24-7696-e7ca-15a1-8f126b0860ee@redhat.com>
 <25a72fa3-9859-3fdb-ffd3-deb7bf154fe0@redhat.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <cbb82f0a-a578-5fb0-6b62-00bcd0a09b2e@linux.ibm.com>
Date: Sat, 5 Oct 2019 11:43:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <25a72fa3-9859-3fdb-ffd3-deb7bf154fe0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-05_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910050057
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
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, linux-sh@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Logan Gunthorpe <logang@deltatee.com>,
 Pankaj Gupta <pagupta@redhat.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/4/19 2:33 PM, David Hildenbrand wrote:
> On 04.10.19 11:00, David Hildenbrand wrote:
>> On 03.10.19 18:48, Aneesh Kumar K.V wrote:
>>> On 10/1/19 8:33 PM, David Hildenbrand wrote:
>>>> On 01.10.19 16:57, David Hildenbrand wrote:
>>>>> On 01.10.19 16:40, David Hildenbrand wrote:
>>>>>> From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
>>>>>>
>>>>>> With altmap, all the resource pfns are not initialized. While initializing
>>>>>> pfn, altmap reserve space is skipped. Hence when removing pfn from zone
>>>>>> skip pfns that were never initialized.
>>>>>>
>>>>>> Update memunmap_pages to calculate start and end pfn based on altmap
>>>>>> values. This fixes a kernel crash that is observed when destroying
>>>>>> a namespace.
>>>>>>
>>>>>> [   81.356173] kernel BUG at include/linux/mm.h:1107!
>>>>>> cpu 0x1: Vector: 700 (Program Check) at [c000000274087890]
>>>>>>       pc: c0000000004b9728: memunmap_pages+0x238/0x340
>>>>>>       lr: c0000000004b9724: memunmap_pages+0x234/0x340
>>>>>> ...
>>>>>>       pid   = 3669, comm = ndctl
>>>>>> kernel BUG at include/linux/mm.h:1107!
>>>>>> [c000000274087ba0] c0000000009e3500 devm_action_release+0x30/0x50
>>>>>> [c000000274087bc0] c0000000009e4758 release_nodes+0x268/0x2d0
>>>>>> [c000000274087c30] c0000000009dd144 device_release_driver_internal+0x174/0x240
>>>>>> [c000000274087c70] c0000000009d9dfc unbind_store+0x13c/0x190
>>>>>> [c000000274087cb0] c0000000009d8a24 drv_attr_store+0x44/0x60
>>>>>> [c000000274087cd0] c0000000005a7470 sysfs_kf_write+0x70/0xa0
>>>>>> [c000000274087d10] c0000000005a5cac kernfs_fop_write+0x1ac/0x290
>>>>>> [c000000274087d60] c0000000004be45c __vfs_write+0x3c/0x70
>>>>>> [c000000274087d80] c0000000004c26e4 vfs_write+0xe4/0x200
>>>>>> [c000000274087dd0] c0000000004c2a6c ksys_write+0x7c/0x140
>>>>>> [c000000274087e20] c00000000000bbd0 system_call+0x5c/0x68
>>>>>>
>>>>>> Cc: Dan Williams <dan.j.williams@intel.com>
>>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>>> Cc: Jason Gunthorpe <jgg@ziepe.ca>
>>>>>> Cc: Logan Gunthorpe <logang@deltatee.com>
>>>>>> Cc: Ira Weiny <ira.weiny@intel.com>
>>>>>> Reviewed-by: Pankaj Gupta <pagupta@redhat.com>
>>>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>>>> [ move all pfn-realted declarations into a single line ]
>>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>>> ---
>>>>>>    mm/memremap.c | 13 ++++++++-----
>>>>>>    1 file changed, 8 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/mm/memremap.c b/mm/memremap.c
>>>>>> index 557e53c6fb46..026788b2ac69 100644
>>>>>> --- a/mm/memremap.c
>>>>>> +++ b/mm/memremap.c
>>>>>> @@ -123,7 +123,7 @@ static void dev_pagemap_cleanup(struct dev_pagemap *pgmap)
>>>>>>    void memunmap_pages(struct dev_pagemap *pgmap)
>>>>>>    {
>>>>>>    	struct resource *res = &pgmap->res;
>>>>>> -	unsigned long pfn;
>>>>>> +	unsigned long pfn, nr_pages, start_pfn, end_pfn;
>>>>>>    	int nid;
>>>>>>    
>>>>>>    	dev_pagemap_kill(pgmap);
>>>>>> @@ -131,14 +131,17 @@ void memunmap_pages(struct dev_pagemap *pgmap)
>>>>>>    		put_page(pfn_to_page(pfn));
>>>>>>    	dev_pagemap_cleanup(pgmap);
>>>>>>    
>>>>>> +	start_pfn = pfn_first(pgmap);
>>>>>> +	end_pfn = pfn_end(pgmap);
>>>>>> +	nr_pages = end_pfn - start_pfn;
>>>>>> +
>>>>>>    	/* pages are dead and unused, undo the arch mapping */
>>>>>> -	nid = page_to_nid(pfn_to_page(PHYS_PFN(res->start)));
>>>>>> +	nid = page_to_nid(pfn_to_page(start_pfn));
>>>>>>    
>>>>>>    	mem_hotplug_begin();
>>>>>>    	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
>>>>>> -		pfn = PHYS_PFN(res->start);
>>>>>> -		__remove_pages(page_zone(pfn_to_page(pfn)), pfn,
>>>>>> -				 PHYS_PFN(resource_size(res)), NULL);
>>>>>> +		__remove_pages(page_zone(pfn_to_page(start_pfn)), start_pfn,
>>>>>> +			       nr_pages, NULL);
>>>>>>    	} else {
>>>>>>    		arch_remove_memory(nid, res->start, resource_size(res),
>>>>>>    				pgmap_altmap(pgmap));
>>>>>>
>>>>>
>>>>> Aneesh, I was wondering why the use of "res->start" is correct (and we
>>>>> shouldn't also witch to start_pfn/nr_pages here. It would be good if Dan
>>>>> could review.
>>>>>
>>>>
>>>> To be more precise, I wonder if it should actually be
>>>>
>>>> __remove_pages(page_zone(pfn_to_page(start_pfn)), res->start,
>>>>                  resource_size(res))
>>>>
>>>
>>> yes, that would be make it much clear.
>>>
>>> But for MEMORY_DEVICE_PRIVATE start_pfn and pfn should be same?
>>
>> Okay, let's recap. We should call add_pages()/__remove_pages()
>> and arch_add_memory()/arch_remove_memory() with the exact same ranges.
>>
>> So with PHYS_PFN(res->start) and PHYS_PFN(resource_size(res)
>>
>> Now, only a subset of the pages gets actually initialized,
>> meaning the NID and the ZONE we read could be stale.
>> That, we have to fix.
>>
>> What about something like this (am I missing something?):
>>
>>  From d77b5c50f86570819a437517a897cc40ed29eefb Mon Sep 17 00:00:00 2001
>> From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
>> Date: Fri, 27 Sep 2019 16:02:24 +0530
>> Subject: [PATCH] mm/memunmap: Don't access uninitialized memmap in
>>   memunmap_pages()
>>
>> With an altmap, the memmap falling into the reserved altmap space are
>> not initialized and, therefore, contain a garbage NID and a garbage
>> zone. Make sure to read the NID/zone from a memmap that was initialzed.
>>
>> This fixes a kernel crash that is observed when destroying a namespace:
>>
>> [   81.356173] kernel BUG at include/linux/mm.h:1107!
>> cpu 0x1: Vector: 700 (Program Check) at [c000000274087890]
>>      pc: c0000000004b9728: memunmap_pages+0x238/0x340
>>      lr: c0000000004b9724: memunmap_pages+0x234/0x340
>> ...
>>      pid   = 3669, comm = ndctl
>> kernel BUG at include/linux/mm.h:1107!
>> [c000000274087ba0] c0000000009e3500 devm_action_release+0x30/0x50
>> [c000000274087bc0] c0000000009e4758 release_nodes+0x268/0x2d0
>> [c000000274087c30] c0000000009dd144 device_release_driver_internal+0x174/0x240
>> [c000000274087c70] c0000000009d9dfc unbind_store+0x13c/0x190
>> [c000000274087cb0] c0000000009d8a24 drv_attr_store+0x44/0x60
>> [c000000274087cd0] c0000000005a7470 sysfs_kf_write+0x70/0xa0
>> [c000000274087d10] c0000000005a5cac kernfs_fop_write+0x1ac/0x290
>> [c000000274087d60] c0000000004be45c __vfs_write+0x3c/0x70
>> [c000000274087d80] c0000000004c26e4 vfs_write+0xe4/0x200
>> [c000000274087dd0] c0000000004c2a6c ksys_write+0x7c/0x140
>> [c000000274087e20] c00000000000bbd0 system_call+0x5c/0x68
>>
>> Cc: Dan Williams <dan.j.williams@intel.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Jason Gunthorpe <jgg@ziepe.ca>
>> Cc: Logan Gunthorpe <logang@deltatee.com>
>> Cc: Ira Weiny <ira.weiny@intel.com>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> [ minimze code changes, rephrase description ]
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   mm/memremap.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/mm/memremap.c b/mm/memremap.c
>> index 557e53c6fb46..8b11c0da345c 100644
>> --- a/mm/memremap.c
>> +++ b/mm/memremap.c
>> @@ -123,6 +123,7 @@ static void dev_pagemap_cleanup(struct dev_pagemap *pgmap)
>>   void memunmap_pages(struct dev_pagemap *pgmap)
>>   {
>>   	struct resource *res = &pgmap->res;
>> +	struct page *first_page;
>>   	unsigned long pfn;
>>   	int nid;
>>   
>> @@ -131,14 +132,16 @@ void memunmap_pages(struct dev_pagemap *pgmap)
>>   		put_page(pfn_to_page(pfn));
>>   	dev_pagemap_cleanup(pgmap);
>>   
>> +	/* make sure to access a memmap that was actually initialized */
>> +	first_page = pfn_to_page(pfn_first(pgmap));
>> +
>>   	/* pages are dead and unused, undo the arch mapping */
>> -	nid = page_to_nid(pfn_to_page(PHYS_PFN(res->start)));
>> +	nid = page_to_nid(first_page);
>>   
>>   	mem_hotplug_begin();
>>   	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
>> -		pfn = PHYS_PFN(res->start);
>> -		__remove_pages(page_zone(pfn_to_page(pfn)), pfn,
>> -				 PHYS_PFN(resource_size(res)), NULL);
>> +		__remove_pages(page_zone(first_page), res->start,
>> +			       resource_size(res), NULL);
> 
> Keeping the PHYS_PFN() calls of course ...
> 


That is not different from what I posted right?  For MEMORY_DEVICE_PRIVATE


start_pfn  = PHYS_PFN(rest->start)


>>   	} else {
>>   		arch_remove_memory(nid, res->start, resource_size(res),
>>   				pgmap_altmap(pgmap));
>>
> 
> 

-aneesh

