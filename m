Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F3637C765
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 18:14:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgKcn2Blmz303y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 02:14:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WZniOXXJ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WZniOXXJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=WZniOXXJ; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=WZniOXXJ; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgKcC0Yz3z2xtm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 02:14:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620836054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+99igyVqmzNGHqQrMpM/kFdTQLOrOFCJjPehA1KV9HQ=;
 b=WZniOXXJ5kacvEQUuTbu4EoqiQmfAkXAeJ6GIkzLCxw7cyZAQETsj+1xLHGz+vSFZnYM3I
 ddZoIAoMZAJLS9ajkKmiK/P70ttRKt/lEHCWaGEDJV2zZkUXe+EUHQUrx9kZUe5wqbTNzg
 NGoGKkun6ee//Fd23S7JKjptkgfuTUA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620836054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+99igyVqmzNGHqQrMpM/kFdTQLOrOFCJjPehA1KV9HQ=;
 b=WZniOXXJ5kacvEQUuTbu4EoqiQmfAkXAeJ6GIkzLCxw7cyZAQETsj+1xLHGz+vSFZnYM3I
 ddZoIAoMZAJLS9ajkKmiK/P70ttRKt/lEHCWaGEDJV2zZkUXe+EUHQUrx9kZUe5wqbTNzg
 NGoGKkun6ee//Fd23S7JKjptkgfuTUA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-ggDFUMhwP3O6mMUoZ86y3A-1; Wed, 12 May 2021 12:14:11 -0400
X-MC-Unique: ggDFUMhwP3O6mMUoZ86y3A-1
Received: by mail-ed1-f70.google.com with SMTP id
 d6-20020a0564020786b0290387927a37e2so13051970edy.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 09:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+99igyVqmzNGHqQrMpM/kFdTQLOrOFCJjPehA1KV9HQ=;
 b=p7WobqTzJasml4dKwA0zCBoxeu79WMW0/i4gnKvjz4U/ECdlCrLGYDsgGlw5gIFCZ2
 4yedQipRm3yGTjoHuuR9i26Pk9jl8Nhl210goVE53ZOroszTmWXqWpseyJuxN3HZp4/N
 kDDvNorprzMg2cOiat/3d2A1p+30Mz+9oF2VUUlmcHxCpfbMn9aooTx/9C0/LZLax1F/
 a0n50di1rjyJ7oZi7K8ehk525CiwiylXVpcWtx/lnaJkGDK7rXAbufAjWRr4IFkqHoNP
 dUtj6ZrNbYr4gYHRNoiXpmpV5f28OUzWzQaZuNxorCKRG2Nf1DImnyi8lx6CcfUXY2V1
 y2+Q==
X-Gm-Message-State: AOAM530F3OlFmMBwPKV7wyeP4O3i0gkmkm0C2IA2gAMNC45hD6tHqku2
 Rho1m3RNjYj/ttunRY3pcjTZ7Q8sanNdsS9jPVxqsaCTVF49xFFuUukorJrJmqd401nxS+JW/aq
 MZnyXM8J9fQIYGqqfmjMACdf79A==
X-Received: by 2002:a05:6402:310a:: with SMTP id
 dc10mr44324728edb.38.1620836048579; 
 Wed, 12 May 2021 09:14:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/05CH7MkXWBkCHuvNwNl+Ar0uhN69I4Cp7zGz9zWHbeo06zctJRw0Pe1wTe8pgHTDR3XEWg==
X-Received: by 2002:a05:6402:310a:: with SMTP id
 dc10mr44324694edb.38.1620836048213; 
 Wed, 12 May 2021 09:14:08 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c65ab.dip0.t-ipconnect.de. [91.12.101.171])
 by smtp.gmail.com with ESMTPSA id bn5sm83012ejb.97.2021.05.12.09.14.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 09:14:07 -0700 (PDT)
To: Zi Yan <ziy@nvidia.com>, Michal Hocko <mhocko@suse.com>
References: <20210506152623.178731-1-zi.yan@sent.com>
 <fb60eabd-f8ef-2cb1-7338-7725efe3c286@redhat.com>
 <YJUqrOacyqI+kiKW@dhcp22.suse.cz>
 <792d73e2-5d63-74a5-5554-20351d5532ff@redhat.com>
 <746780E5-0288-494D-8B19-538049F1B891@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC PATCH 0/7] Memory hotplug/hotremove at subsection size
