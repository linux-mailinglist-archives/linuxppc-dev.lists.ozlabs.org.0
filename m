Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7304E24D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 22:56:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46z2jY2xYQzDqSC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 07:56:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="bcYrgPfU"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46z1116rtkzDqN8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 06:39:45 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id d8so7290873otc.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 12:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8ApkkYruavPD6VaVfU4QHr5pRzVSLLe/BmCajbyD76I=;
 b=bcYrgPfUve+/e7PA/COpa9cpiotkNE8e14cXEXZpBzSMlJpSompwdbTdWjjkQJddx0
 Uw+3WqPKAUioj4/4XPm7cJ24FTR0IET9Naz1ZwjQyErO2IZvSkGMpp/gew8XlZpggjwU
 urspNOSnz3kU9GTyqmzURLWDOMJHHwAlk9WGjmcgjm+VaVmSdvOU+um4KKw70KPHFsUp
 FTUvgk6gpDTS/o2wCQdq+8Gi3txZF11FZsotj80J3+OxzF3vILzEFTeGcvRDQy1jMFEi
 SRx85TI+B5z5ijy9jfA6ym8yiuLiEhXgUKJRjaghu/8ovT45aTiORONSiCHuKkbYvhPp
 fMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8ApkkYruavPD6VaVfU4QHr5pRzVSLLe/BmCajbyD76I=;
 b=blFK+EN7vbjfpadOpxwtyyE6xNBUERB71MPOqlrAQazGUU1uJ2ve7AfsO23v5DzM02
 rly9jQojczIW9UOvNWZabd5ef16gGdfLk/et3pGU0OMzLAjwf8NB3NQPq3ThyrJBAj1a
 E2KaE8I2f0dg8EWmekS9mFqjpZt3uETtVuarC0P89uNIzbOUjoSzytQp4qusFYOhXcUu
 8cDvj99Q2fbugbMktiNx9HIt9+yCisGBaZl/Af3y41kx0Wm/jjkPuwL0gf4R9NuCMNaT
 +9llrpUa2HI1SWreoJUoIzS1JYsh0ZYc5vCEKRjbW9UpdBC3qRW8YhUqUyt/qDKYGnyb
 0o8Q==
X-Gm-Message-State: APjAAAWdu76HNGtv76CiPHVR5GHE/77UpNWsW5ncpI/qppYz49KQenl6
 pr+fTAAnOUXGPUhpm6mPXxK2RLUkcHW1q6xB/v9lRw==
X-Google-Smtp-Source: APXvYqwijxA4UnPG5Tbj7UXgroNEpqpPtlp/BzJIeWUQUfe3F9HUg3GXu8gWZWfrY7GBmsZ1h9DSM1JTtNPajl0t3Ss=
X-Received: by 2002:a05:6830:617:: with SMTP id
 w23mr8183922oti.247.1571859582403; 
 Wed, 23 Oct 2019 12:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191022171239.21487-1-david@redhat.com>
 <CAPcyv4gJ+2he2E-6D0QZvkFWvRM9Fsvn9cAoPZbcU4zvsDHcEQ@mail.gmail.com>
 <acf86afd-a45c-5d83-daff-3bfb840d48a7@redhat.com>
 <CAPcyv4hHTqWWWREX2AtpEpfLHdDHvT-Kp_2YBW1As0y2Mx+6Dg@mail.gmail.com>
 <55640861-bbcb-95f0-766a-95bc961f1b0e@redhat.com>
In-Reply-To: <55640861-bbcb-95f0-766a-95bc961f1b0e@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 23 Oct 2019 12:39:31 -0700
Message-ID: <CAPcyv4g1zBpD2i936wWB9Pn0OStUoksXXLCCdXeYjbHuri-j4Q@mail.gmail.com>
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

