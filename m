Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7E2E24CD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 22:53:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46z2dQ6FgKzDqRR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 07:52:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="hbN7bIiI"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yxgk6h1vzDqNf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 04:09:36 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id d8so6879937otc.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 10:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/PPTNoTWpl2Emb8pb8ijRWaxdCAJfb0VFPmFXVJXJ0Y=;
 b=hbN7bIiIX8Xmxz4v3l9adUYVp8CKtz0z5KQi/27rhGcPP601NUpctvc3jVlRlmAq60
 bUH2bqaNZJ9UrYZme/X2orJt/+vEoAwoqDVyVGfR1TqrAatkLwtzHFrJEv4mqzOTDUKZ
 zp2peBbaDwOUIb5SBWYc1SXLUeaoIXVN4F7WKhHc8YJviU5NL7SbXN5mNamVMC412qqH
 0SCiBOM5ynGJUKcG0RwMlOZ/gPcnjg1Yf0DknwM/RuqXhua0o3wQY3vosVPoVXCS9v5X
 y0MGUZpzfF0MfwnxF5f6iDq8OgHH01U9NAwoE0E8xv2N0rSqlvONAVbxkmTs03rBkNDf
 62ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/PPTNoTWpl2Emb8pb8ijRWaxdCAJfb0VFPmFXVJXJ0Y=;
 b=VP8lKz+03CbZbk4XJCOQBrvtl3iNAc9PFpjJrbRGn4M+9DfZ0+tqy6jfkY3sZz4sWx
 w5yCqpeJ3QK5HIpul74gh47rfHkYCBR01YOiydXvsb9el4+SEGgInlROGCpJDlyZh8Dg
 8We2F3IS8eLrgzhZurgQah9rL/ruOMosE2KCxCcr0uL6t/lzc5SWcYlt/PCpIA4QZdrb
 KSdhpeZK4xUxyaxizZ2jQVZAbxS9cJm7A7vTPK3xOdZiY4YlczExIxx/Y8x+JZ1tVRj5
 KrkgClcUF9vZAImx7HQ4al+BuhcrdflYNhJ6uH4MYZ4H3AT1ngRFX/Jg7ukuCt7bF4PY
 2nQA==
X-Gm-Message-State: APjAAAV0CTqQcdy2YKDwg1ABC/KWOm5E++R6a8dKlnPZOOsWatY/St8x
 IsnRpQ5R1AHAvhp2wR9fLEsd4DAlhrpm7jlv4jHyDw==
X-Google-Smtp-Source: APXvYqwKooneF9Tk0GZvPmgAdoyoPp5zUpQpfCPxGZyKnmAbzf+oYuN3U71bPYK4qtN8ms7/1oT3X39EsbFkk/t4RFE=
X-Received: by 2002:a05:6830:617:: with SMTP id
 w23mr7691060oti.247.1571850573334; 
 Wed, 23 Oct 2019 10:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191022171239.21487-1-david@redhat.com>
 <CAPcyv4gJ+2he2E-6D0QZvkFWvRM9Fsvn9cAoPZbcU4zvsDHcEQ@mail.gmail.com>
 <acf86afd-a45c-5d83-daff-3bfb840d48a7@redhat.com>
In-Reply-To: <acf86afd-a45c-5d83-daff-3bfb840d48a7@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 23 Oct 2019 10:09:21 -0700
Message-ID: <CAPcyv4hHTqWWWREX2AtpEpfLHdDHvT-Kp_2YBW1As0y2Mx+6Dg@mail.gmail.com>
Subject: Re: [PATCH RFC v1 00/12] mm: Don't mark hotplugged pages PG_reserved
 (including ZONE_DEVICE)
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 24 Oct 2019 07:47:41 +1100
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 KVM list <kvm@vger.kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 Linux MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 Ben Chan <benchan@chromium.org>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 devel@driverdev.osuosl.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, X86 ML <x86@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Madhumitha Prabakaran <madhumithabiw@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Nishka Dasgupta <nishkadg.linux@gmail.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Matt Sickler <Matt.Sickler@daktronics.com>, Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 =?UTF-8?Q?Simon_Sandstr=C3=B6m?= <simon@nikanor.nu>,
 Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>,
 kvm-ppc@vger.kernel.org, Qian Cai <cai@lca.pw>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Todd Poynor <toddpoynor@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Allison Randal <allison@lohutok.net>, Jim Mattson <jmattson@google.com>,
 Vandana BN <bnvandana@gmail.com>, Jeremy Sowden <jeremy@azazel.net>,
 Mel Gorman <mgorman@techsingularity.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Rob Springer <rspringer@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 23, 2019 at 12:26 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 22.10.19 23:54, Dan Williams wrote:
