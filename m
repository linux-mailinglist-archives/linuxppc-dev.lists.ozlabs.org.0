Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D54948959DB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 18:40:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hZEfuMtU;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hZEfuMtU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8DBs4Wfbz3dfg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 03:40:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hZEfuMtU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hZEfuMtU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8DB45vFzz3bqC
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 03:39:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712075977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1iho2fHVZbhIBfU3vzg6gBJfNoVNEa84mgMip0YsLq0=;
	b=hZEfuMtUQv+VLF2lVCp2K6tOWAPUJkAyZERWLnUu6Mawz22czIU8xEyuLkbLr7+nQ96SKh
	CB8kzUQX+m64y2Vogi5Nkl488x+V2pSB6Z2gCjuoT7BMygAOdKmBADNmorblNlYAQ8U2uv
	KJdIEYPm7FnswoMTWNQH2wpips4wXnk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712075977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1iho2fHVZbhIBfU3vzg6gBJfNoVNEa84mgMip0YsLq0=;
	b=hZEfuMtUQv+VLF2lVCp2K6tOWAPUJkAyZERWLnUu6Mawz22czIU8xEyuLkbLr7+nQ96SKh
	CB8kzUQX+m64y2Vogi5Nkl488x+V2pSB6Z2gCjuoT7BMygAOdKmBADNmorblNlYAQ8U2uv
	KJdIEYPm7FnswoMTWNQH2wpips4wXnk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-9j5idUltMjueekoXEf6dqQ-1; Tue, 02 Apr 2024 12:39:35 -0400
X-MC-Unique: 9j5idUltMjueekoXEf6dqQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-34368e90fcdso248086f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Apr 2024 09:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712075974; x=1712680774;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1iho2fHVZbhIBfU3vzg6gBJfNoVNEa84mgMip0YsLq0=;
        b=KstS9nSP9C+CuRrz+RIksofjZnvgQ3CUCdGQwahy4sodTPlH9Qp5uBr57VOvFFP6/6
         S+DWKkjMbYkxxnwzHm89kMzc7nV+oeC9kgSdqbd0yLP0qqypQREP23FgB9ha+AsulR1/
         KF/+yDOcAJ0fklm0wrcngpp+VX1SKM9ea/XZKmeOcSAoUz+NwOeGoh4GMp32anK6C2ZW
         piNJ7ZZiTjRWfecnw/N8i+LGtwm/UJ3jt7alDV1x4EWCZeEUVJIXoSqBlr/54Xyy9Cwh
         l3ITAuxEKNPgs7dy5zzA3I2IJ+MleiC1HeCx5WGPAS+j8kvzD/lMsbvWsd9JaX00QSR/
         M8uw==
X-Forwarded-Encrypted: i=1; AJvYcCWAgdg1JLuzBQ/Ar1GPUD3NtpLduEbqnBPlmMxXZxfkLM/GE6Jpit0eX/ydpCFYP57HGuxEpSd0aSVvkekT7JPuUGgEcxrZevnWLcFY8A==
X-Gm-Message-State: AOJu0Yw7cQZOOSTbSUOSe4Hb4SIGCwZvuvpAbP95/TcoeTlcmS8x33lD
	v1q1++zPCuGCLj8qNChUhXEkLjZWu1SuGji9ulNOmFBX7MIgtSZ+eGa/WRr5VMGjo7EMSrEY8E2
	dHdWdoGVwsEl7zGrtwfcLvzetrvrXOhCOKZsRfVJPuQz6riOi4Qnoty951c4nffw=
X-Received: by 2002:a5d:4145:0:b0:33e:19ae:3716 with SMTP id c5-20020a5d4145000000b0033e19ae3716mr7756511wrq.11.1712075974037;
        Tue, 02 Apr 2024 09:39:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp91XYqHkyWyxPGtGhZGA2zsBT+69zBFL9WcLwqDRcrrzX0Y/1pHr7AvlnRJRHAr3is/tQPg==
X-Received: by 2002:a5d:4145:0:b0:33e:19ae:3716 with SMTP id c5-20020a5d4145000000b0033e19ae3716mr7756477wrq.11.1712075973575;
        Tue, 02 Apr 2024 09:39:33 -0700 (PDT)
