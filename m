Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9B21A3166
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 10:59:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yZpd3kzYzDqd0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 18:59:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ciinVsIn; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yZlR6C8vzDqc5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 18:57:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586422624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2cM+nC39WRQy4oEaNjzY4GHGnalvU5WyGDpJdJ7+AEQ=;
 b=ciinVsIndBCKroz83yaJeihTFm5F04xfZGBFQWUHm2LiW5VeGBHO7sYTrIY+lZ833gtF91
 HA5tVbcz4A/yiOKIQYjPRCJ2y07VLThEDtz4EhtoZC84phrefAziZ0xSE21AYUDi9RyfVm
 G67X2dG2fA5Dpb1IbIvT1Eohtp4m2h8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-TnkQ7Va3O52pbTbuRUiXCQ-1; Thu, 09 Apr 2020 04:57:00 -0400
X-MC-Unique: TnkQ7Va3O52pbTbuRUiXCQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15760107ACCD;
 Thu,  9 Apr 2020 08:56:59 +0000 (UTC)
Received: from [10.36.113.222] (ovpn-113-222.ams2.redhat.com [10.36.113.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27ECF5C1C5;
 Thu,  9 Apr 2020 08:56:55 +0000 (UTC)
Subject: Re: [PATCH v1 1/2] powerpc/pseries/hotplug-memory: stop checking
 is_mem_section_removable()
From: David Hildenbrand <david@redhat.com>
To: piliu <piliu@redhat.com>, Baoquan He <bhe@redhat.com>
References: <20200407135416.24093-1-david@redhat.com>
 <20200407135416.24093-2-david@redhat.com>
 <20200408024630.GQ2402@MiWiFi-R3L-srv>
 <16187f69-0e5b-c9c2-a31b-8658425758aa@redhat.com>
 <85637e60-4d11-2b69-f2a9-1505e0342ce3@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <230658ef-2ab0-1f53-1f04-7b2670c18d8b@redhat.com>
Date: Thu, 9 Apr 2020 10:56:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <85637e60-4d11-2b69-f2a9-1505e0342ce3@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09.04.20 09:26, David Hildenbrand wrote:
> On 09.04.20 04:59, piliu wrote:
>>
>>
>> On 04/08/2020 10:46 AM, Baoquan He wrote:
>>> Add Pingfan to CC since he usually handles ppc related bugs for RHEL.
>>>
>>> On 04/07/20 at 03:54pm, David Hildenbrand wrote:
>>>> In commit 53cdc1cb29e8 ("drivers/base/memory.c: indicate all memory
>>>> blocks as removable"), the user space interface to compute whether a memory
>>>> block can be offlined (exposed via
>>>> /sys/devices/system/memory/memoryX/removable) has effectively been
>>>> deprecated. We want to remove the leftovers of the kernel implementation.
>>>
>>> Pingfan, can you have a look at this change on PPC?  Please feel free to
>>> give comments if any concern, or offer ack if it's OK to you.
>>>
>>>>
>>>> When offlining a memory block (mm/memory_hotplug.c:__offline_pages()),
>>>> we'll start by:
>>>> 1. Testing if it contains any holes, and reject if so
>>>> 2. Testing if pages belong to different zones, and reject if so
>>>> 3. Isolating the page range, checking if it contains any unmovable pages
>>>>
>>>> Using is_mem_section_removable() before trying to offline is not only racy,
>>>> it can easily result in false positives/negatives. Let's stop manually
>>>> checking is_mem_section_removable(), and let device_offline() handle it
>>>> completely instead. We can remove the racy is_mem_section_removable()
>>>> implementation next.
>>>>
>>>> We now take more locks (e.g., memory hotplug lock when offlining and the
>>>> zone lock when isolating), but maybe we should optimize that
>>>> implementation instead if this ever becomes a real problem (after all,
>>>> memory unplug is already an expensive operation). We started using
>>>> is_mem_section_removable() in commit 51925fb3c5c9 ("powerpc/pseries:
>>>> Implement memory hotplug remove in the kernel"), with the initial
>>>> hotremove support of lmbs.
>>>>
>>>> Cc: Nathan Fontenot <nfont@linux.vnet.ibm.com>
>>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>>> Cc: Paul Mackerras <paulus@samba.org>
>>>> Cc: Michal Hocko <mhocko@suse.com>
>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>> Cc: Baoquan He <bhe@redhat.com>
>>>> Cc: Wei Yang <richard.weiyang@gmail.com>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>  .../platforms/pseries/hotplug-memory.c        | 26 +++----------------
>>>>  1 file changed, 3 insertions(+), 23 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
>>>> index b2cde1732301..5ace2f9a277e 100644
>>>> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
>>>> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
>>>> @@ -337,39 +337,19 @@ static int pseries_remove_mem_node(struct device_node *np)
>>>>  
>>>>  static bool lmb_is_removable(struct drmem_lmb *lmb)
>>>>  {
>>>> -	int i, scns_per_block;
>>>> -	bool rc = true;
>>>> -	unsigned long pfn, block_sz;
>>>> -	u64 phys_addr;
>>>> -
>>>>  	if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
>>>>  		return false;
>>>>  
>>>> -	block_sz = memory_block_size_bytes();
>>>> -	scns_per_block = block_sz / MIN_MEMORY_BLOCK_SIZE;
>>>> -	phys_addr = lmb->base_addr;
>>>> -
>>>>  #ifdef CONFIG_FA_DUMP
>>>>  	/*
>>>>  	 * Don't hot-remove memory that falls in fadump boot memory area
>>>>  	 * and memory that is reserved for capturing old kernel memory.
>>>>  	 */
>>>> -	if (is_fadump_memory_area(phys_addr, block_sz))
>>>> +	if (is_fadump_memory_area(lmb->base_addr, memory_block_size_bytes()))
>>>>  		return false;
>>>>  #endif
>>>> -
>>>> -	for (i = 0; i < scns_per_block; i++) {
>>>> -		pfn = PFN_DOWN(phys_addr);
>>>> -		if (!pfn_in_present_section(pfn)) {
>>>> -			phys_addr += MIN_MEMORY_BLOCK_SIZE;
>>>> -			continue;
>>>> -		}
>>>> -
>>>> -		rc = rc && is_mem_section_removable(pfn, PAGES_PER_SECTION);
>>>> -		phys_addr += MIN_MEMORY_BLOCK_SIZE;
>>>> -	}
>>>> -
>>>> -	return rc;
>>>> +	/* device_offline() will determine if we can actually remove this lmb */
>>>> +	return true;
>> So I think here swaps the check and do sequence. At least it breaks
>> dlpar_memory_remove_by_count(). It is doable to remove
>> is_mem_section_removable(), but here should be more effort to re-arrange
>> the code.
>>
> 
> Thanks Pingfan,
> 
> 1. "swaps the check and do sequence":
> 
> Partially. Any caller of dlpar_remove_lmb() already has to deal with
> false positives. device_offline() can easily fail after
> dlpar_remove_lmb() == true. It's inherently racy.

Sorry, s/dlpar_remove_lmb/lmb_is_removable/


-- 
Thanks,

David / dhildenb

