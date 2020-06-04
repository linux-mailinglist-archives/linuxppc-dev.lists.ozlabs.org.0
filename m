Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A231EE90C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 19:01:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dBrs2cfrzDqrN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 03:01:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=sedat.dilek@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=INbAqWsa; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dBnS4R58zDqrZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 02:58:46 +1000 (AEST)
Received: by mail-il1-x144.google.com with SMTP id 9so6726577ilg.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jun 2020 09:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=V0PNBpoMs08sQd4e2o2SoGg1Svcltptif4I91AoTlvg=;
 b=INbAqWsakbJzK4ZSEEFe429oBmTHcyH/9fRe64K2yh4y2wJGs9smE/e7f9S9PpL5bs
 Ei3AuQd5J5QASo5h1K5IKhrn7HBM9jIJsQRkdX5VKKmmq9Iv24Nvs3ORCfG/4sFmSM3L
 IilNtaVFyoUbQ7lJ0xJbyK4mMrpfgu0p+EHbg5L7sMGwDnaQ3HmUoz91WAWyAhp99of5
 dXsZCy80rDdj0rr8jk/YobGwpMdvWpus6/V4eNk8sEtY4ihPOAWfI35LqNXZrGT0AtIx
 +d83hsXhaf7SLFXwpM3UJJ20FguuXVWDyctqM7VjuEdflMMpwhRIjBKBqytpwGwoGoxk
 k9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=V0PNBpoMs08sQd4e2o2SoGg1Svcltptif4I91AoTlvg=;
 b=iUG0A1fjqbaCwy+bN5/2PQfthBHQKfRlq5xkDrgZOBRCdFFjlAs58ZQc1ZmGbM3eKW
 We7m/kQxae1rsEa//sqTgbho0WZE15G9e5f3CECIW+289CWrCXeNLRJ6uM3MbAssj4iW
 S2AC1ttEPe5ON0Uzl6/XGSM32jRpKsuqhRHTPyxg16pjaYs63yFOq/NnD3nJREM9GqF+
 sYAnekq36fMOxxNYhRH4cI5ewPRSKLgYLYZKbTemw+xupKJ1QPhHK3dErLZpUSmV5n6a
 c6ZuRBvJD7DD92/6G24mqFuyiluJan+k8g/G4NDKnoOrFZUAnZ8bR3Fb7AFqxgGrICQ2
 bQlA==
X-Gm-Message-State: AOAM5308iSzF+TSK89xjLRadYKpwJNp5L0lry6wwbrjkGJrI2aZWZtS2
 6Ku++515nhsIKWXxhziBXteOjsv7ZFF27c1WuQs=
X-Google-Smtp-Source: ABdhPJwMMOV4ROUKfkRri2iYpXGV3bCFo31xQIsOQpa//uvPw9wXVjqQALsY3dAdNGtINNjfGPr6il3/Rr6FaC+T8Bk=
X-Received: by 2002:a92:9603:: with SMTP id g3mr5099315ilh.204.1591289921631; 
 Thu, 04 Jun 2020 09:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200604074446.23944-1-joro@8bytes.org>
 <20200604164814.GA7600@kernel.org>
In-Reply-To: <20200604164814.GA7600@kernel.org>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 4 Jun 2020 18:58:29 +0200
Message-ID: <CA+icZUVvMBTtF+p5obq-eiZzccRo8g8vmiczDGUxZnj-fu8U9Q@mail.gmail.com>
Subject: Re: [PATCH] mm: Fix pud_alloc_track()
To: Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: sedat.dilek@gmail.com
Cc: linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 jroedel@suse.de, linux-mm@kvack.org, peterz@infradead.org,
 linuxppc-dev@lists.ozlabs.org, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Abdul Haleem <abdhalee@linux.vnet.ibm.com>, linux-next@vger.kernel.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Andy Lutomirski <luto@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 manvanth@linux.vnet.ibm.com, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 4, 2020 at 6:49 PM Mike Rapoport <rppt@kernel.org> wrote:
>
> On Thu, Jun 04, 2020 at 09:44:46AM +0200, Joerg Roedel wrote:
> > From: Joerg Roedel <jroedel@suse.de>
> >
> > The pud_alloc_track() needs to do different checks based on whether
> > __ARCH_HAS_5LEVEL_HACK is defined, like it already does in
> > pud_alloc(). Otherwise it causes boot failures on PowerPC.
> >
> > Provide the correct implementations for both possible settings of
> > __ARCH_HAS_5LEVEL_HACK to fix the boot problems.
>
> There is a patch in mmotm [1] that completely removes
> __ARCH_HAS_5LEVEL_HACK which is a part of the series [2] that updates
> p4d folding accross architectures. This should fix boot on PowerPC and
> the addition of pXd_alloc_track() for __ARCH_HAS_5LEVEL_HACK wouldn't be
> necessary.
>
>
> [1] https://github.com/hnaz/linux-mm/commit/cfae68792af3731ac902ea6ba5ed8df5a0f6bd2f
> [2] https://lore.kernel.org/kvmarm/20200414153455.21744-1-rppt@kernel.org/
>

