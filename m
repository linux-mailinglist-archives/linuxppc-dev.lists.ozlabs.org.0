Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2312071138A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 20:18:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRxBH64cRz3fFh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 04:18:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=qpx33W23;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=qpx33W23;
	dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRx9P29Trz3bjy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 04:17:28 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-ba1815e12efso763584276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 11:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685038645; x=1687630645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEt/V8+3jpKdaWf/91twz9m1AxbB8mw1sieW7q1FOX4=;
        b=qpx33W23LxzGgtt7x0f+jHNiqnq/vW7f+lo4R60odkrqHHbvAvDFwCToA7ZeGOtlZu
         1pix82nq+XRaSlrOoV5XSSn7dUtYbrVRPJSVcc+Y0QUEIud/VeliblGAWTefKuC3uiLW
         Y767SW9acPu7TamxQ3rDZ7ad1waallUvH2KGWMSoPdMgQ6uqByETyo++E8JgCnYWaIR7
         T+3+xQi6fbJlgvqxHEFBxTPhg1oh030qaBtpvB360U8uoO6SqTXFxFoolc38s3Jd+HWF
         qSuZfJvCEliq2Q2QxhelaN+CYntsdlTkVUzhuGY+pHQjjIlm9D34YIwBuMF1/x8S1rOB
         qR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685038645; x=1687630645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEt/V8+3jpKdaWf/91twz9m1AxbB8mw1sieW7q1FOX4=;
        b=jK2gAIZTRam98kRQ4RJWt6e4UUAxQHr0lFXVPfwt3mkuWpMJ8rnon55M/a3xFI2u66
         9KyMFLyqDVCXth8bwMzQt52sUIzppvhmzC0sNlQSmJiFZg8Nxs5OSOeHMAypLqt7DcWM
         pN0u4U8dSfQzu7YO4GR4klDu772ewg+4LPZ2bjg46jyZGRanhKAn+g1q2YC4uroMsCgZ
         2GX9dOZZlaxuS6/pphbA8VTd6yqJBH5yABAXeHu34jts+YKLzAOy5EgIElhBQDbqYcDL
         eZ4r0oEWgPTniLJoKW/y+rUeOwZKZJHzA6o1vjQdhPQMurUiopc1AY+cI7VAgm2lkMV4
         9YWA==
X-Gm-Message-State: AC+VfDywIKjuZDL6P/pQ6NRDV+jCOUYEnbB3TqrMpBYJ4be8UXbKFS1t
	XhW68R5UR0fGy60FXUT5h6QJn+5MMdGflCwaNF4=
X-Google-Smtp-Source: ACHHUZ4CxdCafEVA2N8+YE3r54vbJuyNv4iSvWQn7ibpFdu7Q8YcRob13nPjv7XKdbKB6AoaGk0hrDu/6J2TDu7u8Qo=
X-Received: by 2002:a25:ac6:0:b0:ba7:bb4c:7960 with SMTP id
 189-20020a250ac6000000b00ba7bb4c7960mr4320550ybk.26.1685038645132; Thu, 25
 May 2023 11:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-14-vishal.moola@gmail.com> <20230525091900.GY4967@kernel.org>
In-Reply-To: <20230525091900.GY4967@kernel.org>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 25 May 2023 11:17:14 -0700
Message-ID: <CAOzc2pxNRbohxxNnaKtBNOBgOschHMj278-6hWZK9A1oJOgujA@mail.gmail.com>
Subject: Re: [PATCH v2 13/34] mm: Create ptdesc equivalents for pgtable_{pte,pmd}_page_{ctor,dtor}
To: Mike Rapoport <rppt@kernel.org>
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

On Thu, May 25, 2023 at 2:19=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Mon, May 01, 2023 at 12:28:08PM -0700, Vishal Moola (Oracle) wrote:
> > Creates ptdesc_pte_ctor(), ptdesc_pmd_ctor(), ptdesc_pte_dtor(), and
> > ptdesc_pmd_dtor() and make the original pgtable constructor/destructors
> > wrappers.
>
> I think pgtable_pXY_ctor/dtor names would be better.

I have it as ptdesc to keep it consistent with the rest of the functions. I
also think it makes more sense as it's initializing stuff tracked by a ptde=
sc.

> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >  include/linux/mm.h | 56 ++++++++++++++++++++++++++++++++++------------
> >  1 file changed, 42 insertions(+), 14 deletions(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 58c911341a33..dc61aeca9077 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -2847,20 +2847,34 @@ static inline bool ptlock_init(struct ptdesc *p=
tdesc) { return true; }
> >  static inline void ptlock_free(struct ptdesc *ptdesc) {}
> >  #endif /* USE_SPLIT_PTE_PTLOCKS */
> >
> > -static inline bool pgtable_pte_page_ctor(struct page *page)
> > +static inline bool ptdesc_pte_ctor(struct ptdesc *ptdesc)
> >  {
> > -     if (!ptlock_init(page_ptdesc(page)))
> > +     struct folio *folio =3D ptdesc_folio(ptdesc);
> > +
> > +     if (!ptlock_init(ptdesc))
> >               return false;
> > -     __SetPageTable(page);
> > -     inc_lruvec_page_state(page, NR_PAGETABLE);
> > +     __folio_set_table(folio);
> > +     lruvec_stat_add_folio(folio, NR_PAGETABLE);
> >       return true;
> >  }
> >
> > +static inline bool pgtable_pte_page_ctor(struct page *page)
> > +{
> > +     return ptdesc_pte_ctor(page_ptdesc(page));
> > +}
> > +
> > +static inline void ptdesc_pte_dtor(struct ptdesc *ptdesc)
> > +{
> > +     struct folio *folio =3D ptdesc_folio(ptdesc);
> > +
> > +     ptlock_free(ptdesc);
> > +     __folio_clear_table(folio);
> > +     lruvec_stat_sub_folio(folio, NR_PAGETABLE);
> > +}
> > +
> >  static inline void pgtable_pte_page_dtor(struct page *page)
> >  {
> > -     ptlock_free(page_ptdesc(page));
> > -     __ClearPageTable(page);
> > -     dec_lruvec_page_state(page, NR_PAGETABLE);
> > +     ptdesc_pte_dtor(page_ptdesc(page));
> >  }
> >
> >  #define pte_offset_map_lock(mm, pmd, address, ptlp)  \
> > @@ -2942,20 +2956,34 @@ static inline spinlock_t *pmd_lock(struct mm_st=
ruct *mm, pmd_t *pmd)
> >       return ptl;
> >  }
> >
> > -static inline bool pgtable_pmd_page_ctor(struct page *page)
> > +static inline bool ptdesc_pmd_ctor(struct ptdesc *ptdesc)
> >  {
> > -     if (!pmd_ptlock_init(page_ptdesc(page)))
> > +     struct folio *folio =3D ptdesc_folio(ptdesc);
> > +
> > +     if (!pmd_ptlock_init(ptdesc))
> >               return false;
> > -     __SetPageTable(page);
> > -     inc_lruvec_page_state(page, NR_PAGETABLE);
> > +     __folio_set_table(folio);
> > +     lruvec_stat_add_folio(folio, NR_PAGETABLE);
> >       return true;
> >  }
> >
> > +static inline bool pgtable_pmd_page_ctor(struct page *page)
> > +{
> > +     return ptdesc_pmd_ctor(page_ptdesc(page));
> > +}
> > +
> > +static inline void ptdesc_pmd_dtor(struct ptdesc *ptdesc)
> > +{
> > +     struct folio *folio =3D ptdesc_folio(ptdesc);
> > +
> > +     pmd_ptlock_free(ptdesc);
> > +     __folio_clear_table(folio);
> > +     lruvec_stat_sub_folio(folio, NR_PAGETABLE);
> > +}
> > +
> >  static inline void pgtable_pmd_page_dtor(struct page *page)
> >  {
> > -     pmd_ptlock_free(page_ptdesc(page));
> > -     __ClearPageTable(page);
> > -     dec_lruvec_page_state(page, NR_PAGETABLE);
> > +     ptdesc_pmd_dtor(page_ptdesc(page));
> >  }
> >
> >  /*
> > --
> > 2.39.2
> >
> >
>
> --
> Sincerely yours,
> Mike.
