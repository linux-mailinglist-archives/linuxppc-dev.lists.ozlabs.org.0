Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 457191A2DCC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 05:01:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yQrl34jvzDrBj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 13:01:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=piliu@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Jax21M4V; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yQpp5bGZzDqgP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 12:59:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586401163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=drb6LdoPt8DojKwyM0hU/W9FVGYuL0GAN//NvbMdUQQ=;
 b=Jax21M4VZyMwtJvqHUCtnYKiLnY/5XTkWi82PKfY60PIy5+0woLsbihMJiO119ZrYSaKpi
 Q3TnJpBX+TjbeYCNfZaRww1XbdTQhUCEbTia90KC5BoIl+GVNdV9EczILpjER+PMSN4bhY
 Mh49gc5cieXVLkweXiqT1kTI0ymxizM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-kLlVpwcxOh6qvgKVFagviQ-1; Wed, 08 Apr 2020 22:59:18 -0400
X-MC-Unique: kLlVpwcxOh6qvgKVFagviQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7ED0918AB2C3;
 Thu,  9 Apr 2020 02:59:16 +0000 (UTC)
Received: from [10.72.8.19] (ovpn-8-19.pek2.redhat.com [10.72.8.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0879FC0DA3;
 Thu,  9 Apr 2020 02:59:06 +0000 (UTC)
Subject: Re: [PATCH v1 1/2] powerpc/pseries/hotplug-memory: stop checking
 is_mem_section_removable()
To: Baoquan He <bhe@redhat.com>, David Hildenbrand <david@redhat.com>
References: <20200407135416.24093-1-david@redhat.com>
 <20200407135416.24093-2-david@redhat.com>
 <20200408024630.GQ2402@MiWiFi-R3L-srv>
From: piliu <piliu@redhat.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <16187f69-0e5b-c9c2-a31b-8658425758aa@redhat.com>
Date: Thu, 9 Apr 2020 10:59:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200408024630.GQ2402@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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



On 04/08/2020 10:46 AM, Baoquan He wrote:
> Add Pingfan to CC since he usually handles ppc related bugs for RHEL.
> 
> On 04/07/20 at 03:54pm, David Hildenbrand wrote:
>> In commit 53cdc1cb29e8 ("drivers/base/memory.c: indicate all memory
>> blocks as removable"), the user space interface to compute whether a memory
>> block can be offlined (exposed via
>> /sys/devices/system/memory/memoryX/removable) has effectively been
>> deprecated. We want to remove the leftovers of the kernel implementation.
> 
> Pingfan, can you have a look at this change on PPC?  Please feel free to
> give comments if any concern, or offer ack if it's OK to you.
> 
>>
>> When offlining a memory block (mm/memory_hotplug.c:__offline_pages()),
>> we'll start by:
>> 1. Testing if it contains any holes, and reject if so
>> 2. Testing if pages belong to different zones, and reject if so
>> 3. Isolating the page range, checking if it contains any unmovable pages
>>
>> Using is_mem_section_removable() before trying to offline is not only racy,
>> it can easily result in false positives/negatives. Let's stop manually
>> checking is_mem_section_removable(), and let device_offline() handle it
>> completely instead. We can remove the racy is_mem_section_removable()
>> implementation next.
>>
>> We now take more locks (e.g., memory hotplug lock when offlining and the
>> zone lock when isolating), but maybe we should optimize that
>> implementation instead if this ever becomes a real problem (after all,
>> memory unplug is already an expensive operation). We started using
>> is_mem_section_removable() in commit 51925fb3c5c9 ("powerpc/pseries:
>> Implement memory hotplug remove in the kernel"), with the initial
>> hotremove support of lmbs.
>>
>> Cc: Nathan Fontenot <nfont@linux.vnet.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: Michal Hocko <mhocko@suse.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Baoquan He <bhe@redhat.com>
>> Cc: Wei Yang <richard.weiyang@gmail.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>  .../platforms/pseries/hotplug-memory.c        | 26 +++----------------
>>  1 file changed, 3 insertions(+), 23 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
>> index b2cde1732301..5ace2f9a277e 100644
>> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
>> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
>> @@ -337,39 +337,19 @@ static int pseries_remove_mem_node(struct device_node *np)
>>  
>>  static bool lmb_is_removable(struct drmem_lmb *lmb)
>>  {
>> -	int i, scns_per_block;
>> -	bool rc = true;
>> -	unsigned long pfn, block_sz;
>> -	u64 phys_addr;
>> -
>>  	if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
>>  		return false;
>>  
>> -	block_sz = memory_block_size_bytes();
>> -	scns_per_block = block_sz / MIN_MEMORY_BLOCK_SIZE;
>> -	phys_addr = lmb->base_addr;
>> -
>>  #ifdef CONFIG_FA_DUMP
>>  	/*
>>  	 * Don't hot-remove memory that falls in fadump boot memory area
>>  	 * and memory that is reserved for capturing old kernel memory.
>>  	 */
>> -	if (is_fadump_memory_area(phys_addr, block_sz))
>> +	if (is_fadump_memory_area(lmb->base_addr, memory_block_size_bytes()))
>>  		return false;
>>  #endif
>> -
>> -	for (i = 0; i < scns_per_block; i++) {
>> -		pfn = PFN_DOWN(phys_addr);
>> -		if (!pfn_in_present_section(pfn)) {
>> -			phys_addr += MIN_MEMORY_BLOCK_SIZE;
>> -			continue;
>> -		}
>> -
>> -		rc = rc && is_mem_section_removable(pfn, PAGES_PER_SECTION);
>> -		phys_addr += MIN_MEMORY_BLOCK_SIZE;
>> -	}
>> -
>> -	return rc;
>> +	/* device_offline() will determine if we can actually remove this lmb */
>> +	return true;
So I think here swaps the check and do sequence. At least it breaks
dlpar_memory_remove_by_count(). It is doable to remove
is_mem_section_removable(), but here should be more effort to re-arrange
the code.

Thanks,
Pingfan
>>  }
>>  
>>  static int dlpar_add_lmb(struct drmem_lmb *);
>> -- 
>> 2.25.1
>>

