Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B64016AAECF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 10:30:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PTxJw4qHKz3cgR
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 20:30:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.178; helo=mail-qt1-f178.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PTxJK3X0Pz3bTc
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Mar 2023 20:30:08 +1100 (AEDT)
Received: by mail-qt1-f178.google.com with SMTP id s12so7533084qtq.11
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Mar 2023 01:30:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678008605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgd0m+/MCaDvNZBjSvDtubD53Qmudtg807BEeMSQ1f0=;
        b=ZJdxu+dbyj2NTIN3Zn5ALWl/QCgdrmY3qzezkmGyfQcxFfecQl/D9+yxaKZ7kPCqov
         VYIQkIT7C/S+1E28Uinci7NvaO0Dwzth55h67zOoWzzL1+8p5srkDg5MTVLgwzSb8Ybx
         VlceKaSQ/fBaP3+28lymQK9SIwm8jRMM2UbO7d7x8m3ix/189Sfd7Yse3NTp3azwTo3e
         yUSFdymedt6Zu5wxJqHUKTMT44moe5xhM9xRi80DitMKqxPlZD8qMtS/ka3b3CRybdWf
         WqjTI4jhGJNydLBMGmd3282o7Tod7f4dSuuQmqf6p5zirHqtxCsbEHaQDFf8bM5OLaCJ
         QkkA==
X-Gm-Message-State: AO0yUKWwzNV0i+drxH0AlEIfhdlaR/upGRmSzTma6BbyV/y5ydNQjNzH
	kNDa5FBBipF8cCYRmT3YHEc6I7AcFTtDMw==
X-Google-Smtp-Source: AK7set+10h+Uj9zhgTCQp0/TLPWvHfLDKbKG8Lr2o3b1eDhQlMyraVxY+YkONrtLpIOYHReLvX/Ygg==
X-Received: by 2002:a05:622a:87:b0:3bd:11a5:c12b with SMTP id o7-20020a05622a008700b003bd11a5c12bmr13486687qtw.5.1678008605042;
        Sun, 05 Mar 2023 01:30:05 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id c133-20020ae9ed8b000000b0074280fc7bd8sm5260598qkg.60.2023.03.05.01.30.04
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 01:30:04 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-536bbe5f888so128271907b3.8
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Mar 2023 01:30:04 -0800 (PST)
X-Received: by 2002:a81:af0c:0:b0:52f:1c23:ef1 with SMTP id
 n12-20020a81af0c000000b0052f1c230ef1mr4669025ywh.5.1678008604127; Sun, 05 Mar
 2023 01:30:04 -0800 (PST)
MIME-Version: 1.0
References: <20230303102817.212148-1-bhe@redhat.com> <20230303102817.212148-3-bhe@redhat.com>
 <87sfej1rie.fsf@mpe.ellerman.id.au>
In-Reply-To: <87sfej1rie.fsf@mpe.ellerman.id.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 5 Mar 2023 10:29:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXoM24uAZGcjBtscNMOSY_+4u08PEOR7gOfCH7jvCceDg@mail.gmail.com>
Message-ID: <CAMuHMdXoM24uAZGcjBtscNMOSY_+4u08PEOR7gOfCH7jvCceDg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arch/*/io.h: remove ioremap_uc in some architectures
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, Baoquan He <bhe@redhat.com>, arnd@arndb.de, linux-sh@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, hch@infradead.org, linux-mm@kvack.org, mcgrof@kernel.org, linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Sun, Mar 5, 2023 at 10:23=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
> Baoquan He <bhe@redhat.com> writes:
> > ioremap_uc() is only meaningful on old x86-32 systems with the PAT
> > extension, and on ia64 with its slightly unconventional ioremap()
> > behavior, everywhere else this is the same as ioremap() anyway.
> >
> > Here, remove the ioremap_uc() definition in architecutures other
> > than x86 and ia64. These architectures all have asm-generic/io.h
> > included and will have the default ioremap_uc() definition which
> > returns NULL.
> >
> > Note: This changes the existing behaviour and could break code
> > calling ioremap_uc(). If any ARCH meets this breakage and really
> > needs a specific ioremap_uc() for its own usage, one ioremap_uc()
> > can be added in the ARCH.
>
> I see one use in:
>
> drivers/video/fbdev/aty/atyfb_base.c:        par->ati_regbase =3D ioremap=
_uc(info->fix.mmio_start, 0x1000);
>
>
> Which isn't obviously x86/ia64 specific.
>
> I'm pretty sure some powermacs (powerpc) use that driver.

I originally wrote that driver for CHRP, so yes.

> Maybe that exact code path is only reachable on x86/ia64? But if so
> please explain why.
>
> Otherwise it looks like this series could break that driver on powerpc
> at least.

Indeed.

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
