Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C3A72F93E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 11:30:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qh0XV6vd5z3bXl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 19:30:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.171; helo=mail-yb1-f171.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qh0Wz6GNfz2xdr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 19:30:22 +1000 (AEST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-bcad7f7dabcso417939276.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 02:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686735018; x=1689327018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUg4qrNPX3u1L7teHyX+L+B+2nv6pGpY1jj7jQmio6E=;
        b=StXJ9ecmSf88wVBsKvldT/Ph6xPLOJmKVqUkeLLE2764rKFx4JFizoI3Mc6zPpPfhf
         WX3DIIyRaDJK7fhaYdBaa1Bsm23xx9NiQkLbxdOhHRxsStJQJeI+BA0W1o3U19YH1mmm
         wM8IvBhYXAvLoepEsvZC5xA5Ur8nKTk029eCxDZBFe6HHbH9eD8VINzswHsO8NdTBNdg
         wreoLQ/56TluvES1ujNMN939Ff/CfRvtLOn/hp9m2agT1I91u4Z9oWMSO1OJijzajuh2
         Kh5oZLmkyBbiFaIQkNRClbOwYb6y07u+BoIXVu9mYJbnxEDmpB0DrHwXKTelA4x1FeTg
         Q3SQ==
X-Gm-Message-State: AC+VfDwXF9bYw7PycZjXpJao4rYSs0WIRwtClnvPg0FxVcBN9ALqlnwg
	bEWRqC3r04QEyzvIgM3pcUXtDjpxDQ0prw==
X-Google-Smtp-Source: ACHHUZ403zab32RV2EwuOSln6GVWUn0SxSf854H6fKv7YMBYZv/d4mZGUGMF6+2v5Zv+dhO344GGhg==
X-Received: by 2002:a25:d688:0:b0:bc4:3e4e:12 with SMTP id n130-20020a25d688000000b00bc43e4e0012mr1316023ybg.36.1686735018318;
        Wed, 14 Jun 2023 02:30:18 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id t4-20020a252d04000000b00bcb9b435a84sm1462301ybt.11.2023.06.14.02.30.17
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 02:30:17 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5700b37da3fso3355757b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 02:30:17 -0700 (PDT)
X-Received: by 2002:a25:6b47:0:b0:ba8:2009:ccbb with SMTP id
 o7-20020a256b47000000b00ba82009ccbbmr1338474ybm.46.1686735017346; Wed, 14 Jun
 2023 02:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-28-vishal.moola@gmail.com> <e52c7a74-da68-08d2-54e2-f95a8c5b52e7@kernel.org>
In-Reply-To: <e52c7a74-da68-08d2-54e2-f95a8c5b52e7@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jun 2023 11:30:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXPASfLM8St_JZOW3Wke+ickJoo1oDr+orRbTERy=Zgwg@mail.gmail.com>
Message-ID: <CAMuHMdXPASfLM8St_JZOW3Wke+ickJoo1oDr+orRbTERy=Zgwg@mail.gmail.com>
Subject: Re: [PATCH v4 27/34] nios2: Convert __pte_free_tlb() to use ptdescs
To: Dinh Nguyen <dinguyen@kernel.org>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Dinh,

On Wed, Jun 14, 2023 at 12:17=E2=80=AFAM Dinh Nguyen <dinguyen@kernel.org> =
wrote:
> On 6/12/23 16:04, Vishal Moola (Oracle) wrote:
> > Part of the conversions to replace pgtable constructor/destructors with
> > ptdesc equivalents.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >   arch/nios2/include/asm/pgalloc.h | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/=
pgalloc.h
> > index ecd1657bb2ce..ce6bb8e74271 100644
> > --- a/arch/nios2/include/asm/pgalloc.h
> > +++ b/arch/nios2/include/asm/pgalloc.h
> > @@ -28,10 +28,10 @@ static inline void pmd_populate(struct mm_struct *m=
m, pmd_t *pmd,
> >
> >   extern pgd_t *pgd_alloc(struct mm_struct *mm);
> >
> > -#define __pte_free_tlb(tlb, pte, addr)                               \
> > -     do {                                                    \
> > -             pgtable_pte_page_dtor(pte);                     \
> > -             tlb_remove_page((tlb), (pte));                  \
> > +#define __pte_free_tlb(tlb, pte, addr)                                =
       \
> > +     do {                                                            \
> > +             pagetable_pte_dtor(page_ptdesc(pte));                   \
> > +             tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));      \
> >       } while (0)
> >
> >   #endif /* _ASM_NIOS2_PGALLOC_H */
>
> Applied!

I don't think you can just apply this patch, as the new functions
were only introduced in [PATCH v4 05/34] of this series.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
