Return-Path: <linuxppc-dev+bounces-5648-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAED8A20FC9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 18:52:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjCYW49Gnz304Z;
	Wed, 29 Jan 2025 04:52:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738086767;
	cv=none; b=Rehx5/ACha1boAUiFbs5coLrr8+1oebxLokevvdzmj6vF18gGRMowYTCcOLEzyVH6llQ81B8J7voer/L1H/n28AjeuezFLREiGRlLEm6AIQ6MGEsP10rHAimOTbXsrOn/rFGm9/tCUtjpGkL3k1jP6xE0gAnn7rrHk0UEgR9vXpsgYBxFkE8ZvDHAuhgihMrUL7KqY64tyXM4f0A32kDVddcfUXAFZSFSObwYYAkP+8EAEeKyG+j5LSQy4DsNhWsCYaYgLqrCZw4idpq+hJ5cNBYVo3GPnnSR51dv2PI7sOhU8VXAWR1SfrOjWPQKct+KJL97bX/SRMomkVaZMU6CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738086767; c=relaxed/relaxed;
	bh=4wXkeYXUQNvnJWneRbTlwwnldlqP4I+SRpXXND7XHyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H8PM7YoAXUzvJuhif93AdGPwQ2/D7vjIWB/4SxCm4zBac4TdYlQvky1C9VNQWtTLMlv7F+gZie3YIDUo3UIjtgMri0mm2O5MOn+hK73z5WzOIcmRdl5LOrRHvgsegUufMCu5gWDYezaTo6DVxlV13KuFJeoDhZ4TZ/PKgUxoodpZxeeLbIQmaI1jZUvba/5cS+JWeh/j4w9YY1W832vXUeVzSH2Sr4TdbYJyujaPhRS7lJhcOn7J7Tw2qAQWVKs3sqyok7s7E8Lq2qkAgeVxjMbNEOy1NpBUkemgpuMWr4aPII+AhfYVOijjajwRkOlbXDWw69NoRR8SxmeMpw8wWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KV+9plnY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=fvdl@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KV+9plnY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=fvdl@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjCYT4Z86z2yYq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 04:52:44 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-467abce2ef9so314661cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 09:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738086762; x=1738691562; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wXkeYXUQNvnJWneRbTlwwnldlqP4I+SRpXXND7XHyY=;
        b=KV+9plnYCtKfyM6VuSBed8Tsm9/D3WV0PaO8nvTo93ubgKeiIGX06wHSG4oG3S4Ssf
         P3QKJ+ofW7oK61Qt53JTUVbF1LCBQdvQZon1pQtGhPZKqDz3/0BsyFr4GD0wtVLACope
         ZTnQKSu5dGOINGaSScPGkCeZOF8j5jFG1Bf49hrS+F+kkvSf91qXSC8WAeyvYLBofetJ
         AezP6j1zcOMGDz8vzp42Y8ovLsVMN+SDc6InZ9kqyWj60G9CM341+vpT8AsESofQC/f/
         QeDeQOL8HwsK5nbBDd6Jt4aWlCOuy5brlhXcenSe9c/gskYTsaIrRA4ErZt/03h2+YBR
         32AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738086762; x=1738691562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wXkeYXUQNvnJWneRbTlwwnldlqP4I+SRpXXND7XHyY=;
        b=blguiQtpA+Ie3edrztvVZLyBs/HtAM9YAq58q+u3JV6caBolFGr+nomZomTjdEnox/
         rLB0ZrLiyH1TP3EYD1MdvIiL0fJJ7LHzSYtD7GAw+Xwlu8LErbk1Gfc4+mkw2+vi4h5u
         SDEWGKOR6gHsi9XxVW+yGKa6fJuLJZ7aLDiONlhw3/IRkHjglUwvb5TGH+e0O8dHOToS
         72C7QCA71ZHTVv+9IeixjAFB2lucVg69hC7ILtatQ9xux524QwlMejIGq+pZRywknG4z
         pd4g+I+KEN8/uZUKMrH3HJ2SL165Bzjyl+Yulxg6G4zb8bXN9zhT4+onZ3O/UJhWKTu4
         4G2g==
