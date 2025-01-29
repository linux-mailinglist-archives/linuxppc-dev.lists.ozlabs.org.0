Return-Path: <linuxppc-dev+bounces-5696-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 905AAA2264A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 23:44:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yjxz42RCVz30Pn;
	Thu, 30 Jan 2025 09:44:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::835"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738190640;
	cv=none; b=MXS9tfEMjaZ4dlvRT2WKzKuyqPlfAYBygUYwH3J1fCTE6EVq8fvfY5srIvEe0YlIMMcHhTwElDCuJN+2pq9Ww6GpY6kDkz5QL+9DH+DNm8KBKMwfjH6JnRNHNZko2D6nyykIYY/P0hRCP6OznI2PDwpFx5Bzk8mAMURMlgCDHBEt3TphI32ww4MTFJy0PUfsBMyHgO9roHlyIKViBozCw8/FH73ajzlP0i/eQ5PVKBQbf9l/pj6Q7c+wzNgWPTVm6zmIvwChabgEw8jkDcWiEMIeg7V3rw53YharoOzajwRc8HrdsAby25WVRd2dScFXee0vI5a58i9YOXvpNazbWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738190640; c=relaxed/relaxed;
	bh=NV1NZrhmBoapAhga8suluhi2xpF68ROjpGqXcyJZnwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXf/qhtpXf8oMnIETypWgro6Z/vemBFzCn03C147CKGz81rNwUk4lc5H73kjSSwIBmtP0Gn90TtqfQfnC7VBnDUD3Vy86pBJZNMBDbPWRQJ/1NCfqviSKjPVwfRCQBzXfNpTHfAitMZ7VGSPHIG9MsNAXhsWWNov4t0ZjmxoQHrIGdam/s/9G0Z0U4XmCvZCVb1IyTkcUT5AquU2OioY7hCBL07yR5bNy4DDYgbpQNl7UHg20mswZlz4lUDX5q46FqfBDLZCFVq4V8wYP5kbIvhB4Ezq90JcdFpmhzYcuuWkwEcT4p4TU4I29UktpJM6N8og01uOfmlygck+Z7Br+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=J+KEisCG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=fvdl@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=J+KEisCG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=fvdl@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yjxz33FVNz2yk6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 09:43:59 +1100 (AEDT)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-467896541e1so73811cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 14:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190637; x=1738795437; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NV1NZrhmBoapAhga8suluhi2xpF68ROjpGqXcyJZnwg=;
        b=J+KEisCGwa+hUuezLw+XnP0tFPZ6f3CD9UtFeJjvgCjzjl5mjGuQY7qrSbCkQthbYL
         hiyL6CFhu2PwkIM2Pq8aiDZ7XYlmXr1FVL4WYfpmmmZDrK05LxDKU1XYmx2HIcGHZPU/
         LYcrzKXMg+lzvYhvAQFULSSB3a3phi2zPWbPpWvLLj4niO4KbauE0QU3el/c28tff2a9
         6Ovvo5p33xGuxYP/4QjoohvPJubuBbcG3f1BVNEohHVGamkJZskbDz4X3nKLEDiImC9G
         OFEl8Q0DBZWe5j6NbO8vQEAD25xUvUQMRtSPIHSd/2K1MiK+6N4DJI6WckffzH72ovfy
         CV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190637; x=1738795437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NV1NZrhmBoapAhga8suluhi2xpF68ROjpGqXcyJZnwg=;
        b=AJFcR7G3Mabjq7kY060AoXfdgKkpAQqPk4CWygNF0riQQLFP2y8BJYv79y6SaPbz/s
         y2UmeCfywm2IJNoyQOi8C8Yiz4HXl4oL4HkvNVcsT1wB6Hw7AUJIhIk7Z+qWXrsCgdiO
         ruHGKLIxo4xv12NsmHR89gP5XRWf/qYoj2WKqP64l6TU1neJrN4KH/kQszFFZD9mSGaV
         9tjRHQXVFqnu8mLe67GPVd1DVPaPEFd7GLCZOIzkxIkir6av3RyLvCDIWUia6GxQq+Pf
         obsi66/fEvE/Mqz/VPvigQgt2SUDxUifEDOcOrnYselcl28+f4KF5b7pfZIG8q/VxWMq
         1Ijg==
