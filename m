Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 466526EA008
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Apr 2023 01:33:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2Yrj0zFLz3fTK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Apr 2023 09:33:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=AX4YGgPJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=AX4YGgPJ;
	dkim-atps=neutral
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2Yqp6lprz3cdR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Apr 2023 09:33:10 +1000 (AEST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5529f3b8623so2178467b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 16:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682033582; x=1684625582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PN2ixoAK9D3BuA0Ys9lwnMZMdyz2nW/UTyxM+6NXzqI=;
        b=AX4YGgPJjZWyR0kqu580/PVasSF+uNRiA7gr7gHqMdE/2vLkFpdjQpKmKbwxnvzy1W
         4jX/DWRv14Hh6L+AuqxNt9TrfsVNFOA+DMslH6msB9ssOPuKNdU5LH4UlZNRkrQgi/yF
         2C7UqT75y8+OehNqUJfsf2nClBSiv3rZRBTIf/8qXrl8xEYNdOg0mllWNN17Cw7o+BHc
         Dv7TVavT6/AGmzCH4d7Tksroa3F14WaPTNTcwjLqhrbimQGYJu8Di4n0FcYkgCSZZuxf
         BRI5CuXSQtBQDqv2Sdnh5lzey/n44xr+tGNe/P6HPq7sE+h81UtCj457v+cM+mPjpeEU
         pLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682033582; x=1684625582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PN2ixoAK9D3BuA0Ys9lwnMZMdyz2nW/UTyxM+6NXzqI=;
        b=RduZx9S+eItUc6aUcWTPAcpJD9pRmoT+2EfmTcsakpgL4P/zOm0TtC1BTevQUtOumK
         CPyIJxRZfTKfdUShlpRyhmWHWR8QGqkipKJCdcdf1m+4gXHc+dybdza3sSKHYNc/Ll3d
         UuAEK2wmibq3ADCuCOWR3SK0sDqaF+KnXp2NJf1/Wqgc3dSGUjjNVVeYj24oYWOt2696
         g0dL/G4ZS9XMlfsx0HOzoeNoD/mfs8n6MkHN7YBG3Pgho4NNu08Qok/BoWipVMEMkQkQ
         HuMhWvDl/VZW8hliAMLSFYMraKFbvdhjoA8MMKmWoOFUwPaBrcWNoPzzjSdbaxFpqJRi
         Q8/Q==
X-Gm-Message-State: AAQBX9ec2Qfanq4oVQmSOOIFKc0qg6BCCs+Ctqot/4C1Spvf/3lAEFC5
	53o2W2ixLZXRgyJ/yHRjC7VkdMgwYdBrShmeRcU=
X-Google-Smtp-Source: AKy350bopqnJQtT+418DUBi5UUf4Yx/MaaBIpccKeoXBRimnuUzPebu61FMjyfXCRvipIUnUp3uBwA4Azmrc32p/hx0=
X-Received: by 2002:a0d:f205:0:b0:541:8810:8d7b with SMTP id
 b5-20020a0df205000000b0054188108d7bmr466003ywf.15.1682033581993; Thu, 20 Apr
 2023 16:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230417205048.15870-1-vishal.moola@gmail.com>
 <20230417205048.15870-2-vishal.moola@gmail.com> <da600570-51c7-8088-b46b-7524c9e66e5d@redhat.com>
 <CAOzc2pwpRhNoFbdzdzuvrqbZdf2OsrTvBGs40QCZJjA5fS_q1A@mail.gmail.com> <e0c0ad67-f23f-ff35-80bf-841dcfd43d99@redhat.com>
In-Reply-To: <e0c0ad67-f23f-ff35-80bf-841dcfd43d99@redhat.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 20 Apr 2023 16:32:50 -0700
Message-ID: <CAOzc2pwDtn836Tf0Egh+Z258hxSTVtvwuyU2qiJa1iLa6vZFjQ@mail.gmail.com>
Subject: Re: [PATCH 01/33] s390: Use _pt_s390_gaddr for gmap address tracking
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 19, 2023 at 12:54=E2=80=AFAM David Hildenbrand <david@redhat.co=
m> wrote:
>
> On 18.04.23 23:33, Vishal Moola wrote:
> > On Tue, Apr 18, 2023 at 8:45=E2=80=AFAM David Hildenbrand <david@redhat=
.com> wrote:
> >>
> >> On 17.04.23 22:50, Vishal Moola (Oracle) wrote:
> >>> s390 uses page->index to keep track of page tables for the guest addr=
ess
> >>> space. In an attempt to consolidate the usage of page fields in s390,
> >>> replace _pt_pad_2 with _pt_s390_gaddr to replace page->index in gmap.
> >>>
> >>> This will help with the splitting of struct ptdesc from struct page, =
as
> >>> well as allow s390 to use _pt_frag_refcount for fragmented page table
> >>> tracking.
> >>>
> >>> Since page->_pt_s390_gaddr aliases with mapping, ensure its set to NU=
LL
> >>> before freeing the pages as well.
> >>>
> >>> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> >>> index 3fc9e680f174..2616d64c0e8c 100644
> >>> --- a/include/linux/mm_types.h
> >>> +++ b/include/linux/mm_types.h
> >>> @@ -144,7 +144,7 @@ struct page {
> >>>                struct {        /* Page table pages */
> >>>                        unsigned long _pt_pad_1;        /* compound_he=
ad */
> >>>                        pgtable_t pmd_huge_pte; /* protected by page->=
ptl */
> >>> -                     unsigned long _pt_pad_2;        /* mapping */
> >>> +                     unsigned long _pt_s390_gaddr;   /* mapping */
> >>>                        union {
> >>>                                struct mm_struct *pt_mm; /* x86 pgds o=
nly */
> >>>                                atomic_t pt_frag_refcount; /* powerpc =
*/
> >>
> >> The confusing part is, that these gmap page tables are not ordinary
> >> process page tables that we would ordinarily place into this section
> >> here. That's why they are also not allocated/freed using the typical
> >> page table constructor/destructor ...
> >
> > I initially thought the same, so I was quite confused when I saw
> > __gmap_segment_gaddr was using pmd_pgtable_page().
> >
> > Although they are not ordinary process page tables, since we
> > eventually want to move them out of struct page, I think shifting them
> > to be in ptdescs, being a memory descriptor for page tables, makes
> > the most sense.
>
> Seeing utilities like tlb_remove_page_ptdesc() that don't really apply
> to such page tables, I wonder if we should much rather treat such
> shadow/auxiliary/... page tables (just like other architectures like
> x86, arm, ... employ as well) as a distinct type.
>
> And have ptdesc be the common type for all process page tables.

Although I do like the idea of having a distinct type for them, I'm not sur=
e
I see the merits of having another type specifically for those types of
page tables.

As it currently is, tlb_remove_table() is only distinct from tlb_remove_pag=
e()
when an architecture defines its own removal function. I'm not too familiar
with most of their differences, but we can probably continue to let them do
that. As of now, I'm not too sure what a distinct type would look like that
could meet all their needs holistically.

> >
> > Another option is to leave pmd_pgtable_page() as is just for this case.
> > Or we can revert commit 7e25de77bc5ea which uses the function here
> > then figure out where these gmap pages table pages will go later.
>
> I'm always confused when reading gmap code, so let me have another look :=
)
>
> The confusing part is that s390x shares the lowest level page tables
> (PTE tables) between the process and gmap ("guest mapping", similar to
> EPT on x86-64). It maps these process PTE tables (covering 1 MiB) into
> gmap-specific PMD tables.

Especially in cases like this. If the architecture wants to share page tabl=
es
then everything being in form ptdesc would make that easiest, and
continue to let them define their own niche functions for their needs.

> pmd_pgtable_page() should indeed always give us a gmap-specific
> PMD-table. In fact, something allocated via gmap_alloc_table().
>
> Decoupling both concepts sounds like a good idea.

Yeah, I'm not a fan of how this gmap caller is the only external caller
using this to get a page for their own purposes. I'll update that in v2.
