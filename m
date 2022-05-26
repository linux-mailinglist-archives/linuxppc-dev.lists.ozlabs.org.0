Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FED9534B86
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 10:18:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L815n0RQcz3c8P
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 18:18:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.126.131; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L815J31MBz2ypZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 18:17:39 +1000 (AEST)
Received: from mail-yb1-f181.google.com ([209.85.219.181]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MEC8L-1o1WY717TB-00AGTV for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May
 2022 10:17:34 +0200
Received: by mail-yb1-f181.google.com with SMTP id y141so1654045ybe.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 01:17:33 -0700 (PDT)
X-Gm-Message-State: AOAM532TPTtJU1lPVnnhetHoF3Tm3WqDQbu7bnKSo33rNQnmht1OuGGn
	PfU+K5xgjDwZZUiz3HupCTZVB1hEqjwvuE39/n8=
X-Google-Smtp-Source: ABdhPJzzDGfRDZzZlBYmxCfbGw+1dzm4g7liyEpEudmbi7VqC5LKJWZl53KUZgIAAT3HgLquslAgQXrWoCBOPsPKOiI=
X-Received: by 2002:a25:31c2:0:b0:641:660f:230f with SMTP id
 x185-20020a2531c2000000b00641660f230fmr34286510ybx.472.1653553052355; Thu, 26
 May 2022 01:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220519031345.2134401-1-kuba@kernel.org> <f84c4cb17eebe385fe22c3fc4563645742269d46.camel@kernel.crashing.org>
 <alpine.DEB.2.22.394.2205260933520.394690@ramsan.of.borg>
In-Reply-To: <alpine.DEB.2.22.394.2205260933520.394690@ramsan.of.borg>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 26 May 2022 10:17:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1z5_QBMq+X53wN=xP4_00ahrQDpz7Kd3GJCK-9Mn9AQQ@mail.gmail.com>
Message-ID: <CAK8P3a1z5_QBMq+X53wN=xP4_00ahrQDpz7Kd3GJCK-9Mn9AQQ@mail.gmail.com>
Subject: Re: [PATCH net-next] eth: de4x5: remove support for Generic DECchip &
 DIGITAL EtherWORKS PCI/EISA
To: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ToPJsKqH9I0LqV1brbczhutQUIRTgysLbfanp7GIgxo0Ei2yLLT
 95MtYZn7Yygr4boCQ9cI+C09vz+/a3IDeQRKMkyKK5D6TdVtb2n7RIFYcasicTfxtC+s/cH
 r/z56jIgLuP6FfTjGnV3fNtJk8ziFx7iQhI0p2EnbDa/srk12zm1zKni9MrcWThKXivECCQ
 Vbs2+pcTPzWbSGte4MklA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tPGM2y4QDCE=:HpG/2u4Y7dDDB5/dj6fibx
 387PkHgU6IcHrJRQB3dRnyY0WpkWdH5nDj6bcjhDceQRyHhzPZdwvx1yximpRXNpTvw+hvPUU
 nqyqkS8jwcwIE1ioLRsnQKh5VI9KziNHd5eqOh9qyl2N4DTCNZdVNgmaiNqf3O3wS73FOURHP
 rmfVlk99T5UCSz8vSTb9oIxx5ERoSceTLlcIEYfOGcv6JGEIQRZ/iyUy7jV3MQ7dCSNcGSkFW
 PYb0ZouLg3jBT6oO6L45nw3kEYHgvM/3R36d9wnHQrU8WYNCQLU+K00IXt9FrVmPiqiZhkTJS
 g8Us33Ncz0ZRBWLUJZd4hkYv//ltUe5HFu9mhWHv4xhW03a0uVF+pxeCAtPUcRaunKGM6pH9c
 sua8AZr7ZcDpPmdgTUGFXc2oXb+l3RBlieoD6yBq/Rqpb4qZO3HJZ1j6JGpxVTG1Lrh6opRYS
 fZPX3clZC8lMy7uLyqA4pem84CSDRvSMD0aF4m3UPJybKcMAKVDs/dAMyFm+NcZBMR449Vsv2
 y10YzE2+bbaAbKT7sPGApc0xr86sSSNxXzCeUvM8R43Cegsv+kn9Zgntj+LlFDfHKk++Z3MSQ
 kpn3jKRGbDyC5WFV87nK1Ql3bJp4DmgjXFB48DoA1n4Pxiu6CVNDpOl3N3QGs8/TTaUzeM2Sc
 AufclrKhs1nuhy9frw/mmfKRxvOTP7SNTXvyr53mtrIb75Y7cXDXYi5B0ZQLYfkfGQg2GrRrF
 8PVuQCyTYVYJ+T0jBmr9P/spitdbJfTLfJCeb4gNxhMWqQqyouQGkgXsK5R73RVvpwV7CssHe
 iRjTJjRbz0T3qxxj3FgycQpcjyYLbJddyz/X1yCfnpA8SREzTT2yTgtzoWUNxP8HMf5VKjJqE
 XA0QOlau2KNHOQM/JbAA==
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, sburla@marvell.com, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>, vburru@marvell.com, Networking <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, zhangyue1@kylinos.cn, Paolo Abeni <pabeni@redhat.com>, aayarekar@marvell.com, David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 26, 2022 at 9:43 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sat, 21 May 2022, Benjamin Herrenschmidt wrote:
> > On Wed, 2022-05-18 at 20:13 -0700, Jakub Kicinski wrote:
> >> Looks like almost all changes to this driver had been tree-wide
> >> refactoring since git era begun. There is one commit from Al
> >> 15 years ago which could potentially be fixing a real bug.
> >>
> >> The driver is using virt_to_bus() and is a real magnet for pointless
> >> cleanups. It seems unlikely to have real users. Let's try to shed
> >> this maintenance burden.
> >>
> >> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> >
> > Removing this driver will kill support for some rather old PowerMac
> > models (some PowerBooks I think, paulus would know). No objection on my
> > part, though. I doubt people still use these things with new kernels
> > but ... who knows ? :-)
>
> Aren't these PCI, and thus working fine with the PCI-only DE2104X
> (dc2104x) or TULIP (dc2114x) drivers?
>
> IIRC, I've initially used the de4x5 driver on Alpha (UDB/Multia) or PPC
> (CHRP), but switched to the TULIP driver later (that was before the
> dc2104x/dc2114x driver split, hence a loooong time ago).

The PCI device IDs say this is correct: there are four IDs in the
de4x5 driver, all of which are also listed in one of the two other
drivers.

      Arnd