X-Forwarded-Encrypted: i=1; AJvYcCUeBK36bLLrUEvScwkcQJK/gOmi19MY2FUB8NONogRNH5r8sBm9KSEWYzdv/rl8fvYbqOWith/I+88EEKE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzjQMXjezfrj0EXaRfrdJqkR2sYkzV2uIHakGa5FJnTOs0LCfdJ
	3rBjEBmyVz2nNBsa2ZvweSZUN4uWuNQRpdhrkI9+xJgeYb7OjQN9vG6pmv1hMieA+muZW8WfF4u
	UhFPRmoDXb+ew51JYfhROf4jiixewJ9aioUMP
X-Gm-Gg: ASbGnct+l5X0Q1w5kC3GxNnq7DxZQyUou7/5vNNuR3Va8nPxDNJvhefoNhXWTZWY0GV
	Fzgw/oKQfJAVcfOIbRo5J70zYtnJXH6j2jLnfrkFT+m7jN6xQigXTg5mWrmdmCq7PLU4UAg==
X-Google-Smtp-Source: AGHT+IG3T6DTF5v+oLGyYzoNXFHqkxY6CIsVLh/tMVZCk6tiToGciXyRwR194csL25uhdE9+C7DCdCNao23WVTOmM1s=
X-Received: by 2002:a05:622a:58c8:b0:467:84a1:df08 with SMTP id
 d75a77b69052e-46fdf6566f6mr267891cf.23.1738190636646; Wed, 29 Jan 2025
 14:43:56 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250127232207.3888640-1-fvdl@google.com> <20250127232207.3888640-28-fvdl@google.com>
 <c961cc1e-897d-4b86-b123-b12a0c27f91a@csgroup.eu> <CAPTztWa8bL06fVDP-N3s1yqMLxFZfvDvVRpn5B5YZBJ3idru9Q@mail.gmail.com>
