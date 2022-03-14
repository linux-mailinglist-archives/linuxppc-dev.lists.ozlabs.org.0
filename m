Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B38B4D8FFD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 00:01:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHX9F2SBdz30hh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 10:01:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cSnuNO7T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1134;
 helo=mail-yw1-x1134.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cSnuNO7T; dkim-atps=neutral
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHX8d1Bt1z2yxL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 10:01:20 +1100 (AEDT)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2dc242a79beso182202667b3.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 16:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GZvlCSbYUAZCT6WYGhbLvGVpZqj/APaxYT9NOyLklH0=;
 b=cSnuNO7Tl21mmHQ/FQlheeioIQK8aUg+15i0HUc2IVu4woD25SosbOXpit99ItRt7r
 kK2C5I52WjrqfODs/rgcTxxOVA5k/5Wu3ydix6wyiUQQnmnXUnwz7S/+bRkmf2YgnVXW
 R0QCx9UUzLyHmaOqyU3OrsKSl/u+1gvWQbhyFW0XVZmHwM6IZ6HYD0FRHuvelTkAIOj7
 TmcPDGObTiGvIGFdnyZOxD6nyWaABCe/1iUYkq2WG1P/91367UlmMRQzS6U75WKId4GY
 eFVnCW0sLm3xhdV1LrGI26w2fEQLqLGc7P7tHoEF1rbBNuz+A+NYvmZm5bokeA4KY25P
 cx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GZvlCSbYUAZCT6WYGhbLvGVpZqj/APaxYT9NOyLklH0=;
 b=WTLASkT05Tp0kZE6zc971UEsdiNYxHpVjuwTnz55Ha/O2Wgy5q5Y98IrDbeZRh2iV/
 AX3JUQtNpIM4nrijRTChpmxri6FcKLUfajYsxTxB96y7ZeRvxSP6hTm+Jz+AXe9Et5Vq
 r4U05mPza+18J627l9AE3HwKDdE5HHx+sThKFmp8whM1zM6MxILNzanSLapqnyGuQ0xv
 l/5rDWtbUyDUk4HS5GT7H42ZS1DvzdSGtY43CcGgwF6bhChqiJp/cr934laKpls1OugY
 y6F5w+Kqw/bInaJ2itODsfqYLuNbb7y84IdmJSecSaKiEhp+1d7MWS2WizzvEEuaTDnf
 efpQ==
X-Gm-Message-State: AOAM531amjxBONVVy/JZB9TYP5UYeY1a+FhGWzPH1nzI6ytLohhIkCOr
 tb5uBvvV9agT/0YACyS56d8bWof+kZiIjYP6Zog=
X-Google-Smtp-Source: ABdhPJzKsp/b/N21o+5KqCNZRnM2FowSxsmDVjQI8h1kOmQK0JDeXEEarUdcdB30Tglx+ZFfXzrDQZHl9Fge60K9M4I=
X-Received: by 2002:a81:9112:0:b0:2dc:53ab:9fc2 with SMTP id
 i18-20020a819112000000b002dc53ab9fc2mr21523799ywg.24.1647298874617; Mon, 14
 Mar 2022 16:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211110003717.1150965-1-jniethe5@gmail.com>
 <20211110003717.1150965-4-jniethe5@gmail.com>
 <69fafbf6-2d3f-4589-1ebf-e6e4216e850c@csgroup.eu>
In-Reply-To: <69fafbf6-2d3f-4589-1ebf-e6e4216e850c@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 15 Mar 2022 10:01:03 +1100
Message-ID: <CACzsE9rs0rk6+WZZxef0Dt9gRXucTm=2buXFjzunANf6C_Okuw@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] powerpc: Rework and improve STRICT_KERNEL_RWX
 patching
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "cmr@bluescreens.de" <cmr@bluescreens.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 12, 2022 at 6:30 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Hi Jordan
>
> Le 10/11/2021 =C3=A0 01:37, Jordan Niethe a =C3=A9crit :
> > From: "Christopher M. Riedl" <cmr@bluescreens.de>
> >
> > Rework code-patching with STRICT_KERNEL_RWX to prepare for a later patc=
h
> > which uses a temporary mm for patching under the Book3s64 Radix MMU.
> > Make improvements by adding a WARN_ON when the patchsite doesn't match
> > after patching and return the error from __patch_instruction() properly=
.
> >
> > Signed-off-by: Christopher M. Riedl <cmr@bluescreens.de>
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v7: still pass addr to map_patch_area()
>
>
> This patch doesn-t apply, can you rebase the series ?
Yep, will do.
>
> Thanks
> Christophe
>
> > ---
> >   arch/powerpc/lib/code-patching.c | 20 ++++++++++----------
> >   1 file changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-p=
atching.c
> > index 29a30c3068ff..d586bf9c7581 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -75,6 +75,7 @@ static inline void stop_using_temp_mm(struct temp_mm_=
state prev_state)
> >   }
> >
> >   static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
> > +static DEFINE_PER_CPU(unsigned long, cpu_patching_addr);
> >
> >   static int text_area_cpu_up(unsigned int cpu)
> >   {
> > @@ -87,6 +88,7 @@ static int text_area_cpu_up(unsigned int cpu)
> >               return -1;
> >       }
> >       this_cpu_write(text_poke_area, area);
> > +     this_cpu_write(cpu_patching_addr, (unsigned long)area->addr);
> >
> >       return 0;
> >   }
> > @@ -172,11 +174,10 @@ static inline int unmap_patch_area(unsigned long =
addr)
> >
> >   static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
> >   {
> > -     int err;
> > +     int err, rc =3D 0;
> >       u32 *patch_addr =3D NULL;
> >       unsigned long flags;
> >       unsigned long text_poke_addr;
> > -     unsigned long kaddr =3D (unsigned long)addr;
> >
> >       /*
> >        * During early early boot patch_instruction is called
> > @@ -188,15 +189,13 @@ static int do_patch_instruction(u32 *addr, struct=
 ppc_inst instr)
> >
> >       local_irq_save(flags);
> >
> > -     text_poke_addr =3D (unsigned long)__this_cpu_read(text_poke_area)=
->addr;
> > -     if (map_patch_area(addr, text_poke_addr)) {
> > -             err =3D -1;
> > +     text_poke_addr =3D __this_cpu_read(cpu_patching_addr);
> > +     err =3D map_patch_area(addr, text_poke_addr);
> > +     if (err)
> >               goto out;
> > -     }
> > -
> > -     patch_addr =3D (u32 *)(text_poke_addr + (kaddr & ~PAGE_MASK));
> >
> > -     __patch_instruction(addr, instr, patch_addr);
> > +     patch_addr =3D (u32 *)(text_poke_addr | offset_in_page(addr));
> > +     rc =3D __patch_instruction(addr, instr, patch_addr);
> >
> >       err =3D unmap_patch_area(text_poke_addr);
> >       if (err)
> > @@ -204,8 +203,9 @@ static int do_patch_instruction(u32 *addr, struct p=
pc_inst instr)
> >
> >   out:
> >       local_irq_restore(flags);
> > +     WARN_ON(!ppc_inst_equal(ppc_inst_read(addr), instr));
> >
> > -     return err;
> > +     return rc ? rc : err;
> >   }
> >   #else /* !CONFIG_STRICT_KERNEL_RWX */
> >
