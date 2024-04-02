Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 912DC89598C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 18:21:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DjOMmwNV;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DjOMmwNV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8Cmc2T7Qz3vXW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 03:21:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DjOMmwNV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DjOMmwNV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8Clp09qCz3dRl
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 03:20:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712074819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6VYTLj6zuDQKXTw32j4CU9J0mr6/jLig+bT9f0giokI=;
	b=DjOMmwNVLKVKg2DprwCMDG2Wo8D86OqpTnKyhbTyL+/w4LKZamhoAFgVLHQEQI0lkN0Hni
	RAI8U25f1aDNtg+wloW/gOr4a5aIawz4bES+baB1HZhRSO3CxvxfHd69t50qCz7uftoubV
	1N0mwTT37UOi01sA4hb4DHUniTC6bA0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712074819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6VYTLj6zuDQKXTw32j4CU9J0mr6/jLig+bT9f0giokI=;
	b=DjOMmwNVLKVKg2DprwCMDG2Wo8D86OqpTnKyhbTyL+/w4LKZamhoAFgVLHQEQI0lkN0Hni
	RAI8U25f1aDNtg+wloW/gOr4a5aIawz4bES+baB1HZhRSO3CxvxfHd69t50qCz7uftoubV
	1N0mwTT37UOi01sA4hb4DHUniTC6bA0=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-osLFVchuPDexZy6PUjIAEg-1; Tue, 02 Apr 2024 12:20:17 -0400
X-MC-Unique: osLFVchuPDexZy6PUjIAEg-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6e6cb8055b8so1828207a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Apr 2024 09:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712074815; x=1712679615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VYTLj6zuDQKXTw32j4CU9J0mr6/jLig+bT9f0giokI=;
        b=DWQDglytf+f24buoUV9aMrL03h7ZdLDsW11I/RvaTOEQ3b7YCsEWyt1jjcSjoU0ybr
         YDEQlO5Ni7/L8Ab1XZ8blil2r4V93xZ5oYxdasSaT9rxFIWxT+nQp77jRuBBwrYJt9gv
         aonHzPCTT8d/vUbi49iMyHFod0NW5b3vuzPXbcySauz5wx71jRfMPaKA6aH+yXo/9Ouo
         0gYOSjGn1zXvG/eixNKFRSh/lbOuQjAG/pQao0RXP6OYBQ7Rt0QN9H3HUN0+oJUZ5uJK
         +LmarnBgguIWOZZIvUAX71Kt2gLnjXRdkghJQxXKurvDkeKCs06kWNlySK257s06qMV7
         g2BA==
X-Forwarded-Encrypted: i=1; AJvYcCWqUBcQzWAgCIn1BatRsp2kbFnfQfy0XGOXo8XK6VgMhTglm4WgAWk/AloCOscLyo05tU/nHQgsftdrClL4kacHMcqIZCQMhjiLL2vPCQ==
X-Gm-Message-State: AOJu0Yyo/Pj+fbEcve47wMi/rbXivecV8e4IHR/OVNM7qIeqlpZ+EYQd
	WopuzA7tmiktU5Pupu23AedTlc5AVM+9nCzZu7DMeiM3xeKna4wmjK0z84aN+QzPvWelhvChW/2
	sQjSkPaHit3RRFsq8JugeYuFG0N/gmARfI+BqXHtsfITV/XhRy4dzIiFnmR/MHFM=
X-Received: by 2002:a9d:65c4:0:b0:6e6:e347:55ec with SMTP id z4-20020a9d65c4000000b006e6e34755ecmr13573446oth.3.1712074814753;
        Tue, 02 Apr 2024 09:20:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE46ExPt478qvysfpB2pMyq3euVTttE4wU4rsd9sOccZPGdfnbScoFrAULW+LlTgBkO8bPnog==
X-Received: by 2002:a9d:65c4:0:b0:6e6:e347:55ec with SMTP id z4-20020a9d65c4000000b006e6e34755ecmr13573406oth.3.1712074814121;
        Tue, 02 Apr 2024 09:20:14 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id gg8-20020a056214252800b00698fad61756sm3521549qvb.65.2024.04.02.09.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 09:20:13 -0700 (PDT)
Date: Tue, 2 Apr 2024 12:20:10 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 13/13] mm/gup: Handle hugetlb in the generic
 follow_page_mask code
Message-ID: <ZgwwOq3XXKlS_7LQ@x1n>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-14-peterx@redhat.com>
 <adfdd89b-ee56-4758-836e-c66a0be7de25@arm.com>
 <5d9dd9a7-e544-4741-944c-469b79c2c649@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5d9dd9a7-e544-4741-944c-469b79c2c649@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

On Tue, Apr 02, 2024 at 05:26:28PM +0200, David Hildenbrand wrote:
> On 02.04.24 16:48, Ryan Roberts wrote:
> > Hi Peter,