In-Reply-To: <CAPTztWa8bL06fVDP-N3s1yqMLxFZfvDvVRpn5B5YZBJ3idru9Q@mail.gmail.com>
From: Frank van der Linden <fvdl@google.com>
Date: Wed, 29 Jan 2025 14:43:45 -0800
X-Gm-Features: AWEUYZknBL0-ZlhTc29GRwr47Hak95j6j2l9UYyEKqqjLiuJyO254WkfZQumzac
Message-ID: <CAPTztWZV1+jmhKqiV-nLnjo4pbYmkNi2wWAVPc__M+rPGN0K=A@mail.gmail.com>
Subject: Re: [PATCH 27/27] mm/hugetlb: enable bootmem allocation from CMA areas
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, yuzhao@google.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 28, 2025 at 9:52=E2=80=AFAM Frank van der Linden <fvdl@google.c=
om> wrote:
>
> Hi Christophe, thanks for your comments. Replies inline below.
>
> On Tue, Jan 28, 2025 at 12:55=E2=80=AFAM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
> >
> >
> >
> > Le 28/01/2025 =C3=A0 00:22, Frank van der Linden a =C3=A9crit :
> > > If hugetlb_cma_only is enabled, we know that hugetlb pages
> > > can only be allocated from CMA. Now that there is an interface
> > > to do early reservations from a CMA area (returning memblock
> > > memory), it can be used to allocate hugetlb pages from CMA.
> > >
> > > This also allows for doing pre-HVO on these pages (if enabled).
> > >
> > > Make sure to initialize the page structures and associated data
> > > correctly. Create a flag to signal that a hugetlb page has been
> > > allocated from CMA to make things a little easier.
> > >
> > > Some configurations of powerpc have a special hugetlb bootmem
> > > allocator, so introduce a boolean arch_specific_huge_bootmem_alloc
> > > that returns true if such an allocator is present. In that case,
> > > CMA bootmem allocations can't be used, so check that function
> > > before trying.
> > >
> > > Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > Signed-off-by: Frank van der Linden <fvdl@google.com>
> > > ---
> > >   arch/powerpc/mm/hugetlbpage.c |   5 ++
> > >   include/linux/hugetlb.h       |   7 ++
> > >   mm/hugetlb.c                  | 135 +++++++++++++++++++++++++------=
---
> > >   3 files changed, 114 insertions(+), 33 deletions(-)
> > >
> > > diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbp=
age.c
> > > index d3c1b749dcfc..e53e4b4c8ef6 100644
> > > --- a/arch/powerpc/mm/hugetlbpage.c
> > > +++ b/arch/powerpc/mm/hugetlbpage.c
> > > @@ -121,6 +121,11 @@ bool __init hugetlb_node_alloc_supported(void)
> > >   {
> > >       return false;
> > >   }
> > > +
> > > +bool __init arch_specific_huge_bootmem_alloc(struct hstate *h)
> > > +{
> > > +     return (firmware_has_feature(FW_FEATURE_LPAR) && !radix_enabled=
());
> > > +}
> > >   #endif
> > >
> > >
> > > diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> > > index 2512463bca49..bca3052fb175 100644
> > > --- a/include/linux/hugetlb.h
> > > +++ b/include/linux/hugetlb.h
> > > @@ -591,6 +591,7 @@ enum hugetlb_page_flags {
> > >       HPG_freed,
> > >       HPG_vmemmap_optimized,
> > >       HPG_raw_hwp_unreliable,
> > > +     HPG_cma,
> > >       __NR_HPAGEFLAGS,
> > >   };
> > >
> > > @@ -650,6 +651,7 @@ HPAGEFLAG(Temporary, temporary)
> > >   HPAGEFLAG(Freed, freed)
> > >   HPAGEFLAG(VmemmapOptimized, vmemmap_optimized)
> > >   HPAGEFLAG(RawHwpUnreliable, raw_hwp_unreliable)
> > > +HPAGEFLAG(Cma, cma)
> > >
> > >   #ifdef CONFIG_HUGETLB_PAGE
> > >
> > > @@ -678,14 +680,18 @@ struct hstate {
> > >       char name[HSTATE_NAME_LEN];
> > >   };
> > >
> > > +struct cma;
> > > +
> > >   struct huge_bootmem_page {
> > >       struct list_head list;
> > >       struct hstate *hstate;
> > >       unsigned long flags;
> > > +     struct cma *cma;
> > >   };
> > >
> > >   #define HUGE_BOOTMEM_HVO            0x0001
> > >   #define HUGE_BOOTMEM_ZONES_VALID    0x0002
> > > +#define HUGE_BOOTMEM_CMA             0x0004
> > >
> > >   bool hugetlb_bootmem_page_zones_valid(int nid, struct huge_bootmem_=
page *m);
> > >
> > > @@ -711,6 +717,7 @@ bool __init hugetlb_node_alloc_supported(void);
> > >
> > >   void __init hugetlb_add_hstate(unsigned order);
> > >   bool __init arch_hugetlb_valid_size(unsigned long size);
> > > +bool __init arch_specific_huge_bootmem_alloc(struct hstate *h);
> >
> > Why adding 'specific' in the name ? Prefixing a function name with arch=
_
> > is usually enough to denote an architecture specific function.
>
> True, yes. That should probably be arch_has_huge_bootmem_alloc, I will
> change that.
>
> >
> > >   struct hstate *size_to_hstate(unsigned long size);
> > >
> > >   #ifndef HUGE_MAX_HSTATE
> > > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > > index 32ebde9039e2..183e8d0c2fb4 100644
> > > --- a/mm/hugetlb.c
> > > +++ b/mm/hugetlb.c
> > > @@ -61,7 +61,7 @@ static struct cma *hugetlb_cma[MAX_NUMNODES];
> > >   static unsigned long hugetlb_cma_size_in_node[MAX_NUMNODES] __initd=
ata;
> > >   #endif
> > >   static bool hugetlb_cma_only;
> > > -static unsigned long hugetlb_cma_size __initdata;
> > > +static unsigned long hugetlb_cma_size;
> >
> > Why remove __initdata ? As far as I can see it is used only in
> > hugetlb_early_cma() and hugetlb_hstate_alloc_pages() which are __init
> > functions.
>
> hugetlb_cma_size is now used in alloc_gigantic_folio(), which is not
> an __init function. However, you got me thinking: since
> hugetlb_cma_only is only effective when hugetlb_cma_size !=3D 0, I can
> just reset hugetlb_cma_only to false if hugetlb_cma_size =3D=3D 0 after
> parsing the commandline arguments. This will revert hugetlb_cma_size
> to __initdata, and simplifies things a bit. I'll make that change in
> v2.
> >
> > >
> > >   __initdata struct list_head huge_boot_pages[MAX_NUMNODES];
> > >   __initdata unsigned long hstate_boot_nrinvalid[HUGE_MAX_HSTATE];
> > > @@ -132,8 +132,10 @@ static void hugetlb_free_folio(struct folio *fol=
io)
> > >   #ifdef CONFIG_CMA
> > >       int nid =3D folio_nid(folio);
> > >
> > > -     if (cma_free_folio(hugetlb_cma[nid], folio))
> > > +     if (folio_test_hugetlb_cma(folio)) {
> > > +             WARN_ON(!cma_free_folio(hugetlb_cma[nid], folio));
> >
> > Is that WARN_ON() needed ? See
> > https://docs.kernel.org/process/coding-style.html#do-not-crash-the-kern=
el
>
> Not strictly, I suppose, but if there is a CMA-allocated hugetlb
> folio, and cma_free fails, that would be a condition worthy of a
> warning, as the flag somehow got corrupted or there is an internal CMA
> error.  How about WARN_ON_ONCE?
>
> >
> >
> > >               return;
> > > +     }
> > >   #endif
> > >       folio_put(folio);
> > >   }
> > > @@ -1509,6 +1511,9 @@ static struct folio *alloc_gigantic_folio(struc=
t hstate *h, gfp_t gfp_mask,
> > >                                       break;
> > >                       }
> > >               }
> > > +
> > > +             if (folio)
> > > +                     folio_set_hugetlb_cma(folio);
> > >       }
> > >   #endif
> > >       if (!folio) {
> > > @@ -3175,6 +3180,63 @@ struct folio *alloc_hugetlb_folio(struct vm_ar=
ea_struct *vma,
> > >       return ERR_PTR(-ENOSPC);
> > >   }
> > >
> > > +/*
> > > + * Some architectures do their own bootmem allocation, so they can't=
 use
> > > + * early CMA allocation. So, allow for this function to be redefined=
.
> > > + */
> > > +bool __init __attribute((weak))
> >
> > Can't you use __weak ?
> >
> > By the way, do we really need a weak function here ? Can't it be a
> > static inline helper that gets waived by a macro defined by the arch,
> > something like:
> >
> > #ifndef arch_huge_bootmem_alloc
> > static inline arch_huge_bootmem_alloc(struct hstate *h)
> > {
> >         return false;
> > }
> > #endif
> >
> > Then powerpc does:
> >
> > #define arch_huge_bootmem_alloc arch_huge_bootmem_alloc
> > static inline arch_huge_bootmem_alloc(struct hstate *h)
> > {
> >         return (firmware_has_feature(FW_FEATURE_LPAR) && !radix_enabled=
());
> > }
> >
>
> Fair enough, yeah. I used a weak symbol because that was already used
> for powerpc with alloc_bootmem_huge_page(), but I can change this one.
>
> >
> > But why is struct hstate *h parameter needed ? Seems like noone uses it=
.
>
> Correct - I merely extrapolated a bit and thought "well, architectures
> might have bootmem hugetlb allocators that only deal with certain
> sizes". But then again, like you say, there is currently no need for
> it. I'll remove the argument.
>
> >
> > > +arch_specific_huge_bootmem_alloc(struct hstate *h)
> > > +{
> > > +     return false;
> > > +}
> > > +
> > > +static bool __init hugetlb_early_cma(struct hstate *h)
> > > +{
> > > +     if (arch_specific_huge_bootmem_alloc(h))
> > > +             return false;
> > > +
> > > +     return (hstate_is_gigantic(h) && hugetlb_cma_size && hugetlb_cm=
a_only);
> > > +}
> > > +
> > > +static __init void *alloc_bootmem(struct hstate *h, int nid)
> > > +{
> > > +     struct huge_bootmem_page *m;
> > > +     unsigned long flags;
> > > +     struct cma *cma;
> > > +
> > > +#ifdef CONFIG_CMA
> >
> >   #ifdefs in C files should be avoided, see
> > https://docs.kernel.org/process/coding-style.html#conditional-compilati=
on
> >
> > > +     if (hugetlb_early_cma(h)) {
> > > +             flags =3D HUGE_BOOTMEM_CMA;
> > > +             cma =3D hugetlb_cma[nid];
> > > +             m =3D cma_reserve_early(cma, huge_page_size(h));
> > > +     } else
> > > +#endif
> >
> > This kind of if/else construct in uggly, should be avoided.
> >
>
> I found this ifdef hard to avoid, sadly, I tried various ways to avoid
> it (If (IS_ENABLED(CONFIG_CMA), etc), but came up short. I'll have
> another look for v2, but short of trying to split off all CMA-related
> code in to a different file, which would definitely be out of scope
> here, it might not end up being better.

I ended up moving the hugetlb_cma code to its own file anyway, which
is a new patch at the end of the v2 series I just sent.

- Frank