On Wed, Oct 23, 2019 at 10:28 AM David Hildenbrand <david@redhat.com> wrote:
>
> >> I dislike this for three reasons
> >>
> >> a) It does not protect against any races, really, it does not improve things.
> >> b) We do have the exact same problem with pfn_to_online_page(). As long as we
> >>    don't hold the memory hotplug lock, memory can get offlined and remove any time. Racy.
> >
> > True, we need to solve that problem too. That seems to want something
> > lighter weight than the hotplug lock that can be held over pfn lookups
> > +  use rather than requiring a page lookup in paths where it's not
> > clear that a page reference would prevent unplug.
> >
> >> c) We mix in ZONE specific stuff into the core. It should be "just another zone"
> >
> > Not sure I grok this when the RFC is sprinkling zone-specific
> > is_zone_device_page() throughout the core?
>
> Most users should not care about the zone. pfn_active() would be enough
> in most situations, especially most PFN walkers - "this memmap is valid
> and e.g., contains a valid zone ...".

Oh, I see, you're saying convert most users to pfn_active() (and some
TBD rcu locking), but only pfn_to_online_page() users would need the
zone lookup? I can get on board with that.

>
> >
> >>
> >> What I propose instead (already discussed in https://lkml.org/lkml/2019/10/10/87)
> >
> > Sorry I missed this earlier...
> >
> >>
> >> 1. Convert SECTION_IS_ONLINE to SECTION_IS_ACTIVE
> >> 2. Convert SECTION_IS_ACTIVE to a subsection bitmap
> >> 3. Introduce pfn_active() that checks against the subsection bitmap
> >> 4. Once the memmap was initialized / prepared, set the subsection active
> >>    (similar to SECTION_IS_ONLINE in the buddy right now)
> >> 5. Before the memmap gets invalidated, set the subsection inactive
> >>    (similar to SECTION_IS_ONLINE in the buddy right now)
> >> 5. pfn_to_online_page() = pfn_active() && zone != ZONE_DEVICE
> >> 6. pfn_to_device_page() = pfn_active() && zone == ZONE_DEVICE
> >
> > This does not seem to reduce any complexity because it still requires
> > a pfn to zone lookup at the end of the process.
> >
> > I.e. converting pfn_to_online_page() to use a new pfn_active()
> > subsection map plus looking up the zone from pfn_to_page() is more
> > steps than just doing a direct pfn to zone lookup. What am I missing?
>
> That a real "pfn to zone" lookup without going via the struct page will
> require to have more than just a single bitmap. IMHO, keeping the
> information at a single place (memmap) is the clean thing to do (not
> replicating it somewhere else). Going via the memmap might not be as
> fast as a direct lookup, but do we actually care? We are already looking
> at "random PFNs we are not sure if there is a valid memmap".

True, we only care about the validity of the check, and as you pointed
out moving the check to the pfn level does not solve the validity
race. It needs a lock.

>
> >>
> >> Especially, driver-reserved device memory will not get set active in
> >> the subsection bitmap.
> >>
> >> Now to the race. Taking the memory hotplug lock at random places is ugly. I do
> >> wonder if we can use RCU:
> >
> > Ah, yes, exactly what I was thinking above.
> >
> >>
> >> The user of pfn_active()/pfn_to_online_page()/pfn_to_device_page():
> >>
> >>         /* the memmap is guaranteed to remain active under RCU */
> >>         rcu_read_lock();
> >>         if (pfn_active(random_pfn)) {
> >>                 page = pfn_to_page(random_pfn);
> >>                 ... use the page, stays valid
> >>         }
> >>         rcu_unread_lock();
> >>
> >> Memory offlining/memremap code:
> >>
> >>         set_subsections_inactive(pfn, nr_pages); /* clears the bit atomically */
> >>         synchronize_rcu();
> >>         /* all users saw the bitmap update, we can invalide the memmap */
> >>         remove_pfn_range_from_zone(zone, pfn, nr_pages);
> >
> > Looks good to me.
> >
> >>
> >>>
> >>>>
> >>>> I only gave it a quick test with DIMMs on x86-64, but didn't test the
> >>>> ZONE_DEVICE part at all (any tips for a nice QEMU setup?). Compile-tested
> >>>> on x86-64 and PPC.
> >>>
> >>> I'll give it a spin, but I don't think the kernel wants to grow more
> >>> is_zone_device_page() users.
> >>
> >> Let's recap. In this RFC, I introduce a total of 4 (!) users only.
> >> The other parts can rely on pfn_to_online_page() only.
> >>
> >> 1. "staging: kpc2000: Prepare transfer_complete_cb() for PG_reserved changes"
> >> - Basically never used with ZONE_DEVICE.
> >> - We hold a reference!
> >> - All it protects is a SetPageDirty(page);
> >>
> >> 2. "staging/gasket: Prepare gasket_release_page() for PG_reserved changes"
> >> - Same as 1.
> >>
> >> 3. "mm/usercopy.c: Prepare check_page_span() for PG_reserved changes"
> >> - We come via virt_to_head_page() / virt_to_head_page(), not sure about
> >>   references (I assume this should be fine as we don't come via random
> >>   PFNs)
> >> - We check that we don't mix Reserved (including device memory) and CMA
> >>   pages when crossing compound pages.
> >>
> >> I think we can drop 1. and 2., resulting in a total of 2 new users in
> >> the same context. I think that is totally tolerable to finally clean
> >> this up.
> >
> > ...but more is_zone_device_page() doesn't "finally clean this up".
> > Like we discussed above it's the missing locking that's the real
> > cleanup, the pfn_to_online_page() internals are secondary.
>
> It's a different cleanup IMHO. We can't do everything in one shot. But
> maybe I can drop the is_zone_device_page() parts from this patch and
> completely rely on pfn_to_online_page(). Yes, that needs fixing to, but
> it's a different story.
>
> The important part of this patch:
>
> While pfn_to_online_page() will always exclude ZONE_DEVICE pages,
> checking PG_reserved on ZONE_DEVICE pages (what we do right now!) is
> racy as hell (especially when concurrently initializing the memmap).
>
> This does improve the situation.

True that's a race a vector I was not considering.

>
> >>
> >> However, I think we also have to clarify if we need the change in 3 at all.
> >> It comes from
> >>
> >> commit f5509cc18daa7f82bcc553be70df2117c8eedc16
> >> Author: Kees Cook <keescook@chromium.org>
> >> Date:   Tue Jun 7 11:05:33 2016 -0700
> >>
> >>     mm: Hardened usercopy
> >>
> >>     This is the start of porting PAX_USERCOPY into the mainline kernel. This
> >>     is the first set of features, controlled by CONFIG_HARDENED_USERCOPY. The
> >>     work is based on code by PaX Team and Brad Spengler, and an earlier port
> >>     from Casey Schaufler. Additional non-slab page tests are from Rik van Riel.
> >> [...]
> >>     - otherwise, object must not span page allocations (excepting Reserved
> >>       and CMA ranges)
> >>
> >> Not sure if we really have to care about ZONE_DEVICE at this point.
> >
> > That check needs to be careful to ignore ZONE_DEVICE pages. There's
> > nothing wrong with a copy spanning ZONE_DEVICE and typical pages.
>
> Please note that the current check would *forbid* this (AFAIKs for a
> single heap object). As discussed in the relevant patch, we might be
> able to just stop doing that and limit it to real PG_reserved pages
> (without ZONE_DEVICE). I'd be happy to not introduce new
> is_zone_device_page() users.

At least for non-HMM ZONE_DEVICE usage, i.e. the dax + pmem stuff, is
excluded from this path by:

52f476a323f9 libnvdimm/pmem: Bypass CONFIG_HARDENED_USERCOPY overhead

So this case is one more to add to the pile of HMM auditing.