X-Forwarded-Encrypted: i=1; AJvYcCV+cQU63kMU7Q5ETR+YSbbevXodO0y8ga/FqU1KbCNdLo4KL5AtPd3qlC+dQzEmn05ElBW5pA5fJ4zy8js=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxZtNX74DON1Oy9BraMVcWZ9Sv6Z8B4gaI7wpmArSdnOH/IG5sI
	59+pj9o5RKd5eTkr2rwm973YXOCGdeaPTkbA1teCc9ifwWIzwESrrw/nRUYCpM5Cm70NFhC4wHo
	FzvQ6+NQ6hV39UVzhOvvuID49M3KjBekvK30B
X-Gm-Gg: ASbGncthgPOfYZxs15Xx/M6qBYbDoXsjJOYU2u4iL6tes9vyCoHFEuGo6F3MjRjtqFj
	87UzkN/1wg8kX+sKcr4CazHchVS3Khu6K3AZbU/PwYrSNty8mRfjKyywCS6WwtpEXI7qNNg==
X-Google-Smtp-Source: AGHT+IH5SmjSz0uJkIH3f8TUz8je4MRVsb+1W/hJ9Mzhc89H+uYAM57oxxGMerbdM1gg7ZUYAHpiicr8PY2piLnZ+24=
X-Received: by 2002:a05:622a:6186:b0:466:a3ed:bde7 with SMTP id
 d75a77b69052e-46fc55f7d43mr4507971cf.6.1738086761455; Tue, 28 Jan 2025
 09:52:41 -0800 (PST)
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
 <c961cc1e-897d-4b86-b123-b12a0c27f91a@csgroup.eu>
In-Reply-To: <c961cc1e-897d-4b86-b123-b12a0c27f91a@csgroup.eu>
From: Frank van der Linden <fvdl@google.com>
Date: Tue, 28 Jan 2025 09:52:30 -0800
X-Gm-Features: AWEUYZmZVx6i-Y9H1he5YEZ5mjejVQJ6mNWAJa-9s1l0Epx1pWxFs4z2YPh-Zf4
Message-ID: <CAPTztWa8bL06fVDP-N3s1yqMLxFZfvDvVRpn5B5YZBJ3idru9Q@mail.gmail.com>
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

Hi Christophe, thanks for your comments. Replies inline below.