> > Hi David,
> >
> > Thanks for tackling this!
>
> Thanks for having a look :)
>
> [...]
>
>
> >> I am probably a little bit too careful (but I don't want to break things).
> >> In most places (besides KVM and vfio that are nuts), the
> >> pfn_to_online_page() check could most probably be avoided by a
> >> is_zone_device_page() check. However, I usually get suspicious when I see
> >> a pfn_valid() check (especially after I learned that people mmap parts of
> >> /dev/mem into user space, including memory without memmaps. Also, people
> >> could memmap offline memory blocks this way :/). As long as this does not
> >> hurt performance, I think we should rather do it the clean way.
> >
> > I'm concerned about using is_zone_device_page() in places that are not
> > known to already have a reference to the page. Here's an audit of
> > current usages, and the ones I think need to cleaned up. The "unsafe"
> > ones do not appear to have any protections against the device page
> > being removed (get_dev_pagemap()). Yes, some of these were added by
> > me. The "unsafe? HMM" ones need HMM eyes because HMM leaks device
> > pages into anonymous memory paths and I'm not up to speed on how it
> > guarantees 'struct page' validity vs device shutdown without using
> > get_dev_pagemap().
> >
> > smaps_pmd_entry(): unsafe
> >
> > put_devmap_managed_page(): safe, page reference is held
> >
> > is_device_private_page(): safe? gpu driver manages private page lifetime
> >
> > is_pci_p2pdma_page(): safe, page reference is held
> >
> > uncharge_page(): unsafe? HMM
> >
> > add_to_kill(): safe, protected by get_dev_pagemap() and dax_lock_page()
> >
> > soft_offline_page(): unsafe
> >
> > remove_migration_pte(): unsafe? HMM
> >
> > move_to_new_page(): unsafe? HMM
> >
> > migrate_vma_pages() and helpers: unsafe? HMM
> >
> > try_to_unmap_one(): unsafe? HMM
> >
> > __put_page(): safe
> >
> > release_pages(): safe
> >
> > I'm hoping all the HMM ones can be converted to
> > is_device_private_page() directlly and have that routine grow a nice
> > comment about how it knows it can always safely de-reference its @page
> > argument.
> >
> > For the rest I'd like to propose that we add a facility to determine
> > ZONE_DEVICE by pfn rather than page. The most straightforward why I
> > can think of would be to just add another bitmap to mem_section_usage
> > to indicate if a subsection is ZONE_DEVICE or not.
>
> (it's a somewhat unrelated bigger discussion, but we can start discussing it in this thread)
>
> I dislike this for three reasons
>
> a) It does not protect against any races, really, it does not improve things.
> b) We do have the exact same problem with pfn_to_online_page(). As long as we
>    don't hold the memory hotplug lock, memory can get offlined and remove any time. Racy.

True, we need to solve that problem too. That seems to want something
lighter weight than the hotplug lock that can be held over pfn lookups
+  use rather than requiring a page lookup in paths where it's not
clear that a page reference would prevent unplug.

> c) We mix in ZONE specific stuff into the core. It should be "just another zone"

Not sure I grok this when the RFC is sprinkling zone-specific
is_zone_device_page() throughout the core?