That link shows an overview of v4 and is easily downloadable as a
single mbox file.
See " Series = mm: remove __ARCH_HAS_5LEVEL_HACK"

- Sedat -

[1] https://lore.kernel.org/patchwork/project/lkml/list/?series=438627

> > Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
> > Tested-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
> > Tested-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> > Fixes: d8626138009b ("mm: add functions to track page directory modifications")
> > Signed-off-by: Joerg Roedel <jroedel@suse.de>
> > ---
> >  include/asm-generic/5level-fixup.h |  5 +++++
> >  include/linux/mm.h                 | 26 +++++++++++++-------------
> >  2 files changed, 18 insertions(+), 13 deletions(-)
> >
> > diff --git a/include/asm-generic/5level-fixup.h b/include/asm-generic/5level-fixup.h
> > index 58046ddc08d0..afbab31fbd7e 100644
> > --- a/include/asm-generic/5level-fixup.h
> > +++ b/include/asm-generic/5level-fixup.h
> > @@ -17,6 +17,11 @@
> >       ((unlikely(pgd_none(*(p4d))) && __pud_alloc(mm, p4d, address)) ? \
> >               NULL : pud_offset(p4d, address))
> >
> > +#define pud_alloc_track(mm, p4d, address, mask)                                      \
> > +     ((unlikely(pgd_none(*(p4d))) &&                                         \
> > +       (__pud_alloc(mm, p4d, address) || ({*(mask)|=PGTBL_P4D_MODIFIED;0;})))?       \
> > +       NULL : pud_offset(p4d, address))
> > +
> >  #define p4d_alloc(mm, pgd, address)          (pgd)
> >  #define p4d_alloc_track(mm, pgd, address, mask)      (pgd)
> >  #define p4d_offset(pgd, start)                       (pgd)
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 66e0977f970a..ad3b31c5bcc3 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -2088,35 +2088,35 @@ static inline pud_t *pud_alloc(struct mm_struct *mm, p4d_t *p4d,
> >               NULL : pud_offset(p4d, address);
> >  }
> >
> > -static inline p4d_t *p4d_alloc_track(struct mm_struct *mm, pgd_t *pgd,
> > +static inline pud_t *pud_alloc_track(struct mm_struct *mm, p4d_t *p4d,
> >                                    unsigned long address,
> >                                    pgtbl_mod_mask *mod_mask)
> > -
> >  {
> > -     if (unlikely(pgd_none(*pgd))) {
> > -             if (__p4d_alloc(mm, pgd, address))
> > +     if (unlikely(p4d_none(*p4d))) {
> > +             if (__pud_alloc(mm, p4d, address))
> >                       return NULL;
> > -             *mod_mask |= PGTBL_PGD_MODIFIED;
> > +             *mod_mask |= PGTBL_P4D_MODIFIED;
> >       }
> >
> > -     return p4d_offset(pgd, address);
> > +     return pud_offset(p4d, address);
> >  }
> >
> > -#endif /* !__ARCH_HAS_5LEVEL_HACK */
> > -
> > -static inline pud_t *pud_alloc_track(struct mm_struct *mm, p4d_t *p4d,
> > +static inline p4d_t *p4d_alloc_track(struct mm_struct *mm, pgd_t *pgd,
> >                                    unsigned long address,
> >                                    pgtbl_mod_mask *mod_mask)
> > +
> >  {
> > -     if (unlikely(p4d_none(*p4d))) {
> > -             if (__pud_alloc(mm, p4d, address))
> > +     if (unlikely(pgd_none(*pgd))) {
> > +             if (__p4d_alloc(mm, pgd, address))
> >                       return NULL;
> > -             *mod_mask |= PGTBL_P4D_MODIFIED;
> > +             *mod_mask |= PGTBL_PGD_MODIFIED;
> >       }
> >
> > -     return pud_offset(p4d, address);
> > +     return p4d_offset(pgd, address);
> >  }
> >
> > +#endif /* !__ARCH_HAS_5LEVEL_HACK */
> > +
> >  static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address)
> >  {
> >       return (unlikely(pud_none(*pud)) && __pmd_alloc(mm, pud, address))?
> > --
> > 2.26.2
> >
>
> --
> Sincerely yours,
> Mike.
