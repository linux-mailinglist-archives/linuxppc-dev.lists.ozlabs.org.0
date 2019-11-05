Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE25CF0ADF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 01:07:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4776Kb5jw9zF5B0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 11:07:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="r71UU1NF"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4774vP40sszDqFM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 10:02:56 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id t4so7697878otr.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Nov 2019 15:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FJnp1WzP7FDNOlX+PPW/uXmMFEEBV08ygb44tlD6toQ=;
 b=r71UU1NF3VCvLrng/dY2UGB8Q9lxizmNC3+RQwXfL+BA+gtvyFkbklNt8G0KmWTyI/
 gY4A3WDBq4+OGqDaUA8w6/JZlXbaFXwNHFgMssB0CicQRm2b3ATAUgnMl37fXYM0ybh0
 i2y88ubkRNwE0lnU8UgrhxLS6tlDGagVtCZ85SLH0zGx8HRr1NwsyRQ8m6k8Nk/g7CAE
 2Nz4suTZOTQTGfFBTfBb43ExGodrmtVOXpVaipIEnH/Vb/f5e+doWkdWW+4BoBYRt4W5
 uILcxXLTtVAw+eWccvxT46RuKzmX+sL0p4DT2Mzbni/aVhvov/FERz4vwE5LUVDjdhbI
 W3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FJnp1WzP7FDNOlX+PPW/uXmMFEEBV08ygb44tlD6toQ=;
 b=eapabq6p9wKNsl9ArZW7W3k+RsQbnU1PT/8BxmccCm6o1QO62+N/489JMpr9TOeysk
 FfWAlJxx+WY7MJCdIPTyThe8kQcQyb0o/aIrv4qa5spgjGf2tUqb9i+RCH6Saxoh+qH+
 el10Mi7r7fOLivQe4cnEGLU0Pm2+OHhAPuAFHP51EfBkpvQc3CByFxrLXsBgx4u4jG3Z
 9s74KhkBAyHfKshui6HMH0ERQYSQe+7mAo/SD6VocL1p71QlaS9X3uqQ+f1/GDVlGsUZ
 KZia3NRZxdu3k8+ryhToolrcFvzsAnndLM8Sz0ub6PoXEk9v4LtOE0BmiDtC6ol40HBT
 0BWg==
X-Gm-Message-State: APjAAAUS5f7UOign2Fc7GYNAEMFvt9aIxtGs+7WI46ULwfvJrsoYGHqz
 XAvZAbtBllfz/W8a+ue0UhJst7mE0N8K/h2zuJliTw==
X-Google-Smtp-Source: APXvYqwKvRMYh+ESeeQbTjGztzWIU2GaaX6lax5LzmKoFmyMhxApIqS8cluAsJUsUZJOgqRh+PH603pjKculyAMZPiA=
X-Received: by 2002:a9d:30c8:: with SMTP id r8mr7347703otg.363.1572994971715; 
 Tue, 05 Nov 2019 15:02:51 -0800 (PST)
MIME-Version: 1.0
References: <20191024120938.11237-1-david@redhat.com>
 <20191024120938.11237-4-david@redhat.com>
 <CAPcyv4jyTxEpw5ep5Noy0YRV7Dybzj+8OTVMwRK_zeFigF-LsQ@mail.gmail.com>
 <bbe59155-24ae-f229-e182-107730423c47@redhat.com>
 <01adb4cb-6092-638c-0bab-e61322be7cf5@redhat.com>
 <613f3606-748b-0e56-a3ad-1efaffa1a67b@redhat.com>
 <20191105160000.GC8128@linux.intel.com>
 <ed89cd61-7c45-8c9c-ffeb-f27b1872bd7a@redhat.com>
In-Reply-To: <ed89cd61-7c45-8c9c-ffeb-f27b1872bd7a@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 5 Nov 2019 15:02:40 -0800
Message-ID: <CAPcyv4htPCeui80fOOno+7AFo3V-=VEiWkAv8j+-Kkad+UnFGQ@mail.gmail.com>
Subject: Re: [PATCH v1 03/10] KVM: Prepare kvm_is_reserved_pfn() for
 PG_reserved changes
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 06 Nov 2019 11:05:37 +1100
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
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 KVM list <kvm@vger.kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Linux MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>,
 Kees Cook <keescook@chromium.org>, devel@driverdev.osuosl.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, X86 ML <x86@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Juergen Gross <jgross@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Sasha Levin <sashal@kernel.org>,
 kvm-ppc@vger.kernel.org, Qian Cai <cai@lca.pw>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jim Mattson <jmattson@google.com>, Mel Gorman <mgorman@techsingularity.net>,
 Adam Borowski <kilobyte@angband.pl>, Cornelia Huck <cohuck@redhat.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 5, 2019 at 12:31 PM David Hildenbrand <david@redhat.com> wrote:
