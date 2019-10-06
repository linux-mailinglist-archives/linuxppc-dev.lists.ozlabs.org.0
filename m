Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FACCD924
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Oct 2019 22:15:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46mZbv1r3QzDqCM
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2019 07:15:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46mZZ43Kj8zDqLX
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Oct 2019 07:13:46 +1100 (AEDT)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0A6A718CB8E9;
 Sun,  6 Oct 2019 20:13:43 +0000 (UTC)
Received: from [10.36.116.33] (ovpn-116-33.ams2.redhat.com [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12BB35D9CC;
 Sun,  6 Oct 2019 20:13:39 +0000 (UTC)
Subject: Re: [PATCH v6 01/10] mm/memunmap: Don't access uninitialized memmap
 in memunmap_pages()
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, x86@kernel.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Logan Gunthorpe <logang@deltatee.com>, Ira Weiny <ira.weiny@intel.com>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-2-david@redhat.com>
 <20191006195838.GA27160@freebsd.route53-aws-cloud.de>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <fefcb660-d8e2-57fd-a348-a6e5269587fd@redhat.com>
Date: Sun, 6 Oct 2019 22:13:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191006195838.GA27160@freebsd.route53-aws-cloud.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Sun, 06 Oct 2019 20:13:43 +0000 (UTC)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06.10.19 21:58, Damian Tometzki wrote:
> Hello David,
> 
> patch 05/10 is missing in the patch series. 
> 

Hi Damian,

not really. Could be that lkml is slow today. E.g., check

https://marc.info/?l=linux-mm&m=157035222620403&w=2

and especially

https://marc.info/?l=linux-mm&m=157035225120440&w=2

All mails popped up on the mm list.

> 
> On Sun, 06. Oct 10:56, David Hildenbrand wrote:
>> From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
>>
>> With an altmap, the memmap falling into the reserved altmap space are
>> not initialized and, therefore, contain a garbage NID and a garbage
>> zone. Make sure to read the NID/zone from a memmap that was initialzed.
>>
>> This fixes a kernel crash that is observed when destroying a namespace:
>>
>> [   81.356173] kernel BUG at include/linux/mm.h:1107!
>> cpu 0x1: Vector: 700 (Program Check) at [c000000274087890]
>>     pc: c0000000004b9728: memunmap_pages+0x238/0x340
>>     lr: c0000000004b9724: memunmap_pages+0x234/0x340
>> ...
>>     pid   = 3669, comm = ndctl
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
>>  mm/memremap.c | 11 +++++++----
>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/mm/memremap.c b/mm/memremap.c
>> index 557e53c6fb46..8c2fb44c3b4d 100644
>> --- a/mm/memremap.c
>> +++ b/mm/memremap.c
>> @@ -123,6 +123,7 @@ static void dev_pagemap_cleanup(struct dev_pagemap *pgmap)
>>  void memunmap_pages(struct dev_pagemap *pgmap)
>>  {
>>  	struct resource *res = &pgmap->res;
>> +	struct page *first_page;
>>  	unsigned long pfn;
>>  	int nid;
>>  
>> @@ -131,14 +132,16 @@ void memunmap_pages(struct dev_pagemap *pgmap)
>>  		put_page(pfn_to_page(pfn));
>>  	dev_pagemap_cleanup(pgmap);
>>  
>> +	/* make sure to access a memmap that was actually initialized */
>> +	first_page = pfn_to_page(pfn_first(pgmap));
>> +
>>  	/* pages are dead and unused, undo the arch mapping */
>> -	nid = page_to_nid(pfn_to_page(PHYS_PFN(res->start)));
>> +	nid = page_to_nid(first_page);
> 
> Why we need 'nid = page_to_nid(first_page)' we didnt use it anymore in this function ?

Please see ...

> 
>>  
>>  	mem_hotplug_begin();
>>  	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
>> -		pfn = PHYS_PFN(res->start);
>> -		__remove_pages(page_zone(pfn_to_page(pfn)), pfn,
>> -				 PHYS_PFN(resource_size(res)), NULL);
>> +		__remove_pages(page_zone(first_page), PHYS_PFN(res->start),
>> +			       PHYS_PFN(resource_size(res)), NULL);
>>  	} else {
>>  		arch_remove_memory(nid, res->start, resource_size(res),
                                   ^ here

:)

>>  				pgmap_altmap(pgmap));



-- 

Thanks,

David / dhildenb