Received: from ?IPV6:2003:cb:c732:e600:4982:2903:710f:f20a? (p200300cbc732e60049822903710ff20a.dip0.t-ipconnect.de. [2003:cb:c732:e600:4982:2903:710f:f20a])
        by smtp.gmail.com with ESMTPSA id v7-20020a5d59c7000000b003432ffc3aeasm14440219wry.56.2024.04.02.09.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 09:39:33 -0700 (PDT)
Message-ID: <8b0b24bb-3c38-4f27-a2c9-f7d7adc4a115@redhat.com>
Date: Tue, 2 Apr 2024 18:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] mm/gup: Handle hugetlb in the generic
 follow_page_mask code
To: Peter Xu <peterx@redhat.com>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-14-peterx@redhat.com>
 <adfdd89b-ee56-4758-836e-c66a0be7de25@arm.com>
 <5d9dd9a7-e544-4741-944c-469b79c2c649@redhat.com> <ZgwwOq3XXKlS_7LQ@x1n>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ZgwwOq3XXKlS_7LQ@x1n>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: James Houghton <jthoughton@google.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Ryan Roberts <ryan.roberts@arm.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02.04.24 18:20, Peter Xu wrote:
> On Tue, Apr 02, 2024 at 05:26:28PM +0200, David Hildenbrand wrote:
>> On 02.04.24 16:48, Ryan Roberts wrote:
>>> Hi Peter,
> 
> Hey, Ryan,
> 
> Thanks for the report!
> 
>>>
>>> On 27/03/2024 15:23, peterx@redhat.com wrote:
>>>> From: Peter Xu <peterx@redhat.com>
>>>>
>>>> Now follow_page() is ready to handle hugetlb pages in whatever form, and
>>>> over all architectures.  Switch to the generic code path.
>>>>
>>>> Time to retire hugetlb_follow_page_mask(), following the previous
>>>> retirement of follow_hugetlb_page() in 4849807114b8.
>>>>
>>>> There may be a slight difference of how the loops run when processing slow
>>>> GUP over a large hugetlb range on cont_pte/cont_pmd supported archs: each
>>>> loop of __get_user_pages() will resolve one pgtable entry with the patch
>>>> applied, rather than relying on the size of hugetlb hstate, the latter may
>>>> cover multiple entries in one loop.
>>>>
>>>> A quick performance test on an aarch64 VM on M1 chip shows 15% degrade over
>>>> a tight loop of slow gup after the path switched.  That shouldn't be a
>>>> problem because slow-gup should not be a hot path for GUP in general: when
>>>> page is commonly present, fast-gup will already succeed, while when the
>>>> page is indeed missing and require a follow up page fault, the slow gup
>>>> degrade will probably buried in the fault paths anyway.  It also explains
>>>> why slow gup for THP used to be very slow before 57edfcfd3419 ("mm/gup:
>>>> accelerate thp gup even for "pages != NULL"") lands, the latter not part of
>>>> a performance analysis but a side benefit.  If the performance will be a
>>>> concern, we can consider handle CONT_PTE in follow_page().
>>>>
>>>> Before that is justified to be necessary, keep everything clean and simple.
>>>>
>>>> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>>>> Signed-off-by: Peter Xu <peterx@redhat.com>
>>>
>>> Afraid I'm seeing an oops when running gup_longterm test on arm64 with current mm-unstable. Git bisect blames this patch. The oops reproduces for me every time on 2 different machines:
>>>
>>>
>>> [    9.340416] kernel BUG at mm/gup.c:778!
>>> [    9.340746] Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
>>> [    9.341199] Modules linked in:
>>> [    9.341481] CPU: 1 PID: 1159 Comm: gup_longterm Not tainted 6.9.0-rc2-00210-g910ff1a347e4 #11
>>> [    9.342232] Hardware name: linux,dummy-virt (DT)
>>> [    9.342647] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>> [    9.343195] pc : follow_page_mask+0x4d4/0x880
>>> [    9.343580] lr : follow_page_mask+0x4d4/0x880
>>> [    9.344018] sp : ffff8000898b3aa0
>>> [    9.344345] x29: ffff8000898b3aa0 x28: fffffdffc53973e8 x27: 00003c0005d08000
>>> [    9.345028] x26: ffff00014e5cfd08 x25: ffffd3513a40c000 x24: fffffdffc5d08000
>>> [    9.345682] x23: ffffc1ffc0000000 x22: 0000000000080101 x21: ffff8000898b3ba8
>>> [    9.346337] x20: 0000fffff4200000 x19: ffff00014e52d508 x18: 0000000000000010
>>> [    9.347005] x17: 5f656e6f7a5f7369 x16: 2120262620296567 x15: 6170286461654865
>>> [    9.347713] x14: 6761502128454741 x13: 2929656761702865 x12: 6761705f65636976
>>> [    9.348371] x11: 65645f656e6f7a5f x10: ffffd3513b31d6e0 x9 : ffffd3513852f090
>>> [    9.349062] x8 : 00000000ffffefff x7 : ffffd3513b31d6e0 x6 : 0000000000000000
>>> [    9.349753] x5 : ffff00017ff98cc8 x4 : 0000000000000fff x3 : 0000000000000000
>>> [    9.350397] x2 : 0000000000000000 x1 : ffff000190e8b480 x0 : 0000000000000052
>>> [    9.351097] Call trace:
>>> [    9.351312]  follow_page_mask+0x4d4/0x880
>>> [    9.351700]  __get_user_pages+0xf4/0x3e8
>>> [    9.352089]  __gup_longterm_locked+0x204/0xa70
>>> [    9.352516]  pin_user_pages+0x88/0xc0
>>> [    9.352873]  gup_test_ioctl+0x860/0xc40
>>> [    9.353249]  __arm64_sys_ioctl+0xb0/0x100
>>> [    9.353648]  invoke_syscall+0x50/0x128
>>> [    9.354022]  el0_svc_common.constprop.0+0x48/0xf8
>>> [    9.354488]  do_el0_svc+0x28/0x40
>>> [    9.354822]  el0_svc+0x34/0xe0
>>> [    9.355128]  el0t_64_sync_handler+0x13c/0x158
>>> [    9.355489]  el0t_64_sync+0x190/0x198
>>> [    9.355793] Code: aa1803e0 d000d8e1 91220021 97fff560 (d4210000)
>>> [    9.356280] ---[ end trace 0000000000000000 ]---
>>> [    9.356651] note: gup_longterm[1159] exited with irqs disabled
>>> [    9.357141] note: gup_longterm[1159] exited with preempt_count 2
>>> [    9.358033] ------------[ cut here ]------------
>>> [    9.358800] WARNING: CPU: 1 PID: 0 at kernel/context_tracking.c:128 ct_kernel_exit.constprop.0+0x108/0x120
>>> [    9.360157] Modules linked in:
>>> [    9.360541] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D            6.9.0-rc2-00210-g910ff1a347e4 #11
>>> [    9.361626] Hardware name: linux,dummy-virt (DT)
>>> [    9.362087] pstate: 204003c5 (nzCv DAIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>> [    9.362758] pc : ct_kernel_exit.constprop.0+0x108/0x120
>>> [    9.363306] lr : ct_idle_enter+0x10/0x20
>>> [    9.363845] sp : ffff8000801abdc0
>>> [    9.364222] x29: ffff8000801abdc0 x28: 0000000000000000 x27: 0000000000000000
>>> [    9.364961] x26: 0000000000000000 x25: ffff00014149d780 x24: 0000000000000000
>>> [    9.365557] x23: 0000000000000000 x22: ffffd3513b299d48 x21: ffffd3513a785730
>>> [    9.366239] x20: ffffd3513b299c28 x19: ffff00017ffa7da0 x18: 0000fffff5ffffff
>>> [    9.366869] x17: 0000000000000000 x16: 1fffe0002a21a8c1 x15: 0000000000000000
>>> [    9.367524] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000002
>>> [    9.368207] x11: 0000000000000001 x10: 0000000000000ad0 x9 : ffffd35138589230
>>> [    9.369123] x8 : ffff00014149e2b0 x7 : 0000000000000000 x6 : 000000000f8c0fb2
>>> [    9.370403] x5 : 4000000000000002 x4 : ffff2cb045825000 x3 : ffff8000801abdc0
>>> [    9.371170] x2 : ffffd3513a782da0 x1 : 4000000000000000 x0 : ffffd3513a782da0
>>> [    9.372279] Call trace:
>>> [    9.372519]  ct_kernel_exit.constprop.0+0x108/0x120
>>> [    9.373216]  ct_idle_enter+0x10/0x20
>>> [    9.373562]  default_idle_call+0x3c/0x160
>>> [    9.374055]  do_idle+0x21c/0x280
>>> [    9.374394]  cpu_startup_entry+0x3c/0x50
>>> [    9.374797]  secondary_start_kernel+0x140/0x168
>>> [    9.375220]  __secondary_switched+0xb8/0xc0
>>> [    9.375875] ---[ end trace 0000000000000000 ]---
>>>
>>>
>>> The oops trigger is at mm/gup.c:778:
>>> VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
>>>
>>>
>>> This is the output of gup_longterm (last output is just before oops):
>>>
>>> # [INFO] detected hugetlb page size: 2048 KiB
>>> # [INFO] detected hugetlb page size: 32768 KiB
>>> # [INFO] detected hugetlb page size: 64 KiB
>>> # [INFO] detected hugetlb page size: 1048576 KiB
>>> TAP version 13
>>> 1..70
>>> # [RUN] R/W longterm GUP pin in MAP_SHARED file mapping ... with memfd
>>> ok 1 Should have worked
>>> # [RUN] R/W longterm GUP pin in MAP_SHARED file mapping ... with tmpfile
>>> ok 2 Should have failed
>>> # [RUN] R/W longterm GUP pin in MAP_SHARED file mapping ... with local tmpfile
>>> ok 3 Should have failed
>>> # [RUN] R/W longterm GUP pin in MAP_SHARED file mapping ... with memfd hugetlb (2048 kB)
>>> ok 4 Should have worked
>>> # [RUN] R/W longterm GUP pin in MAP_SHARED file mapping ... with memfd hugetlb (32768 kB)
>>>
>>>
>>> So 2M passed ok, and its failing for 32M, which is cont-pmd. I'm guessing you're trying to iterate 2M into a cont-pmd folio and ending up with an unexpected tail page?
>>
>> I assume we find the expected tail page, it's just that the check
>>
>> VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
>>
>> Doesn't make sense with hugetlb folios. We might have a tail page mapped in
>> a cont-pmd entry. As soon as we call follow_huge_pmd() on "not the first
>> cont-pmd entry", we trigger this check.
>>
>> Likely this sanity check must also allow for hugetlb folios. Or we should
>> just remove it completely.
> 
> Right, IMHO it'll be easier we remove it, actually I see there's one more
> at the end, so I think we need to remove both.
> 
>>
>> In the past, we wanted to make sure that we never get tail pages of THP from
>> PMD entries, because something would currently be broken (we don't support
>> THP > PMD).
> 
> There's probably one more thing we need to do, on allowing
> PageAnonExclusive() to work with hugetlb tails. Even if we remove the
> warnings and if I read the code right, we can BUG_ON again on checking tail
> pages over anon-exclusive for PageHuge.
> 
> So I assume to fix it completely, we may need two changes: Patch 1 to
> prepare PageAnonExclusive() to work on hugetlb tails, then patch 2 to be
> squashed into the patch "mm/gup: handle huge pmd for follow_pmd_mask()".
> Note: not this patch to fixup, as this patch only does the "switchover" to
> the new path, the culprit should be the other patch..
> 
> I have them attached below first, before I'll also go and see whether I can
> run some arm tests later today or tomorrow.  David, any comments from
> anon-exclusive side?

I added the PageAnonExclusive checks for hugetlb back then, because 
calling it on a tail page indicated real trouble for hugetlb.

Well, and I didn't want to have runtime-hugetlb checks in 
PageAnonExclusive code called on certainly-not-hugetlb code paths.

Personally, I'd fixup the problematic callsite where we know nothing 
nasty is happening (like we did for gup_must_unshare(), because we don't 
expect hugetlb tail pages from arbitrary other code).

But as I'm getting closer to a folio_test_anon_exclusive() 
implementation as we speak (closer, but not done :) ... ), where I'd 
remove any such hugetlb special handling, I don't particularly care how 
we handle GUP here in the meantime.

-- 
Cheers,

David / dhildenb

