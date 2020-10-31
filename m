Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 871462A1ACB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Oct 2020 22:36:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CNsv00wnFzDqnw
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Nov 2020 08:36:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=uOwQd87e; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CNsr25mQHzDqHZ
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Nov 2020 08:33:54 +1100 (AEDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C27E7206ED
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Oct 2020 21:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604180030;
 bh=a949fi3JWCiOsIfB/oXLlGSJaTnnNYCIyox+iEaG/3k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uOwQd87e+foiBGR40L7/E//TK/U00IYrErM5E/SIiuXJW+ItAP/uX7aaowuSeAPh6
 tUe7NpXsy5i3s4p8P/xLQRMeuJ9BMtKeEUxzpNZzI5n1RX3DuN+SyxLmKGlabtwNlz
 gp/IHWsOlgVaZbkqJJz3zqR0MDyrqlciKZ/NQ25Y=
Received: by mail-qt1-f173.google.com with SMTP id j62so6786972qtd.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Oct 2020 14:33:50 -0700 (PDT)
X-Gm-Message-State: AOAM532hhPoIBpPergIjZEfbBNk34ySq90x1aTYZhWDprVkBZW9xxJvE
 F5WBPET9byu5skSFGSgmazX9rSZT+o2GTkiumos=
X-Google-Smtp-Source: ABdhPJyD/4AcE03j7HIaN207+kO4IYyQ0WkWkrWDUSbNUToIdPZlRv7YWwHuIabdMaXmtCngmEmV1ORQEwrjBUGk+Sk=
X-Received: by 2002:ac8:4808:: with SMTP id g8mr8036830qtq.18.1604180029997;
 Sat, 31 Oct 2020 14:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201029221806.189523375@linutronix.de>
 <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
 <87pn50ob0s.fsf@nanos.tec.linutronix.de>
 <87blgknjcw.fsf@nanos.tec.linutronix.de>
 <CAHk-=whsJv0bwWRVZHsLoSe48ykAea6T7Oi=G+r8ckLrZ0YUpg@mail.gmail.com>
 <87sg9vl59i.fsf@nanos.tec.linutronix.de>
 <CAHk-=wjjO9BtTUAsLraqZqdzaPGJ-qvubZfwUsmRUX896eHcGw@mail.gmail.com>
 <CAK8P3a3FyKTHDSAPCyP8e7UA0LN3OvAatNK_vQ3tnBsdbou4sA@mail.gmail.com>
 <20201031160539.Horde.n5yNbG9LoUSWqtuPQW_h3w1@messagerie.c-s.fr>
In-Reply-To: <20201031160539.Horde.n5yNbG9LoUSWqtuPQW_h3w1@messagerie.c-s.fr>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 31 Oct 2020 22:33:33 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3uY0ASRGcPi-OZdRyL_xLY81nJfu+O6z-Ovxu9YCR4dQ@mail.gmail.com>
Message-ID: <CAK8P3a3uY0ASRGcPi-OZdRyL_xLY81nJfu+O6z-Ovxu9YCR4dQ@mail.gmail.com>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic &
 friends
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Ben Segall <bsegall@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Matthew Wilcox <willy@infradead.org>,
 linux-sparc <sparclinux@vger.kernel.org>, Vincent Chen <deanbo422@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul McKenney <paulmck@kernel.org>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Peter Zijlstra <peterz@infradead.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Mel Gorman <mgorman@suse.de>, Ingo Molnar <mingo@kernel.org>,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 Steven Rostedt <rostedt@goodmis.org>, Greentime Hu <green.hu@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Oct 31, 2020 at 4:04 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> > There are also some users on 10+ year old 32-bit netbooks or
> > business laptops, both x86 and Apple G4.
> > The longest-lived 32-bit embedded systems with large memory
> > (other than Arm) are probably NXP QorIQ P20xx/P40xx used in
> > military VME bus systems, and low-end embedded systems based
> > on Vortex86.
> > I'm less worried about all of these because upstream kernel
> > support for ppc32 and x86-32 is already bitrotting and they will
> > likely get stuck on the last working kernel before the
> > TI/Renesas/NXP Arm systems do.
> >
>
> Upstream kernel support for ppc32 is bitrotting, seriously ? What do
> you mean exactly ?

I was thinking more of the platform support: out of the twelve
32-bit platforms in arch/powerpc/platforms/, your 8xx is the only
one listed as 'maintained' or 'supported' in the maintainers list,
and that seems to accurately describe the current state.

Freescale seems to have practically stopped contributing to any of
their 32-bit platforms in 2016 after the NXP acquisition and no longer
employing either of the maintainers. Similarly, Ben seems to have
stopped working on powermac in 2016, which was ten years after
the last 32-bit hardware shipped for that platform.

> ppc32 is actively supported, with recent addition of support of
> hugepages, kasan, uaccess protection, VMAP stack, etc ...

That is good to hear, I didn't know about these additions.
What platforms are people using to develop these? Is this
mainly your 8xx work, or is there ongoing development for
platforms that need highmem?

         Arnd
