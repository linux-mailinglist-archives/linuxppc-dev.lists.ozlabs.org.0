Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B642933B08E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 12:03:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzYRx5cdJz2yx4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 22:03:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.51; helo=mail-ua1-f51.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzYRc70GMz2xy8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 22:02:52 +1100 (AEDT)
Received: by mail-ua1-f51.google.com with SMTP id b10so4053726uap.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 04:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=luUI1y7TeItItv6lcgdhrz6xW5IIMYrJljt0a6PyOsI=;
 b=FZoJAVOOsZzCvBfm2U05vL2/2c0OPnfHhgHLW2/Idj6u1srCnnWKV7qgss5e1R1BcB
 GuYDOAolxLvAUbgnQ+HCuchNuG17m8ywGYDC84mMBOGsUa5b2m+rW1WMj4ykWWzjasEe
 E1cKxaYFE/sGxvePbqm+2bLafzY1swhc8Q9MYlMhJmSz0cStrq5emKgWFifI+d6DgPl1
 kQsuE7voG3c1k0w6UnQkcz1JqIXXhpWWeEVw8+vAGP/RIdz+SBRyUPYVzpr4SjF3HlXI
 oMzdmXHAkVxhTorbqdIfTBak/CT1HFum+x4h6n7wr4bKEusNG2kJYTix5YXLGd5WObAt
 DQ1g==
X-Gm-Message-State: AOAM533uoFEOkzBudruIpTmpH4dix5jXC9aH2zz7tSVVUUqHPojuk3fp
 oYEYCpIXgCs/7u90eTIvh0uAlecstsd+qw/FZt8=
X-Google-Smtp-Source: ABdhPJwPc7mvd0FdJocPWpgaceI9gdWFckR56CTV+7TuC43r6wmKuXqJ5ZeaHIO9vTmiuBEaxjh+uUOW0JKpCIRDJ6w=
X-Received: by 2002:ab0:20b3:: with SMTP id y19mr4290646ual.2.1615806168140;
 Mon, 15 Mar 2021 04:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210315104409.1598822-1-geert@linux-m68k.org>
 <CAMuHMdVJFprsj9njwv13jWTBELuq8RcXOmR7AoR9dqDdydLcNQ@mail.gmail.com>
 <2c123f94-ceae-80c0-90e2-21909795eb76@csgroup.eu>
In-Reply-To: <2c123f94-ceae-80c0-90e2-21909795eb76@csgroup.eu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Mar 2021 12:02:37 +0100
Message-ID: <CAMuHMdUMjN9TW-ggAgOtj3V36kzNCfoG5o-Bcj=Lk9diJciS=g@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.12-rc3
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Mon, Mar 15, 2021 at 11:55 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 15/03/2021 =C3=A0 11:49, Geert Uytterhoeven a =C3=A9crit :
> > On Mon, Mar 15, 2021 at 11:46 AM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> >> JFYI, when comparing v5.12-rc3[1] to v5.12-rc2[3], the summaries are:
> >>    - build errors: +2/-2
> >
> >> 2 error regressions:
> >>    + /kisskb/src/include/linux/compiler_types.h: error: call to '__com=
piletime_assert_248' declared with attribute error: BUILD_BUG failed:  =3D>=
 320:38
> >>    + /kisskb/src/include/linux/compiler_types.h: error: call to '__com=
piletime_assert_249' declared with attribute error: BUILD_BUG failed:  =3D>=
 320:38
> >
> > powerpc-gcc4.9/ppc64_book3e_allmodconfig
> >
> > So we traded implicit declaration errors:
> >
> >    - /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_cal=
cs.c:
> > error: implicit declaration of function 'disable_kernel_vsx'
> > [-Werror=3Dimplicit-function-declaration]: 674:2 =3D>
> >    - /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_cal=
cs.c:
> > error: implicit declaration of function 'enable_kernel_vsx'
> > [-Werror=3Dimplicit-function-declaration]: 638:2 =3D>
> >
> > for compile-time assertions.
> >
>
> You are missing https://github.com/linuxppc/linux/commit/eed5fae00593ab9d=
261a0c1ffc1bdb786a87a55a

Which is not part of v5.12-rc3.

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