>
> >>> I think I know what's going wrong:
> >>>
> >>> Pages that are pinned via gfn_to_pfn() and friends take a references,
> >>> however are often released via
> >>> kvm_release_pfn_clean()/kvm_release_pfn_dirty()/kvm_release_page_clean()...
> >>>
> >>>
> >>> E.g., in arch/x86/kvm/x86.c:reexecute_instruction()
> >>>
> >>> ...
> >>> pfn = gfn_to_pfn(vcpu->kvm, gpa_to_gfn(gpa));
> >>> ...
> >>> kvm_release_pfn_clean(pfn);
> >>>
> >>>
> >>>
> >>> void kvm_release_pfn_clean(kvm_pfn_t pfn)
> >>> {
> >>>     if (!is_error_noslot_pfn(pfn) && !kvm_is_reserved_pfn(pfn))
> >>>             put_page(pfn_to_page(pfn));
> >>> }
> >>>
> >>> This function makes perfect sense as the counterpart for kvm_get_pfn():
> >>>
> >>> void kvm_get_pfn(kvm_pfn_t pfn)
> >>> {
> >>>     if (!kvm_is_reserved_pfn(pfn))
> >>>             get_page(pfn_to_page(pfn));
> >>> }
> >>>
> >>>
> >>> As all ZONE_DEVICE pages are currently reserved, pages pinned via
> >>> gfn_to_pfn() and friends will often not see a put_page() AFAIKS.
> >
> > Assuming gup() takes a reference for ZONE_DEVICE pages, yes, this is a
> > KVM bug.
>
> Yes, it does take a reference AFAIKs. E.g.,
>
> mm/gup.c:gup_pte_range():
> ...
>                 if (pte_devmap(pte)) {
>                         if (unlikely(flags & FOLL_LONGTERM))
>                                 goto pte_unmap;
>
>                         pgmap = get_dev_pagemap(pte_pfn(pte), pgmap);
>                         if (unlikely(!pgmap)) {
>                                 undo_dev_pagemap(nr, nr_start, pages);
>                                 goto pte_unmap;
>                         }
>                 } else if (pte_special(pte))
>                         goto pte_unmap;
>
>                 VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
>                 page = pte_page(pte);
>
>                 head = try_get_compound_head(page, 1);
>
> try_get_compound_head() will increment the reference count.
>
> >
> >>> Now, my patch does not change that, the result of
> >>> kvm_is_reserved_pfn(pfn) will be unchanged. A proper fix for that would
> >>> probably be
> >>>
> >>> a) To drop the reference to ZONE_DEVICE pages in gfn_to_pfn() and
> >>> friends, after you successfully pinned the pages. (not sure if that's
> >>> the right thing to do but you're the expert)
> >>>
> >>> b) To not use kvm_release_pfn_clean() and friends on pages that were
> >>> definitely pinned.
> >
> > This is already KVM's intent, i.e. the purpose of the PageReserved() check
> > is simply to avoid putting a non-existent reference.  The problem is that
> > KVM assumes pages with PG_reserved set are never pinned, which AFAICT was
> > true when the code was first added.
> >
> >> (talking to myself, sorry)
> >>
> >> Thinking again, dropping this patch from this series could effectively also
> >> fix that issue. E.g., kvm_release_pfn_clean() and friends would always do a
> >> put_page() if "pfn_valid() and !PageReserved()", so after patch 9 also on
> >> ZONDE_DEVICE pages.
> >
> > Yeah, this appears to be the correct fix.
> >
> >> But it would have side effects that might not be desired. E.g.,:
> >>
> >> 1. kvm_pfn_to_page() would also return ZONE_DEVICE pages (might even be the
> >> right thing to do).
> >
> > This should be ok, at least on x86.  There are only three users of
> > kvm_pfn_to_page().  Two of those are on allocations that are controlled by
> > KVM and are guaranteed to be vanilla MAP_ANONYMOUS.  The third is on guest
> > memory when running a nested guest, and in that case supporting ZONE_DEVICE
> > memory is desirable, i.e. KVM should play nice with a guest that is backed
> > by ZONE_DEVICE memory.
> >
> >> 2. kvm_set_pfn_dirty() would also set ZONE_DEVICE pages dirty (might be
> >> okay)
> >
> > This is ok from a KVM perspective.
>
> What about
>
> void kvm_get_pfn(kvm_pfn_t pfn)
> {
>         if (!kvm_is_reserved_pfn(pfn))
>                 get_page(pfn_to_page(pfn));
> }
>
> Is a pure get_page() sufficient in case of ZONE_DEVICE?
> (asking because of the live references obtained via
> get_dev_pagemap(pte_pfn(pte), pgmap) in mm/gup.c:gup_pte_range()
> somewhat confuse me :) )

It is not sufficient. PTE_DEVMAP is there to tell the gup path "be
careful, this pfn has device-lifetime, make sure the device is pinned
and not actively in the process of dying before pinning any pages
associated with this device".

However, if kvm_get_pfn() is honoring kvm_is_reserved_pfn() that
returns true for ZONE_DEVICE, I'm missing how it is messing up the
reference counts.

> > The scarier code (for me) is transparent_hugepage_adjust() and
> > kvm_mmu_zap_collapsible_spte(), as I don't at all understand the
> > interaction between THP and _PAGE_DEVMAP.
>
> The x86 KVM MMU code is one of the ugliest code I know (sorry, but it
> had to be said :/ ). Luckily, this should be independent of the
> PG_reserved thingy AFAIKs.

Both transparent_hugepage_adjust() and kvm_mmu_zap_collapsible_spte()
are honoring kvm_is_reserved_pfn(), so again I'm missing where the
page count gets mismanaged and leads to the reported hang.
