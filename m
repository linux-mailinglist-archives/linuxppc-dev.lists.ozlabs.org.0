Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A4F7402AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 19:53:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jU0XSQm/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrC3y46p8z3bXf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 03:53:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jU0XSQm/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrC3343Xqz30Ct
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 03:52:14 +1000 (AEST)
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6b5d7e60015so4283708a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 10:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687888331; x=1690480331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ya0gjT04wvrkPEwxsIo0SrjOZFrw43ACMJ5aI2sBKGs=;
        b=jU0XSQm/UgQNqhqQcjqaxOHJKL3Tu8GM/GwEobHZGDkP+x8DVdgSjRkU85h/Lj/+te
         oZwK4Q1yO37Pzbn1i7oZRsd+yfivOXZX9DLv/iX+OOzSZ/17s4ytR4cUrCKbaq8ScVjb
         y4NBy98BQyt8WGI73+o5s1aq7cUaSdPW95ULfQ6FlPkdUprfA5PQkMvKjJsZAGVBcKqi
         qlieckJVpQyRqbWlQMoi71Q4k95ldkAZz69rpAi1h8kLQ3wxt3idqYMSWF1Mqn3mJooy
         Rs2GGbK0m2G7LUgnIAcus/1X+0dgeX1Usy3dZ/2MF2ihQvsHs5fE8nG3/WrSESAbmo+3
         LPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687888331; x=1690480331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ya0gjT04wvrkPEwxsIo0SrjOZFrw43ACMJ5aI2sBKGs=;
        b=UyC5Mu7d3jNSzsIb0qCVYv8gv+cmlOChhG7ui5D57WhcoZBBFfDgMOoVir+7q8++S2
         HS6kXGFqq72SZxRS3EvNffRf/jCjJNREfS0d8G7J8rHMrLCDvVjNcKolHE6hOLawF8Cd
         sAhRfT8glXJJw4rkNOXtdavOwnwVcrPFDJaJPFxMFRq2shtAbZUkqkdVZxteSDX8Dvfs
         9dnYyIw0ncuRna0ZR7+x9pjW8u8SUV1hI/e8M5HKFF6hKkvrp7n+0eCzhmnsxNXrhYuw
         eV9zs8pODdf0q3nsNRwMCdoU6PLe0UCXMgYNWNI4dhK6LmwnerSz3YWKYsnEQG7YL7AG
         MMqQ==
X-Gm-Message-State: AC+VfDxniDJ6ccSLD5G2Z372A52ERoKWfw702/3aREcT+ps2+oP2tLRz
	rzbeqAi+r7vllJO9oR9J5N+IPeT5L/dO0UaySq8=
X-Google-Smtp-Source: ACHHUZ60PXVLGXFjCZbPL4+H89P+QaultgII2fPTXJpRhifF/y6voZRlslPkfFetToA56imkT1WhjHNqMU1RYiBUm6M=
X-Received: by 2002:a05:6359:d23:b0:133:a55:7e26 with SMTP id
 gp35-20020a0563590d2300b001330a557e26mr5444430rwb.7.1687888330839; Tue, 27
 Jun 2023 10:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230627031431.29653-1-vishal.moola@gmail.com>
 <20230627031431.29653-4-vishal.moola@gmail.com> <ZJsJT9dLtxaKlxVb@x1n>
In-Reply-To: <ZJsJT9dLtxaKlxVb@x1n>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Tue, 27 Jun 2023 10:51:59 -0700
Message-ID: <CAOzc2pw2U2XvMcaEdy18UYe=5=PeCBn_qLR_3ns8_nWvgSSDQw@mail.gmail.com>
Subject: Re: [PATCH v6 03/33] pgtable: Create struct ptdesc
To: Peter Xu <peterx@redhat.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Mike Rapoport <rppt@kernel.org>, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 27, 2023 at 9:07=E2=80=AFAM Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, Jun 26, 2023 at 08:14:01PM -0700, Vishal Moola (Oracle) wrote:
> > Currently, page table information is stored within struct page. As part
> > of simplifying struct page, create struct ptdesc for page table
> > information.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > ---
> >  include/linux/pgtable.h | 68 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index 5063b482e34f..d46cb709ce08 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -987,6 +987,74 @@ static inline void ptep_modify_prot_commit(struct =
vm_area_struct *vma,
> >  #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
> >  #endif /* CONFIG_MMU */
> >
> > +
> > +/**
> > + * struct ptdesc -    Memory descriptor for page tables.
> > + * @__page_flags:     Same as page flags. Unused for page tables.
> > + * @pt_rcu_head:      For freeing page table pages.
> > + * @pt_list:          List of used page tables. Used for s390 and x86.
> > + * @_pt_pad_1:        Padding that aliases with page's compound head.
> > + * @pmd_huge_pte:     Protected by ptdesc->ptl, used for THPs.
> > + * @_pt_s390_gaddr:   Aliases with page's mapping. Used for s390 gmap =
only.
>
> Should some arch-specific bits (and a few others) always under some
> #ifdefs, so it shouldn't appear on other archs?

Right now this struct completely overlays struct page, so the padding as
well as any arch-specific fields have to stay. Whenever we get ptdescs
independent of struct page we can cleanup any unnecessary fields, as
well as omit unnecessary fields from unrelated architectures.
