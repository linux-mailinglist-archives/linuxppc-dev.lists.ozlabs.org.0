Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1361298C92
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 13:01:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKYN863lwzDqNt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 23:01:44 +1100 (AEDT)
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
 header.s=mimecast20190719 header.b=FZLvvsPD; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=FZLvvsPD; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKYFY5DCxzDqN2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Oct 2020 22:56:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603713356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8HQyHiJi8lNhKdgT87H/9jAZEMb+E8WQwouLjsaWes=;
 b=FZLvvsPD66VmMlqBZWI97suQelOG/5gdYXgvTBTpsRqUnGYhg2a+yln1R806bOAVcPEsI7
 6dUIcrJZ4yxUa1hfZlg/BJEpLwRlYJdTsJVKvJygohpjCLZPIY7GjNuqfFveVt6C4jP7n0
 2phFFuERHeKMvGGKgKpGzACok85CjnM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603713356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8HQyHiJi8lNhKdgT87H/9jAZEMb+E8WQwouLjsaWes=;
 b=FZLvvsPD66VmMlqBZWI97suQelOG/5gdYXgvTBTpsRqUnGYhg2a+yln1R806bOAVcPEsI7
 6dUIcrJZ4yxUa1hfZlg/BJEpLwRlYJdTsJVKvJygohpjCLZPIY7GjNuqfFveVt6C4jP7n0
 2phFFuERHeKMvGGKgKpGzACok85CjnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-fdjIXLUsORWYQaL3CV17Hw-1; Mon, 26 Oct 2020 07:55:52 -0400
X-MC-Unique: fdjIXLUsORWYQaL3CV17Hw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B28548049D9;
 Mon, 26 Oct 2020 11:55:46 +0000 (UTC)
Received: from [10.36.113.62] (ovpn-113-62.ams2.redhat.com [10.36.113.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 451C56EF58;
 Mon, 26 Oct 2020 11:55:38 +0000 (UTC)
Subject: Re: [PATCH 1/4] mm: introduce debug_pagealloc_map_pages() helper
To: Mike Rapoport <rppt@kernel.org>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-2-rppt@kernel.org>
 <8720c067-7dc5-2b02-918b-e54dd642bfd6@redhat.com>
 <20201026115443.GF1154158@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <67e342cd-5ac4-4ba5-77f7-946c9415534e@redhat.com>
Date: Mon, 26 Oct 2020 12:55:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201026115443.GF1154158@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Pekka Enberg <penberg@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26.10.20 12:54, Mike Rapoport wrote:
> On Mon, Oct 26, 2020 at 12:05:13PM +0100, David Hildenbrand wrote:
>> On 25.10.20 11:15, Mike Rapoport wrote:
>>> From: Mike Rapoport <rppt@linux.ibm.com>
>>>
>>> When CONFIG_DEBUG_PAGEALLOC is enabled, it unmaps pages from the
>>> kernel direct mapping after free_pages(). The pages than need to be
>>> mapped back before they could be used. Theese mapping operations use 
>>> __kernel_map_pages() guarded with with debug_pagealloc_enabled().
>>>
>>> The only place that calls __kernel_map_pages() without checking
>>> whether DEBUG_PAGEALLOC is enabled is the hibernation code that
>>> presumes availability of this function when ARCH_HAS_SET_DIRECT_MAP
>>> is set. Still, on arm64, __kernel_map_pages() will bail out when
>>> DEBUG_PAGEALLOC is not enabled but set_direct_map_invalid_noflush()
>>> may render some pages not present in the direct map and hibernation
>>> code won't be able to save such pages.
>>>
>>> To make page allocation debugging and hibernation interaction more
>>> robust, the dependency on DEBUG_PAGEALLOC or ARCH_HAS_SET_DIRECT_MAP
>>> has to be made more explicit.
>>>
>>> Start with combining the guard condition and the call to 
>>> __kernel_map_pages() into a single debug_pagealloc_map_pages()
>>> function to emphasize that __kernel_map_pages() should not be called
>>> without DEBUG_PAGEALLOC and use this new function to map/unmap pages
>>> when page allocation debug is enabled.
>>>
>>> As the only remaining user of kernel_map_pages() is the hibernation
>>> code, mode that function into kernel/power/snapshot.c closer to a
>>> caller.
>>
>> s/mode/move/
>>
>>>
>>> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com> --- 
>>> include/linux/mm.h      | 16 +++++++--------- kernel/power/snapshot.c
>>> | 11 +++++++++++ mm/memory_hotplug.c     |  3 +-- mm/page_alloc.c
>>> |  6 ++---- mm/slab.c               |  8 +++----- 5 files changed, 24
>>> insertions(+), 20 deletions(-)
>>>
>>> diff --git a/include/linux/mm.h b/include/linux/mm.h index
>>> ef360fe70aaf..14e397f3752c 100644 --- a/include/linux/mm.h +++
>>> b/include/linux/mm.h @@ -2927,21 +2927,19 @@ static inline bool
>>> debug_pagealloc_enabled_static(void) #if
>>> defined(CONFIG_DEBUG_PAGEALLOC) ||
>>> defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP) extern void
>>> __kernel_map_pages(struct page *page, int numpages, int enable);
>>>
>>> -/* - * When called in DEBUG_PAGEALLOC context, the call should most
>>> likely be - * guarded by debug_pagealloc_enabled() or
>>> debug_pagealloc_enabled_static() - */ -static inline void 
>>> -kernel_map_pages(struct page *page, int numpages, int enable) 
>>> +static inline void debug_pagealloc_map_pages(struct page *page, +
>>> int numpages, int enable) { -	__kernel_map_pages(page, numpages,
>>> enable); +	if (debug_pagealloc_enabled_static()) +
>>> __kernel_map_pages(page, numpages, enable); } + #ifdef
>>> CONFIG_HIBERNATION extern bool kernel_page_present(struct page
>>> *page); #endif	/* CONFIG_HIBERNATION */ #else	/*
>>> CONFIG_DEBUG_PAGEALLOC || CONFIG_ARCH_HAS_SET_DIRECT_MAP */ -static
>>> inline void -kernel_map_pages(struct page *page, int numpages, int
>>> enable) {} +static inline void debug_pagealloc_map_pages(struct page
>>> *page, +					     int numpages, int enable) {} #ifdef
>>> CONFIG_HIBERNATION static inline bool kernel_page_present(struct page
>>> *page) { return true; } #endif	/* CONFIG_HIBERNATION */ diff --git
>>> a/kernel/power/snapshot.c b/kernel/power/snapshot.c index
>>> 46b1804c1ddf..fa499466f645 100644 --- a/kernel/power/snapshot.c +++
>>> b/kernel/power/snapshot.c @@ -76,6 +76,17 @@ static inline void
>>> hibernate_restore_protect_page(void *page_address) {} static inline
>>> void hibernate_restore_unprotect_page(void *page_address) {} #endif
>>> /* CONFIG_STRICT_KERNEL_RWX  && CONFIG_ARCH_HAS_SET_MEMORY */
>>>
>>> +#if defined(CONFIG_DEBUG_PAGEALLOC) ||
>>> defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP) +static inline void 
>>> +kernel_map_pages(struct page *page, int numpages, int enable) +{ +
>>> __kernel_map_pages(page, numpages, enable); +} +#else +static inline
>>> void +kernel_map_pages(struct page *page, int numpages, int enable)
>>> {} +#endif +
>>
>> That change should go into a separate patch.
>  
> Hmm, I beleive you refer to moving kernel_map_pages() to snapshot.c,
> right?

Sorry, yes!


-- 
Thanks,

David / dhildenb

