Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A49E2A404B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 10:31:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQPfX1J66zDqLc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 20:31:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=SHetzLSq; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=SHetzLSq; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQPcc0dnYzDq9C
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 20:29:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604395757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6VxSu2PqZTOVwlHqfV5vgrCySM0YW7L+hDdT3d5Hk5c=;
 b=SHetzLSqxEwVztRygwnJO3dywHwPkOzN7JDFeTxsoRsaVQPADY1Y0cD9WEy7CPn9fODTMg
 fV/Ic2XCzBlgv1S/2gQedAkmxnpa6vmHYfMs8TZ/jdIVJvR+6hEf27gAUF7f5qqYwXFqJD
 pilsggpCJsCDMmvwXF1C4h0svuE34NU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604395757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6VxSu2PqZTOVwlHqfV5vgrCySM0YW7L+hDdT3d5Hk5c=;
 b=SHetzLSqxEwVztRygwnJO3dywHwPkOzN7JDFeTxsoRsaVQPADY1Y0cD9WEy7CPn9fODTMg
 fV/Ic2XCzBlgv1S/2gQedAkmxnpa6vmHYfMs8TZ/jdIVJvR+6hEf27gAUF7f5qqYwXFqJD
 pilsggpCJsCDMmvwXF1C4h0svuE34NU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-Z8eVsKNQMrizAoeQ62RFAQ-1; Tue, 03 Nov 2020 04:29:12 -0500
X-MC-Unique: Z8eVsKNQMrizAoeQ62RFAQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5860C835B49;
 Tue,  3 Nov 2020 09:29:10 +0000 (UTC)