>
> What I propose instead (already discussed in https://lkml.org/lkml/2019/10/10/87)

Sorry I missed this earlier...

>
> 1. Convert SECTION_IS_ONLINE to SECTION_IS_ACTIVE
> 2. Convert SECTION_IS_ACTIVE to a subsection bitmap
> 3. Introduce pfn_active() that checks against the subsection bitmap
> 4. Once the memmap was initialized / prepared, set the subsection active
>    (similar to SECTION_IS_ONLINE in the buddy right now)
> 5. Before the memmap gets invalidated, set the subsection inactive
>    (similar to SECTION_IS_ONLINE in the buddy right now)
> 5. pfn_to_online_page() = pfn_active() && zone != ZONE_DEVICE
> 6. pfn_to_device_page() = pfn_active() && zone == ZONE_DEVICE

This does not seem to reduce any complexity because it still requires
a pfn to zone lookup at the end of the process.

I.e. converting pfn_to_online_page() to use a new pfn_active()
subsection map plus looking up the zone from pfn_to_page() is more
steps than just doing a direct pfn to zone lookup. What am I missing?

>
> Especially, driver-reserved device memory will not get set active in
> the subsection bitmap.
>
> Now to the race. Taking the memory hotplug lock at random places is ugly. I do
> wonder if we can use RCU:

Ah, yes, exactly what I was thinking above.

>
> The user of pfn_active()/pfn_to_online_page()/pfn_to_device_page():
>
>         /* the memmap is guaranteed to remain active under RCU */
>         rcu_read_lock();
>         if (pfn_active(random_pfn)) {
>                 page = pfn_to_page(random_pfn);
>                 ... use the page, stays valid
>         }
>         rcu_unread_lock();
>
> Memory offlining/memremap code:
>
>         set_subsections_inactive(pfn, nr_pages); /* clears the bit atomically */
>         synchronize_rcu();
>         /* all users saw the bitmap update, we can invalide the memmap */
>         remove_pfn_range_from_zone(zone, pfn, nr_pages);

Looks good to me.

>
> >
> >>
> >> I only gave it a quick test with DIMMs on x86-64, but didn't test the
> >> ZONE_DEVICE part at all (any tips for a nice QEMU setup?). Compile-tested
> >> on x86-64 and PPC.
> >
> > I'll give it a spin, but I don't think the kernel wants to grow more
> > is_zone_device_page() users.
>
> Let's recap. In this RFC, I introduce a total of 4 (!) users only.
> The other parts can rely on pfn_to_online_page() only.
>
> 1. "staging: kpc2000: Prepare transfer_complete_cb() for PG_reserved changes"
> - Basically never used with ZONE_DEVICE.
> - We hold a reference!
> - All it protects is a SetPageDirty(page);
>
> 2. "staging/gasket: Prepare gasket_release_page() for PG_reserved changes"
> - Same as 1.
>
> 3. "mm/usercopy.c: Prepare check_page_span() for PG_reserved changes"
> - We come via virt_to_head_page() / virt_to_head_page(), not sure about
>   references (I assume this should be fine as we don't come via random
>   PFNs)
> - We check that we don't mix Reserved (including device memory) and CMA
>   pages when crossing compound pages.
>
> I think we can drop 1. and 2., resulting in a total of 2 new users in
> the same context. I think that is totally tolerable to finally clean
> this up.

...but more is_zone_device_page() doesn't "finally clean this up".
Like we discussed above it's the missing locking that's the real
cleanup, the pfn_to_online_page() internals are secondary.

>
>
> However, I think we also have to clarify if we need the change in 3 at all.
> It comes from
>
> commit f5509cc18daa7f82bcc553be70df2117c8eedc16
> Author: Kees Cook <keescook@chromium.org>
> Date:   Tue Jun 7 11:05:33 2016 -0700
>
>     mm: Hardened usercopy
>
>     This is the start of porting PAX_USERCOPY into the mainline kernel. This
>     is the first set of features, controlled by CONFIG_HARDENED_USERCOPY. The
>     work is based on code by PaX Team and Brad Spengler, and an earlier port
>     from Casey Schaufler. Additional non-slab page tests are from Rik van Riel.
> [...]
>     - otherwise, object must not span page allocations (excepting Reserved
>       and CMA ranges)
>
> Not sure if we really have to care about ZONE_DEVICE at this point.

That check needs to be careful to ignore ZONE_DEVICE pages. There's
nothing wrong with a copy spanning ZONE_DEVICE and typical pages.