Message-ID: <e132fdd9-65af-1cad-8a6e-71844ebfe6a2@redhat.com>
Date: Wed, 12 May 2021 18:14:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <746780E5-0288-494D-8B19-538049F1B891@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-ia64@vger.kernel.org, Wei Yang <richard.weiyang@linux.alibaba.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, x86@kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>
>> As stated somewhere here already, we'll have to look into making alloc_contig_range() (and main users CMA and virtio-mem) independent of MAX_ORDER and mainly rely on pageblock_order. The current handling in alloc_contig_range() is far from optimal as we have to isolate a whole MAX_ORDER - 1 page -- and on ZONE_NORMAL we'll fail easily if any part contains something unmovable although we don't even want to allocate that part. I actually have that on my list (to be able to fully support pageblock_order instead of MAX_ORDER -1 chunks in virtio-mem), however didn't have time to look into it.
> 
> So in your mind, for gigantic page allocation (> MAX_ORDER), alloc_contig_range()
> should be used instead of buddy allocator while pageblock_order is kept at a small
> granularity like 2MB. Is that the case? Isn’t it going to have high fail rate
> when any of the pageblocks within a gigantic page range (like 1GB) becomes unmovable?
> Are you thinking additional mechanism/policy to prevent such thing happening as
> an additional step for gigantic page allocation? Like your ZONE_PREFER_MOVABLE idea?
> 

I am not fully sure yet where the journey will go , I guess nobody 
knows. Ultimately, having buddy support for >= current MAX_ORDER (IOW, 
increasing MAX_ORDER) will most probably happen, so it would be worth 
investigating what has to be done to get that running as a first step.

Of course, we could temporarily think about wiring it up in the buddy like

if (order < MAX_ORDER)
	__alloc_pages()...
else
	alloc_contig_pages()

but it doesn't really improve the situation IMHO, just an API change.

So I think we should look into increasing MAX_ORDER, seeing what needs 
to be done to have that part running while keeping the section size and 
the pageblock order as is. I know that at least memory 
onlining/offlining, cma, alloc_contig_range(), ... needs tweaking, 
especially when we don't increase the section size (but also if we would 
due to the way page isolation is currently handled). Having a MAX_ORDER 
-1 page being partially in different nodes might be another thing to 
look into (I heard that it can already happen right now, but I don't 
remember the details).

The next step after that would then be better fragmentation avoidance 
for larger granularity like 1G THP.

>>
>> Further, page onlining / offlining code and early init code most probably also needs care if MAX_ORDER - 1 crosses sections. Memory holes we might suddenly have in MAX_ORDER - 1 pages might become a problem and will have to be handled. Not sure which other code has to be tweaked (compaction? page isolation?).
> 
> Can you elaborate it a little more? From what I understand, memory holes mean valid
> PFNs are not contiguous before and after a hole, so pfn++ will not work, but
> struct pages are still virtually contiguous assuming SPARSE_VMEMMAP, meaning page++
> would still work. So when MAX_ORDER - 1 crosses sections, additional code would be
> needed instead of simple pfn++. Is there anything I am missing?

I think there are two cases when talking about MAX_ORDER and memory holes:

1. Hole with a valid memmap: the memmap is initialize to PageReserved()
    and the pages are not given to the buddy. pfn_valid() and
    pfn_to_page() works as expected.
2. Hole without a valid memmam: we have that CONFIG_HOLES_IN_ZONE thing
    already, see include/linux/mmzone.h. pfn_valid_within() checks are
    required. Doesn't win a beauty contest, but gets the job done in
    existing setups that seem to care.

"If it is possible to have holes within a MAX_ORDER_NR_PAGES, then we 
need to check pfn validity within that MAX_ORDER_NR_PAGES block. 
pfn_valid_within() should be used in this case; we optimise this away 
when we have no holes within a MAX_ORDER_NR_PAGES block."

CONFIG_HOLES_IN_ZONE is just a bad name for this.

(increasing the section size implies that we waste more memory for the 
memmap in holes. increasing MAX_ORDER means that we might have to deal 
with holes within MAX_ORDER chunks)

We don't have too many pfn_valid_within() checks. I wonder if we could 
add something that is optimized for "holes are a power of two and 
properly aligned", because pfn_valid_within() right not deals with holes 
of any kind which makes it somewhat inefficient IIRC.

> 
> BTW, to test a system with memory holes, do you know is there an easy of adding
> random memory holes to an x86_64 VM, which can help reveal potential missing pieces
> in the code? Changing BIOS-e820 table might be one way, but I have no idea on
> how to do it on QEMU.

It might not be very easy that way. But I heard that some arm64 systems 
have crazy memory layouts -- maybe there, it's easier to get something 
nasty running? :)

https://lkml.kernel.org/r/YJpEwF2cGjS5mKma@kernel.org

I remember there was a way to define the e820 completely on kernel 
cmdline, but I might be wrong ...

-- 
Thanks,

David / dhildenb