Received: from [10.36.115.7] (ovpn-115-7.ams2.redhat.com [10.36.115.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 219DF5D9CC;
 Tue,  3 Nov 2020 09:29:06 +0000 (UTC)
Subject: Re: [PATCH v1 4/4] powernv/memtrace: don't abuse memory hot(un)plug
 infrastructure for memory allocations
To: Michal Hocko <mhocko@suse.com>
References: <20201029162718.29910-1-david@redhat.com>
 <20201029162718.29910-5-david@redhat.com>
 <20201103092309.GD21990@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <a07525c6-a8a5-2d8b-1fec-eb25a3503a3d@redhat.com>
Date: Tue, 3 Nov 2020 10:29:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201103092309.GD21990@dhcp22.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Rashmica Gupta <rashmica.g@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03.11.20 10:23, Michal Hocko wrote:
> On Thu 29-10-20 17:27:18, David Hildenbrand wrote:
>> Let's use alloc_contig_pages() for allocating memory and remove the
>> linear mapping manually via arch_remove_linear_mapping(). Mark all pages
>> PG_offline, such that they will definitely not get touched - e.g.,
>> when hibernating. When freeing memory, try to revert what we did.
>>
>> The original idea was discussed in:
>>   https://lkml.kernel.org/r/48340e96-7e6b-736f-9e23-d3111b915b6e@redhat.com
>>
>> This is similar to CONFIG_DEBUG_PAGEALLOC handling on other
>> architectures, whereby only single pages are unmapped from the linear
>> mapping. Let's mimic what memory hot(un)plug would do with the linear
>> mapping.
>>
>> We now need MEMORY_HOTPLUG and CONTIG_ALLOC as dependencies.
>>
>> Simple test under QEMU TCG (10GB RAM, single NUMA node):
>>
>> sh-5.0# mount -t debugfs none /sys/kernel/debug/
>> sh-5.0# cat /sys/devices/system/memory/block_size_bytes
>> 40000000
>> sh-5.0# echo 0x40000000 > /sys/kernel/debug/powerpc/memtrace/enable
>> [   71.052836][  T356] memtrace: Allocated trace memory on node 0 at 0x0000000080000000
>> sh-5.0# echo 0x80000000 > /sys/kernel/debug/powerpc/memtrace/enable
>> [   75.424302][  T356] radix-mmu: Mapped 0x0000000080000000-0x00000000c0000000 with 64.0 KiB pages
>> [   75.430549][  T356] memtrace: Freed trace memory back on node 0
>> [   75.604520][  T356] memtrace: Allocated trace memory on node 0 at 0x0000000080000000
>> sh-5.0# echo 0x100000000 > /sys/kernel/debug/powerpc/memtrace/enable
>> [   80.418835][  T356] radix-mmu: Mapped 0x0000000080000000-0x0000000100000000 with 64.0 KiB pages
>> [   80.430493][  T356] memtrace: Freed trace memory back on node 0
>> [   80.433882][  T356] memtrace: Failed to allocate trace memory on node 0
>> sh-5.0# echo 0x40000000 > /sys/kernel/debug/powerpc/memtrace/enable
>> [   91.920158][  T356] memtrace: Allocated trace memory on node 0 at 0x0000000080000000
>>
>> Note 1: We currently won't be allocating from ZONE_MOVABLE - because our
>> 	pages are not movable. However, as we don't run with any memory
>> 	hot(un)plug mechanism around, we could make an exception to
>> 	increase the chance of allocations succeeding.
>>
>> Note 2: PG_reserved isn't sufficient. E.g., kernel_page_present() used
>> 	along PG_reserved in hibernation code will always return "true"
>> 	on powerpc, resulting in the pages getting touched. It's too
>> 	generic - e.g., indicates boot allocations.
>>
>> Note 3: For now, we keep using memory_block_size_bytes() as minimum
>> 	granularity. I'm not able to come up with a better guess (most
>> 	probably, doing it on a section basis could be possible).
>>
>> Suggested-by: Michal Hocko <mhocko@kernel.org>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: Rashmica Gupta <rashmica.g@gmail.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Mike Rapoport <rppt@kernel.org>
>> Cc: Michal Hocko <mhocko@suse.com>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Thanks! This looks like a move into the right direction. I cannot really
> judge implementation details because I am not familiar with the code.
> I have only one tiny concern:
> [...]
>> -/* called with device_hotplug_lock held */
>> -static bool memtrace_offline_pages(u32 nid, u64 start_pfn, u64 nr_pages)
>> +static u64 memtrace_alloc_node(u32 nid, u64 size)
>>   {
>> -	const unsigned long start = PFN_PHYS(start_pfn);
>> -	const unsigned long size = PFN_PHYS(nr_pages);
>> +	const unsigned long nr_pages = PHYS_PFN(size);
>> +	unsigned long pfn, start_pfn;
>> +	struct page *page;
>>   
>> -	if (walk_memory_blocks(start, size, NULL, check_memblock_online))
>> -		return false;
>> -
>> -	walk_memory_blocks(start, size, (void *)MEM_GOING_OFFLINE,
>> -			   change_memblock_state);
>> -
>> -	if (offline_pages(start_pfn, nr_pages)) {
>> -		walk_memory_blocks(start, size, (void *)MEM_ONLINE,
>> -				   change_memblock_state);
>> -		return false;
>> -	}
>> +	/*
>> +	 * Trace memory needs to be aligned to the size, which is guaranteed
>> +	 * by alloc_contig_pages().
>> +	 */
>> +	page = alloc_contig_pages(nr_pages, __GFP_THISNODE | __GFP_NOWARN,
>> +				  nid, NULL);
> 
> __GFP_THISNODE without other modifiers looks suspicious. I suspect you
> want to enfore node locality and exclude movable zones by this. While
> this works it is an antipattern. I would rather use GFP_KERNEL |
> __GFP_THISNODE | __GFP_NOWARN to be more in line with other gfp usage.

Agreed GFP_KERNEL should be the right thing to do here.

> 
> If for no other reasons we want to be able to work inside a normal
> compaction context (comparing to effectively GFP_NOIO which the above
> implies). Also this looks like a sleepable context.
> 

Yes it is. Thanks!

-- 
Thanks,

David / dhildenb

