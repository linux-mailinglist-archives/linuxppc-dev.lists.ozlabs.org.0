Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22311534111
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 18:09:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7bc10BPMz3bkT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 02:09:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FlOwZrOq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FlOwZrOq; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7bbJ63qfz2ysv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 02:08:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EFE1C6160E
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 16:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A31C3411B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653494918;
 bh=yKZpZ7SIZeLHb0X8nC5bqkpDaZyHuZo++7kw37oIcGQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FlOwZrOqfkixLh2Sz/ijPE+iWSPo1vExFZD8oDnS3R9OR4unlRzyuyrdhSTR1zgpg
 E/nrlCNvYXUleRxXew2pxNa99VDWB7/TvfNzZJn/IzByDauDFummkfOCALKNj7hGy3
 MJPC+HjoczAhgNxYjyIAmpbUczVCJ4vd9FfnSVys7pc7ov/5BhJV0T5+04OyMvo1U9
 7A7T4q4IVFxmGUv8Dq12u11u9pFd3Pt44InDRzFzt93f/gvv35sx+q79xDPNdd4yfE
 ePJJ+sAEJvQkBvzOh72x1laK5N0nTl2IQ7KT36kI0pCYx3Vmqnb5T5/M/AhWTdwkIN
 Yrb+uvO13Rfzg==
Received: by mail-vk1-f181.google.com with SMTP id bs5so10114304vkb.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 09:08:38 -0700 (PDT)
X-Gm-Message-State: AOAM530TewTKD0gFyh3jMjVrxZzNfMvescJQux0WR2rpI2FoPKI9V3rb
 /H51fKWW/sBbnB2OLlDW7l2eWS/casWvrOxfQbw=
X-Google-Smtp-Source: ABdhPJw1WHHqxuzdMTtb2eEqwRRFtvXa8jU3vxrvtrww8g1vIS4KjJWMDyxFq63Hm2BXr071eyutBaZ38+UIdXynb6U=
X-Received: by 2002:a1f:2106:0:b0:357:a8c9:a8d6 with SMTP id
 h6-20020a1f2106000000b00357a8c9a8d6mr5907118vkh.2.1653494913806; Wed, 25 May
 2022 09:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220322144003.2357128-1-guoren@kernel.org>
 <20220524220646.GA3990738@roeck-us.net>
 <6435704.4vTCxPXJkl@diego> <3418219.V25eIC5XRa@diego>
In-Reply-To: <3418219.V25eIC5XRa@diego>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 26 May 2022 00:08:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTkpHLZf-+VXZE_gCn=5ZJ5FS3jOxKLVoMyL4i=baPd7Q@mail.gmail.com>
Message-ID: <CAJF2gTTkpHLZf-+VXZE_gCn=5ZJ5FS3jOxKLVoMyL4i=baPd7Q@mail.gmail.com>
Subject: Re: [PATCH V9 20/20] riscv: compat: Add COMPAT Kbuild skeletal support
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thx Heiko & Guenter,

On Wed, May 25, 2022 at 7:10 PM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Am Mittwoch, 25. Mai 2022, 12:57:30 CEST schrieb Heiko St=C3=BCbner:
> > Am Mittwoch, 25. Mai 2022, 00:06:46 CEST schrieb Guenter Roeck:
> > > On Wed, May 25, 2022 at 01:46:38AM +0800, Guo Ren wrote:
> > > [ ... ]
> > >
> > > > > The problem is come from "__dls3's vdso decode part in musl's
> > > > > ldso/dynlink.c". The ehdr->e_phnum & ehdr->e_phentsize are wrong.
> > > > >
> > > > > I think the root cause is from musl's implementation with the wro=
ng
> > > > > elf parser. I would fix that soon.
> > > > Not elf parser, it's "aux vector just past environ[]". I think I co=
uld
> > > > solve this, but anyone who could help dig in is welcome.
> > > >
> > >
> > > I am not sure I understand what you are saying here. Point is that my
> > > root file system, generated with musl a year or so ago, crashes with
> > > your patch set applied. That is a regression, even if there is a bug
> > > in musl.
Thx for the report, it's a valuable regression for riscv-compat.

> >
> > Also as I said in the other part of the thread, the rootfs seems innoce=
nt,
> > as my completely-standard Debian riscv64 rootfs is also affected.
> >
> > The merged version seems to be v12 [0] - not sure how we this discussio=
n
> > ended up in v9, but I just tested this revision in two variants:
> >
> > - v5.17 + this v9 -> works nicely
>
> I take that back ... now going back to that build I somehow also run into
> that issue here ... will investigate more.
Yeah, it's my fault. I've fixed up it, please have a try:

https://lore.kernel.org/linux-riscv/20220525160404.2930984-1-guoren@kernel.=
org/T/#u

>
>
> > - v5.18-rc6 + this v9 (rebased onto it) -> breaks the boot
> >   The only rebase-conflict was with the introduction of restartable
> >   sequences and removal of the tracehook include, but turning CONFIG_RS=
EQ
> >   off doesn't seem to affect the breakage.
> >
> > So it looks like something changed between 5.17 and 5.18 that causes th=
e issue.
> >
> >
> > Heiko
> >
> >
> > [0] https://lore.kernel.org/all/20220405071314.3225832-1-guoren@kernel.=
org/
> >
>
>
>
>


--=20
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
