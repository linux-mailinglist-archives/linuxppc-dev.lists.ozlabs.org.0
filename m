Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B9E71955E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 10:21:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWzcH0S9Nz3dwg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 18:21:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bIHOxHzj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bIHOxHzj;
	dkim-atps=neutral
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWzbM5zG5z3cC5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 18:20:30 +1000 (AEST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-565cfe4ece7so5707147b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 01:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685607627; x=1688199627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tS4a1xOgxMUMLEbnCg0V4q+ycCWx2xlztmESkIXckyo=;
        b=bIHOxHzjZXokee9j5bbLR5t5pc8c2Z3iggLrV1+hE0XnEXAKfoXhCLHOSa/72NNKfd
         6fz4mYEsaohJNpEL4Rs9VL4vNpL+O0IFENkKP8Ed1r56LzcraMW5AYAo4x/ntCtiU2p3
         x22qNSqmdrlW4Y/tGkgjrEwyv71XC2UWZFG42WlTnI/gnlPQ9bm7CQBxLeRufsNGf3b3
         aSnEcs9elD0+6oKwXRc6fHvLfsfn4GZRVVoYihKOLOoIEu2kuGpVvxaorPdvDNijmjMi
         d1rL9Zr7ifZGWT0hflvFwiRNteKQuaUR21zo007VMcTBghI8tw53RKKaLOkzxLItE6zV
         XEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685607627; x=1688199627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tS4a1xOgxMUMLEbnCg0V4q+ycCWx2xlztmESkIXckyo=;
        b=OWZe9Le1LFctTQmfsZdRiKYafIh81i2zAM/yP9dgQL4WoAdxND8RgnFCAlyFVe33HT
         AxVK6hx1h+2kdzQN/uNPGt/8cw97BCCY6XMao7bDzFr+XQWaS/XL7r9oBoSrb8TfueDo
         c8Z8GZfD7/sxIV9pcwCwSbCF0H0lCvoKEzhB1Xg21uXShlF0u1kmCQj4f6eXgMNiqV8X
         mM9ceMVB4klYq6Ua7cnIKqY1ZYYq8tmConPwyvAltCWIoSb+hprL3lr/JpmTPdIGOzeT
         NB0kvZG9Kcm3WsiEFxinHhJyHaiKzbzrcX1e7JdECKj4IKMrzfvGmNa6lxoP+3Wkn705
         jWhQ==
X-Gm-Message-State: AC+VfDy+6JFCdnD6eQIcq8i0ofQ3spiHlrm4MApSPtml1Rg82Fu0JJHw
	sMtXJNKcoF//+P7/OdxpdnXQkU2u6v2SXI6QvrT6LexXEQI=
X-Google-Smtp-Source: ACHHUZ4IZT44NtIfRs/xlbKnWFcG4D7AEEUxUuudHP/RnlDvS1B/rq8axgox+tzLkd9y6rosB3Zw4KNqjFWW/wbAOr8=
X-Received: by 2002:a81:7785:0:b0:565:7d7:1356 with SMTP id
 s127-20020a817785000000b0056507d71356mr8254467ywc.22.1685607626688; Thu, 01
 Jun 2023 01:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230531213032.25338-1-vishal.moola@gmail.com>
 <20230531213032.25338-26-vishal.moola@gmail.com> <CAMuHMdWCe=VsTJYNA_-k=JipeAGKzgBFjZ8i+XRK7U1DBei=7A@mail.gmail.com>
In-Reply-To: <CAMuHMdWCe=VsTJYNA_-k=JipeAGKzgBFjZ8i+XRK7U1DBei=7A@mail.gmail.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 1 Jun 2023 01:20:15 -0700
Message-ID: <CAOzc2pzVEO_LSw1Ffwk1K3sXni_32wO0T+fEAnR6zVVB5x=vVA@mail.gmail.com>
Subject: Re: [PATCH v3 25/34] m68k: Convert various functions to use ptdescs
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

On Thu, Jun 1, 2023 at 12:40=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Vishal,
>
> On Wed, May 31, 2023 at 11:32=E2=80=AFPM Vishal Moola (Oracle)
> <vishal.moola@gmail.com> wrote:
> > As part of the conversions to replace pgtable constructor/destructors w=
ith
> > ptdesc equivalents, convert various page table functions to use ptdescs=
.
> >
> > Some of the functions use the *get*page*() helper functions. Convert
> > these to use pagetable_alloc() and ptdesc_address() instead to help
> > standardize page tables further.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
>
> Thanks for your patch!
>
> > --- a/arch/m68k/include/asm/mcf_pgalloc.h
> > +++ b/arch/m68k/include/asm/mcf_pgalloc.h
> > @@ -7,20 +7,19 @@
> >
> >  extern inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
> >  {
> > -       free_page((unsigned long) pte);
> > +       pagetable_free(virt_to_ptdesc(pte));
> >  }
> >
> >  extern const char bad_pmd_string[];
> >
> >  extern inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
> >  {
> > -       unsigned long page =3D __get_free_page(GFP_DMA);
> > +       struct ptdesc *ptdesc =3D pagetable_alloc(GFP_DMA | __GFP_ZERO,=
 0);
> >
> > -       if (!page)
> > +       if (!ptdesc)
> >                 return NULL;
> >
> > -       memset((void *)page, 0, PAGE_SIZE);
> > -       return (pte_t *) (page);
> > +       return (pte_t *) (ptdesc_address(ptdesc));
>
> No need to cast "void *" when returning a different pointer type.
>
> >  }
> >
> >  extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, unsigned long addres=
s)
> > @@ -35,36 +34,36 @@ extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, u=
nsigned long address)
> >  static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pg=
table,
> >                                   unsigned long address)
> >  {
> > -       struct page *page =3D virt_to_page(pgtable);
> > +       struct ptdesc *ptdesc =3D virt_to_ptdesc(pgtable);
> >
> > -       pgtable_pte_page_dtor(page);
> > -       __free_page(page);
> > +       pagetable_pte_dtor(ptdesc);
> > +       pagetable_free(ptdesc);
> >  }
> >
> >  static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
> >  {
> > -       struct page *page =3D alloc_pages(GFP_DMA, 0);
> > +       struct ptdesc *ptdesc =3D pagetable_alloc(GFP_DMA, 0);
> >         pte_t *pte;
> >
> > -       if (!page)
> > +       if (!ptdesc)
> >                 return NULL;
> > -       if (!pgtable_pte_page_ctor(page)) {
> > -               __free_page(page);
> > +       if (!pagetable_pte_ctor(ptdesc)) {
> > +               pagetable_free(ptdesc);
> >                 return NULL;
> >         }
> >
> > -       pte =3D page_address(page);
> > -       clear_page(pte);
> > +       pte =3D ptdesc_address(ptdesc);
> > +       pagetable_clear(pte);
> >
> >         return pte;
> >  }
> >
> >  static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
> >  {
> > -       struct page *page =3D virt_to_page(pgtable);
> > +       struct ptdesc *ptdesc =3D virt_to_ptdesc(ptdesc);
>
> virt_to_ptdesc(pgtable)
>
> (You can build this using m5475evb_defconfig)
>
> >
> > -       pgtable_pte_page_dtor(page);
> > -       __free_page(page);
> > +       pagetable_pte_dtor(ptdesc);
> > +       pagetable_free(ptdesc);
> >  }
> >
> >  /*
> > @@ -75,16 +74,18 @@ static inline void pte_free(struct mm_struct *mm, p=
gtable_t pgtable)
> >
> >  static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
> >  {
> > -       free_page((unsigned long) pgd);
> > +       pagetable_free(virt_to_ptdesc(pgd));
> >  }
> >
> >  static inline pgd_t *pgd_alloc(struct mm_struct *mm)
> >  {
> >         pgd_t *new_pgd;
> > +       struct ptdesc *ptdesc =3D pagetable_alloc(GFP_DMA | GFP_NOWARN,=
 0);
> >
> > -       new_pgd =3D (pgd_t *)__get_free_page(GFP_DMA | __GFP_NOWARN);
> > -       if (!new_pgd)
> > +       if (!ptdesc)
> >                 return NULL;
> > +       new_pgd =3D (pgd_t *) ptdesc_address(ptdesc);
>
> No need to cast "void *" when assigning to a different pointer type.
>
> > +
> >         memcpy(new_pgd, swapper_pg_dir, PTRS_PER_PGD * sizeof(pgd_t));
> >         memset(new_pgd, 0, PAGE_OFFSET >> PGDIR_SHIFT);
> >         return new_pgd;
>
> The rest LGTM.

Thanks so much for the review! I'll make those changes in the next
version.


> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