Hey, Ryan,

Thanks for the report!

> > 
> > On 27/03/2024 15:23, peterx@redhat.com wrote:
> > > From: Peter Xu <peterx@redhat.com>
> > > 
> > > Now follow_page() is ready to handle hugetlb pages in whatever form, and
> > > over all architectures.  Switch to the generic code path.
> > > 
> > > Time to retire hugetlb_follow_page_mask(), following the previous
> > > retirement of follow_hugetlb_page() in 4849807114b8.
> > > 
> > > There may be a slight difference of how the loops run when processing slow
> > > GUP over a large hugetlb range on cont_pte/cont_pmd supported archs: each
> > > loop of __get_user_pages() will resolve one pgtable entry with the patch
> > > applied, rather than relying on the size of hugetlb hstate, the latter may
> > > cover multiple entries in one loop.
> > > 
> > > A quick performance test on an aarch64 VM on M1 chip shows 15% degrade over
> > > a tight loop of slow gup after the path switched.  That shouldn't be a
> > > problem because slow-gup should not be a hot path for GUP in general: when
> > > page is commonly present, fast-gup will already succeed, while when the
> > > page is indeed missing and require a follow up page fault, the slow gup
> > > degrade will probably buried in the fault paths anyway.  It also explains
> > > why slow gup for THP used to be very slow before 57edfcfd3419 ("mm/gup:
> > > accelerate thp gup even for "pages != NULL"") lands, the latter not part of
> > > a performance analysis but a side benefit.  If the performance will be a
> > > concern, we can consider handle CONT_PTE in follow_page().
> > > 
> > > Before that is justified to be necessary, keep everything clean and simple.
> > > 
> > > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > 
> > Afraid I'm seeing an oops when running gup_longterm test on arm64 with current mm-unstable. Git bisect blames this patch. The oops reproduces for me every time on 2 different machines:
> > 
> > 
> > [    9.340416] kernel BUG at mm/gup.c:778!
> > [    9.340746] Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
> > [    9.341199] Modules linked in:
> > [    9.341481] CPU: 1 PID: 1159 Comm: gup_longterm Not tainted 6.9.0-rc2-00210-g910ff1a347e4 #11
> > [    9.342232] Hardware name: linux,dummy-virt (DT)
> > [    9.342647] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [    9.343195] pc : follow_page_mask+0x4d4/0x880
> > [    9.343580] lr : follow_page_mask+0x4d4/0x880
> > [    9.344018] sp : ffff8000898b3aa0
> > [    9.344345] x29: ffff8000898b3aa0 x28: fffffdffc53973e8 x27: 00003c0005d08000
> > [    9.345028] x26: ffff00014e5cfd08 x25: ffffd3513a40c000 x24: fffffdffc5d08000
> > [    9.345682] x23: ffffc1ffc0000000 x22: 0000000000080101 x21: ffff8000898b3ba8
> > [    9.346337] x20: 0000fffff4200000 x19: ffff00014e52d508 x18: 0000000000000010
> > [    9.347005] x17: 5f656e6f7a5f7369 x16: 2120262620296567 x15: 6170286461654865
> > [    9.347713] x14: 6761502128454741 x13: 2929656761702865 x12: 6761705f65636976
> > [    9.348371] x11: 65645f656e6f7a5f x10: ffffd3513b31d6e0 x9 : ffffd3513852f090
> > [    9.349062] x8 : 00000000ffffefff x7 : ffffd3513b31d6e0 x6 : 0000000000000000
> > [    9.349753] x5 : ffff00017ff98cc8 x4 : 0000000000000fff x3 : 0000000000000000
> > [    9.350397] x2 : 0000000000000000 x1 : ffff000190e8b480 x0 : 0000000000000052
> > [    9.351097] Call trace:
> > [    9.351312]  follow_page_mask+0x4d4/0x880
> > [    9.351700]  __get_user_pages+0xf4/0x3e8
> > [    9.352089]  __gup_longterm_locked+0x204/0xa70
> > [    9.352516]  pin_user_pages+0x88/0xc0
> > [    9.352873]  gup_test_ioctl+0x860/0xc40
> > [    9.353249]  __arm64_sys_ioctl+0xb0/0x100
> > [    9.353648]  invoke_syscall+0x50/0x128
> > [    9.354022]  el0_svc_common.constprop.0+0x48/0xf8
> > [    9.354488]  do_el0_svc+0x28/0x40
> > [    9.354822]  el0_svc+0x34/0xe0
> > [    9.355128]  el0t_64_sync_handler+0x13c/0x158
> > [    9.355489]  el0t_64_sync+0x190/0x198
> > [    9.355793] Code: aa1803e0 d000d8e1 91220021 97fff560 (d4210000)
> > [    9.356280] ---[ end trace 0000000000000000 ]---
> > [    9.356651] note: gup_longterm[1159] exited with irqs disabled
> > [    9.357141] note: gup_longterm[1159] exited with preempt_count 2
> > [    9.358033] ------------[ cut here ]------------
> > [    9.358800] WARNING: CPU: 1 PID: 0 at kernel/context_tracking.c:128 ct_kernel_exit.constprop.0+0x108/0x120
> > [    9.360157] Modules linked in:
> > [    9.360541] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D            6.9.0-rc2-00210-g910ff1a347e4 #11
> > [    9.361626] Hardware name: linux,dummy-virt (DT)
> > [    9.362087] pstate: 204003c5 (nzCv DAIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [    9.362758] pc : ct_kernel_exit.constprop.0+0x108/0x120
> > [    9.363306] lr : ct_idle_enter+0x10/0x20
> > [    9.363845] sp : ffff8000801abdc0
> > [    9.364222] x29: ffff8000801abdc0 x28: 0000000000000000 x27: 0000000000000000
> > [    9.364961] x26: 0000000000000000 x25: ffff00014149d780 x24: 0000000000000000
> > [    9.365557] x23: 0000000000000000 x22: ffffd3513b299d48 x21: ffffd3513a785730
> > [    9.366239] x20: ffffd3513b299c28 x19: ffff00017ffa7da0 x18: 0000fffff5ffffff
> > [    9.366869] x17: 0000000000000000 x16: 1fffe0002a21a8c1 x15: 0000000000000000
> > [    9.367524] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000002
> > [    9.368207] x11: 0000000000000001 x10: 0000000000000ad0 x9 : ffffd35138589230
> > [    9.369123] x8 : ffff00014149e2b0 x7 : 0000000000000000 x6 : 000000000f8c0fb2
> > [    9.370403] x5 : 4000000000000002 x4 : ffff2cb045825000 x3 : ffff8000801abdc0
> > [    9.371170] x2 : ffffd3513a782da0 x1 : 4000000000000000 x0 : ffffd3513a782da0
> > [    9.372279] Call trace:
> > [    9.372519]  ct_kernel_exit.constprop.0+0x108/0x120
> > [    9.373216]  ct_idle_enter+0x10/0x20
> > [    9.373562]  default_idle_call+0x3c/0x160
> > [    9.374055]  do_idle+0x21c/0x280
> > [    9.374394]  cpu_startup_entry+0x3c/0x50
> > [    9.374797]  secondary_start_kernel+0x140/0x168
> > [    9.375220]  __secondary_switched+0xb8/0xc0
> > [    9.375875] ---[ end trace 0000000000000000 ]---
> > 
> > 
> > The oops trigger is at mm/gup.c:778:
> > VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
> > 
> > 
> > This is the output of gup_longterm (last output is just before oops):
> > 
> > # [INFO] detected hugetlb page size: 2048 KiB
> > # [INFO] detected hugetlb page size: 32768 KiB
> > # [INFO] detected hugetlb page size: 64 KiB
> > # [INFO] detected hugetlb page size: 1048576 KiB
> > TAP version 13
> > 1..70
> > # [RUN] R/W longterm GUP pin in MAP_SHARED file mapping ... with memfd
> > ok 1 Should have worked
> > # [RUN] R/W longterm GUP pin in MAP_SHARED file mapping ... with tmpfile
> > ok 2 Should have failed
> > # [RUN] R/W longterm GUP pin in MAP_SHARED file mapping ... with local tmpfile
> > ok 3 Should have failed
> > # [RUN] R/W longterm GUP pin in MAP_SHARED file mapping ... with memfd hugetlb (2048 kB)
> > ok 4 Should have worked
> > # [RUN] R/W longterm GUP pin in MAP_SHARED file mapping ... with memfd hugetlb (32768 kB)
> > 
> > 
> > So 2M passed ok, and its failing for 32M, which is cont-pmd. I'm guessing you're trying to iterate 2M into a cont-pmd folio and ending up with an unexpected tail page?
> 
> I assume we find the expected tail page, it's just that the check
> 
> VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
> 
> Doesn't make sense with hugetlb folios. We might have a tail page mapped in
> a cont-pmd entry. As soon as we call follow_huge_pmd() on "not the first
> cont-pmd entry", we trigger this check.
> 
> Likely this sanity check must also allow for hugetlb folios. Or we should
> just remove it completely.

Right, IMHO it'll be easier we remove it, actually I see there's one more
at the end, so I think we need to remove both.

> 
> In the past, we wanted to make sure that we never get tail pages of THP from
> PMD entries, because something would currently be broken (we don't support
> THP > PMD).

There's probably one more thing we need to do, on allowing
PageAnonExclusive() to work with hugetlb tails. Even if we remove the
warnings and if I read the code right, we can BUG_ON again on checking tail
pages over anon-exclusive for PageHuge.

So I assume to fix it completely, we may need two changes: Patch 1 to
prepare PageAnonExclusive() to work on hugetlb tails, then patch 2 to be
squashed into the patch "mm/gup: handle huge pmd for follow_pmd_mask()".
Note: not this patch to fixup, as this patch only does the "switchover" to
the new path, the culprit should be the other patch..

I have them attached below first, before I'll also go and see whether I can
run some arm tests later today or tomorrow.  David, any comments from
anon-exclusive side?

Thanks,

===8<===

From 26f0670acea948945222c97a9cab58428782ca69 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Tue, 2 Apr 2024 11:52:28 -0400
Subject: [PATCH 1/2] mm: Allow anon exclusive check over hugetlb tail pages

PageAnonExclusive() used to forbid tail pages for hugetlbfs, as that used
to be called mostly in hugetlb specific paths and the head page was
guaranteed.

As we move forward towards merging hugetlb paths into generic mm, we may
start to pass in tail hugetlb pages (when with cont-pte/cont-pmd huge
pages) for such check.  Allow it to properly fetch the head, in which case
the anon-exclusiveness of the head will always represents the tail page.

There's already a sign of it when we look at the fast-gup which already
contain the hugetlb processing altogether: we used to have a specific
commit 5805192c7b72 ("mm/gup: handle cont-PTE hugetlb pages correctly in
gup_must_unshare() via GUP-fast") covering that area.  Now with this more
generic change, that can also go away.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/page-flags.h |  8 +++++++-
 mm/internal.h              | 10 ----------
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 888353c209c0..225357f48a79 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -1095,7 +1095,13 @@ PAGEFLAG(Isolated, isolated, PF_ANY);
 static __always_inline int PageAnonExclusive(const struct page *page)
 {
 	VM_BUG_ON_PGFLAGS(!PageAnon(page), page);
-	VM_BUG_ON_PGFLAGS(PageHuge(page) && !PageHead(page), page);
+	/*
+	 * Allow the anon-exclusive check to work on hugetlb tail pages.
+	 * Here hugetlb pages will always guarantee the anon-exclusiveness
+	 * of the head page represents the tail pages.
+	 */
+	if (PageHuge(page) && !PageHead(page))
+		page = compound_head(page);
 	return test_bit(PG_anon_exclusive, &PF_ANY(page, 1)->flags);
 }
 
diff --git a/mm/internal.h b/mm/internal.h
index 9512de7398d5..87f6e4fd56a5 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1259,16 +1259,6 @@ static inline bool gup_must_unshare(struct vm_area_struct *vma,
 	if (IS_ENABLED(CONFIG_HAVE_FAST_GUP))
 		smp_rmb();
 
-	/*
-	 * During GUP-fast we might not get called on the head page for a
-	 * hugetlb page that is mapped using cont-PTE, because GUP-fast does
-	 * not work with the abstracted hugetlb PTEs that always point at the
-	 * head page. For hugetlb, PageAnonExclusive only applies on the head
-	 * page (as it cannot be partially COW-shared), so lookup the head page.
-	 */
-	if (unlikely(!PageHead(page) && PageHuge(page)))
-		page = compound_head(page);
-
 	/*
 	 * Note that PageKsm() pages cannot be exclusive, and consequently,
 	 * cannot get pinned.
-- 
2.44.0

From 2411d1c6cc95a937c8b7c74e13a206c22c034fab Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Tue, 2 Apr 2024 12:04:35 -0400
Subject: [PATCH 2/2] fixup! mm/gup: handle huge pmd for follow_pmd_mask()

Allow follow_pmd_mask() to take hugetlb tail pages.  The old warnings do
not help now as hugetlb now allows it to happen, so drop them.

Reported-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 91d70057aea0..d60b63fcfc82 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -775,8 +775,6 @@ static struct page *follow_huge_pmd(struct vm_area_struct *vma,
 	assert_spin_locked(pmd_lockptr(mm, pmd));
 
 	page = pmd_page(pmdval);
-	VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
-
 	if ((flags & FOLL_WRITE) &&
 	    !can_follow_write_pmd(pmdval, page, vma, flags))
 		return NULL;
@@ -805,7 +803,6 @@ static struct page *follow_huge_pmd(struct vm_area_struct *vma,
 
 	page += (addr & ~HPAGE_PMD_MASK) >> PAGE_SHIFT;
 	ctx->page_mask = HPAGE_PMD_NR - 1;
-	VM_BUG_ON_PAGE(!PageCompound(page) && !is_zone_device_page(page), page);
 
 	return page;
 }
-- 
2.44.0

-- 
Peter Xu