On Tue, Jan 28, 2025 at 12:55=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 28/01/2025 =C3=A0 00:22, Frank van der Linden a =C3=A9crit :
> > If hugetlb_cma_only is enabled, we know that hugetlb pages
> > can only be allocated from CMA. Now that there is an interface
> > to do early reservations from a CMA area (returning memblock
> > memory), it can be used to allocate hugetlb pages from CMA.
> >
> > This also allows for doing pre-HVO on these pages (if enabled).
> >
> > Make sure to initialize the page structures and associated data
> > correctly. Create a flag to signal that a hugetlb page has been
> > allocated from CMA to make things a little easier.
> >
> > Some configurations of powerpc have a special hugetlb bootmem
> > allocator, so introduce a boolean arch_specific_huge_bootmem_alloc
> > that returns true if such an allocator is present. In that case,
> > CMA bootmem allocations can't be used, so check that function
> > before trying.
> >
> > Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Signed-off-by: Frank van der Linden <fvdl@google.com>
> > ---
> >   arch/powerpc/mm/hugetlbpage.c |   5 ++
> >   include/linux/hugetlb.h       |   7 ++
> >   mm/hugetlb.c                  | 135 +++++++++++++++++++++++++--------=
-
> >   3 files changed, 114 insertions(+), 33 deletions(-)
> >
> > diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpag=
e.c
> > index d3c1b749dcfc..e53e4b4c8ef6 100644
> > --- a/arch/powerpc/mm/hugetlbpage.c
> > +++ b/arch/powerpc/mm/hugetlbpage.c
> > @@ -121,6 +121,11 @@ bool __init hugetlb_node_alloc_supported(void)
> >   {
> >       return false;
> >   }
> > +
> > +bool __init arch_specific_huge_bootmem_alloc(struct hstate *h)
> > +{
> > +     return (firmware_has_feature(FW_FEATURE_LPAR) && !radix_enabled()=
);
> > +}
> >   #endif
> >
> >
> > diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> > index 2512463bca49..bca3052fb175 100644
> > --- a/include/linux/hugetlb.h
> > +++ b/include/linux/hugetlb.h
> > @@ -591,6 +591,7 @@ enum hugetlb_page_flags {
> >       HPG_freed,
> >       HPG_vmemmap_optimized,
> >       HPG_raw_hwp_unreliable,
> > +     HPG_cma,
> >       __NR_HPAGEFLAGS,
> >   };
> >
> > @@ -650,6 +651,7 @@ HPAGEFLAG(Temporary, temporary)
> >   HPAGEFLAG(Freed, freed)
> >   HPAGEFLAG(VmemmapOptimized, vmemmap_optimized)
> >   HPAGEFLAG(RawHwpUnreliable, raw_hwp_unreliable)
> > +HPAGEFLAG(Cma, cma)
> >
> >   #ifdef CONFIG_HUGETLB_PAGE
> >
> > @@ -678,14 +680,18 @@ struct hstate {
> >       char name[HSTATE_NAME_LEN];
> >   };
> >
> > +struct cma;
> > +
> >   struct huge_bootmem_page {
> >       struct list_head list;
> >       struct hstate *hstate;
> >       unsigned long flags;
> > +     struct cma *cma;
> >   };
> >
> >   #define HUGE_BOOTMEM_HVO            0x0001
> >   #define HUGE_BOOTMEM_ZONES_VALID    0x0002
> > +#define HUGE_BOOTMEM_CMA             0x0004
> >
> >   bool hugetlb_bootmem_page_zones_valid(int nid, struct huge_bootmem_pa=
ge *m);
> >
> > @@ -711,6 +717,7 @@ bool __init hugetlb_node_alloc_supported(void);
> >
> >   void __init hugetlb_add_hstate(unsigned order);
> >   bool __init arch_hugetlb_valid_size(unsigned long size);
> > +bool __init arch_specific_huge_bootmem_alloc(struct hstate *h);
>
> Why adding 'specific' in the name ? Prefixing a function name with arch_
> is usually enough to denote an architecture specific function.

True, yes. That should probably be arch_has_huge_bootmem_alloc, I will
change that.

>
> >   struct hstate *size_to_hstate(unsigned long size);
> >
> >   #ifndef HUGE_MAX_HSTATE
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 32ebde9039e2..183e8d0c2fb4 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -61,7 +61,7 @@ static struct cma *hugetlb_cma[MAX_NUMNODES];
> >   static unsigned long hugetlb_cma_size_in_node[MAX_NUMNODES] __initdat=
a;
> >   #endif
> >   static bool hugetlb_cma_only;
> > -static unsigned long hugetlb_cma_size __initdata;
> > +static unsigned long hugetlb_cma_size;
>
> Why remove __initdata ? As far as I can see it is used only in
> hugetlb_early_cma() and hugetlb_hstate_alloc_pages() which are __init
> functions.

hugetlb_cma_size is now used in alloc_gigantic_folio(), which is not
an __init function. However, you got me thinking: since
hugetlb_cma_only is only effective when hugetlb_cma_size !=3D 0, I can
just reset hugetlb_cma_only to false if hugetlb_cma_size =3D=3D 0 after
parsing the commandline arguments. This will revert hugetlb_cma_size
to __initdata, and simplifies things a bit. I'll make that change in
v2.
>
> >
> >   __initdata struct list_head huge_boot_pages[MAX_NUMNODES];
> >   __initdata unsigned long hstate_boot_nrinvalid[HUGE_MAX_HSTATE];
> > @@ -132,8 +132,10 @@ static void hugetlb_free_folio(struct folio *folio=
)
> >   #ifdef CONFIG_CMA
> >       int nid =3D folio_nid(folio);
> >
> > -     if (cma_free_folio(hugetlb_cma[nid], folio))
> > +     if (folio_test_hugetlb_cma(folio)) {
> > +             WARN_ON(!cma_free_folio(hugetlb_cma[nid], folio));
>
> Is that WARN_ON() needed ? See
> https://docs.kernel.org/process/coding-style.html#do-not-crash-the-kernel

Not strictly, I suppose, but if there is a CMA-allocated hugetlb
folio, and cma_free fails, that would be a condition worthy of a
warning, as the flag somehow got corrupted or there is an internal CMA
error.  How about WARN_ON_ONCE?

>
>
> >               return;
> > +     }
> >   #endif
> >       folio_put(folio);
> >   }
> > @@ -1509,6 +1511,9 @@ static struct folio *alloc_gigantic_folio(struct =
hstate *h, gfp_t gfp_mask,
> >                                       break;
> >                       }
> >               }
> > +
> > +             if (folio)
> > +                     folio_set_hugetlb_cma(folio);
> >       }
> >   #endif
> >       if (!folio) {
> > @@ -3175,6 +3180,63 @@ struct folio *alloc_hugetlb_folio(struct vm_area=
_struct *vma,
> >       return ERR_PTR(-ENOSPC);
> >   }
> >
> > +/*
> > + * Some architectures do their own bootmem allocation, so they can't u=
se
> > + * early CMA allocation. So, allow for this function to be redefined.
> > + */
> > +bool __init __attribute((weak))
>
> Can't you use __weak ?
>
> By the way, do we really need a weak function here ? Can't it be a
> static inline helper that gets waived by a macro defined by the arch,
> something like:
>
> #ifndef arch_huge_bootmem_alloc
> static inline arch_huge_bootmem_alloc(struct hstate *h)
> {
>         return false;
> }
> #endif
>
> Then powerpc does:
>
> #define arch_huge_bootmem_alloc arch_huge_bootmem_alloc
> static inline arch_huge_bootmem_alloc(struct hstate *h)
> {
>         return (firmware_has_feature(FW_FEATURE_LPAR) && !radix_enabled()=
);
> }
>

Fair enough, yeah. I used a weak symbol because that was already used
for powerpc with alloc_bootmem_huge_page(), but I can change this one.

>
> But why is struct hstate *h parameter needed ? Seems like noone uses it.

Correct - I merely extrapolated a bit and thought "well, architectures
might have bootmem hugetlb allocators that only deal with certain
sizes". But then again, like you say, there is currently no need for
it. I'll remove the argument.

>
> > +arch_specific_huge_bootmem_alloc(struct hstate *h)
> > +{
> > +     return false;
> > +}
> > +
> > +static bool __init hugetlb_early_cma(struct hstate *h)
> > +{
> > +     if (arch_specific_huge_bootmem_alloc(h))
> > +             return false;
> > +
> > +     return (hstate_is_gigantic(h) && hugetlb_cma_size && hugetlb_cma_=
only);
> > +}
> > +
> > +static __init void *alloc_bootmem(struct hstate *h, int nid)
> > +{
> > +     struct huge_bootmem_page *m;
> > +     unsigned long flags;
> > +     struct cma *cma;
> > +
> > +#ifdef CONFIG_CMA
>
>   #ifdefs in C files should be avoided, see
> https://docs.kernel.org/process/coding-style.html#conditional-compilation
>
> > +     if (hugetlb_early_cma(h)) {
> > +             flags =3D HUGE_BOOTMEM_CMA;
> > +             cma =3D hugetlb_cma[nid];
> > +             m =3D cma_reserve_early(cma, huge_page_size(h));
> > +     } else
> > +#endif
>
> This kind of if/else construct in uggly, should be avoided.
>

I found this ifdef hard to avoid, sadly, I tried various ways to avoid
it (If (IS_ENABLED(CONFIG_CMA), etc), but came up short. I'll have
another look for v2, but short of trying to split off all CMA-related
code in to a different file, which would definitely be out of scope
here, it might not end up being better.

> > +     {
> > +             flags =3D 0;
> > +             cma =3D NULL;
> > +             m =3D memblock_alloc_try_nid_raw(huge_page_size(h),
> > +                     huge_page_size(h), 0, MEMBLOCK_ALLOC_ACCESSIBLE, =
nid);
> > +     }
> > +
> > +     if (m) {
> > +             /*
> > +              * Use the beginning of the huge page to store the
> > +              * huge_bootmem_page struct (until gather_bootmem
> > +              * puts them into the mem_map).
> > +              *
> > +              * Put them into a private list first because mem_map
> > +              * is not up yet.
> > +              */
> > +             INIT_LIST_HEAD(&m->list);
> > +             list_add(&m->list, &huge_boot_pages[nid]);
> > +             m->hstate =3D h;
> > +             m->flags =3D flags;
> > +             m->cma =3D cma;
> > +     }
> > +
> > +     return m;
> > +}
> > +
> >   int alloc_bootmem_huge_page(struct hstate *h, int nid)
> >       __attribute__ ((weak, alias("__alloc_bootmem_huge_page")));
> >   int __alloc_bootmem_huge_page(struct hstate *h, int nid)
> > @@ -3184,17 +3246,14 @@ int __alloc_bootmem_huge_page(struct hstate *h,=
 int nid)
> >
> >       /* do node specific alloc */
> >       if (nid !=3D NUMA_NO_NODE) {
> > -             m =3D memblock_alloc_try_nid_raw(huge_page_size(h), huge_=
page_size(h),
> > -                             0, MEMBLOCK_ALLOC_ACCESSIBLE, nid);
> > +             m =3D alloc_bootmem(h, node);
> >               if (!m)
> >                       return 0;
> >               goto found;
> >       }
> >       /* allocate from next node when distributing huge pages */
> >       for_each_node_mask_to_alloc(&h->next_nid_to_alloc, nr_nodes, node=
, &node_states[N_ONLINE]) {
> > -             m =3D memblock_alloc_try_nid_raw(
> > -                             huge_page_size(h), huge_page_size(h),
> > -                             0, MEMBLOCK_ALLOC_ACCESSIBLE, node);
> > +             m =3D alloc_bootmem(h, node);
> >               if (m)
> >                       break;
> >       }
> > @@ -3203,7 +3262,6 @@ int __alloc_bootmem_huge_page(struct hstate *h, i=
nt nid)
> >               return 0;
> >
> >   found:
> > -
> >       /*
> >        * Only initialize the head struct page in memmap_init_reserved_p=
ages,
> >        * rest of the struct pages will be initialized by the HugeTLB
> > @@ -3213,18 +3271,6 @@ int __alloc_bootmem_huge_page(struct hstate *h, =
int nid)
> >        */
> >       memblock_reserved_mark_noinit(virt_to_phys((void *)m + PAGE_SIZE)=
,
> >               huge_page_size(h) - PAGE_SIZE);
> > -     /*
> > -      * Use the beginning of the huge page to store the
> > -      * huge_bootmem_page struct (until gather_bootmem
> > -      * puts them into the mem_map).
> > -      *
> > -      * Put them into a private list first because mem_map
> > -      * is not up yet.
> > -      */
> > -     INIT_LIST_HEAD(&m->list);
> > -     list_add(&m->list, &huge_boot_pages[node]);
> > -     m->hstate =3D h;
> > -     m->flags =3D 0;
> >       return 1;
> >   }
> >
> > @@ -3265,13 +3311,25 @@ static void __init hugetlb_folio_init_vmemmap(s=
truct folio *folio,
> >       prep_compound_head((struct page *)folio, huge_page_order(h));
> >   }
> >
> > +static bool __init hugetlb_bootmem_page_prehvo(struct huge_bootmem_pag=
e *m)
> > +{
> > +     return (m->flags & HUGE_BOOTMEM_HVO);
>
> Parenthesis are superflous
>
> > +}
> > +
> > +static bool __init hugetlb_bootmem_page_earlycma(struct huge_bootmem_p=
age *m)
> > +{
> > +     return (m->flags & HUGE_BOOTMEM_CMA);
>
> Parenthesis are superflous
>

Sure, will remove them.

> > +}
> > +
> >   /*
> >    * memblock-allocated pageblocks might not have the migrate type set
> >    * if marked with the 'noinit' flag. Set it to the default (MIGRATE_M=
OVABLE)
> > - * here.
> > + * here, or MIGRATE_CMA if this was a page allocated through an early =
CMA
> > + * reservation.
> >    *
> > - * Note that this will not write the page struct, it is ok (and necess=
ary)
> > - * to do this on vmemmap optimized folios.
> > + * In case of vmemmap optimized folios, the tail vmemmap pages are map=
ped
> > + * read-only, but that's ok - for sparse vmemmap this does not write t=
o
> > + * the page structure.
> >    */
> >   static void __init hugetlb_bootmem_init_migratetype(struct folio *fol=
io,
> >                                                         struct hstate *=
h)
> > @@ -3280,9 +3338,13 @@ static void __init hugetlb_bootmem_init_migratet=
ype(struct folio *folio,
> >
> >       WARN_ON_ONCE(!pageblock_aligned(folio_pfn(folio)));
> >
> > -     for (i =3D 0; i < nr_pages; i +=3D pageblock_nr_pages)
> > -             set_pageblock_migratetype(folio_page(folio, i),
> > +     for (i =3D 0; i < nr_pages; i +=3D pageblock_nr_pages) {
> > +             if (folio_test_hugetlb_cma(folio))
> > +                     init_cma_pageblock(folio_page(folio, i));
> > +             else
> > +                     set_pageblock_migratetype(folio_page(folio, i),
> >                                         MIGRATE_MOVABLE);
> > +     }
> >   }
> >
> >   static void __init prep_and_add_bootmem_folios(struct hstate *h,
> > @@ -3319,7 +3381,7 @@ bool __init hugetlb_bootmem_page_zones_valid(int =
nid,
> >                                            struct huge_bootmem_page *m)
> >   {
> >       unsigned long start_pfn;
> > -     bool valid;
> > +     bool valid =3D false;
>
> Why do you need that, I can't see any path to reach out: without setting
> 'valid'.

True - probably a leftover from an earlier iteration, I can remove that.
>
> >
> >       if (m->flags & HUGE_BOOTMEM_ZONES_VALID) {
> >               /*
> > @@ -3328,10 +3390,16 @@ bool __init hugetlb_bootmem_page_zones_valid(in=
t nid,
> >               return true;
> >       }
> >
> > +     if (hugetlb_bootmem_page_earlycma(m)) {
> > +             valid =3D cma_validate_zones(m->cma);
> > +             goto out;
> > +     }
> > +
> >       start_pfn =3D virt_to_phys(m) >> PAGE_SHIFT;
> >
> >       valid =3D !pfn_range_intersects_zones(nid, start_pfn,
> >                       pages_per_huge_page(m->hstate));
> > +out:
> >       if (!valid)
> >               hstate_boot_nrinvalid[hstate_index(m->hstate)]++;
> >
> > @@ -3360,11 +3428,6 @@ static void __init hugetlb_bootmem_free_invalid_=
page(int nid, struct page *page,
> >       }
> >   }
> >
> > -static bool __init hugetlb_bootmem_page_prehvo(struct huge_bootmem_pag=
e *m)
> > -{
> > -     return (m->flags & HUGE_BOOTMEM_HVO);
> > -}
> > -
> >   /*
> >    * Put bootmem huge pages into the standard lists after mem_map is up=
.
> >    * Note: This only applies to gigantic (order > MAX_PAGE_ORDER) pages=
.
> > @@ -3414,6 +3477,9 @@ static void __init gather_bootmem_prealloc_node(u=
nsigned long nid)
> >                        */
> >                       folio_set_hugetlb_vmemmap_optimized(folio);
> >
> > +             if (hugetlb_bootmem_page_earlycma(m))
> > +                     folio_set_hugetlb_cma(folio);
> > +
> >               list_add(&folio->lru, &folio_list);
> >
> >               /*
> > @@ -3606,8 +3672,11 @@ static void __init hugetlb_hstate_alloc_pages(st=
ruct hstate *h)
> >   {
> >       unsigned long allocated;
> >
> > -     /* skip gigantic hugepages allocation if hugetlb_cma enabled */
> > -     if (hstate_is_gigantic(h) && hugetlb_cma_size) {
> > +     /*
> > +      * Skip gigantic hugepages allocation if early CMA
> > +      * reservations are not available.
> > +      */
> > +     if (hstate_is_gigantic(h) && hugetlb_cma_size && !hugetlb_early_c=
ma(h)) {
> >               pr_warn_once("HugeTLB: hugetlb_cma is enabled, skip boot =
time allocation\n");
> >               return;
> >       }
>

